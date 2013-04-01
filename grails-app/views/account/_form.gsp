<%@ page import="newsystem.Account" %>



<div class="fieldcontain ${hasErrors(bean: accountInstance, field: 'accountId', 'error')} ">
	<label for="accountId">
		<g:message code="account.accountId.label" default="Account Id" />
		
	</label>
	<g:textField name="accountId" maxlength="8" value="${accountInstance?.accountId}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: accountInstance, field: 'password', 'error')} ">
	<label for="password">
		<g:message code="account.password.label" default="Password" />
		
	</label>
	<g:textField name="password" maxlength="8" value="${accountInstance?.password}"/>
</div>

