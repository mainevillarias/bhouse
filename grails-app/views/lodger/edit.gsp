<%@ page import="newsystem.Lodger" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="layout">
		<g:set var="entityName" value="${message(code: 'lodger.label', default: 'Lodger')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>

		<div id="edit-lodger" class="content scaffold-edit" role="main">
			<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${lodgerInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${lodgerInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form method="post" >
				<g:hiddenField name="id" value="${lodgerInstance?.id}" />
				<g:hiddenField name="version" value="${lodgerInstance?.version}" />
				<fieldset class="form">
					<g:render template="formForEdit"/>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
					<g:actionSubmit class="" action="show" value="Cancel Update" />
				</fieldset>
			</g:form>
		</div>
		<p class="button-style"><g:link class="" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></p>
	</body>
</html>
