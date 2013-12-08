<%@ page import="br.com.romalopes.romamoneygrails.SecUser" %>



<div class="fieldcontain ${hasErrors(bean: secUserInstance, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="secUser.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="username" required="" value="${secUserInstance?.username}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: secUserInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="secUser.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="password" required="" value="${secUserInstance?.password}"/>
</div>
<%--

<div class="fieldcontain ${hasErrors(bean: secUserInstance, field: 'currentAccount', 'error')} ">
	<label for="currentAccount">
		<g:message code="secUser.currentAccount.label" default="Current Account" />
		
	</label>
	<g:select id="currentAccount" name="currentAccount.id" from="${br.com.romalopes.romamoneygrails.BankAccount.list()}" optionKey="id" value="${secUserInstance?.currentAccount?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: secUserInstance, field: 'bankAccounts', 'error')} ">
	<label for="bankAccounts">
		<g:message code="secUser.bankAccounts.label" default="Bank Accounts" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${secUserInstance?.bankAccounts?}" var="b">
    <li><g:link controller="bankAccount" action="show" id="${b.id}">${b?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="bankAccount" action="create" params="['secUser.id': secUserInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'bankAccount.label', default: 'BankAccount')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: secUserInstance, field: 'accountExpired', 'error')} ">
	<label for="accountExpired">
		<g:message code="secUser.accountExpired.label" default="Account Expired" />
		
	</label>
	<g:checkBox name="accountExpired" value="${secUserInstance?.accountExpired}" />
</div>

<div class="fieldcontain ${hasErrors(bean: secUserInstance, field: 'accountLocked', 'error')} ">
	<label for="accountLocked">
		<g:message code="secUser.accountLocked.label" default="Account Locked" />
		
	</label>
	<g:checkBox name="accountLocked" value="${secUserInstance?.accountLocked}" />
</div>

<div class="fieldcontain ${hasErrors(bean: secUserInstance, field: 'enabled', 'error')} ">
	<label for="enabled">
		<g:message code="secUser.enabled.label" default="Enabled" />
		
	</label>
	<g:checkBox name="enabled" value="${secUserInstance?.enabled}" />
</div>

<div class="fieldcontain ${hasErrors(bean: secUserInstance, field: 'passwordExpired', 'error')} ">
	<label for="passwordExpired">
		<g:message code="secUser.passwordExpired.label" default="Password Expired" />
		
	</label>
	<g:checkBox name="passwordExpired" value="${secUserInstance?.passwordExpired}" />
</div>

--%>