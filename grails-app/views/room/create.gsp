<%@ page import="newsystem.Room" %>
<!DOCTYPE html>
<html>

	<head>
		<meta name="layout" content="layout">
		<g:set var="entityName" value="${message(code: 'room.label', default: 'Room')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	
	</head>
	<body>
	
	<h1><g:message code="default.create.label" args="[entityName]" /></h1>
		
		<div id="create-room" class="nav" role="main">
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
			<g:form action="save" >
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
