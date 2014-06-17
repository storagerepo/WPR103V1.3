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
							<h2>Participant Weekly Responses</h2>
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
      <script>
       function downloadfn()
              {
            	
            	  document.getElementById("download").style.color="brown";
            	  
              }</script>
  <a href="downloadparticipantsurvey?participantid=${participantid}"  onclick="downloadfn()"  id="download" style="text-decoration:underline;font-size: 15px;color: blue;" >Export To Excel</a>
  <br>
							<table cellpadding="0" cellspacing="0" border="0" width="100%">
				
								<tr class="title">
									<td valign="top" align="left" width="10%">participant_id</td>									
									<td valign="top" align="left" width="15%">q1</td>
									<td valign="top" align="left" width="15%">q2</td>
									<!-- <td valign="top" align="left" width="10%">Status</td> -->
									<td valign="top" align="left" width="10%">q3</td>
									<td valign="top" align="left" width="10%">q4Audio</td>
									<td valign="top" align="left" width="10%">q4Text</td>
									<td valign="top" align="left" width="10%">qm</td>
									<td valign="top" align="left" width="10%">qs</td>
									<td valign="top" align="left" width="10%">startDate</td>
									<td valign="top" align="left" width="10%">weekNumber</td>
									<td valign="top" align="left" width="10%">modified</td>
									<td valign="top" align="left" width="10%">appmodified</td>
									
							</tr>
								

								<!-- Display Admin Userd here  Suresh--> 
									<c:forEach items="${responseForm.response}" var="response" varStatus="status">
									
							       		<tr class="row1" onmouseover="mouse_event(this,"row_hover");" onmouseout="mouse_event(this,"row1");">
								          
											<td valign="top" align="left" width="15%">${response.participant_id}</td>
											<td valign="top" align="left" width="15%">${response.q1}</td>
											<td valign="top" align="left" width="15%">${response.q2}</td>
											<td valign="top" align="left" width="15%">${response.q3}</td>
											<td valign="top" align="left" width="15%">
											<c:choose><c:when test="${response.q4Audio=='.m4a' || response.q4Audio=='.mp4'}"></c:when>
											<c:otherwise>
											<%--  <c:set var="string2" value="${fn:substring(audio, 2, string3)}" /> --%>
                        <c:if test="${fn:contains(response.q4Audio, '.m4a')}">
                        <a href="http://www.medsmonit.com/adherence/uploadaudio/${response.q4Audio}" id="ccolor" onclick="color()">Download Audio</a>
                    
                       <audio controls>
  <source src="http://www.medsmonit.com/adherence/uploadaudio/${response.q4Audio}" type="audio/ogg">
  <source src="http://www.medsmonit.com/adherence/uploadaudio/${response.q4Audio}" type="audio/mp4">
  Your browser does not support the audio element.
</audio>
                       
                       
                        </c:if>
                        
                           <c:if test="${fn:contains(response.q4Audio, '.mp4')}">
                        <a href="http://www.medsmonit.com/adherenceT/uploadaudio/${response.q4Audio}" id="ccolor" onclick="color()">Download Audio</a>
                    
                       <audio controls>
  <source src="http://www.medsmonit.com/adherenceT/uploadaudio/${response.q4Audio}" type="audio/ogg">
  <source src="http://www.medsmonit.com/adherenceT/uploadaudio/${response.q4Audio}" type="audio/mp4">
  Your browser does not support the audio element.
</audio>
                       
                       
                        </c:if>
											
										<%-- ${response.audio}	 --%>
						<%-- 					 <c:set var="audio" value="${response.audio}"></c:set>
											 <c:set var="string3" value="${(fn:length(audio))}" />
                      <c:set var="string2" value="${fn:substring(audio, 2, string3)}" />
                        <c:if test="${fn:contains(audio, '.m4a')}">
                        <a href="http://192.168.1.106:8888/paservice${string2}" id="ccolor" onclick="color()">Download Audio</a>
                    
                       <audio controls>
  <source src="http://192.168.1.106:8888/paservice${string2}" type="audio/ogg">
  <source src="http://192.168.1.106:8888/paservice${string2}" type="audio/mp4">
  Your browser does not support the audio element.
</audio>
                       
                       
                        </c:if>
                         <c:if test="${fn:contains(string2, '.mp4')}">

                  <a href="http://192.168.1.71:8080/bcreasearchT${string2}" id="bcolor" onclick="color1()">Download Audio</a>
                
                <audio controls>
  <source src="http://192.168.1.71:8080/bcreasearchT${string2}" type="audio/ogg">
  <source src="http://192.168.1.71:8080/bcreasearchT${string2}" type="audio/mp4">
  <source src="http://192.168.1.71:8080/bcreasearchT${string2}" type="video/mp4">
  Your browser does not support the audio element.
</audio>
                </c:if> --%> </c:otherwise></c:choose>
											
											</td>											
											<td valign="top" align="left" width="15%">${response.q4Text}</td> 	
											<td valign="top" align="left" width="15%">${response.qm}</td> 	
											<td valign="top" align="left" width="15%">${response.qs}</td> 											
											<td valign="top" align="left" width="15%">${response.startDate}</td> 
											<td valign="top" align="left" width="15%">${response.weekNumber}</td> 
											<td valign="top" align="left" width="15%">${response.modified}</td> 
											<td valign="top" align="left" width="15%">${response.appmodified}</td> 
												
										<%-- 	<td valign="top" align="left" width="10%">${response.status}</td> --%>
										<%-- 	<td valign="top" align="left"  width="10%"><a href="viewanswers?id=${response.log_id}">View Details</a></td> --%>
										<%--<td valign="top" align="left" width="15%">${participantsDetails.education}</td> --%>
										
										</tr>
									
							    	</c:forEach>
						    	
<tr><td colspan="10">  <div class="extrabottom">
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
                  <li class="page"><input type="button" onclick="goBack()" class="submit_btn" value="Back" /></li>
              </c:otherwise>
              
              </c:choose>
         
          
                </ul></div></td></tr>

							

								</table>
<script>
              function color()
              {
            	
            	  document.getElementById("ccolor").style.color="brown";
            	  
              }
              function color1()
              {
            	
            	  document.getElementById("bcolor").style.color="brown";
            	  
              }
              </script>
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
						<script>
function goBack()
  {
  window.history.back();
  }
</script>
<jsp:include page="footer.jsp"></jsp:include>

