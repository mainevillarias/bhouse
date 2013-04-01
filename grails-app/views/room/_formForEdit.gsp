<%@ page import="newsystem.Room" %>

<table>

<tr>
<div class="fieldcontain ${hasErrors(bean: roomInstance, field: 'roomName', 'error')} required">
	<td><label for="roomName">
		<g:message code="room.roomName.label" default="Room Name" />
		<span class="required-indicator">*</span>
	</label></td>
	<td><g:textField name="roomName" required="" value="${roomInstance?.roomName}"/></td>
</div>
</tr>

<tr>
<div class="fieldcontain ${hasErrors(bean: roomInstance, field: 'roomDetails', 'error')} ">
	<td><label for="roomDetails">
		<g:message code="room.roomDetails.label" default="Room Details" />
	</label></td>
	<td><g:textField name="roomDetails" value="${roomInstance?.roomDetails}"/></td>
</div>
</tr>

<tr>
<div class="fieldcontain ${hasErrors(bean: roomInstance, field: 'lodgerType', 'error')} required">
	<td><label for="lodgerType">
		<g:message code="room.lodgerType.label" default="Lodger Type" />
		<span class="required-indicator">*</span>
	</label></td>
	<td>
	<g:select name="lodgerType" from="${roomInstance.constraints.lodgerType.inList}" required="" value="${roomInstance?.lodgerType}" valueMessagePrefix="room.lodgerType"/></td>
</div>
</tr>

<tr>
<div class="fieldcontain ${hasErrors(bean: roomInstance, field: 'roomRate', 'error')} required">
	<td><label for="roomRate">
		<g:message code="room.roomRate.label" default="Room Rate" />
		<span class="required-indicator">*</span>
	</label></td>
	<td><g:field name="roomRate" value="${fieldValue(bean: roomInstance, field: 'roomRate')}" required=""/></td>
</div>
</tr>

<tr>
<div class="fieldcontain ${hasErrors(bean: roomInstance, field: 'totalNumberOfBeds', 'error')} required">
	<td><label for="totalNumberOfBeds">
		<g:message code="room.totalNumberOfBeds.label" default="Total Number Of Beds" />
		<span class="required-indicator">*</span>
	</label></td>
	<td><g:field name="totalNumberOfBeds" type="number" min="0" max="6" value="${roomInstance.totalNumberOfBeds}" required=""/></td>
</div>
</tr>


</table>