
<%@ page import="newsystem.Room" %>
<!DOCTYPE html>
<html>

	<head>
		<meta name="layout" content="main">
		<title>Rav</title>
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
			
		.bodyHeader{
			margin-left: 15em;
		}
		
		.bodyMessage{
			margin-left: 0em;
			margin-right: 0em;
			margin-bottom: 0em;
			font-family: 'Arvo', sans-serif;
			color: black;
			font-size:16px;
			text-shadow: 1px 1px 1px rgba(0, 0, 0, 0.8);
			background-color: #FFFFCC;
		}
-->
</style>
	</head>
	
	<g:if test="${!session.accountId}">
		<span class="menuButton">
	<g:link controller="account" action="login">Login</g:link>
</span>
</g:if>
	<body>
			<center><font color = "green"><g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if></font></center>
	
	
		
	<div>
	<fieldset class="black">
		<div id="myTable" class="homeTable" role="main">
			<center><tableStyle1>Available Rooms</tableStyle1></center>
			
	<div class="bodyDescription" >
		<div class="bodyMessage" align="center">
		Click a room from the list below and apply for reservation.
		</div>
	</div>
		
			
			<table height="50">
				<thead>
				
					<tr>
					
						<g:sortableColumn property="roomName" title="${message(code: 'room.roomName.label', default: 'Room Name')}" />
					
						<g:sortableColumn property="lodgerType" title="${message(code: 'room.lodgerType.label', default: 'Lodger Type')}" />
					
						<g:sortableColumn property="roomRate" title="${message(code: 'room.roomRate.label', default: 'Room Rate')}" />
					
						<g:sortableColumn property="vacancyStatus" title="${message(code: 'room.vacancyStatus.label', default: 'Vacancy Status')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${roomInstanceList}" status="i" var="roomInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="showPUBLIC" id="${roomInstance.id}">${fieldValue(bean: roomInstance, field: "roomName")}</g:link></td>
					
						
						<td>${fieldValue(bean: roomInstance, field: "lodgerType")}</td>
					
						<td>${fieldValue(bean: roomInstance, field: "roomRate")}</td>
					
						<td>${fieldValue(bean: roomInstance, field: "vacancyStatus")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			
				
		</div>
		</fieldset>
</div>
		
		
	</body>
</html>
