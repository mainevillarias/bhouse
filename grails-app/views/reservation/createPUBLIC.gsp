<%@ page import="newsystem.Reservation" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'reservation.label', default: 'Reservation')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'home.css')}" type="text/css">
		
	</head>
	<body>
		<div class="center">
		<div id="create-reservation" class="content scaffold-create" role="main">
			<br>
			<h1>Apply Reservation</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${reservationInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${reservationInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form action="save" >
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="buttons" value="FINISH!" />
				</fieldset>
			</g:form>
		</div>
		</div>
	</body>
</html>
