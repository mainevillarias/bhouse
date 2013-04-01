<!DOCTYPE html">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Rav</title>
<link href='http://fonts.googleapis.com/css?family=Oswald:400,300' rel='stylesheet' type='text/css' />
<link href='http://fonts.googleapis.com/css?family=Abel' rel='stylesheet' type='text/css' />
<link href="css/default.css" rel="stylesheet" type="text/css" media="all" />

</head>
<body>
<div id="header">
	<div id="logo">
		<h1><a href="#">Ravs</a></h1>
	</div>
	<div id="menu">
		<ul>
			<li class="current_page_item"><a class="" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			<li><g:link action="reservationSteps" controller="Home">Reserve a room!</g:link></li>
		</ul>
	</div>
</div>
<div id="banner-wrapper">
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
</div>

<div id="page-wrapper">
	<div id="page">
		<div id="content">
			<div>
				<h2>Welcome to Rav's Boarding House</h2>
				<p>An excellent place to stay for students in Iligan City  located just a few meters away from the main entrance of <strong>Mindanao State University - Iligan Institute of Technology.</strong></p>
				<p>&nbsp;</p>
				<p>Our reserved-for-students approach provides a suitable place to study and maintain a safe and quiet community needed by every students.</p>
				<p>&nbsp;</p>
				<p>At Rav's boarding house, your success is our success.</p>
			</div>
		</div>
		<div id="sidebar">
			<h2>Hello Lodger</h2>
			<ul class="style1">
				<li class="first">
					<div align="right">	
					<fieldset class="buttons">
					<g:form action="searchReservationPUBLIC" controller="reservation" class="">
					<div class="description">Edit your reservation information here:</div><p>&nbsp;</p>
					<g:textField name="reservationCode" value="${params.input}" size="20" placeholder="Type reservation code"/>
					<g:submitButton name="search" class="buttons" value="Search" />
					</g:form>
					</fieldset>
				</div>
				</li>
				<li>
					<p>No Reservation code? <g:link action="viewAvailableRooms" controller="Room">reserve a room now!</g:link></p>
				</li>
				<li>
					<p><g:if test="${!session.accountId}">
						<span class="menuButton">
						<g:link controller="account" action="login"><font color = "green">Login</font></g:link>
					</span>
					</g:if> as Administrator.</p>
				</li>
			</ul>
		</div>
	</div>
</div>

	<div id="menu">
	<p><center>
				<ul>
				<li><a class="" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link action="viewAvailableRooms" controller="Room">View Available Rooms</g:link></li>
				<li><g:link class="" action="list" controller="Room">Admin</g:link></li>
			
				</ul>
				</center></p>
	</div>
</body>
</html>
