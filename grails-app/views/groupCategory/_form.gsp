<%@ page import="br.com.romalopes.romamoneygrails.GroupCategory" %>



<div class="fieldcontain ${hasErrors(bean: groupCategoryInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="groupCategory.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="50" required="" value="${groupCategoryInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: groupCategoryInstance, field: 'group_type', 'error')} required">
	<label for="group_type">
		<g:message code="groupCategory.group_type.label" default="Grouptype" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="group_type" from="${groupCategoryInstance.constraints.group_type.inList}" required="" value="${groupCategoryInstance?.group_type}" valueMessagePrefix="groupCategory.group_type"/>
</div>

<div class="fieldcontain ${hasErrors(bean: groupCategoryInstance, field: 'categories', 'error')} ">
	<label for="categories">
		<g:message code="groupCategory.categories.label" default="Categories" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${groupCategoryInstance?.categories?}" var="c">
    <li><g:link controller="category" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="category" action="create" params="['groupCategory.id': groupCategoryInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'category.label', default: 'Category')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: groupCategoryInstance, field: 'image', 'error')} ">
	<label for="image">
		<g:message code="groupCategory.image.label" default="Image" />
		
	</label>
	<g:textField name="image" value="${groupCategoryInstance?.image}"/>
</div>

