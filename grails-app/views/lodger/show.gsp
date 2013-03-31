
<%@ page import="newsystem.Lodger" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="layout">
		<g:set var="entityName" value="${message(code: 'lodger.label', default: 'Lodger')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'home.css')}" type="text/css">
	</head>
	<body>
<h1><g:message code="default.show.label" args="[entityName]" /></h1>
	

	
		<div id="show-lodger" class="content scaffold-show" role="main">
			
				<div align="" class="nav">
		<small><small><small><small>
			<p class="button-style"><g:link class="" action="show_paymentOptions" controller="payment" params="['lodgerId': lodgerInstance.id]">Add Payment</g:link></p>
			</small></small></small></small>
		</div>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			
				<g:if test="${lodgerInstance?.firstName}">
				<tr>
					<td><g:message code="lodger.firstName.label" default="First Name" /></td>
					
					<td><g:fieldValue bean="${lodgerInstance}" field="firstName"/></td>
					
				</tr>
				</g:if>
			
				<g:if test="${lodgerInstance?.middleName}">
				<tr>
					<td><g:message code="lodger.middleName.label" default="Middle Name" /></td>
					
					<td><g:fieldValue bean="${lodgerInstance}" field="middleName"/></td>
					
				</tr>
				</g:if>
			
				<g:if test="${lodgerInstance?.lastName}">
				<tr>
					<td><g:message code="lodger.lastName.label" default="Last Name" /></td>
					
					<td><g:fieldValue bean="${lodgerInstance}" field="lastName"/></td>
					
				</tr>
				</g:if>
			
				<g:if test="${lodgerInstance?.gender}">
				<tr>
					<td><g:message code="lodger.gender.label" default="Gender" /></td>
					
					<td><g:fieldValue bean="${lodgerInstance}" field="gender"/></td>
					
				</tr>
				</g:if>
			
				<g:if test="${lodgerInstance?.phonenumber}">
				<tr>
					<td><g:message code="lodger.phonenumber.label" default="Phonenumber" /></td>
					
					<td><g:fieldValue bean="${lodgerInstance}" field="phonenumber"/></td>
					
				</tr>
				</g:if>
			
				<g:if test="${lodgerInstance?.homeAddress}">
				<tr>
					<td><g:message code="lodger.homeAddress.label" default="Home Address" /></td>
					
					<td><g:fieldValue bean="${lodgerInstance}" field="homeAddress"/></td>
					
				</tr>
				</g:if>
			
				<g:if test="${lodgerInstance?.emailAddress}">
				<tr>
					<td><g:message code="lodger.emailAddress.label" default="Email Address" /></td>
					
					<td><g:fieldValue bean="${lodgerInstance}" field="emailAddress"/></td>
					
				</tr>
				</g:if>
			
				<g:if test="${lodgerInstance?.previousBalance}">
				<tr>
					<td><g:message code="lodger.previousBalance.label" default="Previous Balance" /></td>
					
					<td><g:fieldValue bean="${lodgerInstance}" field="previousBalance"/></td>
					
				</tr>
				</g:if>
			
				<g:if test="${lodgerInstance?.roomNumber}">
				<tr>
					<td><g:message code="lodger.roomNumber.label" default="Room Number" /></td>
					
					<td><g:link controller="room" action="show" id="${lodgerInstance?.roomNumber?.id}">${lodgerInstance?.roomNumber?.encodeAsHTML()}</g:link></td>
					
				</tr>
				</g:if>
			
				<g:if test="${lodgerInstance?.status}">
				<tr>
					<td><g:message code="lodger.status.label" default="Status" /></td>
					
					<td><g:fieldValue bean="${lodgerInstance}" field="status"/></td>
					
				</tr>
				</g:if>
			
				
			
			</table>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${lodgerInstance?.id}" />
					<g:link class="" action="edit" id="${lodgerInstance?.id}">Edit Lodger</g:link>
					<g:link class="" action="remove_lodger" id="${lodgerInstance?.id}">Remove Lodger</g:link>
					<g:link class="" action="showLodgersPayment" controller="Payment" id="${lodgerInstance?.id}">Payment List</g:link>
					
				</fieldset>
			</g:form>
		</div>
		
	</body>
</html>
