<%@ page import="newsystem.Lodger" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="layout">
		<g:set var="entityName" value="${message(code: 'lodger.label', default: 'Lodger')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'home.css')}" type="text/css">
	</head>
	<body>

	<div class="center">
		<div id="edit-lodger" class="content scaffold-edit" role="main">
		<br>
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
					<g:render template="formForEditLodger"/>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="buttons" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
				</fieldset>
			</g:form>
		</div>
	</div>
	</body>
	
</html>