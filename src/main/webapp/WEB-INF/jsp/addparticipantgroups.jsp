<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="header.jsp"></jsp:include>
<link rel="stylesheet" href="resources/css/jquery-ui.css" />
  <script src="resources/js/jquery-1.9.1.js" type="text/javascript"></script>
  <script src="resources/js/jquery-ui.js" type="text/javascript"></script>
  
  
  
  <script>
 /*  $(document).ready(function() {
      $('#group_name').keyup(function(){

          var group_name= $('#group_name').val();
        
          /* alert(group_name);
          $.post("dashboard",{ rrr: group_name },function(data){
//alert("fdgd123"); */

//alert(n);/* 
             //if(n>0)
              //{
               //    $('#notavai').show(data);
                 // $('#notavai').html(data);

              //}
              //else
              //{
//alert(n);
                //  $('#notavai').hide(data);

              //}

      //    });


    //  });

  //});
     
  
  $(function() {
    $( "#dateofjoinfrom" ).datepicker();
  });
  $(function() {
	    $( "#dateofjointo" ).datepicker();
	  });
  </script>
  
<div id="right_content">

<form action="addparticipantgroups" method="post" >

    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <c:if test="${success==true}">
      <tr>
        <td valign="top" align="left" style="padding:5px 0 10px 0;">
			<div class="status success">
	            <p class="closestatus"><a title="Close" href="">x</a></p>
	            <p><img alt="Success" src="resources/images/icons/icon_success.png"><span>Success!</span>.</p>
	       	</div>                          
		</td>
      </tr>
      </c:if>
      <tr>
        <td valign="top" align="left">
        	<div>
	            <div class="headings altheading">
	              <h2>Participant Groups</h2>
	            </div>
	            <div class="contentbox">
	            <c:choose>
	            <c:when test="${empty participantgroup}">
	              <table cellpadding="0" cellspacing="0" border="0" width="100%">
	                
	                <tr class="row1">
	                  <td valign="middle" align="right" class="input_txt" width=30% ><span class="err">*</span> Group Name :</td>
	                  <td valign="top" align="left" class="input_txt" width=70%><input type="text" name="group_name" class="input_txtbx" style="width:200px;"  id="group_name" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /><br/><span class="err"> <c:if test="${Group_exists==true}"><c:out value="Group Name already exist"/></c:if><form:errors path="pgroups.group_name"></form:errors> </span></td>
	                </tr>
	                <tr class="row1">
	                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span> Group Description :</td>
	                  <td valign="top" align="left" class="input_txt" width="70%"><textarea style="width:200px; height:100px;" name="group_decs" id="group_decs" class="input_txtbx" style="width: 301px; height: 109px;"></textarea></br><span class="err"><form:errors path="pgroups.group_decs"></form:errors></span></td>
	                </tr>
	               </table>
	              <table align="center" class="row2" cellpadding="0" cellspacing="0" border="0" width="100%">           
	                 <tr class="row2">
	                  <td valign="top" align="right">&nbsp;</td>
	                  <td valign="top" align="right" width="42%"><input type="submit" class="submit_btn1" value="Add Group" style="color:white;"><td >
	                  <input type="reset" class="submit_btn1" value="Reset" style="color:white;"></td>
	                  <td><strong><b> <a href="viewparticipantgroups" class="submit_btn1" style="color:white;text-decoration: none; font-size:14px;">Cancel</a></b></strong></td><td width="40%"></td>
	                </tr>	                
	                </table>
	        
	                </c:when>
	                <c:otherwise>
	                  <div class="contentbox">
	                <table cellpadding="0" cellspacing="0" border="0" width="100%">
	                 <tr class="row1">
	                  <td valign="middle" align="right" class="input_txt" width=30% ><span class="err">*</span> Group Name :</td>
	                  <td valign="top" align="left" class="input_txt" width=70%><input type="text" name="group_name" class="input_txtbx" style="width:200px;"  id="group_name" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${participantgroup.group_name}"/><br/><span class="err"> <c:if test="${Group_exists==true}"><c:out value="Group Name already exist"/></c:if><form:errors path="pgroups.group_name"></form:errors> </span></td>
	                </tr>
	               <tr class="row1">
	                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span> Group Description :</td>
	                  <td valign="top" align="left" class="input_txt" width="70%"><textarea style="width:200px; height:100px;" name="group_decs" id="group_decs" class="input_txtbx" style="width: 301px; height: 109px;">${participantgroup.group_decs}</textarea></br><span class="err"><form:errors path="pgroups.group_decs"></form:errors></span></td>
	                </tr>
	                
	                </table>
	                 <table align="center" class="row2" cellpadding="0" cellspacing="0" border="0" width="100%">           
	                 <tr class="row2">
	                  <td valign="top" align="right">&nbsp;</td>
	                  <td valign="top" align="right" width="42%"><input type="submit" class="submit_btn1" value="Add Group" style="color:white;"><td></form>
	                 <form method=get action="showaddparticipantgroups"> <input type="submit" class="submit_btn1"  value="Reset" style="color:white;"></td></form>
	                  <td> <a href="viewparticipantgroups" class="submit_btn1" style="color:white; text-decoration: none;font-size:14px;">Cancel</a></td><td width="40%"></td>
	                </tr>	                
	                </table>
	                
	                </c:otherwise>
	                
	                </c:choose>
	               
		
			
			
	            </div>
          </div></td>
      </tr>
     </table>


</div>
<script type="text/javascript">
function openlocal()
{
	if(document.getElementById('local').style.display=="none")
	{
		document.getElementById('local').style.display="block";
		//document.getElementById('scope_local').setAttribute("checked","true");
	}
	
}
function closelocal()
{
	if(document.getElementById('local').style.display=="block")
	{
		document.getElementById('local').style.display="none";
		//document.getElementById('scope_local').setAttribute("checked","false");
	}
	
}
</script>
<!-- <script type="text/javascript">
	Calendar.setup({
	  inputField    : "startdate",
	  button        : "startdatea",
	  align         : "Tr"
	});
</script>
<script type="text/javascript">
	 Calendar.setup({
	   inputField    : "enddate",
	   button        : "enddatea",
	   align         : "Tr"
	 });
</script> -->
<jsp:include page="footer.jsp"></jsp:include>