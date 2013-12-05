package romamoneygrails

import br.com.romalopes.romamoneygrails.GeneralService;

class HasCurrentAccountTagLib {

	def generalService

	def hasCurrentAccount = { attrs, body ->

 	StringBuilder sb = new StringBuilder()

	sb << """
		<li><a href="transaction/list" class="list">${message(code: 'transaction.label', default: 'transaction')}</a</li>						
		"""
	out << ""
	if(generalService.getCurrentAccount())
		out << sb.toString()
		//out << "// + romaMoneyGrailsService.getCurrentAccount()
	}
}
