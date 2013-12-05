
<%@ page import="br.com.romalopes.romamoneygrails.Transaction" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'transaction.label', default: 'Transaction')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-transaction" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'transaction.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'transaction.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="value" title="${message(code: 'transaction.value.label', default: 'Value')}" />
					
						<g:sortableColumn property="dateCreation" title="${message(code: 'transaction.dateCreation.label', default: 'Date Creation')}" />
					
						<th><g:message code="transaction.category.label" default="Category" /></th>
					
						<th><g:message code="transaction.bankAccount.label" default="Bank Account" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${transactionInstanceList}" status="i" var="transactionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${transactionInstance.id}">${fieldValue(bean: transactionInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: transactionInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: transactionInstance, field: "value")}</td>
					
						<td><g:formatDate date="${transactionInstance.dateCreation}" /></td>
					
						<td>${fieldValue(bean: transactionInstance, field: "category")}</td>
					
						<td>${fieldValue(bean: transactionInstance, field: "bankAccount")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${transactionInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
