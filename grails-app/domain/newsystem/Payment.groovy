package newsystem

class Payment {

	Date paymentDate
	String orNumber
	Float balance
	Date monthOfPayment
	Float paymentAmount//totalpayment
	String paymentStatus
	Float amountPaid
	
	Lodger lodger
	
	
    static constraints = {
		lodger()
		paymentDate()
		orNumber()
		balance(scale: 2)
		paymentAmount()
		paymentStatus(inList:["Partial Payment", "Full Payment"])
		amountPaid()
    }
	
	String toString(){
		"${this.orNumber}"
	}
	
	static searchable = true
}
