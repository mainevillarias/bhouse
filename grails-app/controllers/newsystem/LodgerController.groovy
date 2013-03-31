package newsystem

import org.springframework.dao.DataIntegrityViolationException
import groovy.sql.Sql
import org.apache.commons.lang.RandomStringUtils


class LodgerController extends BaseController{

	def beforeInterceptor = [action:this.&auth,except:['createUnofficialLodger', 'saveUnofficialLodger', 'editLodgerPUBLIC', 'updateForLodgerPUBLIC', 'showPUBLIC']]

	def dataSource


    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [lodgerInstanceList: Lodger.list(params), lodgerInstanceTotal: Lodger.count()]
    }

	def create() {
		[lodgerInstance: new Lodger(params)]
    }

    def createOfficialLodger() {
		def roomId = params.roomId
		def roomInstance = Room.get(roomId)
		def lodgerStatus = "Official"
		def lodgerBalance = 0
		def gender = roomInstance.lodgerType

		if(roomInstance.vacancyStatus.equals("Vacant")){
			 render(view:"createOfficialLodger", model:[lodgerInstance: new Lodger(params), lodgerStatus:lodgerStatus, gender:gender, lodgerBalance:lodgerBalance, roomInstance:roomInstance])
		}
		else{
			flash.message = message(code: 'no.available.beds')
			redirect(action:"show", controller:"room", params:[id:roomInstance.id])
			}
      }
	  
	  def createUnofficialLodger(){
			def roomId = params.roomId
			def roomInstance = Room.get(roomId)
			def lodgerStatus = "Unofficial"
			def lodgerBalance = 0
			def gender = roomInstance.lodgerType

			if(roomInstance.vacancyStatus.equals("Vacant")){
				render(view:"createUnofficialLodger", model:[lodgerInstance: new Lodger(params), lodgerStatus:lodgerStatus, gender:gender, lodgerBalance:lodgerBalance, roomInstance:roomInstance])
			}
			else{
				flash.message = message(code: 'no.available.beds')
				redirect(action:"show", controller:"room", params:[id:roomInstance.id])
			}
	  }
	  
	def remove_lodger(Long id) {
        def lodgerInstance = Lodger.get(id)
		def roomInstance = lodgerInstance.roomNumber
		Lodger.executeUpdate("update Lodger p set p.status='Removed'" + "where p.id='${lodgerInstance.id}'")
		update_vacancy_status(roomInstance.id)
		flash.message = "Lodger ${lodgerInstance.lastName} removed from ${roomInstance.roomName}"
		redirect(action: "show", controller:"room", id: roomInstance.id)
	}
	
	def saveUnofficialLodger(){
		  def lodgerInstance = new Lodger(params)
		  def roomId = lodgerInstance.roomNumber.id
			def roomInstance = Room.get(roomId)
			if (!lodgerInstance.save(flush: true)) {
            redirect(view: "createUnofficialLodger", params: [roomId: roomId])
            return
        }
		update_vacancy_status(roomInstance.id)
        flash.message = "Your almost done. Click finish to complete your reservation process."
		def reservationCode = org.apache.commons.lang.RandomStringUtils.random(9, true, true)
		redirect(action: "createPUBLIC", controller: "Reservation", params:[roomId: roomInstance.id, lodgerId:lodgerInstance.id, reservationCode:reservationCode])
      
	}

    def save() {
        def lodgerInstance = new Lodger(params)
		def roomId = lodgerInstance.roomNumber.id
		def roomInstance = Room.get(roomId)
        if (!lodgerInstance.save(flush: true)) {
            render(view: "create", model: [lodgerInstance: lodgerInstance])
            return
        }
		

		update_vacancy_status(roomInstance.id)

        flash.message = message(code: 'default.created.message', args: [message(code: 'lodger.label', default: 'Lodger'), lodgerInstance.lastName])
        redirect(action: "show", id: lodgerInstance.id)
    }

    def show(Long id) {
        def lodgerInstance = Lodger.get(id)
        if (!lodgerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'lodger.label', default: 'Lodger'), id])
            redirect(action: "list")
            return
        }

        [lodgerInstance: lodgerInstance]
    }

    def edit(Long id) {
        def lodgerInstance = Lodger.get(id)
        if (!lodgerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'lodger.label', default: 'Lodger'), id])
            redirect(action: "list")
            return
        }

      
        [lodgerInstance: lodgerInstance]
    }

    def update(Long id, Long version) {
        def lodgerInstance = Lodger.get(id)
		def roomInstance = lodgerInstance.roomNumber
        if (!lodgerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'lodger.label', default: 'Lodger'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (lodgerInstance.version > version) {
                lodgerInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'lodger.label', default: 'Lodger')] as Object[],
                          "Another user has updated this Lodger while you were editing")
                render(view: "edit", model: [lodgerInstance: lodgerInstance])
                return
            }
        }

		def previousRoom = lodgerInstance.roomNumber
		def previousGender = lodgerInstance.gender
        lodgerInstance.properties = params
		update_vacancy_status(roomInstance.id)
		if ((lodgerInstance.gender != lodgerInstance.roomNumber.lodgerType)) {
			lodgerInstance.errors.rejectValue("version", "gender.update.failed",
                          null,"")
			lodgerInstance.gender = previousGender
            render(view: "edit", model: [lodgerInstance: lodgerInstance])
            return
			
        }
		
		if(lodgerInstance.roomNumber.id == previousRoom.id){
		update_vacancy_status(roomInstance.id)
        flash.message = message(code: 'default.updated.message', args: [message(code: 'lodger.label', default: 'Lodger'), lodgerInstance.lastName])
        redirect(action: "show", id: lodgerInstance.id)
		}
		
		if(lodgerInstance.roomNumber.vacancyStatus == "Full"){
				lodgerInstance.errors.rejectValue("version", "no.vacant.bed",
                          [lodgerInstance.roomNumber.roomName] as Object[],"")
				lodgerInstance.roomNumber = previousRoom
				render(view: "edit", model: [lodgerInstance: lodgerInstance])
				return
		}

			

        if (!lodgerInstance.save(flush: true)) {
            render(view: "edit", model: [lodgerInstance: lodgerInstance])
            return
        }

	
    }

    def delete(Long id) {
        def lodgerInstance = Lodger.get(id)
		def roomInstance = lodgerInstance.roomNumber
		
        if (!lodgerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'lodger.label', default: 'Lodger'), id])
            redirect(action: "list")
            return
        }

        try {
            lodgerInstance.delete(flush: true)
			update_vacancy_status(roomInstance.id)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'lodger.label', default: 'Lodger'), id])
            redirect(action: "show", controller:"Room", params:[id:roomInstance.id] )
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'lodger.label', default: 'Lodger'), id])
            redirect(action: "show", id: id)
        }
    }
	
	def searchableService

	def searchLodger(){
		def query = params.lodgerName
		
		if(query){
			def srchResults = searchableService.search(query)
			def results = srchResults.results
			if(results)
			render(view: "list", model: [lodgerInstanceList: results, lodgerInstanceTotal: results.size()])	
			else{
				flash.message = message(code: 'no.lodger.found')
				redirect(action:"list")
			}
		}
		else{
			flash.message = message(code: 'empty.params')
			redirect(action:"list")
		}
	}
	
	def showCurrentLodgers(Long id){
		def roomInstance = Room.get(id)
		def title = "Current Lodgers"
		def officialLodger = Lodger.findAllWhere(roomNumber: roomInstance, status: "Official")
		def methodName = "showCurrentLodgers"
		
		if(officialLodger){
		render(view:"roomLodgers", controller:"Lodger", model:[lodgerInstanceList: officialLodger, lodgerInstanceTotal: officialLodger.size(), roomInstance:roomInstance, title:title, methodName:methodName])
		return
		}
		
		flash.message = message(code: 'empty.room.lodger', args: [title])
        redirect(action:"show", controller:"Room", params:[id:roomInstance.id])
	}
	
	def showReservedLodgers(Long id){
		def roomInstance = Room.get(id)
		def title = "Reserved Lodgers"
		def unOfficialLodger = Lodger.findAllWhere(roomNumber: roomInstance, status: "Unofficial")
		def methodName = "showReservedLodgers"
		
		if(unOfficialLodger){
		render(view:"roomLodgers", controller:"Lodger", model:[lodgerInstanceList: unOfficialLodger, lodgerInstanceTotal: unOfficialLodger.size(), roomInstance:roomInstance, title:title, methodName:methodName])
		return
		}
	
		flash.message = message(code: 'empty.room.lodger', args: [title])
        redirect(action:"show", controller:"Room", params:[id:roomInstance.id])
	}
	
	def showRemovedLodgers(Long id){
		def roomInstance = Room.get(id)
		def title = "Removed Lodgers"
		def removedLodger = Lodger.findAllWhere(roomNumber: roomInstance, status: "Removed")
		def methodName = "showRemovedLodgers"
		
		if(removedLodger){
		render(view:"roomLodgers", controller:"Lodger", model:[lodgerInstanceList: removedLodger, lodgerInstanceTotal: removedLodger.size(), roomInstance:roomInstance, title:title, methodName:methodName])
		return
		}
		
		flash.message = message(code: 'empty.room.lodger', args: [title])
        redirect(action:"show", controller:"Room", params:[id:roomInstance.id])
	
	}
	
	def editLodgerPUBLIC(Long id) {
        def reservationInstance = Reservation.get(id)
		def lodgerInstance = reservationInstance.lodger
		def roomInstance = lodgerInstance.roomNumber
      
        render(view:"editForLodgerPUBLIC", model:[lodgerInstance: lodgerInstance, roomInstance:roomInstance, reservationInstance:reservationInstance])
    }
	
	def editLodger(Long id) {
        def reservationInstance = Reservation.get(id)
		def lodgerInstance = reservationInstance.lodger
		def roomInstance = lodgerInstance.roomNumber
      
        render(view:"editForLodger", model:[lodgerInstance: lodgerInstance, roomInstance:roomInstance, reservationInstance:reservationInstance])
    }
	
	def updateForLodgerPUBLIC(Long id, Long version) {
        def lodgerInstance = Lodger.get(id)
		def roomInstance = lodgerInstance.roomNumber
  
        if (version != null) {
            if (lodgerInstance.version > version) {
                lodgerInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'lodger.label', default: 'Lodger')] as Object[],
                          "Another user has updated this Lodger while you were editing")
                render(view: "editForLodgerPUBLIC", model: [lodgerInstance: lodgerInstance, roomInstance:roomInstance])
                return
            }
        }

		def previousRoom = lodgerInstance.roomNumber
		def previousGender = lodgerInstance.gender
        lodgerInstance.properties = params
		update_vacancy_status(roomInstance.id)
		if ((lodgerInstance.gender != lodgerInstance.roomNumber.lodgerType)) {
			lodgerInstance.errors.rejectValue("version", "gender.update.failed",
                          null,"")
			lodgerInstance.gender = previousGender
            render(view: "editForLodgerPUBLIC", model: [lodgerInstance: lodgerInstance, roomInstance:roomInstance])
            return
			
        }
		
		if(lodgerInstance.roomNumber.id == previousRoom.id){
		update_vacancy_status(roomInstance.id)
        flash.message = "Your information has been updated."
        redirect(action: "showPUBLIC", id: lodgerInstance.id)
		}
		
		if(lodgerInstance.roomNumber.vacancyStatus == "Full"){
				lodgerInstance.errors.rejectValue("version", "no.vacant.bed",
                          [lodgerInstance.roomNumber.roomName] as Object[],"")
				lodgerInstance.roomNumber = previousRoom
				render(view: "editForLodgerPUBLIC", model: [lodgerInstance: lodgerInstance, roomInstance:roomInstance])
				return
		}

			

        if (!lodgerInstance.save(flush: true)) {
            render(view: "editForLodger", model: [lodgerInstance: lodgerInstance, roomInstance:roomInstance])
            return
        }

	
    }
	
	def showPUBLIC(Long id) {
        def lodgerInstance = Lodger.get(id)
    
        [lodgerInstance: lodgerInstance]
    }
	
	def deletePUBLIC(Long id) {
        def lodgerInstance = Lodger.get(id)
		def roomInstance = lodgerInstance.roomNumber
            lodgerInstance.delete(flush: true)
			update_vacancy_status(roomInstance.id)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'lodger.label', default: 'Lodger'), id])
            redirect(action: "show", controller:"Room", params:[id:roomInstance.id] )
       
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
