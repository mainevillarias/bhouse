package newsystem

import org.springframework.dao.DataIntegrityViolationException
import org.apache.commons.lang.RandomStringUtils


class PaymentController extends BaseController{

	def beforeInterceptor = [action:this.&auth]


    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [paymentInstanceList: Payment.list(params), paymentInstanceTotal: Payment.count()]
    }

    def create() {
		
        [paymentInstance: new Payment(params)]
    }

    def save() {
		def paymentInstance = new Payment(params)
		def datePaid = new Date()
		paymentInstance.paymentDate = datePaid
		def lodgerInstance = Lodger.get(params.lodgerId)
		def roomInstance = lodgerInstance.roomNumber
		def totalBill = paymentInstance.paymentAmount
		def paymentStatus = paymentInstance.paymentStatus
		def orNumber = paymentInstance.orNumber
		def version = paymentInstance.version
		
        if (!paymentInstance.save(flush: true)) {
            render(view: "create", model: [paymentInstance: paymentInstance])
			
            return
        }
		
		
		if ( (paymentInstance.amountPaid > paymentInstance.paymentAmount) ) {
			//paymentInstance.errors.rejectValue("version", "amount.limit.reached",
             //             [paymentInstance.paymentAmount] as Object[],"")
			//edit(paymentInstance.id)
			paymentInstance.amountPaid = 0
			flash.message = message(code:'amount.limit.reached', args:[paymentInstance.paymentAmount])
			
			render(view:"edit", model:[paymentInstance: paymentInstance, lodgerInstance: lodgerInstance, roomInstance: roomInstance, totalBill: totalBill, paymentStatus:paymentStatus, orNumber:orNumber])
				return
			
        }

        def balance = paymentInstance.paymentAmount - paymentInstance.amountPaid
		if(balance == 0){
			lodgerInstance.previousBalance = 0
		}
		else{
			lodgerInstance.previousBalance = balance
		}
		
	
		flash.message = message(code: 'default.created.message', args: [message(code: 'payment.label', default: 'Payment'), paymentInstance.orNumber])
        
		render(view: "receipt", model:[paymentInstance: paymentInstance, balance:balance, lodgerInstance:lodgerInstance])
		//redirect(action:"show", id:paymentInstance.id)
    }

    def show(Long id) {
        def paymentInstance = Payment.get(id)
		
        if (!paymentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'payment.label', default: 'Payment'), id])
            redirect(action: "list")
            return
        }

        [paymentInstance: paymentInstance]
    }

    def edit(Long id) {
        def paymentInstance = Payment.get(id)
		def lodgerInstance = paymentInstance.lodger
		def roomInstance = lodgerInstance.roomNumber
		def totalBill = paymentInstance.paymentAmount
		def paymentStatus = paymentInstance.paymentStatus
		
        if (!paymentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'payment.label', default: 'Payment'), id])
            redirect(action: "list")
            return
        }
		
		if(paymentInstance.paymentStatus == 'Full Payment'){
			flash.message = "Full Payment cannot be edited."
			redirect(action: "show", id: paymentInstance.id)
			return
		}
		def orNumber = paymentInstance.orNumber
		
		[paymentInstance: paymentInstance, lodgerInstance: lodgerInstance, roomInstance: roomInstance, totalBill: totalBill, paymentStatus:paymentStatus, orNumber:orNumber]

    }

    def update(Long id, Long version) {
        def paymentInstance = Payment.get(id)
        if (!paymentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'payment.label', default: 'Payment'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (paymentInstance.version > version) {
                paymentInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'payment.label', default: 'Payment')] as Object[],
                          "Another user has updated this Payment while you were editing")
                render(view: "edit", model: [paymentInstance: paymentInstance])
                return
            }
        }

			
		def totalPayment = paymentInstance.paymentAmount
		def amountP = paymentInstance.amountPaid
		def roomInstance = paymentInstance.lodger.roomNumber
		def totalBill = totalPayment
		def paymentStatus = paymentInstance.paymentStatus
		def orNumber = paymentInstance.orNumber

        paymentInstance.properties = params
		
	
		
		if ( (paymentInstance.amountPaid > totalPayment) ) {
			paymentInstance.errors.rejectValue("version", "amount.limit.reached",
                          [paymentInstance.paymentAmount] as Object[],"")
			paymentInstance.amountPaid = amountP
            render(view: "edit", model:[paymentInstance: paymentInstance, lodgerInstance: paymentInstance.lodger, roomInstance: roomInstance, totalBill: totalBill, paymentStatus:paymentStatus, orNumber:orNumber])
            return
			
        }

        if (!paymentInstance.save(flush: true)) {
            render(view: "edit", model: [paymentInstance: paymentInstance])
            return
        }

		def lodgerInstance = paymentInstance.lodger
		def balance = paymentInstance.paymentAmount - paymentInstance.amountPaid
		if(balance == 0){
			lodgerInstance.previousBalance = 0
		}
		else{
			lodgerInstance.previousBalance = balance
		}
	
		
		flash.message = message(code: 'default.updated.message', args: [message(code: 'payment.label', default: 'Payment'), paymentInstance.orNumber])
		render(view: "receipt", model:[paymentInstance: paymentInstance, balance:balance, lodgerInstance:lodgerInstance])
	 
    }

    def delete(Long id) {
        def paymentInstance = Payment.get(id)
        if (!paymentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'payment.label', default: 'Payment'), id])
            redirect(action: "list")
            return
        }

        try {
            paymentInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'payment.label', default: 'Payment'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'payment.label', default: 'Payment'), id])
            redirect(action: "show", id: id)
        }
    }
	
	def show_paymentOptions(){
		def lodgerInstance = Lodger.get(params.lodgerId)
		
		if(!(lodgerInstance.status.equals('Official'))){
		flash.message = "Payment transactions are only applicable for official lodgers."
		redirect(action:"show" ,controller:"Lodger", id:lodgerInstance.id )
		return
		}
		render(view:"paymentOptions", model:[lodgerInstance: lodgerInstance])
		
	}
	
	def createFullPayment(){
		def lodgerInstance = Lodger.get(params.lodgerId)
		def roomInstance = lodgerInstance.roomNumber
		def totalBill = lodgerInstance.previousBalance + roomInstance.roomRate
		def paymentStatus = "Full Payment"
		def orNumber = org.apache.commons.lang.RandomStringUtils.random(8, false, true)
        render(view:"createFullPayment",model:[paymentInstance: new Payment(params), lodgerInstance: lodgerInstance, roomInstance: roomInstance, totalBill: totalBill, paymentStatus:paymentStatus, orNumber:orNumber])
	}
	
	def createPartialPayment(){
		def lodgerInstance = Lodger.get(params.lodgerId)
		def roomInstance = lodgerInstance.roomNumber
		def totalBill
		if(lodgerInstance.previousBalance==0){
			 totalBill = roomInstance.roomRate
		}
		if(lodgerInstance.previousBalance!=0){
			 totalBill = lodgerInstance.previousBalance
		}
		
		def paymentStatus = "Partial Payment"
		def orNumber = org.apache.commons.lang.RandomStringUtils.random(8, false, true)
		[paymentInstance: new Payment(params), lodgerInstance: lodgerInstance, roomInstance: roomInstance, totalBill: totalBill, paymentStatus:paymentStatus, orNumber:orNumber]
	
	}
	
		def searchableService
		def searchPayment(){
		def paymentCode = params.paymentCode
		
		if(paymentCode){
			def srchResults = searchableService.search(paymentCode)
			def results = srchResults.results
			if(results)
			render(view: "list", model: [paymentInstanceList: results, paymentInstanceTotal: results.size()])	
			else{
				flash.message = message(code: 'no.payment.found')
				redirect(action:"list")
			}
		}else{
			flash.message = message(code: 'empty.params')
			redirect(action:"list")
			}
	}
	
	def showLodgersPayment(Long id){
		def lodgerInstance = Lodger.get(id)
		def paymentInstanceList = Payment.findAllWhere(lodger: lodgerInstance)
		def fullName = "${lodgerInstance.lastName}, "+"${lodgerInstance.firstName} "+"${lodgerInstance.middleName}"
		
		if(paymentInstanceList){
		render(view:"lodgerPaymentList", controller:"Payment", model:[paymentInstanceList:paymentInstanceList , paymentInstanceTotal: paymentInstanceList.size(), lodgerInstance:lodgerInstance])
		return
		}
	
		flash.message = message(code: 'empty.lodger.payments', args: [fullName])
        redirect(action:"show", controller:"Lodger", params:[id:lodgerInstance.id])
	
	}
}
