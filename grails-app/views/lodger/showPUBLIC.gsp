
<%@ page import="newsystem.Lodger" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'lodger.label', default: 'Lodger')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'home.css')}" type="text/css">
		
	</head>
	<body>
	<div class="center">
		<div id="show-lodger" class="content scaffold-show" role="main">
		<br>
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list lodger">
			
				<g:if test="${lodgerInstance?.firstName}">
				<li class="fieldcontain">
					<span id="firstName-label" class="property-label"><g:message code="lodger.firstName.label" default="First Name" /></span>
					
						<span class="property-value" aria-labelledby="firstName-label"><g:fieldValue bean="${lodgerInstance}" field="firstName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${lodgerInstance?.middleName}">
				<li class="fieldcontain">
					<span id="middleName-label" class="property-label"><g:message code="lodger.middleName.label" default="Middle Name" /></span>
					
						<span class="property-value" aria-labelledby="middleName-label"><g:fieldValue bean="${lodgerInstance}" field="middleName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${lodgerInstance?.lastName}">
				<li class="fieldcontain">
					<span id="lastName-label" class="property-label"><g:message code="lodger.lastName.label" default="Last Name" /></span>
					
						<span class="property-value" aria-labelledby="lastName-label"><g:fieldValue bean="${lodgerInstance}" field="lastName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${lodgerInstance?.gender}">
				<li class="fieldcontain">
					<span id="gender-label" class="property-label"><g:message code="lodger.gender.label" default="Gender" /></span>
					
						<span class="property-value" aria-labelledby="gender-label"><g:fieldValue bean="${lodgerInstance}" field="gender"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${lodgerInstance?.phonenumber}">
				<li class="fieldcontain">
					<span id="phonenumber-label" class="property-label"><g:message code="lodger.phonenumber.label" default="Phonenumber" /></span>
					
						<span class="property-value" aria-labelledby="phonenumber-label"><g:fieldValue bean="${lodgerInstance}" field="phonenumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${lodgerInstance?.homeAddress}">
				<li class="fieldcontain">
					<span id="homeAddress-label" class="property-label"><g:message code="lodger.homeAddress.label" default="Home Address" /></span>
					
						<span class="property-value" aria-labelledby="homeAddress-label"><g:fieldValue bean="${lodgerInstance}" field="homeAddress"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${lodgerInstance?.emailAddress}">
				<li class="fieldcontain">
					<span id="emailAddress-label" class="property-label"><g:message code="lodger.emailAddress.label" default="Email Address" /></span>
					
						<span class="property-value" aria-labelledby="emailAddress-label"><g:fieldValue bean="${lodgerInstance}" field="emailAddress"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${lodgerInstance?.previousBalance}">
				<li class="fieldcontain">
					<span id="previousBalance-label" class="property-label"><g:message code="lodger.previousBalance.label" default="Previous Balance" /></span>
					
						<span class="property-value" aria-labelledby="previousBalance-label"><g:fieldValue bean="${lodgerInstance}" field="previousBalance"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${lodgerInstance?.roomNumber}">
				<li class="fieldcontain">
					<span id="roomNumber-label" class="property-label"><g:message code="lodger.roomNumber.label" default="Room Number" /></span>
					
						<span class="property-value" aria-labelledby="roomNumber-label">${lodgerInstance?.roomNumber?.encodeAsHTML()}</span>
					
				</li>
				</g:if>
			
				<g:if test="${lodgerInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="lodger.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${lodgerInstance}" field="status"/></span>
					
				</li>
				</g:if>
			
				
			
			</ol>
		
		</div>
		</div>
	</body>
	
</html>
