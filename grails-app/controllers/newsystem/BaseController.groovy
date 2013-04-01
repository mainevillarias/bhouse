package newsystem

abstract class BaseController {
	def auth() {
		if(!session.accountId) {
		def originalRequestParams = [controller:controllerName,action:actionName]
		originalRequestParams.putAll(params)
		session.originalRequestParams = originalRequestParams
		redirect(controller:'account',action:'login')
		return false
	}
	}
}