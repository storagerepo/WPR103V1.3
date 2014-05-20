<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="Form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="header.jsp"></jsp:include>
<link rel="stylesheet" url="resources/js/jquery.js" />
	<script src="/bcresearchapp/resources/js/jquery.js"></script>
<script type="text/javascript">
$(window).load(function(){
var oldValue = "";
$("#textingcontacts").keyup(function() {
	$("#tc").html('');
	var intRegex = /^\d+$/;
	var xx=document.getElementsByName('message[]').length;
	var $cnt = xx+1;
	if(intRegex.test($(this).val())||$(this).val()=='') 
	{
		var $in = $(this).val();
		var $newdiv="";
	  var $i=$cnt;
			
		var newdiv="";
			for($i=$cnt;$i<=$in;$i++)
				{
				
			newdiv =newdiv+'<table width="100%" border="0" cellspacing="0" cellpadding="0" id="newtbl'+$i+'"><tr class="row2"><td valign="middle" align="right" class="input_txt" width="30%">Message '+$i+' :</td><td valign="top" align="left"  class="input_txt" width="70%"><textarea id="message'+$i+'"  class="input_txtarea" name="message[]" rows="5" cols="" ></textarea></td></tr><tr class="row1"><td align="right" valign="top">&nbsp;</td><td align="left" valign="top"></td></tr></table>';
			 
			
				}
			
			$("#result").html(newdiv);
			$("#tc").html('');
	  
	}
	else if($(this).val()!='')
		{
		
		$("#tc").html('<br/> Kindly give numbers only!!');
		}
}).keydown(function() {
    oldValue = $(this).val();
})
});
</script>

<form action="updatestream" method="POST">
  <div id="right_content">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <tr>
        <td valign="top" align="left" style="padding:5px 0 10px 0;"></td>
      </tr>
      <tr>
        <td valign="top" align="left"><div>
            <div class="headings altheading">
              <h2>Edit Stream</h2>
            </div>
            <div class="contentbox">
            <c:set value="${streamForm.streamDetails[0]}" var="streamDetails"/>
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
             
                <tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="200" width="30%">Stream Id :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="hidden" id="stream_id" value="${streamDetails.streamId}" name="streamId"/> <c:out value="${streamDetails.streamId}"></c:out></td>
                </tr>
                <tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span> Stream Name :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="hidden" name="admin_username" class="input_txtbx" id="admin_username" value="${streamDetails.admin_username}" /><input type="hidden" name="streamName"  id="stream_name" value="${streamDetails.streamName}" /><span><c:out value="${streamDetails.streamName}"></c:out></span>
                  <span><Form:errors path="streamDetails.streamName"></Form:errors></span></td>
                </tr>
                 <tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>No of Messages:</td>
                  <td valign="top" align="left" class="input_txt" width="70%">   
<input id="textingcontacts" name="textingcontacts" class="input_txtbx" width="70%" type="text" value="${streamDetails.textingcontacts}"/><!-- <input type="text" name="textingcontacts" class="input_txtbx" id="textingcontacts"/></br> --> <span id="tc" class="err"><br><form:errors path="streamDetails.textingcontacts"></form:errors></span></td>
                </tr>
                 <tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span> Description :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><textarea name="description" class="input_txtarea"  rows="5" cols="" id="inp_id5"/>${streamDetails.description}</textarea></br><span class="err"><Form:errors path="streamDetails.description"></Form:errors></span></td>
                </tr>
                <% int i=1;%>
                 <c:forEach items="${messages}" var="message" varStatus="status">
                  <tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span> Message <%=i%> :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><textarea class="input_txtarea" name="message[]" rows="5" cols="" id="inp_id5" />${message}</textarea>
                  <% i=i+1; %>             
                   </br><span class="err"></span></td>
                </tr> 
                </c:forEach> 
                <td valign="middle" align="right" colspan="2" class="input_txt">
              <div id="result">
                   </div></td>
                   
              </tr></table><div id="multichoice"></div><table width="100%" border="0" cellspacing="0" cellpadding="0"></table>
		<table align="center"><br>
                 <tr>
                  <td valign="center" align="right"><!-- <a href="javascript:void(0);" onclick="addMultichoice('multichoice');" style="text-decoration:none;" ><input type="button" value="Add one more Message" class="submit_btn2" name="" /></a> --></p> </td>
		<td valign="top" align="right"> <div style="float:center; padding:0px 0px 0px 390px;"> <input type="submit" value="Update Stream" class="submit_btn1" onclick="return validate()"/> </div></td>
         <td valign="top" align="left" style="padding-left:30px;"><a href="viewstream" class="submit_btn1" style="color:white;text-decoration: none; font-size:14px;">Cancel</a> </td>
               
                </tr>
              </table>
             
             
              <div style="clear: both;"></div></div>
            </div>
         </td>
      </tr>
 

</table>
</div>
</form>

<script type="text/javascript">
var $im=1;
var flagm=1;
function addMultichoice(divName)
{
var xx=document.getElementsByName('message[]').length;
var $in = xx+1;

	
	var newdiv = document.createElement('div');

	newdiv.innerHTML = '<table width="100%" border="0" cellspacing="0" cellpadding="0" id="newtbl'+$i+'"><tr class="row2"><td valign="middle" align="right" class="input_txt" width="30%">Message '+$in+' :</td><td valign="top" align="left" class="input_txt" width="70%"><textarea class="input_txtarea" name="message[]" rows="5" cols="" id="inp_id5" ></textarea></td></tr><tr class="row1"><td align="right" valign="top">&nbsp;</td><td align="left" valign="top"></td></tr></table>';
	document.getElementById(divName).appendChild(newdiv);
	$im++;
	flagm++;

	}
	function removechoice(id)
	{
		id='newtbl'+id;
		var child = document.getElementById(id);
		var parentDiv = child.parentNode;
		parentDiv.removeChild(child);

	
	}

	function validate()
	{
	
	var str=document.getElementById("streamName").value;
	var tc=document.getElementById("textingcontacts").value;
	var des=document.getElementById("description").value; 
	var mes=document.getElementById("message").value;
	var mes121=document.getElementById("message2").value;
	var intRegex = /^\d+$/;
	if(intRegex.test(text)||tc=="" ) 
	{
		return false;
	}
	
	if(mes=="")
		{
		document.getElementById("mes").innerHTML="Required Field Should Not be empty";
		return false;
		}
	else if(str=="")
		{
	    document.getElementById("str").innerHTML="Required Field Should not be blank";
		return false;
		}
	else if(tc=="")
		{
		document.getElementById("tc").innerHTML="Required Field Should Not be empty";
		}
	else if(des=="")
		{
		 document.getElementById("des").innerHTML="Required Field Should not be blank";
		 return false;
		}
			return true;
			}
</script>
<jsp:include page="footer.jsp"></jsp:include>

