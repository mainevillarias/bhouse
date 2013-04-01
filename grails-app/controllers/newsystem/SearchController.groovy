package newsystem

class SearchController {

    def index() { }

	def search(){
		def parameter = params.parameter
		def resultType = params.resultType
		
		if(resultType == 'room name'){
			redirect(action:"searchRoom", params:[roomName:parameter], controller:"Room")
			return
		}
		
		if(resultType == 'lodger'){
			redirect(action:"searchLodger", params:[lodgerName: parameter], controller:"Lodger")
			return
		}
		
		if(resultType == 'or number'){
			redirect(action:"searchPayment", params:[paymentCode:parameter], controller:"Payment")
			return
		}
		
		if(resultType == 'reservation code'){
			redirect(action:"searchReservation", params:[reservationCode:parameter], controller:"Reservation")
			return
		}
		
	}
}
