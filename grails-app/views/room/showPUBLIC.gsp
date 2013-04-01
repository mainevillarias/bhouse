
<%@ page import="newsystem.Room" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'room.label', default: 'Room')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'home.css')}" type="text/css">
			<style type="text/css">
<!--
		
		
		elegantHeader1{
				margin: 0 auto;
				line-height: 2;
				font-family:"Edwardian Script ITC";
				color: darkblue;
				font-size:40px;
				text-shadow: 1px 1px 1px rgba(0, 0, 0, 0.8);
			}
			
			
		.center{
				background-color:white;
				margin-left: 10.85em;
				margin-right: 10.85em;
				margin-top: -0.6em;
		}

	
-->
</style>
			
	</head>
	<body>

<div class="center">
		
		
		<br>
			<center><h1>Room ${roomInstance.roomName}</h1></center>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			
			<table>
			
					<g:if test="${roomInstance.picture}">
				<tr>
					<td></td>
					<td>
					<img class="picture" src="${createLink(controller:'room', action:'picture_image', id:roomInstance.ident())}" />
					</td>
				</tr>
				</g:if>
				
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
			
			</table>				
			
	
			

		</div>	
		
<p class="button-style"><g:link class="" action="createUnofficialLodger" controller="lodger" params="['roomId' : roomInstance.id]">Reserve Room</g:link></p>
		
	</body>
</html>
