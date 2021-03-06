package br.com.romalopes.romamoneygrails

import br.com.romalopes.romamoneygrails.GeneralService;

class TransactionController {

    def generalService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [transactionInstanceList: Transaction.list(params), transactionInstanceTotal: Transaction.count()]
    }

    def create() {
        [transactionInstance: new Transaction(params)]
    }

    def save() {
        def transactionInstance = new Transaction(params)

        def user = generalService.getCurrentUser()

        assert(user && user.currentAccount)

        user.currentAccount.addToTransactions(transactionInstance)

        if (!user.currentAccount.save(flush: true)) {
            render(view: "create", model: [transactionInstance: transactionInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'transaction.label', default: 'Transaction'), transactionInstance.id])
        redirect(action: "show", id: transactionInstance.id)
    }

    def show(Long id) {
        def transactionInstance = Transaction.get(id)
        if (!transactionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'transaction.label', default: 'Transaction'), id])
            redirect(action: "list")
            return
        }

        [transactionInstance: transactionInstance]
    }

    def edit(Long id) {
        def transactionInstance = Transaction.get(id)
        if (!transactionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'transaction.label', default: 'Transaction'), id])
            redirect(action: "list")
            return
        }

        [transactionInstance: transactionInstance]
    }

    def update(Long id, Long version) {
        def transactionInstance = Transaction.get(id)
        if (!transactionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'transaction.label', default: 'Transaction'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (transactionInstance.version > version) {
                transactionInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'transaction.label', default: 'Transaction')] as Object[],
                          "Another user has updated this Transaction while you were editing")
                render(view: "edit", model: [transactionInstance: transactionInstance])
                return
            }
        }

        transactionInstance.properties = params

        if (!transactionInstance.save(flush: true)) {
            render(view: "edit", model: [transactionInstance: transactionInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'transaction.label', default: 'Transaction'), transactionInstance.id])
        redirect(action: "show", id: transactionInstance.id)
    }

    def delete(Long id) {
        def transactionInstance = Transaction.get(id)
        if (!transactionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'transaction.label', default: 'Transaction'), id])
            redirect(action: "list")
            return
        }

        transactionInstance.delete(flush: true)
        flash.message = message(code: 'default.deleted.message', args: [message(code: 'transaction.label', default: 'Transaction'), id])
        redirect(action: "list")
    }
}
