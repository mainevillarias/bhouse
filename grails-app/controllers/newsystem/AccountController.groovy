package newsystem

import org.springframework.dao.DataIntegrityViolationException

class AccountController extends BaseController{

	def beforeInterceptor = [action:this.&auth,except:['login', 'logout']]

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [accountInstanceList: Account.list(params), accountInstanceTotal: Account.count()]
    }

    def create() {
        [accountInstance: new Account(params)]
    }

    def save() {
        def accountInstance = new Account(params)
        if (!accountInstance.save(flush: true)) {
            render(view: "create", model: [accountInstance: accountInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'account.label', default: 'Account'), accountInstance.id])
        redirect(action: "show", id: accountInstance.id)
    }

    def show(Long id) {
        def accountInstance = Account.get(id)
        if (!accountInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'account.label', default: 'Account'), id])
            redirect(action: "list")
            return
        }

        [accountInstance: accountInstance]
    }

    def edit(Long id) {
        def accountInstance = Account.get(id)
        if (!accountInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'account.label', default: 'Account'), id])
            redirect(action: "list")
            return
        }

        [accountInstance: accountInstance]
    }

    def update(Long id, Long version) {
        def accountInstance = Account.get(id)
        if (!accountInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'account.label', default: 'Account'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (accountInstance.version > version) {
                accountInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'account.label', default: 'Account')] as Object[],
                          "Another user has updated this Account while you were editing")
                render(view: "edit", model: [accountInstance: accountInstance])
                return
            }
        }

        accountInstance.properties = params

        if (!accountInstance.save(flush: true)) {
            render(view: "edit", model: [accountInstance: accountInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'account.label', default: 'Account'), accountInstance.id])
        redirect(action: "show", id: accountInstance.id)
    }

    def delete(Long id) {
        def accountInstance = Account.get(id)
        if (!accountInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'account.label', default: 'Account'), id])
            redirect(action: "list")
            return
        }

        try {
            accountInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'account.label', default: 'Account'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'account.label', default: 'Account'), id])
            redirect(action: "show", id: id)
        }
    }
	
	def login = {
		if (request.method == "GET") {
			session.accountId = null
			def account = new Account()
		}
		else {
		
		def account = Account.findByAccountIdAndPassword(params.accountId,params.password)
		if (account) {
			session.accountId = account.accountId
			//redirect(controller:'room')
			def redirectParams =session.originalRequestParams?session.originalRequestParams:[controller:'room']
			redirect(redirectParams)
		}

		else {
		flash['message'] = 'Please enter a valid account ID and password'
		}

	}
	}
	
	def logout = {
		session.accountId = null
		flash.message = 'Successfully logged out'
		redirect(controller:'room', action:'listPUBLIC')
	}

}
