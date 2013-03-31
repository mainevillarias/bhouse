<%@ page import="newsystem.Payment" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="layout">
		<g:set var="entityName" value="${message(code: 'payment.label', default: 'Payment')}" />
		<title>Full Payment</title>
	</head>
	<body>

	

		<div id="create-payment" class="content scaffold-create" role="main">
			<h1>Add Full Payment</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${paymentInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${paymentInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form action="save" >
			<input type="hidden" name="lodgerId" value="${lodgerInstance.id}"/>
				<fieldset class="form">
					<g:render template="formFullPayment"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
		</div>
		
			<p class="button-style"><g:link class="" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></p>
			<p class="button-style"><g:link class="" action="show" controller="Lodger" params="['id':lodgerInstance.id]">Back to ${lodgerInstance.firstName}'s profile</g:link></p>
	</body>
</html>
