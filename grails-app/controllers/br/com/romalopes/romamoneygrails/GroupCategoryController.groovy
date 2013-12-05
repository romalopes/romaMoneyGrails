package br.com.romalopes.romamoneygrails

class GroupCategoryController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [groupCategoryInstanceList: GroupCategory.list(params), groupCategoryInstanceTotal: GroupCategory.count()]
    }

    def create() {
        [groupCategoryInstance: new GroupCategory(params)]
    }

    def save() {
        def groupCategoryInstance = new GroupCategory(params)
        if (!groupCategoryInstance.save(flush: true)) {
            render(view: "create", model: [groupCategoryInstance: groupCategoryInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'groupCategory.label', default: 'GroupCategory'), groupCategoryInstance.id])
        redirect(action: "show", id: groupCategoryInstance.id)
    }

    def show(Long id) {
        def groupCategoryInstance = GroupCategory.get(id)
        if (!groupCategoryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'groupCategory.label', default: 'GroupCategory'), id])
            redirect(action: "list")
            return
        }

        [groupCategoryInstance: groupCategoryInstance]
    }

    def edit(Long id) {
        def groupCategoryInstance = GroupCategory.get(id)
        if (!groupCategoryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'groupCategory.label', default: 'GroupCategory'), id])
            redirect(action: "list")
            return
        }

        [groupCategoryInstance: groupCategoryInstance]
    }

    def update(Long id, Long version) {
        def groupCategoryInstance = GroupCategory.get(id)
        if (!groupCategoryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'groupCategory.label', default: 'GroupCategory'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (groupCategoryInstance.version > version) {
                groupCategoryInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'groupCategory.label', default: 'GroupCategory')] as Object[],
                          "Another user has updated this GroupCategory while you were editing")
                render(view: "edit", model: [groupCategoryInstance: groupCategoryInstance])
                return
            }
        }

        groupCategoryInstance.properties = params

        if (!groupCategoryInstance.save(flush: true)) {
            render(view: "edit", model: [groupCategoryInstance: groupCategoryInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'groupCategory.label', default: 'GroupCategory'), groupCategoryInstance.id])
        redirect(action: "show", id: groupCategoryInstance.id)
    }

    def delete(Long id) {
        def groupCategoryInstance = GroupCategory.get(id)
        if (!groupCategoryInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'groupCategory.label', default: 'GroupCategory'), id])
            redirect(action: "list")
            return
        }

        groupCategoryInstance.delete(flush: true)
        flash.message = message(code: 'default.deleted.message', args: [message(code: 'groupCategory.label', default: 'GroupCategory'), id])
        redirect(action: "list")
    }
}
