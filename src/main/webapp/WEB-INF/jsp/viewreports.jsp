<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="header.jsp"></jsp:include>

<script type="text/javascript" src="js/ajaxpaging.js"></script>

<form name="grid" onSubmit="return validate(this)" action="viewbroadcast_page"
	method="GET">

	<div id="right_content">
		<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">


			<tr>
				<c:if test="${success==true}">
					<tr>
						<td valign="top" align="left" style="padding: 5px 0 10px 0;">&nbsp;
							<div id="success_statusbar" class="status success">
								<p class="closestatus">
									<a title="Close" href="viewreports">x</a>
								</p>
								<p>
									<img alt="Success"
										src="resources/images/icons/icon_success.png"><span>Success!</span>.
								</p>
							</div>
					</tr>
				</c:if>
				
			
			<tr>
				<td valign="top" align="left"><div>
						<div class="headings altheading">
							<h2>Broadcast Reports</h2>
						</div>
						<div class="contentbox">
							<table cellpadding="0" cellspacing="0" border="0" width="100%">
							
								<tr class="title">
									
									<td valign="top" align="left" width="10%">Broadcast&nbsp;Id</td>
									<td valign="top" align="left" width="15%">Stream Name</td>
									<td valign="top" align="left" width="15%">Send &nbsp;to&nbsp; Group</td>
									<td valign="top" align="left" width="15%">No of Days/Weeks</td>
									<td valign="top" align="left" width="10%">Frequency</td>
									<td valign="top" align="center" width="15%">Start &nbsp;Date</td>								
									<td valign="top" align="left" width="15%">No&nbsp;Of&nbsp;messages</td>
								    <td valign="top" align="center" width="10%">Status</td>				
								   <td valign="top" align="left" width="10%">Enable/Disable</td>
								   
								</tr>


							</table>
							<table cellpadding="0" cellspacing="0" border="0" width="100%"
								id="user_ajax">
								<%int i=1; %>
								<c:forEach items="${broadCastReportsForm.broadCastReports}"
									var="broadCastReports" varStatus="status">
									<tr class="row<%=i%>">
										
										<td valign="top" align="left" width="10%"><a href="<c:out value="message_status?id=${broadCastReports.broad_id}"/>">${broadCastReports.broad_id}</a></td>
										<td valign="top" align="left" width="15%">&nbsp;&nbsp;&nbsp;&nbsp;${broadCastReports.stream_name}</td>
										<td valign="top" align="center" width="15%">${broadCastReports.group_name}</td>
										<td valign="top" align="center" width="5%">${broadCastReports.days_weeks}</td>
										<td valign="top" align="center" width="25%"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										 <c:if test="${broadCastReports.frequency=='0'}"><c:out value="One per Day"></c:out></c:if>
										 <c:if test="${broadCastReports.frequency=='1'}"><c:out value="Two per Day"></c:out></c:if>
										 <c:if test="${broadCastReports.frequency=='2'}"><c:out value="Weekly Once"></c:out></c:if>
										 <c:if test="${broadCastReports.frequency=='3'}"><c:out value="Three Per Day"></c:out></c:if>
										</td>
										
										<td valign="top" align="center">&nbsp;&nbsp;&nbsp;&nbsp;${broadCastReports.start_date}</td>
										<td valign="top" align="center" width="20%">${broadCastReports.message_count}</td>	
										<td valign="top" align="center" width="20%">
										<%-- <c:choose>
										<c:when test="${broadCastReports.start_date<=todaydate}">
										<c:out value="Started"/>
										</c:when>
										<c:otherwise>
										<c:out value="Scheduled"/>
										</c:otherwise>
										</c:choose> --%>
										<fmt:parseDate value="${broadCastReports.start_date}" pattern="MM/dd/yyyy" var="startDate" />
										<fmt:parseDate value="${todaydate}" pattern="MM/dd/yyyy" var="todayDate" />
										
										<c:choose>
										<c:when test="${startDate le todayDate}">
										<c:out value="Started"/>
									
										</c:when>
										<c:otherwise>
										
										<c:out value="Scheduled"/>
										</c:otherwise>
										</c:choose> 
										
										
										</td>
														
																	
																	
										
										<td valign="top" align="center" width="10%">
										<c:choose>
									     	<c:when test="${broadCastReports.enable==0}">
									     	<a href="viewreports" title=""><img src="resources/images/icons/icon_unapprove.png" alt="Enable" /></a><a href="#"  style="padding-right:20px;" onclick="myActive(${broadCastReports.broad_id},1)">Enable</a>
										 	</c:when>
										 	<c:when test="${broadCastReports.enable==1}">
										 	<a href="viewreports" title=""><img src="resources/images/icons/icon_approve.png" alt="Disable" /></a><a href="#" style="padding-right:10px;" onclick="myActive(${broadCastReports.broad_id},0)">Disable</a>
										 	</c:when>										 	
										 	</c:choose>
										
										
										</td>
										
										
										
										
										
									</tr>
									<%if(i==1) i=2;
									else
									i=1;%>
								</c:forEach>
							
								<tr><td colspan="9">  <div class="extrabottom">
              <ul class="pagination">
         <%--      <% int i=1;int j=0;%> 
              
         --%>
              <c:if test="${currentpage!=1&&currentpage!=null}">
               <li class="page_unselect"><a href="viewbroadcast_page?page=${currentpage - 1}" >Prev</a></li> 
               </c:if>
              
             <%-- <c:forEach var="count" begin="1" end="${noofrows}">  --%>
               <c:forEach begin="1" end="${noofpages}" var="i">
                <c:choose>
                    <c:when test="${currentpage eq i}">
                      <li class="page"><a class="paging_select"><c:out value="${i}"></c:out></a></li>
                     </c:when>
                    <c:otherwise>
                        <li class="page_unselect"><a href="viewbroadcast_page?page=${i}"><c:out value="${i}"></c:out></a></li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>          
            <c:if test="${currentpage!=noofpages}">
              <li class="page_unselect"><a href="viewbroadcast_page?page=${currentpage+1}">Next</a></li> 
                 </c:if>
              <c:choose>
              <c:when test="${button=='viewall'}">
                  <li class="page"><a href="viewallbroadcast" class="paging_select">ViewAll</a></li>
             </c:when>
                <c:otherwise>
                  <li class="page"><a href="viewreports" class="paging_select">Back</a></li>
              </c:otherwise>
              
              </c:choose>
         
          
                </ul></div></td></tr>

								
								</table>
</div>
								<div style="clear: both;"></div>
								</div>
								
								</td>
								</tr>
								<tr>
									<td valign="top" align="left">&nbsp;</td>
								</tr>
								
							</table>
							</form>
						
							
			
							<script>
								function myFunction(str) {
									var answer = confirm("Are you sure want to delete this User?")
									if (answer) {
										window.location = "?do=deleteuser&userid="
												+ str;
									} else {
									}
								}
							</script>
							<script type="text/javascript">
								function streamdelete(str) {

									var answer = confirm("Are you sure want to delete this Stream?")
									if (answer) {
										window.location = "?do=deletestream&streamid="
												+ str;
									} else {
										// 		alert("Thanks for sticking around!")
									}
								}
								
								
								function myActive(broad_id,ena) {

									
									if(ena==1)
									{
										var answer = confirm("Are you sure want to enable this broadcast?");
									}
									else
									{
										var answer = confirm("Are you sure want to Disable this broadcast?");
									}
									if (answer){
//								 		
										window.location = "enable_messaging?id="+broad_id+"&enable="+ena;
									}
									else{
//								 		//alert("Thanks for sticking around!")
									}
								}
								
								
								
								
								
								
								
								
								
								
								
								
							</script>
							<script type="text/javascript">
								$(function() {
									$('input[name="chkUser"]')
											.click(
													function() {
														if ($('input[name="chkUser"]').length == $('input[name="chkUser"]:checked').length) {
															$(
																	'input:checkbox[name="chkAll"]')
																	.attr(
																			"checked",
																			"checked");
														} else {
															$(
																	'input:checkbox[name="chkAll"]')
																	.removeAttr(
																			"checked");
														}
													});
									$('input:checkbox[name="chkAll"]').click(
											function() {
												var slvals = []
												if ($(this).is(':checked')) {
													$('input[name="chkUser"]')
															.attr("checked",
																	true);
												} else {
													$('input[name="chkUser"]')
															.attr("checked",
																	false);
													slvals = null;
												}
											});
								})
							</script>
							<script language="javascript">
								function selectall(field) {
									//field.getElementByTagName('checkbox');
									if (document.grid.checkall.checked == true) {
										for (i = 0; i < field.length; i++)
											field[i].checked = true;
									} else {
										for (i = 0; i < field.length; i++)
											field[i].checked = false;
									}
								}

								function validate(fname) {
									// alert(fname);
									var chks = document
											.getElementsByName('checkbox[]');

									var hasChecked = false;
									for ( var i = 0; i < chks.length; i++) {
										if (chks[i].checked) {
											hasChecked = true;
											break;
										}
									}
									if (hasChecked == false) {
										alert("Please select at least one.");
										return false;
									}
									return true;
								}
							</script>