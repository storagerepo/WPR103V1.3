<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="header.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div id="right_content">
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
								<img alt="Success" src="resources/images/icons/icon_success.png"><span>Success!</span>.
							</p>
						</div>
				</tr>
			</c:if>

		</table>

<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <tr>
        <td valign="top" align="left" style="padding:5px 0 10px 0;"></td>
      </tr>
      <tr>
        <td valign="top" align="left"><div>
            <div class="headings altheading">
              <h2>Participant Details</h2>
            </div>
            <div class="contentbox">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">         
            
    
             <c:forEach items="${participantsDetailsForm.participantsDetails}" var="participantsDetails" varStatus="status">
                 <tr class="row2">
                  <td width="15%" valign="middle" align="left" >SystemID </td>
                    <td width="1%" valign="middle" align="left" >  :</td>
                  <td width="84%" valign="top" align="left" >${participantsDetails.participants_id}</td>
                </tr>
                 <tr class="row1">
                  <td width="15%" valign="middle" align="left" > ID </td>
                    <td width="1%" valign="middle" align="left" >  :</td>
                  <td width="84%" valign="top" align="left" >${participantsDetails.id}</td>
                </tr>
                   <tr class="row2">
                  <td width="15%" valign="middle" align="left" > First Name </td>
                    <td width="1%" valign="middle" align="left" >  :</td>
                  <td width="84%" valign="top" align="left" >${participantsDetails.fname}</td>
                </tr>
              <tr class="row1">
                  <td width="15%" valign="middle" align="left" > User Name </td>
                    <td width="1%" valign="middle" align="left" >  :</td>
                  <td width="84%" valign="top" align="left" >${participantsDetails.username}</td>
                </tr>
		
		<tr class="row2">
                  <td width="15%" valign="middle" align="left" > Mobile Number </td>
                    <td width="1%" valign="middle" align="left" >  :</td>
                  <td width="84%" valign="top" align="left" >${participantsDetails.mobile_num}</td>
                </tr>
                <tr class="row1">
                  <td width="15%" valign="middle" align="left" > Preferred Time </td>
                    <td width="1%" valign="middle" align="left" >  :</td>
                  <td width="84%" valign="top" align="left" ><c:if test="${participantsDetails.time1 ne 'null'}">${participantsDetails.time1}<c:out value="${participantsDetails.time1_am_pm }"></c:out></c:if>
											<c:if test="${participantsDetails.time2 ne 'null'}">${participantsDetails.time2}<c:out value="${participantsDetails.time2_am_pm }"></c:out></c:if>
											<c:if test="${participantsDetails.time3 ne 'null'}">${participantsDetails.time3}<c:out value="${participantsDetails.time3_am_pm }"></c:out></c:if></td>
                </tr>
		<tr class="row2">
                  <td width="15%" valign="middle" align="left" > Email-Id </td>
                    <td width="1%" valign="middle" align="left" >  :</td>
                  <td width="84%" valign="top" align="left" >${participantsDetails.email_id}</td>
                </tr>
                
                	<tr class="row1">
                  <td width="15%" valign="middle" align="left" > Start Date</td>
                    <td width="1%" valign="middle" align="left" >  :</td>
                  <td width="84%" valign="top" align="left" >${participantsDetails.weekly_survey_start_date}</td>
                </tr>
                <tr class="row2">
                  <td width="15%" valign="middle" align="left" >Provider Primary Email</td>
                    <td width="1%" valign="middle" align="left" >  :</td>
                  <td width="84%" valign="top" align="left" >${participantsDetails.provider_email1}</td>
                </tr>
              <tr class="row1">
                  <td width="15%" valign="middle" align="left" >Provider Secondary Email</td>
                    <td width="1%" valign="middle" align="left" >  :</td>
                  <td width="84%" valign="top" align="left" >${participantsDetails.provider_email2}</td>
                </tr>
             
             <%--  <tr class="row2">
                  <td width="15%" valign="middle" align="left" > Gender </td>
                    <td width="1%" valign="middle" align="left" >  :</td>
                    
                    <c:choose>
                    <c:when test="${participantsDetails.gender==0}">
                     <td width="84%" valign="top" align="left" >Male</td>
                    </c:when>                
                    <c:when test="${participantsDetails.gender==1}">
                     <td width="84%" valign="top" align="left" >Female</td>
                    </c:when>
                  </c:choose>
                  
                  
                </tr><tr class="row1">
                  <td width="15%" valign="middle" align="left" > Zipcode </td>
                    <td width="1%" valign="middle" align="left" >  :</td>
                  <td width="84%" valign="top" align="left" >${participantsDetails.city}</td>
                </tr>
              <tr class="row2">
                  <td width="15%" valign="middle" align="left" > Education </td>
                    <td width="1%" valign="middle" align="left" >  :</td>
                  <td width="84%" valign="top" align="left" >${participantsDetails.education}</td>
                </tr>
              <tr class="row1">
                  <td width="15%" valign="middle" align="left" > Medical Details </td>
                    <td width="1%" valign="middle" align="left" >  :</td>
                  <td width="84%" valign="top" align="left" >${participantsDetails.medical_details}</td>
                </tr>
                <tr class="row2">
                  <td width="15%" valign="middle" align="left" > Provider Name </td>
                    <td width="1%" valign="middle" align="left" >  :</td>
                  <td width="84%" valign="top" align="left" >${providername}</td>
                </tr>
              <tr class="row1">
                  <td width="15%" valign="middle" align="left" > Group Name </td>
                    <td width="1%" valign="middle" align="left" >  :</td>
                  <td width="84%" valign="top" align="left" >${participantsDetails.group_name}</td>
                </tr><tr class="row2">
                  <td width="15%" valign="middle" align="left" > Age</td>
                    <td width="1%" valign="middle" align="left" >  :</td>
                  <td width="84%" valign="top" align="left" >${participantsDetails.age}</td>
                </tr> --%>
              <tr class="row2">
                  <td width="15%" valign="middle" align="left" >Join Date</td>
                    <td width="1%" valign="middle" align="left" >  :</td>
                  <td width="84%" valign="top" align="left" >${participantsDetails.date_of_join}</td>
                </tr>           
</c:forEach> 
</table>
 </div>
</div>
          </td>
      </tr>
      </table>
      </div>
<jsp:include page="footer.jsp"></jsp:include>