<%@ page import="br.com.romalopes.romamoneygrails.Category" %>



<div class="fieldcontain ${hasErrors(bean: categoryInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="category.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="50" required="" value="${categoryInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: categoryInstance, field: 'groupCategory', 'error')} required">
	<label for="groupCategory">
		<g:message code="category.groupCategory.label" default="Group Category" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="groupCategory" name="groupCategory.id" from="${br.com.romalopes.romamoneygrails.GroupCategory.list()}" optionKey="id" required="" value="${categoryInstance?.groupCategory?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: categoryInstance, field: 'image', 'error')} ">
	<label for="image">
		<g:message code="category.image.label" default="Image" />
		
	</label>
	<g:textField name="image" value="${categoryInstance?.image}"/>
</div>

