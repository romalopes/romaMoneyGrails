package romamoneygrails

import br.com.romalopes.romamoneygrails.GeneralService;

class HasCurrentAccountTagLib {

	def generalService

	def hasCurrentAccount = { attrs, body ->

 	StringBuilder sb = new StringBuilder()

	out << ""
	if(generalService.getCurrentAccount())
		out << body()
		//out << "// + romaMoneyGrailsService.getCurrentAccount()
	}
}
