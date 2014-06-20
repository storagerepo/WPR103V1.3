<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="header.jsp"></jsp:include>
<link rel="stylesheet" url="resources/js/jquery.js" />
	<script src="/bcresearchapp/resources/js/jquery.js"></script>
	
	
<script type="text/javascript">
$(document).ready(function () {
	
    $("#textingcontacts").bind('keypress', function (event) {
    	
    	
        var regex = new RegExp("^[0-9]+$");
      
        var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
      
     
       if (!regex.test(key)) {
        	
            event.preventDefault();
            return false;
        }
    });
			
});

$(window).load(function(){
var oldValue = "";
$.ajax({type : "POST", url: "/bcresearchapp/streammaxID",
    success: function(response){
   $('#current_stream').html(response);
   $('#streamId').val(response);
}});
/* $("#textingcontacts").keyup(function() {
	$("#tc").html('');
	var intRegex = /^\d+$/;
	var tc=document.getElementById("textingcontacts").value;
	
	if(tc!='')
		{
	if(tc>1000)
	 {
	 document.getElementById("tc").innerHTML="Length is too long";
	 return false;
	 }
		}
	if(intRegex.test($(this).val())||$(this).val()=='') 
	{
		var $in = $(this).val();
		var $newdiv="";
	  var $i=0;
			
		var newdiv="";
			for($i=1;$i<=$in;$i++)
				{
				
			newdiv =newdiv+'<table width="100%" border="0" cellspacing="0" cellpadding="0" id="newtbl'+$i+'"><tr class="row2"><td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>Message '+$i+' :</td><td valign="top" align="left"  class="input_txt" width="70%"><textarea id="message'+$i+'"  class="input_txtarea" name="message[]" rows="5" cols=""></textarea><br><font color="Red" size="+1"><span id="msgerr'+$i+'"></span></font></td></tr><tr class="row1"><td align="right" valign="top">&nbsp;</td><td align="left" valign="top"></td></tr></table>';
			// alert("newdiv"+newdiv);
			
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
}) */
});
$(document).ready(function(){
	  $("#textingcontacts").blur(function(){
	
	var intRegex = /^\d+$/;
	var tc=document.getElementById("textingcontacts").value;
	
	if(tc!='')
		{
	if(tc>1000)
	 {
	 document.getElementById("tc").innerHTML="Length is too long";
	 return false;
	 }
		}
	if(intRegex.test($(this).val())||$(this).val()=='') 
	{
		var $in = $(this).val();
		var $newdiv="";
	  var $i=0;
			
		var newdiv="";
			for($i=1;$i<=$in;$i++)
				{
				
			newdiv =newdiv+'<table width="100%" border="0" cellspacing="0" cellpadding="0" id="newtbl'+$i+'"><tr class="row1"><td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>Message '+$i+' :</td><td valign="top" align="left"  class="input_txt" width="70%"><textarea id="message'+$i+'"  class="input_txtarea" name="message[]" rows="5" cols=""></textarea><br><font color="Red" size="+1"><span id="msgerr'+$i+'"></span></font></td></tr><tr class="row1"><td align="right" valign="top">&nbsp;</td><td align="left" valign="top"></td></tr></table>';
			// alert("newdiv"+newdiv);
			
				}
			
			$("#result").html(newdiv);
			$("#tc").html('');
	  
	}
	else if($(this).val()!='')
		{
		
		$("#tc").html('<br/> Kindly give numbers only!!');
		}

	
});
  });

</script>

<!-- <a javascript:void(0);" onclick="removechoice('+$im+')" style="text-decoration:none;"><input type="submit" class="submit_btn" value="CANCEL"  /></a> -->



<form action="insertstream" method="post">
  <div id="right_content">
 
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <tr>
        <td valign="top" align="left" style="padding:5px 0 10px 0;"></td>
      </tr>
      <tr>
        <td valign="top" align="left"><div>
            <div class="headings altheading">
              <h2>Create Stream</h2>
            </div>
            <div class="contentbox">
             <c:choose>
  <c:when test="${empty messagestreamdetails}">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
                <tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="200" width="30%">Stream Id :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><div id="current_stream"></div><input type="hidden" id="streamId" name="streamId" value=""></td>
                </tr>
                <tr class="row2">
              
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span> Stream Name :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="streamName" class="input_txtbx" id="streamName"/></br><span id="sn" style="color:red;font-size: 12px" class="err"></span>	<span class="err" > <form:errors path="streamDetails.streamName"></form:errors></font></span></td>
                </tr>
                         
                <tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>No of Messages:</td>
                  <td valign="top" align="left" class="input_txt" width="70%">   
<input id="textingcontacts" name="textingcontacts" maxlength="4" class="input_txtbx" width="70%" type="text" onblur="message()"/><!-- <input type="text" name="textingcontacts" class="input_txtbx" id="textingcontacts"/></br> --> 
<br>
	<span id="tc"  style="color:red;font-size: 12px" class="err"><br><form:errors path="streamDetails.textingcontacts"></form:errors></span></td>
                </tr>
                 <tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span> Description :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><textarea name="description" class="input_txtarea"  rows="5" cols="" id="description"/></textarea></br>	
                  <font color="Red" size="+1"><span id="des" style="color:red;font-size: 12px" class="err"><form:errors path="streamDetails.description"></form:errors></span></font></td>
                </tr>
                <tr class="row1">
                  <!-- <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span> Message 1 :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><textarea class="input_txtarea" name="message[]" rows="5" cols="" id="message" /></textarea><br><span id="mes" class="err"></span></br></td>
              -->   
              <td valign="middle" align="right" colspan="2" class="input_txt">
              <div id="result">
                   </div></td>
                   
              </tr></table><div id="multichoice"></div><table width="100%" border="0" cellspacing="0" cellpadding="0"></table>
		</c:when>
		<c:otherwise>
		<table cellpadding="0" cellspacing="0" border="0" width="100%">
             
                <tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="200" width="30%">Stream Id :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="hidden" id="stream_id" value="${messagestreamdetails.streamId}" name="streamId"/> <c:out value="${messagestreamdetails.streamId}"></c:out></td>
                </tr>
                <tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span> Stream Name :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="hidden" name="admin_username" class="input_txtbx" id="admin_username" value="${messagestreamdetails.admin_username}" /><input type="text"  class="input_txtbx" name="streamName" id="stream_name" value="${messagestreamdetails.streamName}"  /><span><%-- <c:out value="${messagestreamdetails.streamName}"></c:out> --%></span>
                  <span><Form:errors path="streamDetails.streamName"></Form:errors></span></td>
                </tr>
                 <tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>No of Messages:</td>
                  <td valign="top" align="left" class="input_txt" width="70%">   
<input id="textingcontacts" maxlength="4" name="textingcontacts" class="input_txtbx" width="70%" type="text" value="${messagestreamdetails.textingcontacts}"/><!-- <input type="text" name="textingcontacts" class="input_txtbx" id="textingcontacts"/></br> --> <span id="tc" class="err"><br><form:errors path="streamDetails.textingcontacts"></form:errors></span></td>
                </tr>
                 <tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span> Description :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><textarea name="description" class="input_txtarea"  rows="5" cols="" id="inp_id5"/>${messagestreamdetails.description}</textarea></br><span class="err"><Form:errors path="streamDetails.description"></Form:errors></span></td>
                </tr>
                <% int i=1;%>
                 <c:forEach items="${messages}" var="message" varStatus="status">
                  <tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span> Message <%=i%> :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><textarea class="input_txtarea" name="message[]" rows="5" cols="" id="message" />${message}</textarea>
                </br><font color="Red" size="+1"><span id="msgerr<%=i%>" class="err"></span></font>
                  <% i=i+1; %>             
                 </td>
                </tr> 
                </c:forEach> 
                <td valign="middle" align="right" colspan="2" class="input_txt">
              <div id="result">
                   </div></td>
                   
              </tr></table>
		
		
		
		</c:otherwise>
		</c:choose>
		<table>
                <tr>               
	                  
		 <td valign="top"><div style="float:center; padding:0px 0px 0px 400px;"><input type="submit" value="Save Stream" class="submit_btn1" onclick="return validate('this')"/> </div></td>
               
               <td valign="top" align="left" style="padding-left:30px;"><a href="createstream"  class="submit_btn1" style="color:white;text-decoration: none; font-size:14px;"/>Reset</a> </td>
               <td valign="top" align="left" style="padding-left:30px;"><a href="viewstream" class="submit_btn1" style="color:white;text-decoration: none; font-size:14px;">Cancel</a> </td>
                </tr>
              </table>
            
              <div style="clear: both;"></div></div>
            </div>
          </div></td>
      </tr></form>
 

<script type="text/javascript">
var $im=1;
var flagm=1;
function addMultichoice(divName)
{
var xx=document.getElementsByName('message[]').length;
var $in = xx+1;
//alert("in"+$in);
	
	var newdiv = document.createElement('div');

	newdiv.innerHTML = '<table width="100%" border="0" cellspacing="0" cellpadding="0" id="newtbl'+$i+'"><tr class="row2"><td valign="middle" align="right" class="input_txt" width="30%">Message '+$in+' :</td><td valign="top" align="left" class="input_txt" width="70%"><textarea class="input_txtarea" name="message[]" rows="5" cols="" id="message'+$in+'" ></textarea><br><font color="Red" size="+1"><span id="msgerr'+$in+'"></span></font></td></tr><tr class="row1"><td align="right" valign="top">&nbsp;</td><td align="left" valign="top"></td></tr></table>';
	//alert(newdiv);
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
		
		document.getElementById("sn").innerHTML="";
		 document.getElementById("tc").innerHTML="";
		 document.getElementById("des").innerHTML="";
	
		if(tc!='')
			{
		 if(tc==0)
			{
			document.getElementById("tc").innerHTML="Kindly give No Of Messages greater than 0";
			return false;
			}
		 if(tc>1000)
			 {
			 document.getElementById("tc").innerHTML="Length is too long";
				return false;
			 }
			}
		 if(str=='' && tc=='' && des=='')
			{
			document.getElementById("sn").innerHTML="Required Field Should Not be empty";
			document.getElementById("tc").innerHTML="Required Field Should Not be empty";
			document.getElementById("des").innerHTML="Required Field Should Not be empty";
			return false;
			}
		if(str=='')
			{
			 document.getElementById("sn").innerHTML="Required Field Should Not be empty";
			
			 return false;
			}
		if(tc=='')
			{
			document.getElementById("tc").innerHTML="Required Field Should Not be empty";
			return false;
			}
		if(des=='')
			{
			document.getElementById("des").innerHTML="Required Field Should Not be empty";
			return false;
			}
		
		var xx=document.getElementsByName('message[]').length;
		var $in = xx+1;
		
		if(xx>0)
			{
		
		for(var $m=1;$m<=xx;$m++)
				{
				//alert("m value"+$m);
				var mtest="message"+$m;
				var msgerror="msgerr"+$m;
				document.getElementById(msgerror).innerHTML="";				
			//	alert("mtestvalue"+document.getElementById(mtest).value);
			if(document.getElementById(mtest).value=='')
				{
				//alert("sdfsd");				
				document.getElementById(msgerror).innerHTML="Required Field Should Not be empty";
				return false;
				}
			}
			}
			
	//	alert("value"+xx+document.getElementsByName('message[1]').value);
		
		
	
	
	
	if(str=='' && tc=="")
		{
			 document.getElementById("sn").innerHTML="Required Field Should Not be empty";
			 document.getElementById("tc").innerHTML="Required Field Should Not be empty";
			 return false;
		}
	if(tc=="" && des=="")
	{
	 document.getElementById("tc").innerHTML="Required Field Should Not be empty";
	 document.getElementById("des").innerHTML="Required Field Should Not be empty";
	 return false;
	}
	if(str==''  && des=="")
	{
	 document.getElementById("sn").innerHTML="Required Field Should Not be empty";	
	 document.getElementById("des").innerHTML="Required Field Should Not be empty";
	 return false;
	}
	
	
	if(str=='')
	{
	document.getElementById("sn").innerHTML="Required Field Should Not be empty";
	return false;
	}
	if(tc=="")
		{
		document.getElementById("tc").innerHTML="Required Field Should Not be empty";
		return false;
		}	
	
if(des=="")
		{
		 document.getElementById("des").innerHTML="Required Field Should Not be empty";
		 return false;
		}
			
			}
</script>

<jsp:include page="footer.jsp"></jsp:include>

