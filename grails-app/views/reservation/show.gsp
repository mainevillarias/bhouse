
<%@ page import="newsystem.Reservation" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="layout">
		<g:set var="entityName" value="${message(code: 'reservation.label', default: 'Reservation')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
				<h1><g:message code="default.show.label" args="[entityName]" /></h1>
	
<small><small>
<p class="button-style"><g:link class="" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></p>
<p class="button-style"><g:link action="extendReservation" params="['reservationId': reservationInstance.id]">Extend Deadline</g:link></p>
	<p class="button-style"><g:link action="confirmReservation" params="['reservationId': reservationInstance.id]">Confirm</g:link></p>
</small></small><p>&nbsp;</p>
		<div id="show-reservation" class="content scaffold-show" role="main">

			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			
				<g:if test="${reservationInstance?.lodger}">
				<tr>
					<td><g:message code="reservation.lodger.label" default="Lodger" /></td>
					
					<td><g:link controller="lodger" action="show" id="${reservationInstance?.lodger?.id}">${reservationInstance?.lodger?.encodeAsHTML()}</g:link></td>
					
				</tr>
				</g:if>
			
				<g:if test="${reservationInstance?.roomNumber}">
				<tr>
					<td><g:message code="reservation.roomNumber.label" default="Room Number" /></td>
					
					<td><g:link controller="room" action="show" id="${reservationInstance?.roomNumber?.id}">${reservationInstance?.roomNumber?.encodeAsHTML()}</g:link></td>
					
				</tr>
				</g:if>
			
				<g:if test="${reservationInstance?.reservationCode}">
				<tr>
					<td><g:message code="reservation.reservationCode.label" default="Reservation Code" /></td>
					
					<td><g:fieldValue bean="${reservationInstance}" field="reservationCode"/></td>
					
				</tr>
				</g:if>
			
				<g:if test="${reservationInstance?.dateReserved}">
				<tr>
					<td><g:message code="reservation.dateReserved.label" default="Date Reserved" /></td>
					
					<td><g:formatDate date="${reservationInstance?.dateReserved}" format="MMM-dd-yyyy" /></td>
					
				</tr>
				</g:if>
			
				<g:if test="${reservationInstance?.deadline}">
				<tr>
					<td><g:message code="reservation.deadline.label" default="Deadline" /></td>
					
					<td><g:formatDate date="${reservationInstance?.deadline}" format="MMM-dd-yyyy" /></td>
					
				</tr>
				</g:if>
			
				<g:if test="${reservationInstance?.status}">
				<tr>
					<td><g:message code="reservation.status.label" default="Status" /></td>
					
					<td><g:fieldValue bean="${reservationInstance}" field="status"/></td>
					
				</tr>
				</g:if>
			
			</table>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${reservationInstance?.id}" />
					<g:link class="" action="editLodger" controller="Lodger" id="${reservationInstance?.id}">Edit Lodger Information</g:link>
					<g:actionSubmit class="" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	
	</body>
</html>
