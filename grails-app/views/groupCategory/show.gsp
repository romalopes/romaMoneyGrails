
<%@ page import="br.com.romalopes.romamoneygrails.GroupCategory" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'groupCategory.label', default: 'GroupCategory')}" />
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
		<div id="show-groupCategory" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list groupCategory">
			
				<g:if test="${groupCategoryInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="groupCategory.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${groupCategoryInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${groupCategoryInstance?.groupType}">
				<li class="fieldcontain">
					<span id="groupType-label" class="property-label"><g:message code="groupCategory.groupType.label" default="Grouptype" /></span>
					
						<span class="property-value" aria-labelledby="groupType-label"><g:fieldValue bean="${groupCategoryInstance}" field="groupType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${groupCategoryInstance?.categories}">
				<li class="fieldcontain">
					<span id="categories-label" class="property-label"><g:message code="groupCategory.categories.label" default="Categories" /></span>
					
						<g:each in="${groupCategoryInstance.categories}" var="c">
						<span class="property-value" aria-labelledby="categories-label"><g:link controller="category" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${groupCategoryInstance?.image}">
				<li class="fieldcontain">
					<span id="image-label" class="property-label"><g:message code="groupCategory.image.label" default="Image" /></span>
					
						<span class="property-value" aria-labelledby="image-label"><g:fieldValue bean="${groupCategoryInstance}" field="image"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${groupCategoryInstance?.id}" />
					<g:link class="edit" action="edit" id="${groupCategoryInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
