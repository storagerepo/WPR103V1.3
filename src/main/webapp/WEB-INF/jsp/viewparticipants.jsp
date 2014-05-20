<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"></jsp:include>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="js/ajaxpaging.js"></script>
<script src="resources/js/jquery_checkbox.js" type="text/javascript"></script>
<div id="right_content">
	<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
				     <tr><td colspan="7" valign="top" align="left" style="padding:5px 0 10px 0;">
					<!-- <div class="del_div">
						<p><label style="padding: 0pt 20px 0pt 0pt;"><input type="submit" name="delete" value="" class="icon1" /></label></p>
	          		</div> -->
				</td></tr></table>
    	<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      		
			<tr>
			<c:if test="${success==true}">
        <tr>
        <td valign="top" align="left" style="padding:5px 0 10px 0;">&nbsp;
            <div id="success_statusbar" class="status success">
            <p class="closestatus"><a title="Close" href="viewparticipants">x</a></p>
            <p><img alt="Success" src="resources/images/icons/icon_success.png"><span>Updated Successfully!</span>.</p>
          </div>
      </tr>
    </c:if>  
			
			
      		</tr>
      		<tr>
        		<td valign="top" align="left">
			        <div class="headings altheading">
			          <h2>View Participants</h2>
			        </div>
			        <div class="contentbox">
						<div style="border:#ccc 2px solid; padding:15px; margin-bottom:15px;">
						
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
							
							<form action="findParticipant" method="GET">
							  <tr>
							    <td align="left" valign="middle" width="10%">Mobile No:</td>
							      <td align="left" valign="middle" width="15%"><input type="text" name="mobile" class="input_txtbx1" id="mobile" value="${mobile }"></td>
							     <td align="left" valign="middle" width="10%">&nbsp;&nbsp;Group Name:</td>
							    <td align="left" valign="middle" width="15%">
							    <select name="groupname">
							    <option value = "">Select Groups</option>
			                  <c:forEach items="${participantGroupForm.participantGroups}" var="participantGroups" varStatus="status">
			                   <option value="${participantGroups.group_name}" <c:if test="${participantGroups.group_name==groupsearch}"><c:out value="selected"/></c:if>>${participantGroups.group_name}</option>
			                   </c:forEach>
			                 </select><span class="err"><form:errors path="participant.groupname"></form:errors></span></td>
							    <td align="left" valign="middle" width="5%">&nbsp;&nbsp;Zipcode:</td>
							    <td align="left" valign="middle" width="15%"><input type="text" name="city" value="${zipcode}" id="city" class="input_txtbx1"></td>
							     <td align="center" valign="middle" width="20%"><input type="submit" class="submit_btn" value="Find"></td>
							      <td align="center" valign="middle" width="20%"><a href="viewparticipants"><input type="button" class="submit_btn" value="Clear"></a></td>
							  </tr>
							  </form>
							</table>
						</div>
						 <form name="grid" onSubmit="return validate(this)" action="deleteSelectedparticipants" method="POST">
				        
				<table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr class="title">
								
								<td valign="center" align="center" width="5%"><input type="checkbox" value="" name="chkAll"></td>
         						<td valign="top" align="left" width="10%">First&nbsp;Name</td>
					         	<td valign="top" align="left" width="15%">Mobile Number</td>
					         		<td valign="top" align="left" width="10%">Provider Name</td>
					         	<td valign="top" align="left" width="10%">Zipcode</td>
								<td valign="top" align="left" width="10%">Age</td>
          						<td valign="top" align="left" width="8%">Time1</td>
          						<td valign="top" align="left" width="8%">Time2</td>
          						<td valign="top" align="left" width="8%">Time3</td>
          						<td valign="top" align="left" width="25%">Action</td>
          						
				
		
        					</tr>
        					<% int i=1; %>
        					<c:if test="${fn:length(participantsDetailsForm.participantsDetails) gt 0}">
        					<c:forEach items="${participantsDetailsForm.participantsDetails}" var="participantsDetails" varStatus="status">
        				       					<tr class="row<%=i%>">
							       		<td valign="center" align="center" width="5%"><input type="checkbox" value="${participantsDetails.participants_id}" name="chkUser"></td>
					     		     	<td valign="top" align="left"  width="10%"><a href="participantdetails?id=${participantsDetails.participants_id}&back=viewparticipant">${participantsDetails.fname}</a></td>
											<td valign="top" align="left" width="15%">${participantsDetails.mobile_num}</td>
											<td valign="top" align="left" width="10%">${participantsDetails.provider_name}</td>
											<td valign="top" align="left" width="10%">${participantsDetails.city}</td>
											<td valign="top" align="left" width="10%"><c:if test="${participantsDetails.age ne 'null'}"><c:out value="${participantsDetails.age}"></c:out></c:if></td>
											<td valign="top" align="left" width="8%"><c:if test="${participantsDetails.time1 ne 'null'}">${participantsDetails.time1}<c:out value="${participantsDetails.time1_am_pm }"></c:out></c:if></td>
											<td valign="top" align="left" width="8%"><c:if test="${participantsDetails.time2 ne 'null'}">${participantsDetails.time2}<c:out value="${participantsDetails.time2_am_pm }"></c:out></c:if></td>
											<td valign="top" align="left" width="8%"><c:if test="${participantsDetails.time3 ne 'null'}">${participantsDetails.time3}<c:out value="${participantsDetails.time3_am_pm }"></c:out></c:if></td>
											<td valign="top" align="left" width="25%">
											<%-- <c:if test="${currentuser.adminuser[0].editparticipant==1}"> --%>
												<a href="#" title="" ><img src="resources/images/icons/icon_edit.png" alt="Edit" /></a><a href="<c:out value="editparticipant?id=${participantsDetails.participants_id}"/>" style="padding-right:10px;">Edit</a>
												<%-- </c:if> --%>
												<%-- <c:if test="${currentuser.adminuser[0].deleteparticipant==1}"> --%>
											<a href="#" title=""><img src="resources/images/icons/icon_delete.png" alt="Delete" /></a><a href="<c:out value="deleteparticipants?id=${participantsDetails.participants_id}"/>" onclick="return confirmation()">Remove</a>
										<%-- 	</c:if> --%>
											</td>
								</tr><% if(i==1) i=2;
								else
								i=1;%>
							    	</c:forEach>
							    	</c:if>
							    <c:if test="${fn:length(participantsDetailsForm.participantsDetails) == 0}">	
							    	<tr class="row1">
							    	<td colspan="7" width="100%"><center><b>No Participants Found!!!</b></center></td>
							    	</tr>
							    	</c:if>
							    	
							    	
							    	
							    	</div>
							    	
							    	
							    	<form action="viewparticipants_page" method="GET">
							    	<table cellpadding="0" cellspacing="0" border="0" width="98%"
			class="margin_table">
							    	<tr >
							    	<td align="left"><div class="extrabottom">
							    		<a><input  type="submit" name="delete"  value="Remove All"  class="submit_btn1" /></a></div>
					</td>
							    	
							    	<td colspan="6">  <div class="extrabottom">
              <ul class="pagination">
         <%--      <% int i=1;int j=0;%> 
              
         --%>
              <c:if test="${currentpage!=1&&currentpage!=null}">
               <li class="page_unselect"><a href="viewparticipants_page?page=${currentpage - 1}" >Prev</a></li> 
               </c:if>
              
             <%-- <c:forEach var="count" begin="1" end="${noofrows}">  --%>
               <c:forEach begin="1" end="${noofpages}" var="i">
                <c:choose>
                    <c:when test="${currentpage eq i}">
                      <li class="page"><a class="paging_select"><c:out value="${i}"></c:out></a></li>
                     </c:when>
                    <c:otherwise>
                        <li class="page_unselect"><a href="viewparticipants_page?page=${i}"><c:out value="${i}"></c:out></a></li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>          
            <c:if test="${currentpage!=noofpages}">
              <li class="page_unselect"><a href="viewparticipants_page?page=${currentpage+1}">Next</a></li> 
                 </c:if>
              <c:choose>
              <c:when test="${button=='viewall'}">
                  <li class="page"><a href="viewallparticipants" class="paging_select">ViewAll</a></li>
             </c:when>
                <c:otherwise>
                  <li class="page"><a href="viewparticipants" class="paging_select">Back</a></li>
              </c:otherwise>
              
              </c:choose>
         
          
                </ul></div></td></tr>
                
							    	
					</table>
					</form>	</form>	
					</td>
					</tr>
				    	
					</table>		    	
							    	
						</table>	    	
							  
						
	
</div>


<script type="text/javascript">
$(function () {
$('input[name="chkUser"]').click(function () {
if ($('input[name="chkUser"]').length == $('input[name="chkUser"]:checked').length) {
$('input:checkbox[name="chkAll"]').attr("checked", "checked");
}
else {
$('input:checkbox[name="chkAll"]').removeAttr("checked");
}
});
$('input:checkbox[name="chkAll"]').click(function () {
var slvals = []
if ($(this).is(':checked')) {
$('input[name="chkUser"]').attr("checked", true);
}
else {
$('input[name="chkUser"]').attr("checked", false);
slvals = null;
}
});
})
</script>




<script language="javascript">
/* function selectall(field)
{
	field.getElementByTagName('checkbox');
	if(document.grid.checkall.checked==true)
	{
		for (i = 0; i < field.length; i++)
			field[i].checked = true ;
	}
	else
	{
		for(i = 0; i < field.length; i++)
			field[i].checked = false;
	}
}

 */ 
function confirmation() {
	var answer = confirm("Are you Sure You Want to Delete Participant ?")
	if (answer){
		return true;
	}
	else{
		return false;
	}
}


////////////////////////---------------------------
function validate()
{
//alert(fname);
var chks = document.getElementsByName('chkUser');
var hasChecked = false;
for (var i = 0; i < chks.length; i++)
{
if (chks[i].checked)
{
hasChecked = true;
break;
}
}
if (hasChecked == false)
{
alert("Please select at least one.");
return false;
}
var result=confirm("Are you sure.You want to delete the User(s)?");
if(result)
	{
return true;
	}
else
	return false;
}


function findpart()
{
 alert("sdasdasdas");
 alert(document.getElementById("moblie").value);
 alert(document.getElementById("group").value);
 alert(document.getElementById("city").value); 
window.location="?do=viewparticipants&moblie="+document.getElementById("moblie").value+"&group="+document.getElementById("group").value+"&city="+document.getElementById("city").value;
}
</script>

<jsp:include page="footer.jsp"></jsp:include>