
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
				font-family:"Brush Script MT";
				color: darkblue;
				font-size:40px;
				text-shadow: 1px 1px 1px rgba(0, 0, 0, 0.8);
			}
			
		.bodyHeader{
			margin-left: 15em;
		}
		
		.bodyMessage{
			margin-left: 15em;
			margin-right: 25em;
			margin-bottom: 3em;
			font-family: 'Arvo', sans-serif;
			color: black;
			font-size:16px;
			text-shadow: 1px 1px 1px rgba(0, 0, 0, 0.8);
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
	

	
	<div class="bodyDescription" >
		<div class="bodyHeader">
		<elegantHeader1>You are 4 Steps away to your next home</elegantHeader1>
		</div>
		
		<div class="bodyMessage">
		Follow these steps to apply for reservation:
		<br><br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		Step 1.     	Choose a room from the list of available rooms.
		<br><br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		Step 2. 	   	Click apply for reservation.
		<br><br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		Step 3. 	   	Fill out all the required information.
		<br><br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		Step 4. 	   	Click FINISH.

		
		
		</div>
	</div>
		<p class="button-style"><g:link action="viewAvailableRooms" controller="Room">Continue</g:link></p>
		
		<div class="bodyDescription" >
		<br>
		Note: You can pay your reservation through money transfer (e.g. LBC, MLHUILLIER, CEBUANA , etc.)
		<br>
		Recipient's Details:
		<br>
		Phonenumber : 09876543212
		<br>
		Name:			Nelson Borgon
		<br>
		Address:		Purok 11-A, Canaway Street, Iligan City House no. 0031
		</div>
	</body>
</html>
