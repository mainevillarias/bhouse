<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'house.png')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'house.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'default.css')}" type="text/css">
		
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

<div id="page-wrapper">
	<div id="page">
		<div id="content">
			<div>

				<p><g:layoutBody/></p>
				<p>&nbsp;</p>
				<p></p>
				<p>&nbsp;</p>
				<p></p>
			</div>
		</div>
		<g:if test="${!session.accountId}">
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
						<g:link controller="account" action="login"><font color = "green">Login</font></g:link><p> as Administrator.</p>
					</span>
					</g:if></p>
				</li>
			</ul>
		</div>
		</g:if>
		<g:else>
		<h2>Hello Admin</h2>
			<ul class="style1">
				<li class="first">
					<div align="left">	
					<div class="nav">
					<p><g:render template="/adminmenubar" /></p>
					</div>
				</div>
				</li>
				<li>
			<span class="menuButton"> 
			<p><g:link controller="account" action="logout"> 
            <font color = "green">Log out </font>
			</g:link></p> 
			</span> 
				</li>
				<li>
					<p><g:if test="${!session.accountId}">
						<span class="menuButton">
						<g:link controller="account" action="login"><font color = "green">Login as Administrator.</font></g:link>
					</span>
					</g:if></p>
				</li>
			</ul>
		</g:else>
		
	</div>
</div>
		
		<!--<center>
		<div class="footer" role="contentinfo"><a href="http://localhost:8080/newsystem/">Home</a> | <a href="http://localhost:8080/newsystem/lodger/list">Lodger</a> | <a href="http://localhost:8080/newsystem/room/list">Room</a> | <a href="http://localhost:8080/newsystem/payment/list">Payment</a> | <a href="http://localhost:8080/newsystem/reservation/list">Reservation</a> | <a href="http://localhost:8080/newsystem/report/index">Reports</a></div>
		</center>-->
		
		<!--<div class="footer" role="contentinfo"></div>
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
		-->
		
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
