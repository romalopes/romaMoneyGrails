
<%@ page import="br.com.romalopes.romamoneygrails.GroupCategory" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'groupCategory.label', default: 'GroupCategory')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-groupCategory" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'groupCategory.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="groupType" title="${message(code: 'groupCategory.groupType.label', default: 'Grouptype')}" />
					
						<g:sortableColumn property="image" title="${message(code: 'groupCategory.image.label', default: 'Image')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${groupCategoryInstanceList}" status="i" var="groupCategoryInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${groupCategoryInstance.id}">${fieldValue(bean: groupCategoryInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: groupCategoryInstance, field: "groupType")}</td>
					
						<td>${fieldValue(bean: groupCategoryInstance, field: "image")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${groupCategoryInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
