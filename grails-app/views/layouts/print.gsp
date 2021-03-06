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
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
		<g:layoutHead/>
		<r:layoutResources />
		
	</head>
	<body>
		<div id="grailsLogo" role="banner" align="center">
		<img src="${resource(dir: 'images', file: 'RAV.png')}" height="150"/>
		</div>
		
		<g:layoutBody />
		
		<!--<center>
		<div class="footer" role="contentinfo"><a href="http://localhost:8080/newsystem/">Home</a> | <a href="http://localhost:8080/newsystem/lodger/list">Lodger</a> | <a href="http://localhost:8080/newsystem/room/list">Room</a> | <a href="http://localhost:8080/newsystem/payment/list">Payment</a> | <a href="http://localhost:8080/newsystem/reservation/list">Reservation</a> | <a href="http://localhost:8080/newsystem/report/index">Reports</a></div>
		</center>-->
		
		<!--<div class="footer" role="contentinfo"></div>
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
		-->
		<div class="myFooter">
				<center>
				<ul>
				<li><a class="" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link action="viewAvailableRooms" controller="Room">View Available Rooms</g:link></li>
				<li><g:link class="" action="list" controller="Room">Admin</g:link></li>
			
				</ul>
				</center>
		</div>	
	</body>
</html>
