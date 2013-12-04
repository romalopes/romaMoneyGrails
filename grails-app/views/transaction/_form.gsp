<%@ page import="br.com.romalopes.romamoneygrails.Transaction" %>



<div class="fieldcontain ${hasErrors(bean: transactionInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="transaction.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="50" required="" value="${transactionInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: transactionInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="transaction.description.label" default="Description" />
		
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="300" value="${transactionInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: transactionInstance, field: 'value', 'error')} required">
	<label for="value">
		<g:message code="transaction.value.label" default="Value" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="value" value="${fieldValue(bean: transactionInstance, field: 'value')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: transactionInstance, field: 'dateCreation', 'error')} required">
	<label for="dateCreation">
		<g:message code="transaction.dateCreation.label" default="Date Creation" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dateCreation" precision="day"  value="${transactionInstance?.dateCreation}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: transactionInstance, field: 'category', 'error')} required">
	<label for="category">
		<g:message code="transaction.category.label" default="Category" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="category" name="category.id" from="${br.com.romalopes.romamoneygrails.Category.list()}" optionKey="id" required="" value="${transactionInstance?.category?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: transactionInstance, field: 'bankAccount', 'error')} required">
	<label for="bankAccount">
		<g:message code="transaction.bankAccount.label" default="Bank Account" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="bankAccount" name="bankAccount.id" from="${br.com.romalopes.romamoneygrails.BankAccount.list()}" optionKey="id" required="" value="${transactionInstance?.bankAccount?.id}" class="many-to-one"/>
</div>

