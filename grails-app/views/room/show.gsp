
<%@ page import="newsystem.Room" %>
<!DOCTYPE html>
<html>

	<head>
		<meta name="layout" content="layout">
		<g:set var="entityName" value="${message(code: 'room.label', default: 'Room')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
		
	</head>
	<body>
	<h1><g:message code="default.show.label" args="[entityName]" /></h1>

		
		<div align="center" class="nav" role="navigation">
<small><small><small><small>
			<p class="button-style"><g:link class="" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></p>
			<p class="button-style"><g:link class="" action="createOfficialLodger" controller="lodger" params="['roomId' : roomInstance.id]">Add Official Lodger</g:link></p>
			<p class="button-style"><g:link class="" action="createUnofficialLodger" controller="lodger" params="['roomId' : roomInstance.id]">Apply Reservation</g:link></p><p>&nbsp;</p>
</small></small></small></small>
		</div>
		
		<div id="show-room" class="content scaffold-show" role="main">
			
			<font color = "green"><big><g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if></big></font>
			
			
			
			<table>
				<g:if test="${roomInstance.roomName}">
				<tr>
					<td><g:message code="room.roomName.label" default="Room Name" /></td>
					
					<td><g:fieldValue bean="${roomInstance}" field="roomName"/></td>
					
				</tr>
				</g:if>

			<g:if test="${roomInstance?.roomDetails}">
				<tr>
					<td><g:message code="room.roomDetails.label" default="Room Details" /></td>
					
					<td><g:fieldValue bean="${roomInstance}" field="roomDetails"/></td>
					
				</tr>
				</g:if>
				
				<g:if test="${roomInstance?.lodgerType}">
				<tr>
					<td><g:message code="room.lodgerType.label" default="Lodger Type" /></td>
					
					<td><g:fieldValue bean="${roomInstance}" field="lodgerType"/></td>
					
				</tr>
				</g:if>
			
				<g:if test="${roomInstance?.roomRate}">
				<tr>
					<td><g:message code="room.roomRate.label" default="Room Rate" /> per head</td>
					
					<td>P<g:fieldValue bean="${roomInstance}" field="roomRate"/></td>
					
				</tr>
				</g:if>
			
				<g:if test="${roomInstance?.totalNumberOfBeds}">
				<tr>
					<td><g:message code="room.totalNumberOfBeds.label" default="Total Number Of Beds" /></td>
					
					<td><g:fieldValue bean="${roomInstance}" field="totalNumberOfBeds"/></td>
					
				</tr>
				</g:if>
			
				<g:if test="${roomInstance?.vacancyStatus}">
				<tr>
					<td><g:message code="room.vacancyStatus.label" default="Vacancy Status" /></td>
					
					<td><g:fieldValue bean="${roomInstance}" field="vacancyStatus"/></td>
					
				</tr>
				</g:if>
				
				
				<g:if test="${roomInstance.picture}">
					<tr>
					
					<span class="property-value" aria-labelledby="picture-label">
					<img class="picture" src="${createLink(controller:'room', action:'picture_image', id:roomInstance.ident())}" />
					</span>
					</tr>
				</g:if>
	
	
			</table>
			
	
			
		</div>

	
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${roomInstance?.id}" />
					<div align="left">
					
					<g:link class="" action="showCurrentLodgers" controller="Lodger" id="${roomInstance?.id}">Current Lodgers</g:link>
					<g:link class="" action="showReservedLodgers" controller="Lodger" id="${roomInstance?.id}">Reserved Lodgers</g:link>
					<g:link class="" action="showRemovedLodgers" controller="Lodger" id="${roomInstance?.id}">Removed Lodgers</g:link>
					
					</div>
					
				</fieldset>
			</g:form>
			
					<div  align="left" class="nav" role="navigation">
<small><small><small><small>
			<p class="button-style"><g:link class="" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></p>
			<p class="button-style"><g:link class="" action="edit" id="${roomInstance?.id}">Edit Room</g:link></p>
			<p class="button-style"><g:link class="" action="uploadPicture" id="${roomInstance?.id}">Upload Picture</g:link>
					</p><p>&nbsp;</p>
</small></small></small></small>
		</div>

		
	</body>
</html>
