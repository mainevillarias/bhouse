<%@ page import="newsystem.Room" %>
<!DOCTYPE html>
<html>

	<head>
		<meta name="layout" content="layout">
		<g:set var="entityName" value="${message(code: 'room.label', default: 'Room')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'style.css')}" type="text/css">
		
	</head>
	<body>
	
	

		<div id="edit" class="content scaffold-edit" role="main">
			<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${roomInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${roomInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form method="post" >
				<g:hiddenField name="id" value="${roomInstance?.id}" />
				<g:hiddenField name="version" value="${roomInstance?.version}" />
				<fieldset class="form">
					<g:render template="formForEdit"/>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
