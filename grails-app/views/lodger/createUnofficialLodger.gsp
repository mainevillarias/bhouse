<%@ page import="newsystem.Lodger" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'lodger.label', default: 'Lodger')}" />
		<title>Apply Reservation</title>
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'home.css')}" type="text/css">
		
	</head>
	<body>
		<div class="center">
		<div id="create-lodger" class="content scaffold-create" role="main">
			<br>
			<h1>Apply Reservation</h1>
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
			<g:form action="saveUnofficialLodger" >
				<fieldset class="form">
					<g:render template="formUnofficialLodger"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="Next"  class="buttons" value="Next" />
				</fieldset>
			</g:form>
		</div>
		</div>
	</body>
</html>
