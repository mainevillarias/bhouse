<%@ page import="newsystem.Lodger" %>

<table>

<div class="fieldcontain ${hasErrors(bean: lodgerInstance, field: 'firstName', 'error')} required">
	<label for="firstName">
		<g:message code="lodger.firstName.label" default="First Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="firstName" required="" value="${lodgerInstance?.firstName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: lodgerInstance, field: 'middleName', 'error')} required">
	<label for="middleName">
		<g:message code="lodger.middleName.label" default="Middle Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="middleName" required="" value="${lodgerInstance?.middleName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: lodgerInstance, field: 'lastName', 'error')} required">
	<label for="lastName">
		<g:message code="lodger.lastName.label" default="Last Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="lastName" required="" value="${lodgerInstance?.lastName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: lodgerInstance, field: 'gender', 'error')} required">
	<label for="gender">
		<g:message code="lodger.gender.label" default="Gender" />
		<span class="required-indicator"></span>
	</label>
	<g:hiddenField name="gender" value="${gender}" valueMessagePrefix="lodger.gender"/>${gender}
</div>

<div class="fieldcontain ${hasErrors(bean: lodgerInstance, field: 'phonenumber', 'error')} required">
	<label for="phonenumber">
		<g:message code="lodger.phonenumber.label" default="Phonenumber" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="phonenumber" required="" value="${lodgerInstance?.phonenumber}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: lodgerInstance, field: 'homeAddress', 'error')} ">
	<label for="homeAddress">
		<g:message code="lodger.homeAddress.label" default="Home Address" />
		
	</label>
	<g:textField name="homeAddress" value="${lodgerInstance?.homeAddress}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: lodgerInstance, field: 'emailAddress', 'error')} ">
	<label for="emailAddress">
		<g:message code="lodger.emailAddress.label" default="Email Address" />
		
	</label>
	<g:textField name="emailAddress" value="${lodgerInstance?.emailAddress}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: lodgerInstance, field: 'previousBalance', 'error')} required">
	
	<g:hiddenField name="previousBalance" value="${lodgerBalance}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: lodgerInstance, field: 'roomNumber', 'error')} required">
	<label for="roomNumber">
		<g:message code="lodger.roomNumber.label" default="Room Number" />
		<span class="required-indicator"></span>
	</label>
	<g:hiddenField name="roomNumber.id" value="${roomInstance.id}"/>${roomInstance.roomName}
</div>

<div class="fieldcontain ${hasErrors(bean: lodgerInstance, field: 'status', 'error')} required">
	<label for="status">
		<g:message code="lodger.status.label" default="Status" />
		<span class="required-indicator"></span>
	</label>
	<g:hiddenField name="status"  value="${lodgerStatus}" />${lodgerStatus}
</div>


</table>
