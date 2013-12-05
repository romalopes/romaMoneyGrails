package br.com.romalopes.romamoneygrails

class BankAccountController {

    def springSecurityService

    def generalService
    
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {

        redirect(action: "list", params: params)
    }

    def list(Integer max) {

        params.max = Math.min(max ?: 10, 100)
        def principal = springSecurityService.getPrincipal()
        def user = User.get(principal.id)

        def query = BankAccount.where {
                        user == user
                    }

        [bankAccountInstanceList: query.list(params), bankAccountInstanceTotal: BankAccount.count()]
//        [bankAccountInstanceList: BankAccount.list(params), bankAccountInstanceTotal: BankAccount.count()]
    }

    def create() {
        [bankAccountInstance: new BankAccount(params)]
    }

    def save() {
        def bankAccountInstance = new BankAccount(params)

        def principal = springSecurityService.getPrincipal()
        def user = User.get(principal.id)

        bankAccountInstance.user = user

        user.addToBankAccounts(bankAccountInstance)

        if(user.currentAccount == null) {
            user.currentAccount = bankAccountInstance
        }
        if (!user.save(flush: true)) {
            render(view: "create", model: [bankAccountInstance: bankAccountInstance])
            return
        }
        

        flash.message = message(code: 'default.created.message', args: [message(code: 'bankAccount.label', default: 'BankAccount'), bankAccountInstance.id])
        redirect(action: "show", id: bankAccountInstance.id)
    }

    def show(Long id) {
        def bankAccountInstance = BankAccount.get(id)
        if (!bankAccountInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bankAccount.label', default: 'BankAccount'), id])
            redirect(action: "list")
            return
        }

        [bankAccountInstance: bankAccountInstance]
    }

    def edit(Long id) {
        def bankAccountInstance = BankAccount.get(id)
        if (!bankAccountInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bankAccount.label', default: 'BankAccount'), id])
            redirect(action: "list")
            return
        }

        [bankAccountInstance: bankAccountInstance]
    }

    def update(Long id, Long version) {
        def bankAccountInstance = BankAccount.get(id)
        if (!bankAccountInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bankAccount.label', default: 'BankAccount'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (bankAccountInstance.version > version) {
                bankAccountInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'bankAccount.label', default: 'BankAccount')] as Object[],
                          "Another user has updated this BankAccount while you were editing")
                render(view: "edit", model: [bankAccountInstance: bankAccountInstance])
                return
            }
        }

        bankAccountInstance.properties = params

        if (!bankAccountInstance.save(flush: true)) {
            render(view: "edit", model: [bankAccountInstance: bankAccountInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'bankAccount.label', default: 'BankAccount'), bankAccountInstance.id])
        redirect(action: "show", id: bankAccountInstance.id)
    }

    def delete(Long id) {
        def bankAccountInstance = BankAccount.get(id)
        if (!bankAccountInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bankAccount.label', default: 'BankAccount'), id])
            redirect(action: "list")
            return
        }

        bankAccountInstance.delete(flush: true)
        flash.message = message(code: 'default.deleted.message', args: [message(code: 'bankAccount.label', default: 'BankAccount'), id])
        redirect(action: "list")
    }
}
