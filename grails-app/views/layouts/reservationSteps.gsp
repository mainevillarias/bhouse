
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
	
	<div class="nav" role="navigation" >
			<ul>
			<li><a class="" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a><li>
			<li><g:link action="reservationSteps" controller="Home">Reservation</g:link><li>
				
			</ul>
		
				<div align="right">	
					<fieldset class="buttons">
					<g:form action="searchReservationPUBLIC" controller="reservation" class="">
					<div class="description">You can edit your reservation information here:</div>
					<g:textField name="reservationCode" value="${params.input}" size="20" placeholder="Type reservation code"/>
					<g:submitButton name="search" class="buttons" value="Search" />
					</g:form>
					</fieldset>
				</div>
	</div>
	<div id="mytable">
		<div align="center">
		<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,0,0" width="400" height="325">
			<param name="flash_component" value="ImageViewer.swc" />
			<param name="movie" value="${resource(dir: 'flash', file: 'public.swf')}" />
			<param name="quality" value="high" />
			<param name="FlashVars" value="flashlet={imageLinkTarget:'_blank',captionFont:'Verdana',titleFont:'Verdana',showControls:false,frameShow:false,slideDelay:5,captionSize:10,captionColor:#333333,titleSize:10,transitionsType:'Fade',titleColor:#333333,slideAutoPlay:true,imageURLs:['${resource(dir: 'images', file: 'location.jpg')}','${resource(dir: 'images', file: 'reservation.jpg')}','${resource(dir: 'images', file: 'room.jpg')}','${resource(dir: 'images', file: 'room2.jpg')}'],slideLoop:true,frameThickness:2,imageLinks:['http://macromedia.com/','http://macromedia.com/','http://macromedia.com/'],frameColor:#333333,bgColor:#000000,imageCaptions:[]}" /><param name="BGCOLOR" value="#000000" />
			<embed src="${resource(dir: 'flash', file: 'public.swf')}" quality="high" 
				flashvars="flashlet={imageLinkTarget:'_blank',captionFont:'Verdana',titleFont:'Verdana',showControls:false,frameShow:false,slideDelay:5,captionSize:10,captionColor:#333333,titleSize:10,transitionsType:'Fade',titleColor:#333333,slideAutoPlay:true,imageURLs:['${resource(dir: 'images', file: 'location.jpg')}','${resource(dir: 'images', file: 'reservation.jpg')}','${resource(dir: 'images', file: 'room.jpg')}','${resource(dir: 'images', file: 'room2.jpg')}'],slideLoop:true,frameThickness:2,imageLinks:['http://macromedia.com/','http://macromedia.com/','http://macromedia.com/'],frameColor:#333333,bgColor:#000000,imageCaptions:[]}" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" 
				type="application/x-shockwave-flash" width="1000" height="325" bgcolor="#000000"> </embed>
		</object>
		</div>
	</div>
	
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
		
		<br><br><br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<g:link action="viewAvailableRooms" controller="Room">Click this link to begin.</g:link>
		
		</div>
	</div>
		
	</body>
</html>
