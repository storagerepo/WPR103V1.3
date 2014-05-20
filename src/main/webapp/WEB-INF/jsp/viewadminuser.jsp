<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"></jsp:include>
<script type="text/javascript" src="js/ajaxpaging.js"></script>
<script src="resources/js/jquery_checkbox.js" type="text/javascript"></script>

<link type='text/css' href='resources/css/confirm.css' rel='stylesheet' media='screen' />

<form name="grid" onSubmit="return validate(this)" action="deleteSelectedadminuser" method="POST">
	<div id="right_content">
    	<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
			<tr>
        		<td valign="top" align="left" style="padding:5px 0 10px 0;">
        			<!-- <div class="del_div">
						<p><label style="padding: 0pt 20px 0pt 0pt;"><input type="submit" name="delete" value="" class="icon1"  /></label></p>
					</div> -->
				</td>
		   	</tr>
			<tr>
			<c:if test="${providerregsuccess==true}">
        <tr>
        <td valign="top" align="left" style="padding:5px 0 10px 0;">&nbsp;
            <div id="success_statusbar" class="status success">
            <p class="closestatus"><a title="Close" href="viewadminuser">x</a></p>
            <p><img alt="Success" src="resources/images/icons/icon_success.png"><span>Contact administrator to activate your registration!</span>.</p>
          </div>
      </tr>
    </c:if>  
			<c:if test="${success==true}">
        <tr>
        <td valign="top" align="left" style="padding:5px 0 10px 0;">&nbsp;
            <div id="success_statusbar" class="status success">
            <p class="closestatus"><a title="Close" href="viewadminuser">x</a></p>
            <p><img alt="Success" src="resources/images/icons/icon_success.png"><span>Success!</span>.</p>
          </div>
      </tr>
    </c:if>  
			
        		
      		</tr>
      		<tr>
	        	<td valign="top" align="left">
	        		<div>
	            		<div class="headings altheading">
	              			<h2>Providers List</h2>
	            		</div>
	            		<div class="contentbox">
	              			<table cellpadding="0" cellspacing="0" border="0" width="100%">
	                			<tr class="title">
									<td valign="center" align="left" width="5%"><input type="checkbox" value="" name="chkAll"></td>
	                  				<td valign="top" align="left" width="16%">Name</td>
	                  				<td valign="top" align="left" width="20%">E-Mail</td>
	                  				<td valign="top" align="left" width="24%">Mobile</td>
	                  				
									<td valign="top" align="left" width="24%">Action</td>
									<td valign="top" align="left" width="24%">Status</td>
								</tr>
								<%int i=1; %>
								<c:forEach items="${adminuserForm.adminuser}" var="adminuser" varStatus="status">
							       		<tr class="row<%=i%>">
							       		<td valign="center" align="left" width="5%"><input type="checkbox" value="${adminuser.admin_id}" name="chkUser"></td>
							       		  	<td valign="top" align="left"  width="10%"><a href="admindetails?id=${adminuser.admin_id}">${adminuser.admin_firstname}</a></td>
											<td valign="top" align="left" width="15%">${adminuser.admin_email}</td>
											<td valign="top" align="left" width="15%">${adminuser.admin_mobile}</td>
											
											<td valign="top" align="left" width="15%">
											
											<a href="#" title="" ><img src="resources/images/icons/icon_edit.png" alt="Edit" /></a><a href="<c:out value="editadminuser?id=${adminuser.admin_id}"/>" style="padding-right:10px;">Edit</a>
									    
										 	<a href="#" title=""><img src="resources/images/icons/icon_delete.png" alt="Delete" /></a><a  href="<c:out value="deleteadminuser?id=${adminuser.admin_id}"/>"  style="padding-right:10px;" onclick="return confirmation()">Remove</a>
										 	</td>
										 	<td valign="top" align="left" width="15%">
										 	<c:choose>
									     	<c:when test="${adminuser.status==0}">
									     	<a href="viewparticipants" title=""><img src="resources/images/icons/icon_approve.png" alt="Active" /></a><a href="#"  style="padding-right:20px;" onclick="myActive(${adminuser.admin_id},1,${currentpage })">Activate</a>
										 	</c:when>
										 	<c:when test="${adminuser.status==1}">
										 	<a href="viewparticipants" title=""><img src="resources/images/icons/icon_unapprove.png" alt="Suspend" /></a><a href="#" style="padding-right:10px;" onclick="myActive(${adminuser.admin_id},0,${currentpage })">Suspend</a>
										 	</c:when>										 	
										 	</c:choose>
										 	
										 	
										 	
										 	
										 	</td>
										 	
										 	
										 	
										 	
									</tr><%if(i==1) i=2;
									else
									i=1;%>
							    	</c:forEach>
							    	<form action="viewadminuser_page" method="GET">
	<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
				<tr >
							    	<td align="left"><div class="extrabottom">
							    		<a><input  type="submit" name="delete"  value="Remove All"  class="submit_btn1" /></a></div>
					</td>
							    	
							    	<td colspan="6">  <div class="extrabottom">
              <ul class="pagination">
         <%--      <% int i=1;int j=0;%> 
              
         --%>
              <c:if test="${currentpage!=1&&currentpage!=null}">
               <li class="page_unselect"><a href="viewadminuser_page?page=${currentpage - 1}" >Prev</a></li> 
               </c:if>
              
             <%-- <c:forEach var="count" begin="1" end="${noofrows}">  --%>
               <c:forEach begin="1" end="${noofpages}" var="i">
                <c:choose>
                    <c:when test="${currentpage eq i}">
                      <li class="page"><a class="paging_select"><c:out value="${i}"></c:out></a></li>
                     </c:when>
                    <c:otherwise>
                        <li class="page_unselect"><a href="viewadminuser_page?page=${i}"><c:out value="${i}"></c:out></a></li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>          
            <c:if test="${currentpage!=noofpages}">
              <li class="page_unselect"><a href="viewadminuser_page?page=${currentpage+1}">Next</a></li> 
                 </c:if>
              <c:choose>
              <c:when test="${button=='viewall'}">
                  <li class="page"><a href="viewalladminuser" class="paging_select">ViewAll</a></li>
             </c:when>
                <c:otherwise>
                  <li class="page"><a href="viewadminuser" class="paging_select">Back</a></li>
              </c:otherwise>
              
              </c:choose>
         
          
                </ul></div></td></tr>
                </table>
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
                </div>
                </form>
                
							    	
							    	
							    	
		
<script type="text/javascript">

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
var result=confirm("Are you sure.You want to delete the Provider(s)?");
if(result)
	{
return true;
	}
else
	return false;
}









function myFunction(str) {

	var answer = confirm("Are you sure want to delete this Providers?")
	if (answer){
		window.location = "?do=deleteuser&userid="+str;
	}
	else{
// 		alert("Thanks for sticking around!")
	}
}

function myActive(adminid,sta,page) {

	
	if(sta==1)
	{
		var answer = confirm("Are you sure want to Active this Provider?");
	}
	else
	{
		var answer = confirm("Are you sure want to Suspend this Provider?");
	}
	if (answer){
// 		alert("?do=activeuser&userid="+str+"&status="+sta);
		window.location = "permission?id="+adminid+"&status="+sta+"&page="+page;
	}
	else{
// 		alert("Thanks for sticking around!")
	}
}
</script>
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

function confirmation() {
	var answer = confirm("Are you Sure You Want to Delete this Provider ?");
	if (answer){
		return true;
	}
	else{
		return false;
	}
}




</script>



<jsp:include page="footer.jsp"></jsp:include>