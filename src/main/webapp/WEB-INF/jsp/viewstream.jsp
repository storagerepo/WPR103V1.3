<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="header.jsp"></jsp:include>
<script type="text/javascript" src="js/ajaxpaging.js"></script>
<script src="resources/js/jquery_checkbox.js" type="text/javascript"></script>

 <form name="grid"  action="deleteSelectedstream" onSubmit="return validate(this)" method="POST">
	<div id="right_content">
    	<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
			<tr>
        		<td valign="top" align="left" style="padding:5px 0 10px 0;">
        			<!-- <div class="del_div">
						<p><label style="padding: 0pt 20px 0pt 0pt;"><a><input  type="submit" name="delete" value="" class="icon1"  /></a></label></p>
					</div> -->
				</td>
		   	</tr>
			<tr>
			
			<c:if test="${success==true}">
        <tr>
        <td valign="top" align="left" style="padding:5px 0 10px 0;">&nbsp;
            <div id="success_statusbar" class="status success">
            <p class="closestatus"><a title="Close" href="viewstream">x</a></p>
            <p><img alt="Success" src="resources/images/icons/icon_success.png"><span>Success!</span>.</p>
          </div>
      </tr>
    </c:if>  
			
        		
      <tr>
        <td valign="top" align="left"><div>
            <div class="headings altheading">
              <h2>View Stream</h2>
            </div>
            <div class="contentbox">
             
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
                <tr class="title">
		          <td valign="center" align="left" width="5%"><input type="checkbox"  value="" name="chkAll"></td>
                  <td valign="top" align="left" width="10%">Stream ID</td>
		          <td valign="top" align="left" width="15%">Name</td>
		          <td valign="top" align="left" width="15%">Description</td>
                  <td valign="top" align="left" width="15%">No of Messages</td>
                  <td valign="top" align="left" width="15%">Created By</td>
		          <td valign="top" align="center" width="25%">Action</td>


                </tr>
         <%int i=1;
         %>
		<c:forEach items="${streamForm.streamDetails}" var="streamDetails" varStatus="status">
        					
		<tr class="row<%=i%>">
		<td valign="center" align="left" width="5%"><input type="checkbox" value="${streamDetails.streamId}" name="chkUser"></td>
        <td valign="top" align="left" width="10%"><a href="streamdetails?id=${streamDetails.streamId}">${streamDetails.streamId}</a></td>
		<td valign="top" align="left" width="15%">${streamDetails.streamName}</td>
		<td valign="top" align="left" width="15%">${streamDetails.description}</td>
        <td valign="top" align="center" width="15%">${streamDetails.message_count}</td>
        <td valign="top" align="left" width="15%">${streamDetails.admin_username}</td>
		<td valign="top" align="center" width="25%">
		
		
		<a href="#" title="" ><img src="resources/images/icons/icon_edit.png" alt="Edit" /></a><a href="<c:out value="edit_stream?id=${streamDetails.streamId}"/>" style="padding-right:10px;">Edit</a>
		
		
	    <a href="#" title=""><img src="resources/images/icons/icon_delete.png" alt="Delete" /></a><a href="<c:out value="deletestream?id=${streamDetails.streamId}"/>" onclick="return confirmation()">Remove</a>
	  
    </tr>
    <%if(i==1) i=2;
    else
    i=1;%>
		</c:forEach>
		
		<form action="viewstream_page" method="GET">
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
               <li class="page_unselect"><a href="viewstream_page?page=${currentpage - 1}" >Prev</a></li> 
               </c:if>
              
             <%-- <c:forEach var="count" begin="1" end="${noofrows}">  --%>
               <c:forEach begin="1" end="${noofpages}" var="i">
                <c:choose>
                    <c:when test="${currentpage eq i}">
                      <li class="page"><a class="paging_select"><c:out value="${i}"></c:out></a></li>
                     </c:when>
                    <c:otherwise>
                        <li class="page_unselect"><a href="viewstream_page?page=${i}"><c:out value="${i}"></c:out></a></li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>          
            <c:if test="${currentpage!=noofpages}">
              <li class="page_unselect"><a href="viewstream_page?page=${currentpage+1}">Next</a></li> 
                 </c:if>
              <c:choose>
              <c:when test="${button=='viewall'}">
                  <li class="page"><a href="viewallstream" class="paging_select">ViewAll</a></li>
             </c:when>
                <c:otherwise>
                  <li class="page"><a href="viewstream" class="paging_select">Back</a></li>
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
function streamdelete(str) {

	var answer = confirm("Are you sure want to delete this Stream?")
	if (answer){
		window.location = "?do=deletestream&streamid="+str;
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



function confirmation() {
	var answer = confirm("Are you Sure You Want to Delete Stream ?");
	if (answer){
		return true;
	}
	else{
		return false;
	}
}
</script>
<script language="javascript">
function selectall(field)
{
	//field.getElementByTagName('checkbox');
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


</script>
