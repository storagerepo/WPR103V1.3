<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<jsp:include page="header.jsp"></jsp:include>
<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet"
	type="text/css" />
<link href="<c:url value="/resources/css/inner-clr.css" />"
	rel="stylesheet" type="text/css" />
 <link href="<c:url value="/resources/css/switch.css" />"
	rel="stylesheet" type="text/css" />
<div id="right_content">

	<form action="updateparticipantmessage" method="POST" name="update" id="update">

		<table cellpadding="0" cellspacing="0" border="0" width="98%"
			class="margin_table" id="su">

			<c:if test="${success==true}">
				<tr>
					<td valign="top" align="left" style="padding: 5px 0 10px 0;">&nbsp;
						<div id="success_statusbar" class="status success">
							<p class="closestatus">
								<a title="Close" href="viewregisterparticipants">x</a>
							</p>
							<p>
								<img alt="Success" src="resources/images/icons/icon_success.png"><span>Updated Successfully!</span>.
							</p>
						</div>
				</tr>
			</c:if>

		</table>
		<table cellpadding="0" cellspacing="0" border="0" width="98%"
			class="margin_table">
			<tr>
				<td valign="top" align="left">
					<div>
						<div class="headings altheading">
							<h2>Settings</h2>
						</div>
						<div class="contentbox">
<c:set value="${participantsDetailsForm.participantsDetails[0]}" var="participant"/>
							<table cellpadding="0" cellspacing="0" border="0" width="100%" align="center">
								<tr>
									<td align="center" valign="top" width="50%"
										style="padding-right: 25px;">
										
										<table align="center" cellpadding="0" cellspacing="0" border="0" width="1000">
											<tr class="row1">
												<td class="input_text"><span class="err">*</span> Receive Message :</td>
												<td> <div class="onoffswitch">
    <input type="checkbox" name="message" value="1"   class="onoffswitch-checkbox" id="myonoffswitch" <c:if test="${participant.message=='1'}"><c:out value="Checked"/></c:if> > 
    <label class="onoffswitch-label" for="myonoffswitch">
        <div class="onoffswitch-inner"></div>
        <div class="onoffswitch-switch"></div></td>
    </label>
</div>
											   
								<!-- </span></font> -->

											</tr>
											<tr><td height="100"></td><tr>

											 
											 
											 
											 
											 
										</table>
									</td>
																		</td>
								</tr>
								 
							</table>
							
							<table align="right"><tr><td><input type="submit" class="submit_btn" value="Save" name="insert"></td></form>
							<!-- <td width="50"></td><td><input type="reset" value="Reset" class="submit_btn"></td> --><td width="50">
							<td><a href="viewregisterparticipants" class="submit_btn" style="color:white">Cancel</a></td></tr></table>
				<%-- </td>
			</tr>
		</table>
	</form>
</div> --%>

<jsp:include page="footer.jsp"></jsp:include>