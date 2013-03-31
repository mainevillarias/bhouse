import newsystem.Account
class BootStrap {
		def init = { servletContext ->
			final String BACKUP_ADMIN = 'adminjoe'
				if (!Account.findByAccountId(BACKUP_ADMIN)) {
					new Account(accountId:BACKUP_ADMIN,password:'password').save()
				}
			}
		def destroy = {
	}
}