
<%@ page import="newsystem.Account" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="layout">
		<g:set var="entityName" value="${message(code: 'account.label', default: 'Account')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="show-account" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list account">
			
				<g:if test="${accountInstance?.accountId}">
				<li class="fieldcontain">
					<span id="accountId-label" class="property-label"><g:message code="account.accountId.label" default="Account Id" /></span>
					
						<span class="property-value" aria-labelledby="accountId-label"><g:fieldValue bean="${accountInstance}" field="accountId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${accountInstance?.password}">
				<li class="fieldcontain">
					<span id="password-label" class="property-label"><g:message code="account.password.label" default="Password" /></span>
					
						<span class="property-value" aria-labelledby="password-label"><g:fieldValue bean="${accountInstance}" field="password"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${accountInstance?.id}" />
					<g:link class="edit" action="edit" id="${accountInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
		<p class="button-style"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></p>
		<p class="button-style"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></p>
	</body>
</html>
