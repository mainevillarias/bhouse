package newsystem

class Lodger {

	String firstName
	String middleName
	String lastName
	String phonenumber
	String homeAddress
	String emailAddress
	Float previousBalance
	String gender
  
	Room roomNumber
	String status
  
	static hasMany = [payment: Payment]
  
  
	static constraints = {
		firstName(blank:false)
		middleName(blank:false)
		lastName(blank:false)
		gender(blank:false, inList:["Female", "Male"])
		phonenumber(blank:false)
		homeAddress()
		emailAddress()
		previousBalance(blank:true)

		roomNumber()
		status(inList:["Unofficial", "Official", "Removed"], blank:false)
	
  }
  
		static searchable = true
  
 	 String toString(){
		"${this.firstName}" + " ${this.middleName}" + " ${this.lastName}"
	}
	
}
