
<%@ page import="br.com.romalopes.romamoneygrails.BankAccount" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bankAccount.label', default: 'BankAccount')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-bankAccount" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'bankAccount.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'bankAccount.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="balance" title="${message(code: 'bankAccount.balance.label', default: 'Balance')}" />
					
						<th><g:message code="bankAccount.user.label" default="User" /></th>
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'bankAccount.dateCreated.label', default: 'Date Created')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${bankAccountInstanceList}" status="i" var="bankAccountInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${bankAccountInstance.id}">${fieldValue(bean: bankAccountInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: bankAccountInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: bankAccountInstance, field: "balance")}</td>
					
						<td>${fieldValue(bean: bankAccountInstance, field: "secUser")}</td>
					
						<td><g:formatDate date="${bankAccountInstance.dateCreated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${bankAccountInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
