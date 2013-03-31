<%@ page import="newsystem.Lodger" %>


<table>
<tr>
<div class="fieldcontain ${hasErrors(bean: lodgerInstance, field: 'firstName', 'error')} required">
	<td><label for="firstName">
		<g:message code="lodger.firstName.label" default="First Name" />
		<span class="required-indicator">*</span>
	</label></td>
	<td><g:textField name="firstName" required="" value="${lodgerInstance?.firstName}"/></td>
</div>
</tr>

<tr>
<div class="fieldcontain ${hasErrors(bean: lodgerInstance, field: 'middleName', 'error')} required">
	<td><label for="middleName">
		<g:message code="lodger.middleName.label" default="Middle Name" />
		<span class="required-indicator">*</span>
	</label></td>
	<td><g:textField name="middleName" required="" value="${lodgerInstance?.middleName}"/></td>
</div>
</tr>

<tr>
<div class="fieldcontain ${hasErrors(bean: lodgerInstance, field: 'lastName', 'error')} required">
	<td><label for="lastName">
		<g:message code="lodger.lastName.label" default="Last Name" />
		<span class="required-indicator">*</span>
	</label></td>
	<td><g:textField name="lastName" required="" value="${lodgerInstance?.lastName}"/></td>
</div>
</tr>

<tr>
<div class="fieldcontain ${hasErrors(bean: lodgerInstance, field: 'gender', 'error')} required">
	<td><label for="gender">
		<g:message code="lodger.gender.label" default="Gender" />
	</label></td>
	<td><g:hiddenField name="gender" value="${lodgerInstance.gender}"/>${lodgerInstance.gender}</td>
</div>
</tr>

<tr>
<div class="fieldcontain ${hasErrors(bean: lodgerInstance, field: 'phonenumber', 'error')} required">
	<td><label for="phonenumber">
		<g:message code="lodger.phonenumber.label" default="Phonenumber" />
		<span class="required-indicator">*</span>
	</label></td>
	<td><g:textField name="phonenumber" required="" value="${lodgerInstance?.phonenumber}"/></td>
</div>
</tr>

<tr>
<div class="fieldcontain ${hasErrors(bean: lodgerInstance, field: 'homeAddress', 'error')} ">
	<td><label for="homeAddress">
		<g:message code="lodger.homeAddress.label" default="Home Address" />
		
	</label></td>
	<td><g:textField name="homeAddress" value="${lodgerInstance?.homeAddress}"/></td>
</div>
</tr>

<tr>
<div class="fieldcontain ${hasErrors(bean: lodgerInstance, field: 'emailAddress', 'error')} ">
	<td><label for="emailAddress">
		<g:message code="lodger.emailAddress.label" default="Email Address" />
		
	</label></td>
	<td><g:textField name="emailAddress" value="${lodgerInstance?.emailAddress}"/></td>
</div>
</tr>

<tr>
<div class="fieldcontain ${hasErrors(bean: lodgerInstance, field: 'previousBalance', 'error')} required">

	<g:hiddenField name="previousBalance" value="${lodgerInstance.previousBalance}"/>
</div>
</tr>

<tr>
<div class="fieldcontain ${hasErrors(bean: lodgerInstance, field: 'roomNumber', 'error')} required">
	<td><label for="roomNumber">
		<g:message code="lodger.roomNumber.label" default="Room Number" />
		
	</label></td>
	<td><g:hiddenField id="roomNumber" name="roomNumber.id" value="${lodgerInstance.roomNumber.id}" />${roomInstance.roomName}</td>
</div>
</tr>

<tr>
<div class="fieldcontain ${hasErrors(bean: lodgerInstance, field: 'status', 'error')} required">
	
	<g:hiddenField name="status" value="${lodgerInstance.status}" />
</div>
</tr>

</table>