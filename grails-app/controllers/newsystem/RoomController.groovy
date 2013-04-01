package newsystem

import org.springframework.dao.DataIntegrityViolationException
import groovy.sql.Sql

class RoomController extends BaseController{
	
	def beforeInterceptor = [action:this.&auth,except:['listPUBLIC', 'viewAvailableRooms', 'picture_image','showPUBLIC']]

	def dataSource

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [roomInstanceList: Room.list(params), roomInstanceTotal: Room.count()]
    }
	
	def listPUBLIC(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        render(view:"listPUBLIC", model:[roomInstanceList: Room.list(params), roomInstanceTotal: Room.count()])
    }
	
    def create() {
        [roomInstance: new Room(params), vacancyStatus: "Vacant"]
    }

    def save() {
		
        def roomInstance = new Room(params)
		
        if (!roomInstance.save(flush: true)) {
            render(view: "create", model: [roomInstance: roomInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'room.label', default: 'Room'), roomInstance.roomName])
        redirect(action: "show", id: roomInstance.id)
    }

    def show(Long id) {
        def roomInstance = Room.get(id)
        if (!roomInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'room.label', default: 'Room'), id])
            redirect(action: "list")
            return
        }
		update_vacancy_status(roomInstance.id)
		def officialLodger = Lodger.findAllWhere(roomNumber: roomInstance, status: "Official")
		def unOfficialLodger = Lodger.findAllWhere(roomNumber: roomInstance, status: "Unofficial")
		def removedLodger = Lodger.findAllWhere(roomNumber: roomInstance, status: "Removed")
        [roomInstance: roomInstance, officialLodger:officialLodger, unOfficialLodger:unOfficialLodger, removedLodger:removedLodger, totalLodger: (roomInstance.lodger).size()]
    
    }
	
	  def showPUBLIC(Long id) {
        def roomInstance = Room.get(id)
        if (!roomInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'room.label', default: 'Room'), id])
            redirect(action: "list")
            return
        }
		def officialLodger = Lodger.findAllWhere(roomNumber: roomInstance, status: "Official")
		def unOfficialLodger = Lodger.findAllWhere(roomNumber: roomInstance, status: "Unofficial")
		def removedLodger = Lodger.findAllWhere(roomNumber: roomInstance, status: "Removed")
        [roomInstance: roomInstance, officialLodger:officialLodger, unOfficialLodger:unOfficialLodger, removedLodger:removedLodger, totalLodger: (roomInstance.lodger).size()]
    
    }
	
	
    def edit(Long id) {
        def roomInstance = Room.get(id)
        if (!roomInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'room.label', default: 'Room'), id])
            redirect(action: "list")
            return
        }

        [roomInstance: roomInstance]
    }

    def update(Long id, Long version) {
        def roomInstance = Room.get(id)
	
        if (!roomInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'room.label', default: 'Room'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (roomInstance.version > version) {
                roomInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'room.label', default: 'Room')] as Object[],
                          "Another user has updated this Room while you were editing")
                render(view: "edit", model: [roomInstance: roomInstance])
                return
            }
        }
		
		if (!roomInstance.save(flush: true)) {
            render(view: "edit", model: [roomInstance: roomInstance])
            return
        }
   
		 roomInstance.properties = params
		 
		 def officialLodger = Lodger.findAllWhere(roomNumber: roomInstance, status: "Official")
		 def unOfficialLodger = Lodger.findAllWhere(roomNumber: roomInstance, status: "Unofficial")
		 def totalLodger = officialLodger.size() + unOfficialLodger.size()
		 
		 if(totalLodger < roomInstance.totalNumberOfBeds){
				roomInstance.vacancyStatus = "Vacant"
		}
		else{
				roomInstance.vacancyStatus = "Full"
		}
		
		 
		if(roomInstance.totalNumberOfBeds < totalLodger ){
			 roomInstance.errors.rejectValue("version", "bed.number.error",
                          [totalLodger]as Object[],"")
				roomInstance.totalNumberOfBeds = totalLodger
				flash.message ="Room has "+totalLodger+". Total no. of beds must be less greater than or equal to "+totalLodger
                render(view: "edit", model: [roomInstance: roomInstance])
                return
			
		}
		
		flash.message = message(code: 'default.updated.message', args: [message(code: 'room.label', default: 'Room'), roomInstance.roomName])
        redirect(action: "show", id: roomInstance.id)
		
    }

    def delete(Long id) {
        def roomInstance = Room.get(id)
        if (!roomInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'room.label', default: 'Room'), id])
            redirect(action: "list")
            return
        }

        try {
            roomInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'room.label', default: 'Room'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'room.label', default: 'Room'), id])
            redirect(action: "show", id: id)
        }
    }
	
	def viewAvailableRooms(){
		def availableRooms = Room.findAllWhere(vacancyStatus: "Vacant")
		
		if(availableRooms){
		render(view:"listPUBLIC", model:[roomInstanceList: availableRooms, roomInstanceTotal: availableRooms.size()])
		return
		}
		else{
			flash.message = message(code: 'no.available.rooms')
			render(view:"listPUBLIC", model:[roomInstanceList: availableRooms, roomInstanceTotal: availableRooms.size()])
		}
		
	}
	
	def searchableService
	def searchRoom(){
		def roomName = params.roomName

		if(roomName){
			def srchResults = searchableService.search(roomName)
			def results = srchResults.results
			if(results){
			render(view: "list", model: [roomInstanceList: results, roomInstanceTotal: results.size()])
			}
			else{
				flash.message = message(code: 'no.room.found')
				redirect(action:"list")
			}
		}
		else{
			flash.message = message(code: 'empty.params')
			redirect(action:"list")
		}
	}
	
	//UPLOADING PICTURE
	
	def uploadPicture(Long id){
		def roomInstance = Room.get(id)
		render(view:"uploadPicture", model:[roomInstance:roomInstance])
	}
	def upload_picture = {
		def roomInstance = Room.get(params.id)  // or however you select the current user
		// Get the picture file from the multi-part request
		def f = request.getFile('picture')

		// List of OK mime-types
		def okcontents = ['image/png', 'image/jpeg', 'image/gif']
		if (! okcontents.contains(f.getContentType())) {
			flash.message = "Picture must be one of: ${okcontents}"
			render(view:'uploadPicture', model:[roomInstance:roomInstance])
			return;
		}

		// Save the image and mime type
		roomInstance.picture = f.getBytes()
		roomInstance.pictureType = f.getContentType()
		log.info("File uploaded: " + roomInstance.pictureType)

		// Validation works, will check if the image is too big
		if (!roomInstance.save()) {
			render(view:'uploadPicture', model:[roomInstance:roomInstance])
			return;
		}
  
		flash.message = "Room (${roomInstance.pictureType}, ${roomInstance.picture.size()} bytes) uploaded."
		redirect(action:'show', id:roomInstance.id)
	}
	
	def picture_image = {
		def pictureRoom = Room.get(params.id)
			if (!pictureRoom || !pictureRoom.picture || !pictureRoom.pictureType) {
				response.sendError(404)
				return;
			}
			response.setContentType(pictureRoom.pictureType)
			response.setContentLength(pictureRoom.picture.size())
			OutputStream out = response.getOutputStream();
			out.write(pictureRoom.picture);
			out.close();
	}
	
	def update_vacancy_status(Long id){
			def roomInstance = Room.get(id)
			def lodgerStatus = "Removed"
			
			def db = new Sql(dataSource) 
			def result = db.rows("SELECT * FROM lodger where lodger.room_number_id = '${roomInstance.id}'  and (lodger.status = 'Official' or lodger.status = 'Unofficial')") // Perform the query
		
			def totalLodgers = result.size();
		
			
			if(totalLodgers < roomInstance.totalNumberOfBeds){
				//sql.execute("UPDATE room SET vacancy_status = 'Vacant' where room.id = '${roomInstance.id}'")
				Room.executeUpdate("update Room r set r.vacancyStatus='Vacant'" +
                      "where r.id='${roomInstance.id}'");
			}
			else{
				Room.executeUpdate("update Room r set r.vacancyStatus='Full'" +
                      "where r.id='${roomInstance.id}'");
			}
	}
	
}
