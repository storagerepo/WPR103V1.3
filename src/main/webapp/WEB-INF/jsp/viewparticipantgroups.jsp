<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"></jsp:include>
<script type="text/javascript" src="js/ajaxpaging.js"></script>
<script src="resources/js/jquery_checkbox.js" type="text/javascript"></script>

<div id="right_content">
	<form name="grid" onSubmit="return validate(this)" action="deleteparticipantgroup" method="POST">
	<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
    	<tr>
			<td valign="top" align="left" style="padding:5px 0 10px 0;">
			<!-- 	<div class="del_div">
					<p><label style="padding: 0pt 20px 0pt 0pt;"><input type="submit" name="delete" value="" class="icon1" /></label></p>
          		</div> -->
			</td>
		</tr>
		<tr>
        	<td valign="top" align="left" style="padding:5px 0 10px 0;">
        	<c:if test="${success==true }">
				<div class="status success">
            		<p class="closestatus"><a title="Close" href="viewparticipantgroups">x</a></p>
            		<p><img alt="Success" src="resources/images/icons/icon_success.png"><span>Success</span> .</p>
          		</div>
          		</c:if>
          		<%-- <c:if test="${success==true }">
				<div class="status error">
            		<p class="closestatus"><a title="Close" href="">x</a></p>
            		<p><img alt="Error" src="images/icons/icon_error.png"><span><AJDF:output>$smarty.session.deletepart</AJDF:output></span> .</p>
          		</div>
          		</c:if> --%>
				<!-- <div class="status success">
            		<p class="closestatus"><a title="Close" href="">x</a></p>
            		<p><img alt="Success" src="images/icons/icon_success.png"><span><AJDF:output> $smarty.session.upuser_new</AJDF:output></span> .</p>
          		</div> -->
			</td>
      	</tr>
      	<tr>
        	<td valign="top" align="left">
        		<div>
	            	<div class="headings altheading">
	              		<h2>View Groups</h2>
	            	</div>
	            	<div class="contentbox">
	            		<table cellpadding="0" cellspacing="0" border="0" width="100%">
	                		<tr class="title">
								<td valign="center" align="left" width="5%" style="padding-left:200px;"><input type="checkbox" onclick="selectall(this.form)" value="" name="chkAll"></td>
	                  			<td valign="top" align="left" width="10%">Group&nbsp;Name</td>
	                  			<td valign="top" align="left" width="25%">Description</td>
	                  			<td valign="top" align="left" width="25%">Action</td>
	                		</tr>
	                		<%int i=1; %>
	                		<c:forEach items="${participantGroupForm.participantGroups}" var="participantGroups" varStatus="status">
	                		
							       		<tr class="row<%=i %>">
							       		<td valign="center" align="left" width="5%" style="padding-left:200px;"><input type="checkbox" value="${participantGroups.group_id}" name="chkUser"></td>
							       		     	<td valign="top" align="left"  width="10%"><a href="groupdetails?id=${participantGroups.group_id}">${participantGroups.group_name}</a></td>
											<td valign="top" align="left" width="25%">${participantGroups.group_decs}</td>
											<%-- <td valign="top" align="left" width="10%">${participantGroups.local_dojfrom}</td>
											<td valign="top" align="left" width="10%">${participantGroups.local_dojto}</td>
											<td valign="top" align="left" width="15%">${participantGroups.local_educations}</td> --%>
											<%-- <td valign="top" align="left" width="15%">${participantsDetails.education}</td> --%>
											<td><a href="#" title=""><img src="resources/images/icons/icon_delete.png" alt="Delete" /></a><a href="<c:out value="deleteparticipantgroup?id=${participantGroups.group_id}"/>" style="padding-right:10px;"  onclick="return confirmation();">Remove</a></td>
						<%-- 					<td valign="top" align="left" width="15%">${participantsDetails.date_of_join}</td>
							 --%>			</tr>
							 <%if(i==1) i=2;
							 else i=1;%>
							    	</c:forEach>
							    	</table>
							    	
							    	
							    	
							    	<form action="viewparticipantgroup_page" method="GET"> 
							    	<table cellpadding="0" cellspacing="0" border="0" width="98%"
			class="margin_table">
							    	<tr >
							    	<td align="center" width="20%"><div class="extrabottom">
							    		<a><input  type="submit" name="delete"  value="Remove All"  class="submit_btn1" /></a></div>
					</td>
							    	
							    	<td colspan="6">  <div class="extrabottom">
              <ul class="pagination">
         <%--      <% int i=1;int j=0;%> 
              
         --%>
              <c:if test="${currentpage!=1&&currentpage!=null}">
               <li class="page_unselect"><a href="viewparticipantgroup_page?page=${currentpage - 1}" >Prev</a></li> 
               </c:if>
              
             <%-- <c:forEach var="count" begin="1" end="${noofrows}">  --%>
               <c:forEach begin="1" end="${noofpages}" var="i">
                <c:choose>
                    <c:when test="${currentpage eq i}">
                      <li class="page"><a class="paging_select"><c:out value="${i}"></c:out></a></li>
                     </c:when>
                    <c:otherwise>
                        <li class="page_unselect"><a href="viewparticipantgroup_page?page=${i}"><c:out value="${i}"></c:out></a></li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>          
            <c:if test="${currentpage!=noofpages}">
              <li class="page_unselect"><a href="viewparticipantgroup_page?page=${currentpage+1}">Next</a></li> 
                 </c:if>
              <c:choose>
              <c:when test="${button=='viewall'}">
                  <li class="page"><a href="viewallgroups" class="paging_select">ViewAll</a></li>
             </c:when>
                <c:otherwise>
                  <li class="page"><a href="viewparticipantgroups" class="paging_select">Back</a></li>
              </c:otherwise>
              
              </c:choose>
         
          
                </ul></div></td></tr>
							    	
							    	
			</table>
			</form>
				</form>	</div>
							    	</div>
							    	</td>
							    	</tr>
							    	</table>		    	
							    	
							    	
							    	
						
</div>
<script>
function confirmation() {

	var answer = confirm("Are You Sure? You Want To Delete Group?")
	if (answer){
		return true;
	}
	else{
		return false;
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
var result=confirm("Are you sure?You want to delete the Group(s)?");
if(result)
	{
return true;
	}
else
	return false;
}
</script>
<jsp:include page="footer.jsp"></jsp:include>