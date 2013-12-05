package br.com.romalopes.romamoneygrails


class GeneralService {

	def springSecurityService

	def getCurrentUser() {
		def principal = springSecurityService.getPrincipal()
        return User.get(principal.id)
    }

    def getCurrentAccount() {
    	User user = getCurrentUser()
    	if(!user)
    		return null;
    	return user.currentAccount
    }

}