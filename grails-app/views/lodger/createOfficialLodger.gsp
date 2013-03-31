<%@ page import="newsystem.Lodger" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="layout">
		<g:set var="entityName" value="${message(code: 'lodger.label', default: 'Lodger')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>

	</head>
	<body>
		
		<div id="create-lodger" class="content scaffold-create" role="main">
			<h1>Create Official Lodger</h1>
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
			<g:form action="save" >
				<fieldset class="form">
					<g:render template="formOfficialLodger"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
		</div>
		<p class="button-style"><g:link class="" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></p>
	</body>
</html>
