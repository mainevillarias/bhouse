<%@ page import="newsystem.Lodger" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="layout">
		<g:set var="entityName" value="${message(code: 'lodger.label', default: 'Lodger')}" />
		<title>Apply Reservation</title>
	</head>
	<body>
		<a href="#create-lodger" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			</ul>
		</div>
		<div id="create-lodger" class="content scaffold-create" role="main">
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
					<g:submitButton name="Next" class="save" value="Next" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
