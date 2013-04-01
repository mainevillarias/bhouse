
<%@ page import="newsystem.Reservation" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'reservation.label', default: 'Reservation')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'home.css')}" type="text/css">
				<style type="text/css">
<!--
	
		reservationCode{
			color: #006600;
			font-weight: bold;
		}
		
		deadline{
			color: red;
			font-weight: bold;
		}

		
-->
</style>
	</head>
	<body>

		<div class="center">
		<div id="show-reservation" class="content scaffold-show" role="main">
		<br>
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list reservation">
			
				<g:if test="${reservationInstance?.lodger}">
				<li class="fieldcontain">
					<span id="lodger-label" class="property-label"><g:message code="reservation.lodger.label" default="Lodger" /></span>
					
						<span class="property-value" aria-labelledby="lodger-label">${reservationInstance?.lodger?.encodeAsHTML()}</span>
					
				</li>
				</g:if>
			
				<g:if test="${reservationInstance?.roomNumber}">
				<li class="fieldcontain">
					<span id="roomNumber-label" class="property-label"><g:message code="reservation.roomNumber.label" default="Room Number" /></span>
					
						<span class="property-value" aria-labelledby="roomNumber-label">${reservationInstance?.roomNumber?.encodeAsHTML()}</span>
					
				</li>
				</g:if>
			
				<g:if test="${reservationInstance?.reservationCode}">
				<li class="fieldcontain">
					<span id="reservationCode-label" class="property-label"><g:message code="reservation.reservationCode.label" default="Reservation Code" /></span>
					
						<span class="property-value" aria-labelledby="reservationCode-label"><reservationCode><g:fieldValue bean="${reservationInstance}" field="reservationCode"/></reservationCode></span>
					
				</li>
				</g:if>
			
				<g:if test="${reservationInstance?.dateReserved}">
				<li class="fieldcontain">
					<span id="dateReserved-label" class="property-label"><g:message code="reservation.dateReserved.label" default="Date Reserved" /></span>
					
						<span class="property-value" aria-labelledby="dateReserved-label"><g:formatDate date="${reservationInstance?.dateReserved}" format="MMM-dd-yyyy" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${reservationInstance?.deadline}">
				<li class="fieldcontain">
					<span id="deadline-label" class="property-label"><g:message code="reservation.deadline.label" default="Deadline" /></span>
					
						<span class="property-value" aria-labelledby="deadline-label"><deadline><g:formatDate date="${reservationInstance?.deadline}" format="MMM-dd-yyyy" /></deadline></span>
					
				</li>
				</g:if>
			
				<g:if test="${reservationInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="reservation.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${reservationInstance}" field="status"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${reservationInstance?.id}" />
					<g:link class="buttons" action="editLodgerPUBLIC" controller="Lodger" id="${reservationInstance?.id}">Edit Your Information</g:link>
					<g:actionSubmit class="buttons" action="deletePUBLIC" controller="Reservation" value="Delete Reservation" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					
				</fieldset>
			</g:form>
		</div>
		</div>
	</body>
</html>
