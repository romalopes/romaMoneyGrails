<%@ page import="br.com.romalopes.romamoneygrails.BankAccount" %>



<div class="fieldcontain ${hasErrors(bean: bankAccountInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="bankAccount.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="50" required="" value="${bankAccountInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bankAccountInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="bankAccount.description.label" default="Description" />
		
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="300" value="${bankAccountInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bankAccountInstance, field: 'balance', 'error')} required">
	<label for="balance">
		<g:message code="bankAccount.balance.label" default="Balance" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="balance" value="${fieldValue(bean: bankAccountInstance, field: 'balance')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: bankAccountInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="bankAccount.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${br.com.romalopes.romamoneygrails.User.list()}" optionKey="id" required="" value="${bankAccountInstance?.user?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bankAccountInstance, field: 'transactions', 'error')} ">
	<label for="transactions">
		<g:message code="bankAccount.transactions.label" default="Transactions" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${bankAccountInstance?.transactions?}" var="t">
    <li><g:link controller="transaction" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="transaction" action="create" params="['bankAccount.id': bankAccountInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'transaction.label', default: 'Transaction')])}</g:link>
</li>
</ul>

</div>

