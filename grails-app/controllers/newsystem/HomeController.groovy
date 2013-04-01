package newsystem

class HomeController {

	def beforeInterceptor = [action:this.&auth, except:['index','reservationSteps']]

    def index() { 
	 render(view:"home")
	}
	
	def reservationSteps(){
	render(view:"reservationSteps")
	}
}
