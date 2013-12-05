
<%@ page import="br.com.romalopes.romamoneygrails.Transaction" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'transaction.label', default: 'Transaction')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-transaction" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list transaction">
			
				<g:if test="${transactionInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="transaction.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${transactionInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${transactionInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="transaction.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${transactionInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${transactionInstance?.value}">
				<li class="fieldcontain">
					<span id="value-label" class="property-label"><g:message code="transaction.value.label" default="Value" /></span>
					
						<span class="property-value" aria-labelledby="value-label"><g:fieldValue bean="${transactionInstance}" field="value"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${transactionInstance?.dateCreation}">
				<li class="fieldcontain">
					<span id="dateCreation-label" class="property-label"><g:message code="transaction.dateCreation.label" default="Date Creation" /></span>
					
						<span class="property-value" aria-labelledby="dateCreation-label"><g:formatDate date="${transactionInstance?.dateCreation}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${transactionInstance?.category}">
				<li class="fieldcontain">
					<span id="category-label" class="property-label"><g:message code="transaction.category.label" default="Category" /></span>
					
						<span class="property-value" aria-labelledby="category-label"><g:link controller="category" action="show" id="${transactionInstance?.category?.id}">${transactionInstance?.category?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${transactionInstance?.bankAccount}">
				<li class="fieldcontain">
					<span id="bankAccount-label" class="property-label"><g:message code="transaction.bankAccount.label" default="Bank Account" /></span>
					
						<span class="property-value" aria-labelledby="bankAccount-label"><g:link controller="bankAccount" action="show" id="${transactionInstance?.bankAccount?.id}">${transactionInstance?.bankAccount?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${transactionInstance?.id}" />
					<g:link class="edit" action="edit" id="${transactionInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
