<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="header.jsp"></jsp:include>

<div id="right_content">
	<form action="viewpageparticipants?page=1" name="dashboard" method="GET">
		<table cellpadding="0" cellspacing="0" border="0" width="98%"
			class="margin_table">

			<tr>
				<td valign="top" align="left"><div>
						<div class="headings altheading">
							<h2>Participants Status</h2>
						</div>
						<div class="contentbox">
						<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table" id="su" >

    <c:if test="${success==true}">
        <tr>
        <td valign="top" align="left" style="padding:5px 0 10px 0;">&nbsp;
            <div id="success_statusbar" class="status success">
            <p class="closestatus"><a title="Close" href="welcome">x</a></p>
            <p><img alt="Success" src="resources/images/icons/icon_success.png"><span>Success!</span>.</p>
          </div>
      </tr>
    </c:if>  
      
      </table> 
  
							<table cellpadding="0" cellspacing="0" border="0" style="table-layout: fixed; width:100%">
				
								<tr class="title">
									<td valign="top" align="left" width="5%">SystemID</td>
								    <td valign="top" align="left" width="3%">ID</td>
									<td valign="top" align="left" width="5%">Name</td>
									<td valign="top" align="left" width="5%">UserName</td>
									<td valign="top" align="left" width="5%">Password</td>
									<td valign="top" align="left" width="8%">Mobile&nbsp;Number</td>
									<td valign="top" align="left" width="8%">Preferred&nbsp;Time</td>
									<td valign="top" align="left" width="7%">Email&nbsp; Id</td>
									<td valign="top" align="left" width="5%">Start&nbsp;Date</td>									
									<td valign="top" align="left" width="11%">Provider&nbsp;Primary&nbsp;Email</td>
									<td valign="top" align="left" width="13%">Provider&nbsp;Secondary&nbsp;Email</td>								
									
									<!-- <td valign="top" align="left" width="15%">Education</td> -->
									<td valign="top" align="left" width="10%">Join&nbsp;Date</td>
								</tr>
								<% int i=1; %>

								<!-- Display Admin Userd here  Suresh--> 
									<c:forEach items="${participantsDetailsForm.participantsDetails}" var="participantsDetails" varStatus="status">
							       		<tr class="row<%=i %>" onmouseover="mouse_event(this,"row_hover");" onmouseout="mouse_event(this,"row1");">
								         <td valign="top" align="left" width="15%" style="overflow:hidden" title="${participantsDetails.participants_id}">${participantsDetails.participants_id}</td>
								         <td valign="top" align="left" width="15%" style="overflow:hidden" title="${participantsDetails.id}">${participantsDetails.id}</td>
								          <td valign="top" align="left"  width="10%" style="overflow:hidden" title="${participantsDetails.fname}"> <a href="participantdetails?id=${participantsDetails.participants_id}&back=dashboard">${participantsDetails.fname}</a></td>
										<td valign="top" align="left" width="15%" style="overflow:hidden" title="${participantsDetails.username}">${participantsDetails.username}</td>
										<td valign="top" align="left" width="15%" style="overflow:hidden" title="${participantsDetails.password}">${participantsDetails.password}</td>
											<td valign="top" align="left" width="15%" style="overflow:hidden" title="${participantsDetails.mobile_num}">${participantsDetails.mobile_num}</td>									
										<td valign="top" align="left" width="8%"><c:if test="${participantsDetails.time1 ne 'null'}">${participantsDetails.time1}<c:out value="${participantsDetails.time1_am_pm }"></c:out></c:if>
											<c:if test="${participantsDetails.time2 ne 'null'}">${participantsDetails.time2}<c:out value="${participantsDetails.time2_am_pm }"></c:out></c:if>
											 <c:if test="${participantsDetails.time3 ne 'null'}">${participantsDetails.time3}<c:out value="${participantsDetails.time3_am_pm }"></c:out></c:if></td>		<%-- 	<td valign="top" align="left" width="15%">${participantsDetails.education}</td> --%>
											<td valign="top" align="left" width="10%" style="overflow:hidden" title="${participantsDetails.email_id}">${participantsDetails.email_id}</td>
											<td valign="top" align="left" width="10%" style="overflow:hidden" title="${participantsDetails.weekly_survey_start_date}">${participantsDetails.weekly_survey_start_date}</td>
											<td valign="top" align="left" width="10%" style="overflow:hidden" title="${participantsDetails.provider_email1}">${participantsDetails.provider_email1}</td>
											<td valign="top" align="left" width="10%" style="overflow:hidden" title="${participantsDetails.provider_email2}">${participantsDetails.provider_email2}</td>
											<td valign="top" align="left" width="10%" style="overflow:hidden" title="${participantsDetails.date_of_join}">${participantsDetails.date_of_join}</td>
										</tr>
										<%if(i==1)
											i=2;
											else
											i=1;%>
							    	</c:forEach>
						    	
<tr><td colspan="11" >  <div class="extrabottom">
              <ul class="pagination">
         <%--      <% int i=1;int j=0;%> 
              
         --%>
              <c:if test="${currentpage!=1&&currentpage!=null}">
               <li class="page_unselect"><a href="viewparticipant_page?page=${currentpage - 1}" >Prev</a></li> 
               </c:if>
              
             <%-- <c:forEach var="count" begin="1" end="${noofrows}">  --%>
               <c:forEach begin="1" end="${noofpages}" var="i">
                <c:choose>
                    <c:when test="${currentpage eq i}">
                      <li class="page"><a class="paging_select"><c:out value="${i}"></c:out></a></li>
                     </c:when>
                    <c:otherwise>
                        <li class="page_unselect"><a href="viewparticipant_page?page=${i}"><c:out value="${i}"></c:out></a></li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>          
            <c:if test="${currentpage!=noofpages}">
              <li class="page_unselect"><a href="viewparticipant_page?page=${currentpage+1}">Next</a></li> 
                 </c:if>
              <c:choose>
              <c:when test="${button=='viewall'}">
                  <li class="page"><a href="viewall" class="paging_select">ViewAll</a></li>
             </c:when>
                <c:otherwise>
                  <li class="page"><a href="welcome" class="paging_select">Back</a></li>
              </c:otherwise>
              
              </c:choose>
         
          
                </ul></div></td></tr>

							

								</table>

								<div style="clear: both;"></div>
								</div>
								</div>
								</td>
								</tr>
								<tr>
									<td valign="top" align="left">&nbsp;</td>
								</tr>
								
							</table>
							</form>
						</div>
<jsp:include page="footer.jsp"></jsp:include>