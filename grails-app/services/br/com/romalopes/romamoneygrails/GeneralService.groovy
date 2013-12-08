package br.com.romalopes.romamoneygrails


class GeneralService {

	def springSecurityService

	def getCurrentUser() {
		def principal = springSecurityService.getPrincipal()
        return SecUser.get(principal.id)
    }

    def getCurrentAccount() {
    	SecUser user = getCurrentUser()
    	if(!user)
    		return null;
    	return user.currentAccount
    }

}