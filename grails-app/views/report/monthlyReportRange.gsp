<%@ page import="newsystem.Payment"%>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="layout">
		<title>Monthly Report</title>
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'admin.css')}" type="text/css">
	</head>
	<body>
		
		<div class="center" align="center">
		<br>
			<h1>&nbsp;Monthly Reports</h1>
					
				<div align="center">
				<fieldset class="buttons">
					
					<g:form action="generateMonthlyReportRange" controller="Report" >
						<% def dateNow = new Date()%>
						<div>
							<label for="month1">
								<g:submitButton name="view" class="buttons" value="View" />
							</label>
								<!--<g:datePicker name="paymentDate1" precision="day"  value="${dateNow}"  />
								&nbsp; - &nbsp;
								<g:datePicker name="paymentDate2" precision="day"  value="${dateNow}"  />-->
								
								<calendar:datePicker name="paymentDate1" defaultValue="${new Date()}"/>
								&nbsp; - &nbsp;
								<calendar:datePicker name="paymentDate2" defaultValue="${new Date()}"/>
						</div>
					
								
						
					</g:form>
					
						
					
				</fieldset>
				
				</div>
				
				
				<div align="left">
				<g:if test="${totalOfPayments}">
					<table>
						<tr>
							<td><center><h1>Total</h1></center></td>
							
						</tr>
						<tr>
							<td><center>P${totalOfPayments}</center></td>
							
						</tr>
						
					</table>
				
				</g:if>
				</div>
				
				<div>

				<div id="list-payment" class="content scaffold-list" role="main">
					<h1></h1>
						<g:if test="${flash.message}">
							<div class="message" role="status">${flash.message}</div>
						</g:if>
				
				<table>
				<thead>
					<tr>
					
						<th>Lodger Name</th>
					
						<th>Date of Payment</th>
						
						<th>Payment Type</th>
						
						<th>OR Number</th>
						
						<th>Amount</th>
		
					</tr>
				</thead>
				<tbody>
				<g:if test="${result}">
				<g:each in="${result}" status="i" var="r">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>${r.last_name}, ${r.first_name} ${r.middle_name}</td>
						
						<td><g:formatDate date="${r.month_of_payment}" format="MMM-dd-yyyy" /></td>
						
						<td>${r.payment_status}</td>
						
						<td>${r.or_number}</td>
						
						<td>${r.amount_paid}</td>
				
					</tr>
				</g:each>
				
				
				</g:if>
				</tbody>
			</table>
			
		
			
				</div>
				
				
		</div>	
		</div>
	</body>
</html>
