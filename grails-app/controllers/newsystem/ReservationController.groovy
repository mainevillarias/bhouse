package newsystem

import org.springframework.dao.DataIntegrityViolationException
import groovy.sql.Sql
import org.apache.commons.lang.RandomStringUtils

class ReservationController extends BaseController{

	def beforeInterceptor = [action:this.&auth, except:['createPUBLIC', 'save', 'showPUBLIC', 'searchReservationPUBLIC', 'deletePUBLIC']]


	def dataSource

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
		automaticDelete()
        [reservationInstanceList: Reservation.list(params), reservationInstanceTotal: Reservation.count()]
    }

    def create() {
		def roomInstance = Room.get(params.roomId)
		def lodgerInstance = Lodger.get(params.lodgerId)
		def reservationCode = params.reservationCode
		//def dateNow = new Date();
        [reservationInstance: new Reservation(params), roomInstance : roomInstance, lodgerInstance: lodgerInstance, reservationCode:reservationCode]
    
      
    }
	
	def extendReservation(){
		
		Sql sql = new Sql(dataSource)
		
		def reservationInstance = Reservation.get(params.reservationId)
		def deadline = reservationInstance.deadline
		deadline = deadline + 1
		sql.execute("UPDATE reservation SET deadline = '${deadline}' where reservation.id = '${reservationInstance.id}'")
		flash.message = "Reservation with code ${reservationInstance.reservationCode} added with 24 hours extention"
		redirect(action: "show", id: reservationInstance.id)
		
	}
	

    def save() {
        def reservationInstance = new Reservation(params)
		def dateNow = new Date()
		reservationInstance.dateReserved = dateNow
		reservationInstance.deadline = dateNow+1
		
		def lodgerInstance = reservationInstance.lodger
		def lodgerFirstName = lodgerInstance.firstName
		def reservationCode = reservationInstance.reservationCode
		def deadline = reservationInstance.deadline
		def roomRate = reservationInstance.roomNumber.roomRate
		def fullName = "${lodgerInstance.lastName}, ${lodgerInstance.firstName} ${lodgerInstance.middleName}"
        if (!reservationInstance.save(flush: true)) {
			lodgerInstance.delete()
            render(view: "create", model: [reservationInstance: reservationInstance])
            return
        }

		if(lodgerInstance.emailAddress){
		sendMail {     
		  to "${lodgerInstance.emailAddress}"     
		  subject "Online Boarding House Reservation"     
		  html 'Hello <b>' + lodgerFirstName +
				', </b> <br>Your Reservation Code is <b>'+reservationCode+'</b><br><b>Full Name:</b> '+ fullName +
				'</br><br> Please Pay <b>P'+roomRate +
				' </b> on or before <b>' + deadline.format("yyyy-MMM-dd") + '</b> or your reservation expires.'
			}
		flash.message = "Thank you for applying a reservation at Rav's Boarding House. Reservation with code " + reservationInstance.reservationCode + " created and sent to your email address."
        redirect(action: "showPUBLIC", id: reservationInstance.id)
		return
		}
		else{
        flash.message = "Thank you for applying a reservation at Rav's Boarding House. Please make a copy of your reservation code and pay your payment before deadline."
        redirect(action: "showPUBLIC", id: reservationInstance.id)
		}
    }

    def show(Long id) {
        def reservationInstance = Reservation.get(id)
        if (!reservationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'reservation.label', default: 'Reservation'), id])
            redirect(action: "list")
            return
        }

        [reservationInstance: reservationInstance]
    }

    def edit(Long id) {
        def reservationInstance = Reservation.get(id)
		def lodgerInstance = reservationInstance.lodger
		def roomInstance = lodgerInstance.roomNumber
		def reservationCode = reservationInstance.reservationCode
		def dateNow = new Date()
        if (!reservationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'reservation.label', default: 'Reservation'), id])
            redirect(action: "list")
            return
        }

        [reservationInstance: reservationInstance, lodgerInstance:lodgerInstance, roomInstance:roomInstance, dateNow: dateNow, reservationCode:reservationCode]
    }


    def update(Long id, Long version) {
		def dateNow = new Date()
        def reservationInstance = Reservation.get(id)
        if (!reservationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'reservation.label', default: 'Reservation'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (reservationInstance.version > version) {
                reservationInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'reservation.label', default: 'Reservation')] as Object[],
                          "Another user has updated this Reservation while you were editing")
                render(view: "edit", model: [reservationInstance: reservationInstance])
                return
            }
        }

        reservationInstance.properties = params

        if (!reservationInstance.save(flush: true)) {
            render(view: "edit", model: [reservationInstance: reservationInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'reservation.label', default: 'Reservation'), reservationInstance.id])
        redirect(action: "show", id: reservationInstance.id)
    }

    def delete(Long id) {
        def reservationInstance = Reservation.get(id)
		def lodgerInstance = reservationInstance.lodger
        if (!reservationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'reservation.label', default: 'Reservation'), id])
            redirect(action: "list")
            return
        }

        try {
            reservationInstance.delete(flush: true)
			lodgerInstance.delete()
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'reservation.label', default: 'Reservation'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'reservation.label', default: 'Reservation'), id])
            redirect(action: "show", id: id)
        }
		
    }
	
	def confirmReservation(){
		Sql sql = new Sql(dataSource)
		def reservationInstance = Reservation.get(params.reservationId)
		def lodgerInstance = reservationInstance.lodger
		sql.execute("UPDATE lodger SET status = 'Official' where id = '${reservationInstance.lodgerId}'")
		reservationInstance.delete()
		redirect(action:"show_paymentOptions", controller:"payment", params:[lodgerId: lodgerInstance.id])
		//redirect(action:"create", controller:"payment")
		
	}
	
	def automaticDelete(){
		def reservationList = Reservation.list()
		def dateNow = new Date();

		for(reservation in reservationList){
			if(reservation.deadline < dateNow){
		
			def lodgerInstance = reservation.lodger
			reservation.delete()
			lodgerInstance.delete()	
			index()	
			}	
		}		
	}
	
		def searchableService
	def searchReservation(){
		def reservationCode = params.reservationCode
		
		if(reservationCode){
			def srchResults = searchableService.search(reservationCode)
			def results = srchResults.results
			if(results)
			render(view: "list", model: [reservationInstanceList: results, reservationInstanceTotal: results.size()])	
			else{
				flash.message = message(code: 'no.reservation.found')
				redirect(action:"list")
			}
		}else{
				flash.message = message(code: 'empty.params')
				redirect(action:"list")
			}
	}
	
	def searchReservationPUBLIC(){
		def reservationCode = params.reservationCode
		
		if(reservationCode){
			def srchResults = searchableService.search(reservationCode)
			def results = srchResults.results
			if(results)
			render(view: "searchResultPUBLIC", model: [reservationInstanceList: results, reservationInstanceTotal: results.size()])	
			else{
				flash.message = message(code: 'no.reservation.found')
				render(view:"searchResultPUBLIC")
			}
		}else{
				flash.message = message(code: 'empty.params')
				render(view:"searchResultPUBLIC")
			}
	}
	
		
	def showPUBLIC(Long id) {
        def reservationInstance = Reservation.get(id)
        if (!reservationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'reservation.label', default: 'Reservation'), id])
            redirect(action: "searchResultPUBLIC")
            return
        }

        [reservationInstance: reservationInstance]
    }

		
	def editPUBLIC(Long id) {
        def reservationInstance = Reservation.get(id)
		def lodgerInstance = reservationInstance.lodger
		def roomInstance = lodgerInstance.roomNumber
		def reservationCode = reservationInstance.reservationCode
		def dateNow = new Date()
      
        [reservationInstance: reservationInstance, lodgerInstance:lodgerInstance, roomInstance:roomInstance, dateNow: dateNow, reservationCode:reservationCode]
    }
	
	 def deletePUBLIC(Long id) {
        def reservationInstance = Reservation.get(id)
		def lodgerInstance = reservationInstance.lodger


            reservationInstance.delete()
			lodgerInstance.delete()
            flash.message = "Reservation with code " +reservationInstance.reservationCode + " has been deleted."
            redirect(action: "listPUBLIC", controller:"Room")
      
		
    }
	
	def createPUBLIC() {
		def roomInstance = Room.get(params.roomId)
		def lodgerInstance = Lodger.get(params.lodgerId)
		def reservationCode = params.reservationCode
		//def dateNow = new Date();
        [reservationInstance: new Reservation(params), roomInstance : roomInstance, lodgerInstance: lodgerInstance, reservationCode:reservationCode]
    
      
    }

	
	
	
}
