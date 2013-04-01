package newsystem
import groovy.sql.Sql


class ReportController extends BaseController{

	def beforeInterceptor = [action:this.&auth]


	def dataSource
	
    def index() {
		render(view:"reportOptions")
	}
	
	def monthlyReport(){
		render(view:"monthlyReport")
	}
	
	def lodgersWithBalance(){
		render(view:"lodgersWithBalance")
	}
	
	def lodgersWithNoMonthPayment(){
		render(view:"lodgersWithNoMonthPayment")
	}
	
	def monthlyReportRange(){
		render(view:"monthlyReportRange")
	}
	
	def generateLodgerWithBalanceReport(){

		def status = "Official"

		def db = new Sql(dataSource) 
	
		def result = db.rows("SELECT lodger.id as lodger_id,lodger.first_name, lodger.middle_name, lodger.last_name, room.room_name, room.room_rate, lodger.previous_balance as lodger_balance from lodger INNER JOIN room on room.id = lodger.room_number_id where lodger.status = '${status}' and lodger.previous_balance > 0")
		render(view:"lodgersWithBalance", model:[result:result])
	}
	
	def generateMonthlyReport(){
		def dateOfPayment = params.monthOfPayment
		def month = dateOfPayment.month + 1
		
		def year = dateOfPayment.getAt(Calendar.YEAR)

		def db = new Sql(dataSource) 
	

		def result = db.rows("SELECT * FROM lodger INNER JOIN payment on lodger.id = payment.lodger_id where (extract(month from payment.month_of_payment) = '${month}' and extract(year from payment.month_of_payment) = '${year}') order by payment.id asc")
		def totalOfPayments = db.rows("SELECT sum(payment.amount_paid) FROM lodger INNER JOIN payment on lodger.id = payment.lodger_id where (extract(month from payment.month_of_payment) = '${month}' and extract(year from payment.month_of_payment) = '${year}') ")
		if(!result){
		flash.message = message(code: 'lodgers.monthly.payment.empty', args: ["${month}" + "-${year}" ])
		render(view:"monthlyReport", model:[result:result,totalOfPayments: totalOfPayments[0][0], monthOfPayment:dateOfPayment ])
		return
		}
		def totalInString = totalOfPayments[0][0].toString()
		flash.message = "Displaying Results"
		render(view:"monthlyReport", model:[result:result,totalOfPayments: totalOfPayments[0][0], monthOfPayment:dateOfPayment ])

	}
	
	def getLodgersWithNoMonthPayment(){
		def dateOfPayment = params.monthOfPayment
		def month = dateOfPayment.month + 1
		
		def year = dateOfPayment.getAt(Calendar.YEAR)

		def db = new Sql(dataSource) 
	
		def a = db.rows("SELECT distinct lodger.id as lodger_id,lodger.first_name, lodger.last_name, lodger.middle_name from lodger INNER JOIN payment on lodger.id = payment.lodger_id where (lodger.status = 'Official') ")
		def b = db.rows("SELECT distinct lodger.id as lodger_id,lodger.first_name, lodger.last_name, lodger.middle_name from lodger INNER JOIN payment on lodger.id = payment.lodger_id where (extract(month from payment.month_of_payment) = '${month}') and (extract(year from payment.month_of_payment) = '${year}') and (lodger.status = 'Official')")
		def result = a - b
	
		if(!result){
		flash.message = "All official lodgers have paid for this month."
		render(view:"lodgersWithNoMonthPayment", model:[result:result])
		return
		}
		
		flash.message = "Displaying Results"
		render(view:"lodgersWithNoMonthPayment", model:[result:result])

	}
	
	def generateMonthlyReportRange(){
		def dateOfPayment1 = params.paymentDate1_value
		def dateOfPayment2 = params.paymentDate2_value
		
		def month1 = params.paymentDate1_month
		def month2 = params.paymentDate2_month
		
		def year1 = params.paymentDate1_year
		def year2 = params.paymentDate2_year
		
		def db = new Sql(dataSource) 

		def result = db.rows("SELECT * FROM lodger INNER JOIN payment on lodger.id = payment.lodger_id where payment.payment_date between '${dateOfPayment1}' and '${dateOfPayment2}' order by payment.id asc")
		def totalOfPayments = db.rows("SELECT sum(payment.amount_paid) FROM lodger INNER JOIN payment on lodger.id = payment.lodger_id where payment.payment_date between '${dateOfPayment1}' and '${dateOfPayment2}' ")
		if(!result){
		flash.message = "No lodger has paid from "+dateOfPayment1+" to "+dateOfPayment2  
		render(view:"monthlyReportRange", model:[result:result,totalOfPayments: totalOfPayments[0][0] ])	
		return
		}
		flash.message = "Displaying Results" 
		
		render(view:"monthlyReportRange", model:[result:result,totalOfPayments: totalOfPayments[0][0]])

	}
	
	def generateJasperMonthlyReport(){
	
		
		def dateOfPayment = params.monthOfPayment2
		def month = dateOfPayment.month + 1
		
		def year = dateOfPayment.getAt(Calendar.YEAR)

		def db = new Sql(dataSource) 
		def totalOfPayments = db.rows("SELECT sum(payment.amount_paid) FROM lodger INNER JOIN payment on lodger.id = payment.lodger_id where (extract(month from payment.month_of_payment) = '${month}' and extract(year from payment.month_of_payment) = '${year}') ")
		
		params.total = "P" + totalOfPayments[0][0]
		
		def result = db.rows("SELECT * FROM lodger INNER JOIN payment on lodger.id = payment.lodger_id where (extract(month from payment.month_of_payment) = '${month}' and extract(year from payment.month_of_payment) = '${year}') order by payment.id asc")

		chain(controller:'jasper',action:'index',model:[data:result],params:params)
	}
	
	
}
