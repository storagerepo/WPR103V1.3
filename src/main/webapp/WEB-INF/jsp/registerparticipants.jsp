<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
            response.setHeader("Cache-Control", "no-cache");
            response.setHeader("Cache-Control", "no-store");
            response.setDateHeader("Expires", 0);
            response.setHeader("Pragma", "no-cache");
%>
<title>:: Medical SMS::</title>
<link rel="stylesheet" url="resources/js/jquery.js" />
<script src="/bcresearchapp/resources/js/jquery.js"></script>
<script>
function regex()
{
var regex=/(^\d{5}$)|(^\d{5}-\d{4}$)/;
var city=document.getElementById('');

}
</script>

<script type="text/javascript">
$(window).load(function(){
	
var oldValue = "";

$("#mno").keyup(function() {
	$("#spnmno").html('');
	var intRegex = /^\d+$/;
	if(intRegex.test($(this).val())||$(this).val()=='') 
	{
		var $in = $(this).val();
		var $newdiv="";
	  var $i=0;
	  if($in.length>10)
		  {
		  $("#spnmno").html('Mobile number is not valid. Should be of length 10!!');		
		   }	
			
	}
	
	else if($(this).val()!='')
		{
		
		$("#spnmno").html('Kindly give numbers only!!');
		return false;
		}
}).keydown(function() {
    oldValue = $(this).val();
})

$("#city").keyup(function() {
	$("#spncity").html('');
	
	var regex=/(^\d{5}$)|(^\d{5}-\d{4}$)/;
	/* if(intRegex.test($(this).val())||$(this).val()=='') 
	{
		var $in = $(this).val();		 
	} */
	if(regex.test($(this).val())||$(this).val()=='') 
	{
		var $in = $(this).val();		 
	}
	
	else if($(this).val()!='')
		{
		
		$("#spncity").html('Not a valid Zipcode!!');
		return false;
		}
}).keydown(function() {
    oldValue = $(this).val();
})
});
</script>

<!-- <script type="text/javascript">
$(window).load(function(){
var oldValue = "";

$("#city").keyup(function() {
	$("#spncity").html('');
	var intRegex = /^\d+$/;
 if($(this).val()!='')
		{
		
		$("#spncity").html('Kindly give numbers only!!');
		}
}).keydown(function() {
    oldValue = $(this).val();
})
});
</script> -->









<script type="text/javascript">
function doAjaxPost() {  
	  // get the form values  
	  var name = $('#Provider_name').val();
	 /*   var education = $('#education').val();	 */   
	  $.ajax({  
	    type: "POST",  
	    url: "/bcresearchapp/AddUser.htm",  
	    data: "Provider_name=" + name,  
	    success: function(response){  
	      // we have the response  
	      $('#info').html(response);
	      /*     $('#education').val(''); */
	    },  
	    error: function(e){  
	      alert('Error: ' + e);  
	    }  
	  });  
	}  
</script>

 <script type="text/javascript">

 $(document).ready(function () {
        	
            $("#fname").bind('keypress', function (event) {
            	
            	
                var regex = new RegExp("^[a-zA-Z0-9 ]+$");
              
                var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
              
             
               if (!regex.test(key)) {
                	
                    event.preventDefault();
                    return false;
                }
            });
        			
        });
 $(document).ready(function () {
 	
     $("#username").bind('keypress', function (event) {
     	
     	
         var regex = new RegExp("^[a-zA-Z0-9-.@_]+$");
       
         var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
       
      
        if (!regex.test(key)) {
         	
             event.preventDefault();
             return false;
         }
     });
 			
 });
    </script>


<script>
function validate(){
	//alert("yes");
document.getElementById("spngrp").innerHTML='';
/* var $firstname=document.getElementById("fname").value;
alert($firstname);
var $fregex = "^[^<>'\"/;`%]*$";
if($fregex.test($firstname)||$firstname=='')
	{
	alert("hi");
		}
else
	{
	alert("dsfsdfdsf");
	} */
		
var fld = document.getElementById('group_name');
var values = [];
for (var i = 0; i < fld.options.length; i++) {

  if (fld.options[i].selected) {
    values.push(fld.options[i].value);
  }
}

if(values.length>4)
{
alert("You can select only 4 groups");

/*  if($zipcode!='')
		{
		alert("no");
		
		$("#spncity").html('Not a valid Zipcode!!');
		/* return false; */
		
 var $zipcode=document.getElementById("city").value;


	var $regex=/(^\d{5}$)|(^\d{5}-\d{4}$)/;
	
	
	if($regex.test($zipcode)||$zipcode=='') 
	{
	
		var $in = $zipcode;		 
	}
	
	else if($zipcode!='')
		{
				
		$("#spncity").html('Not a valid Zipcode!!');
		
		}
		if(document.getElementsByName("group_name").value=='')
		{
		/* alert("sdfsd"); */
		}
 
 return false;
}
else
{

 var $zipcode=document.getElementById("city").value;
/* alert($zipcode); */

	var $regex=/(^\d{5}$)|(^\d{5}-\d{4}$)/;

/* alert("i am in else loop"+$regex); */

if($regex.test($zipcode)||$zipcode=='') 
	{
	/* alert("yes"); */
		var $in = $zipcode;		 
	}
	
	else if($zipcode!='')
		{
		/* alert("no"); */
		
		$("#spncity").html('Not a valid Zipcode!!');
/* alert(document.getElementById("Provider_name").value); */
if(document.getElementById("Provider_name").value!='null')
{
/* alert(document.getElementById("group_name").value); */
//alert(fld.options.length);
if(fld.options.length==0)
{
if(document.getElementById("group_name").value=='')
		{
		
		document.getElementById("spngrp").innerHTML="The selected provider does not have any groups";
		}
		}
		}
		return false;
		}
		
if(document.getElementById("Provider_name").value!='null')
{
/* alert(document.getElementById("group_name").value); */
//alert(fld.options.length);
if(fld.options.length==0)
{
if(document.getElementById("group_name").value=='')
		{
	
		document.getElementById("spngrp").innerHTML="The selected provider does not have any groups";
		return false;
		}
		}
		}
		

return true;
}}
</script>

<Script>
function empty()
{		var fld = document.getElementById('group_name');
		fld.innerHTML = "";
		
	}
</Script>

<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.10.2.min.js">
</head>
<body>

<script type="text/javascript" src="<c:url value="/resources/js/jquery.js" />"></script>
<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet"
	type="text/css" />
<link href="<c:url value="/resources/css/inner-clr.css" />"
	rel="stylesheet" type="text/css" />

<div class="logo">
				<a href="#"><img src="<c:url value="/resources/images/logo_pink.png" />" alt="Company Logo" /></a>
			</div>
<div id="right_content">

	<form action="registerparticipants" method="POST" name="update" id="update">

		<table cellpadding="0" cellspacing="0" border="0" width="98%"
			class="margin_table" id="su">

			<c:if test="${success==true}">
				<tr>
					<td valign="top" align="left" style="padding: 5px 0 10px 0;">&nbsp;
						<div id="success_statusbar" class="status success">
							<p class="closestatus">
								<a title="Close" href="">x</a>
							</p>
							<p>
								<img alt="Success" src="resources/images/icons/icon_success.png"><span>Success!</span>.
							</p>
						</div>
				</tr>
			</c:if>

		</table>
		<table cellpadding="0" cellspacing="0" border="0" width="98%"
			class="margin_table">
			<tr>
				<td valign="top" align="left">
					<div>
						<div class="headings altheading">
							<h2>Register Participant</h2>
						</div>
						
						
						<div class="contentbox">
						<div id="time"></div>
<c:choose>
						<c:when test="${empty participants }">
							<table cellpadding="0" cellspacing="0" border="0" width="100%">
								<tr>
									<td align="left" valign="top" width="50%" style="padding-right: 25px;">
										<h2 class="quck-txt">Quick Info</h2>
										<table cellpadding="0" cellspacing="0" border="0" width="100%">
											<tr class="row2">
												<td valign="middle" align="left" class="input_txt"><span class="err">*</span> First Name :</td>
												<td valign="top" align="left" class="input_txt"><input type="text" class="input_txtbx1" id="fname" onmouseover="showTooltip('tooltip_id','inp_id3');"
													onmouseout="hideTooltip('tooltip_id');" name="fname" /><br />
													<font color="Red" size="+1"> <span id="spnfname">
															<form:errors path="participant.fname"></form:errors>
													</span></font></td>

											</tr>

											
											<tr class="row1">
												<td valign="middle" align="left" class="input_txt"><span
													class="err">*</span><span
													class="err"></span> User Name :</td>
												<td valign="top" align="left" class="input_txt">
												
												<input type="hidden" name="password" value="sa"/>
												<input
													type="text" class="input_txtbx1" id="username"
													onmouseover="showTooltip('tooltip_id','inp_id3');"
													onmouseout="hideTooltip('tooltip_id');" name="username" /> </br>
													 <c:if test="${user_exists ==true}"> <font color="Red" size="+1"><span id="spnlname"></span>User name already exists  <form:errors
															path="participant.username"></form:errors></c:if> </font></td>
											</tr>
											
											
											<tr class="row2">
												<td valign="middle" align="left" class="input_txt"><span
													class="err">*</span> Mobile No :</td>
												<td valign="top" align="left" class="input_txt"><input min="10" maxlength="10"
													type="text" class="input_txtbx1" id="mno"
													onmouseover="showTooltip('tooltip_id','inp_id3');"
													onmouseout="hideTooltip('tooltip_id');"
													value="${mobile_num}" name="mobile_num"/></br> 
												<c:if test="${mobile_exists ==true}">
													<font
													color="Red" size="+1"><span id="spnmno"></span>Mobile name already exists </font>
													</c:if>	
													 <%-- <c:if test="${merror==true}"> <font color="Red" size="+1"><span id="spnmno"></span>Mobile Number Not Valid</font>	<br/></c:if> --%>		
												<font
													color="Red" size="+1"><span id="spnmno"><form:errors
																path="participant.mobile_num"></form:errors> </span></font></td>
											</tr>
											<tr class="row1">
												<td valign="middle" align="left" class="input_txt"><span
													class="err">*</span> Email-Id :</td>
												<td valign="top" align="left" class="input_txt"><input
													type="text" class="input_txtbx1" id="eid"
													onmouseover="showTooltip('tooltip_id','inp_id3');"
													onmouseout="hideTooltip('tooltip_id');" name="email_id" /></br>
												<c:if test="${email_exists ==true}">
													<font
													color="Red" size="+1"><span id="spnlname"></span>Email id already exists </font>
													</c:if>	
													<font color="Red" size="+1"><span id="spneid"><form:errors
																path="participant.email_id"></form:errors> </span></font></td>
											</tr>
											<tr class="row2">
												<td valign="middle" align="left" class="input_txt"><span
													class="err"></span> Gender :</td>
												<td valign="top" align="left" class="input_txt"><input
													type="radio" name="gender" value="0" class="input_txt"
													checked="true">Male&nbsp;&nbsp;&nbsp;<input
													type="radio" name="gender" value="1" class="input_txt">Female&nbsp;&nbsp;&nbsp;</td>
											</tr>
											<tr class="row1">
												<td valign="middle" align="left" class="input_txt"><span
													class="err"></span> <%--  Age :<c:forEach begin="1" end="100" var="i">
                                 <option value="${i}" <c:if test ="${participantsDetails.age == i}">select</c:if>>${i}</option>
                                                       </c:forEach>   --%>
													Age :</td>
												<td valign="top" align="left" class="input_txt"><select
													name="age" class="input_cmbbx1">
														<option selected="selected" value="null">--select--</option>
														<option  value="Below 12">Below 12</option>
														<option value="12-20 years" id="age">12-20 &#160 years</option>
														<option value="21-30 years" id="age">21-30 &#160 years</option>
														<option value="31-40 years" id="age">31-40 &#160 years</option>
														<option value="41-50 years" id="age">41-50 &#160 years</option>
														<option value="51-60 years" id="age">51-60 &#160 years</option>
														<option value="61-70 years" id="age">61-70 &#160 years</option>
														<option value="71-80 years" id="age">71-80 &#160 years</option>
														<option value="81-90 years" id="age">81-90 &#160 years</option>
														<option value="91-100 years" id="age">91-100
															years</option>
														
														<span id="spnage"><form:errors
																path="participant.age"></form:errors> </span>
														</font></td>
											</tr>

											<tr class="row2">
												<td valign="middle" align="left" class="input_txt"><span
													class="err"></span> Zipcode :</td>
												<td valign="top" align="left" class="input_txt"><input
													type="text" class="input_txtbx1" id="city"
													onmouseover="showTooltip('tooltip_id','inp_id3');"
													onmouseout="hideTooltip('tooltip_id');" name="city" /></br>
													
													<font
													color="Red" size="+1"><span id="spncity">
													
													<form:errors path="participant.city"></form:errors> </span></font></td>
											</tr>
											<tr class="row1">
												<td valign="middle" align="left" class="input_txt"><span
													class="err"></span> Education :</td>
												<td valign="top" align="left" class="input_txt"><select
													name="education" class="input_cmbbx1">
														<option selected="selected" value="">--Select--</option>
														<option value="Did not complete High School" id="edu">Did not complete High School</option>
														<option value="High School or GED" id="edu">High School or GED</option>
														<option value="Some College" id="edu">Some
															College</option>
														<option value="Undergraduate Degree" id="edu">Undergraduate Degree</option>
														<option value="Post-graduate Degree" id="edu">Post-graduate Degree</option>
												</select> <br /> <font color="Red" size="+1"><span
														id="spnedu"><form:errors
																path="participant.education"></form:errors> </span></font></td>

											</tr>
											<tr class="row2">
												<td valign="top" align="left" class="input_txt"><span
													class="err"></span> Medical
													Details :</td>
												<td valign="top" align="left" class="input_txt"><textarea
														class="input_txtbx1" id="det"
														onmouseover="showTooltip('tooltip_id','inp_id3');"
														onmouseout="hideTooltip('tooltip_id');"
														style="width: 177px; height: 89px;" name="medical_details" /></textarea>
													</br> <font color="Red" size="+1"><span id="spndet"><form:errors
																path="participant.medical_details"></form:errors> </span></font></td>

											</tr>

										</table>
									</td>
									<td align="left" valign="top">
										
										<table cellpadding="0" cellspacing="0" border="0" width="100%">
											


											
                                              <tr>
												<td><p class="quck-txt">Preferred&nbsp;Timings</p></td>
											</tr>

                                            <tr class="row2">
												<td valign="middle" align="left" class="input_txt"><span
													class="err"></span> Time1 :</td>
												<td valign="top" align="left" class="input_txt">
												<select name="time1" class="input_cmbbx1" id="msg">
											<option value="null" selected="selected">--Select--</option>
											<option value="01" >1&nbsp;</option>
											<option value="02">2&nbsp;</option>
											<option value="03">3&nbsp;</option>
											<option value="04">4&nbsp;</option>
											<option value="05">5&nbsp;</option>
											<option value="06">6&nbsp;</option>
											<option value="07">7&nbsp;</option>
											<option value="08">8&nbsp;</option>
											<option value="09">9&nbsp;</option>
											<option value="10">10&nbsp;</option>
											<option value="11">11&nbsp;</option>
											<option value="12">12&nbsp;</option>
											</select>
									<select name="time1_am_pm" class="input_cmbbx1" style="width:50px;">
											<option value="AM">AM&nbsp;</option>
											<option value="PM">PM&nbsp;</option>
								   </select><br/>
																								
												<font color="Red" size="+1"><span
														id="spnedu"><form:errors
																path="participant.time1"></form:errors> </span></font></td>
											</tr>
                                               <tr class="row1">
												<td valign="middle" align="left" class="input_txt"><span
													class="err"></span> Time2 :</td>
												<td valign="top" align="left" class="input_txt">
												<select name="time2" class="input_cmbbx1" id="msg">														
											<option value="null" selected="selected">--Select--</option>
											<option value="01" >1&nbsp;</option>
											<option value="02">2&nbsp;</option>
											<option value="03">3&nbsp;</option>
											<option value="04">4&nbsp;</option>
											<option value="05">5&nbsp;</option>
											<option value="06">6&nbsp;</option>
											<option value="07">7&nbsp;</option>
											<option value="08">8&nbsp;</option>
											<option value="09">9&nbsp;</option>
											<option value="10">10&nbsp;</option>
											<option value="11">11&nbsp;</option>
											<option value="12">12&nbsp;</option>
											</select>
									<select name="time2_am_pm" class="input_cmbbx1" style="width:50px;">
											<option value="AM">AM&nbsp;</option>
											<option value="PM">PM&nbsp;</option>
								   </select>
														
														
														
														
														<br/>
																							<font color="Red" size="+1"><span
														id="spnedu"><form:errors
																path="participant.time2"></form:errors> </span></font></td>
											</tr>
											<tr class="row2">
												<td valign="middle" align="left" class="input_txt"><span
													class="err"></span> Time3 :</td>
												<td valign="top" align="left" class="input_txt">
												<select name="time3" class="input_cmbbx1" id="msg">
														<option value="null" selected="selected">--Select--</option>
											<option value="01" >1&nbsp;</option>
											<option value="02">2&nbsp;</option>
											<option value="03">3&nbsp;</option>
											<option value="04">4&nbsp;</option>
											<option value="05">5&nbsp;</option>
											<option value="06">6&nbsp;</option>
											<option value="07">7&nbsp;</option>
											<option value="08">8&nbsp;</option>
											<option value="09">9&nbsp;</option>
											<option value="10">10&nbsp;</option>
											<option value="11">11&nbsp;</option>
											<option value="12">12&nbsp;</option>
											</select>
									<select name="time3_am_pm" class="input_cmbbx1" style="width:50px;">
											<option value="AM">AM&nbsp;</option>
											<option value="PM">PM&nbsp;</option>
								   </select><br/>																					
												<font color="Red" size="+1"><span
														id="spnedu"><form:errors
																path="participant.time3"></form:errors> </span></font></td>
											</tr>
											
											<tr>
												<td><p class="quck-txt">Provider & Groups</p></td>
											</tr>
<tr class="row2">
												<td valign="top" align="left" class="input_txt"><span
													class="err">*</span> Provider Name :</td>
												<td valign="top" align="left" class="input_txt">
												<select onchange="doAjaxPost()" name="Provider_name" id="Provider_name"  class="input_cmbbx1"> <option value="null">--Select--</option>
														<c:forEach
															items="${adminuserform.adminuser}"
															var="adminuser" varStatus="status">
															<option value="${adminuser.admin_username}">${adminuser.admin_username}</option>
														</c:forEach>

												</select>
												 </br> <font color="Red" size="+1"><span ><form:errors
																path="participant.Provider_name"></form:errors> </span></font></td>
											</tr>
										<!-- 	<tr>
												<td><p class="quck-txt">Group</p></td>
											</tr>		 -->									
											<tr class="row2" height="150">
												<td valign="top" align="left" class="input_txt"><span
													class="err">*</span> Select
													Group :</td>
												<td valign="top" align="left" class="input_txt">
												<%-- <select
													name="group_name" multiple="multiple">
														<c:forEach
															items="${participantGroupForm.participantGroups}"
															var="participantGroups" varStatus="status">
															<option value="${participantGroups.group_name}">${participantGroups.group_name}</option>
														</c:forEach>

												</select> --%>
							
												<div id="info" style="color: green;"><select id="group_name" multiple="multiple" class="input_cmbbx1"><option></option></select></div>
												
												
												 </br> <font color="Red" size="+1"><span id="spngrp"><form:errors
																path="participant.group_name"></form:errors> </span><span  id="grouperror"></span></font><br>Note: To Select Multiple Groups use ctrl+click
																</td>
											</tr>
											
										</table><br/>
										
											</td>
								</tr>
								<!-- <tr class="row1" width="1000">
									<td valign="top" align="center">&nbsp;</td>
									<td valign="top" align="left"> 
										<span id="spnsub"> </span></td>
									 
								</tr> -->
							</table>
							</c:when>
							<c:otherwise>
						
							<table cellpadding="0" cellspacing="0" border="0" width="100%">
								<tr>
									<td align="left" valign="top" width="50%" style="padding-right: 25px;">
										<p class="quck-txt">Quick Info</p>
										<table cellpadding="0" cellspacing="0" border="0" width="100%">
						
							<table cellpadding="0" cellspacing="0" border="0" width="100%" >
											<tr class="row2">
												<td valign="middle" align="left" class="input_txt"><span
													class="err">*</span> First Name :</td>
													<input type="hidden" class="input_txtbx1" id="inp_id" value="${participants.participants_id }" name="participants_id" />
												<td valign="top" align="left" class="input_txt"><input
													type="text" class="input_txtbx1" id="fname" name="fname" value="${participants.fname }"/><br />
													<font color="Red" size="+1"> <span id="spnfname">
															<form:errors path="participant.fname"></form:errors>
													</span></font></td>

											</tr>											
												<tr class="row1">
												<td valign="middle" align="left" class="input_txt"><span
													class="err">*</span><span
													class="err"></span> User Name :</td>
												<td valign="top" align="left" class="input_txt"><input
													type="text" class="input_txtbx1" id="username"
													onmouseover="showTooltip('tooltip_id','inp_id3');"
													onmouseout="hideTooltip('tooltip_id');" name="username"  value="${participants.username}"/> </br><font color="Red" size="+1"> <c:if test="${user_exists ==true}"><span id="spnlname"></span>User name already exists </c:if> <form:errors
															path="participant.username"></form:errors></font></td>
											</tr>
											<input type="hidden" name="password" value="sa"/>
											<tr class="row2">
												<td valign="middle" align="left" class="input_txt"><span
													class="err">*</span> Mobile No :</td>
												<td valign="top" align="left" class="input_txt"><input
													type="text" class="input_txtbx1" id="mno" min="10" maxlength="10"
													onmouseover="showTooltip('tooltip_id','inp_id3');"
													onmouseout="hideTooltip('tooltip_id');"
													name="mobile_num" value="${participants.mobile_num}" /></br> <font
													color="Red" size="+1"><span id="spnmno"><c:if test="${mobile_exists ==true}">Mobile number already exists</c:if> <c:if test="${merror==true}"> <font color="Red" size="+1"><span id="spnmno"></span>Mobile Number Not Valid</font>	<br/></c:if><form:errors
																path="participant.mobile_num"></form:errors> </span></font></td>
											</tr>
											<tr class="row1">
												<td valign="middle" align="left" class="input_txt"><span
													class="err">*</span> Email-Id :</td>
												<td valign="top" align="left" class="input_txt"><input
													type="text" class="input_txtbx1" id="eid"
													onmouseover="showTooltip('tooltip_id','inp_id3');"
													onmouseout="hideTooltip('tooltip_id');" name="email_id" value="${participants.email_id}" /></br>
													 <font color="Red" size="+1"><span id="spnlname"><c:if test="${email_exists ==true}">Email-id already exists</c:if></span><form:errors
															path="participant.email_id"></form:errors></font></td>
											</tr>
											<tr class="row2">
												<td valign="middle" align="left" class="input_txt"><span class="err"></span> Gender :</td>
												<td valign="top" align="left" class="input_txt"><input type="radio" name="gender" value="0"  class="input_txt" <c:if test="${participants.gender=='0'}"><c:out value="checked=checked"/></c:if>>Male&nbsp;&nbsp;&nbsp;
                  <input type="radio" name="gender" value="1"  class="input_txt" <c:if test="${participants.gender=='1'}"><c:out value="checked=checked"/></c:if>> Female</td></tr>
											<tr class="row1">
												<td valign="middle" align="left" class="input_txt"><span
													class="err"></span> <%--  Age :<c:forEach begin="1" end="100" var="i">
                                 <option value="${i}" <c:if test ="${participantsDetails.age == i}">select</c:if>>${i}</option>
                                                       </c:forEach>   --%>
													Age :</td>
												<td valign="top" align="left" class="input_txt"><select
													name="age" class="input_cmbbx1">
													<option value="null" <c:if test="${participants.age=='null'}"><c:out value="selected"/></c:if>>--Select--</option>
				 <option value="" <c:if test="${participants.age=='Below 12'}"><c:out value="selected"/></c:if>>Below 12</option>
                 <option value="12-20 years" <c:if test="${participants.age=='12-20 years'}"><c:out value="selected"/></c:if>>12-20 &#160 years</option>
                 <option value="20-30 years" <c:if test="${participants.age=='21-30 years'}"><c:out value="selected"/></c:if>>21-30 &#160 years</option>
                 <option value="30-40 years" <c:if test="${participants.age=='31-40 years'}"><c:out value="selected"/></c:if>>31-40 &#160 years</</option>                  
                 <option value="40-50 years" <c:if test="${participants.age=='41-50 years'}"><c:out value="selected"/></c:if>>41-50 &#160 years</option>
                 <option value="50-60 years"  <c:if test="${participants.age=='51-60 years'}"><c:out value="selected"/></c:if>>51-60 &#160 years</option>
                 <option value="60-70 years" <c:if test="${participants.age=='61-70 years'}"><c:out value="selected"/></c:if>>61-70 &#160 years</option>
                 <option value="70-80 years" <c:if test="${participants.age=='71-80 years'}"><c:out value="selected"/></c:if>>71-80 &#160 years</option>
                 <option value="80-90 years" <c:if test="${participants.age=='81-90 years'}"><c:out value="selected"/></c:if>>81-90 &#160 years</option>
                   <option value="90-100 years" <c:if test="${participants.age=='91-100 years'}"><c:out value="selected"/></c:if>>91-100 years</option>
                 
														
														<span id="spnage"><form:errors
																path="participant.age"></form:errors> </span>
														</font></td>
											</tr>

											<tr class="row2">
												<td valign="middle" align="left" class="input_txt"><span
													class="err"></span> Zipcode :</td>
												<td valign="top" align="left" class="input_txt"><input
													type="text" class="input_txtbx1" id="city"
													onmouseover="showTooltip('tooltip_id','inp_id3');"
													onmouseout="hideTooltip('tooltip_id');" name="city" value="${participants.city}" /></br> <font
													color="Red" size="+1"><span id="spncity">
												
													<form:errors path="participant.city"></form:errors> </span></font></td>
											</tr>
											<tr class="row1">
												<td valign="middle" align="left" class="input_txt"><span
													class="err"></span> Education :</td>
												<td valign="top" align="left" class="input_txt"><select
													name="education" class="input_cmbbx1">
			<option <c:if test="${participants.education==''}"><c:out value="selected"/></c:if>>--Select--</option>
			<option value="Did not complete High School" <c:if test="${participants.education=='Did not complete High School'}"><c:out value="selected"/></c:if>>Did not complete High School</option>
			<option value="High School or GED" <c:if test="${participants.education=='High School or GED'}"><c:out value="selected"/></c:if>>High School or GED</option>
			<option value="Some College" <c:if test="${participants.education=='Some College'}"><c:out value="selected"/></c:if> >Some College</option>
			<option value="Undergraduate Degree" <c:if test="${participants.education=='Undergraduate Degree'}"><c:out value="selected"/></c:if>>Undergraduate Degree</option>
			<option value="Post-graduate Degree" <c:if test="${participants.education=='Post-graduate Degree'}"><c:out value="selected"/></c:if>>Post-graduate Degree</option>
												</select> <br /> <font color="Red" size="+1"><span
														id="spnedu"><form:errors
																path="participant.education"></form:errors> </span></font></td>

											</tr>
											<tr class="row2">
												<td valign="top" align="left" class="input_txt"><span
													class="err"></span> Medical
													Details :</td>
												<td valign="top" align="left" class="input_txt"><textarea
														class="input_txtbx1" id="det"
														onmouseover="showTooltip('tooltip_id','inp_id3');"
														onmouseout="hideTooltip('tooltip_id');"
														style="width: 177px; height: 89px;" name="medical_details" />${participants.medical_details }</textarea>
													</br> <font color="Red" size="+1"><span id="spndet"><form:errors
																path="participant.medical_details"></form:errors> </span></font></td>

											</tr>

										</table>
									</td>
									<td align="left" valign="top">
										
										<table cellpadding="0" cellspacing="0" border="0" width="100%">
											


											
                                              <tr>
												<td><p class="quck-txt">Preferred&nbsp;Timings</p></td>
											</tr>

                                       <tr class="row2">
												<td valign="middle" align="left" class="input_txt"><span
													class="err"></span> Time1 :</td>
												<td valign="top" align="left" class="input_txt">
												<select name="time1" class="input_cmbbx1" id="msg">
												<option value="null"  <c:if test="${participants.time1=='null'}"><c:out value="selected"/></c:if>>--Select--</option> 
					  <option value="01" <c:if test="${participants.time1=='01'}"><c:out value="selected"/></c:if>>1</option>
                   <option value="02"  <c:if test="${participants.time1=='02'}"><c:out value="selected"/></c:if>>2</option>
				   <option value="03" <c:if test="${participants.time1=='03'}"><c:out value="selected"/></c:if>>3</option>
				   <option value="04" <c:if test="${participants.time1=='04'}"><c:out value="selected"/></c:if>>4</option>
				   <option value="05" <c:if test="${participants.time1=='05'}"><c:out value="selected"/></c:if>>5</option>
				   <option value="06" <c:if test="${participants.time1=='06'}"><c:out value="selected"/></c:if>>6</option>
				   <option value="07" <c:if test="${participants.time1=='07'}"><c:out value="selected"/></c:if>>7</option>
				   <option value="08"  <c:if test="${participants.time1=='08'}"><c:out value="selected"/></c:if>>8</option>
					<option value="09" <c:if test="${participants.time1=='09'}"><c:out value="selected"/></c:if>>9</option>
				 <option value="10" <c:if test="${participants.time1=='10'}"><c:out value="selected"/></c:if>>10</option>
					<option value="11"  <c:if test="${participants.time1=='11'}"><c:out value="selected"/></c:if>>11</option>
					<option value="12" <c:if test="${participants.time1=='12'}"><c:out value="selected"/></c:if>>12</option>					
															
												</select>
												
												<select name="time1_am_pm" class="input_cmbbx1" style="width:50px;">
											<option value="AM" <c:if test="${participants.time1_am_pm=='AM'}"><c:out value="selected"/></c:if>>AM&nbsp;</option>
											<option value="PM" <c:if test="${participants.time1_am_pm=='PM'}"><c:out value="selected"/></c:if>>PM&nbsp;</option>
								   </select>				
												
												
												
												
												
												
											
												</td>
											</tr>
                                               <tr class="row1">
												<td valign="middle" align="left" class="input_txt"><span
													class="err"></span> Time2 :</td>
												<td valign="top" align="left" class="input_txt" >
												<select name="time2" class="input_cmbbx1" id="msg"">
												<option value="null"  <c:if test="${participants.time2=='null'}"><c:out value="selected"/></c:if>>--Select--</option> 
                    <option value="01" <c:if test="${participants.time2=='01'}"><c:out value="selected"/></c:if>>1</option>
                   <option value="02"  <c:if test="${participants.time2=='02'}"><c:out value="selected"/></c:if>>2</option>
				   <option value="03" <c:if test="${participants.time2=='03'}"><c:out value="selected"/></c:if>>3</option>
				   <option value="04" <c:if test="${participants.time2=='04'}"><c:out value="selected"/></c:if>>4</option>
				   <option value="05" <c:if test="${participants.time2=='05'}"><c:out value="selected"/></c:if>>5</option>
				   <option value="06" <c:if test="${participants.time2=='06'}"><c:out value="selected"/></c:if>>6</option>
				   <option value="07" <c:if test="${participants.time2=='07'}"><c:out value="selected"/></c:if>>7</option>
				   <option value="08"  <c:if test="${participants.time2=='08'}"><c:out value="selected"/></c:if>>8</option>
					<option value="09" <c:if test="${participants.time2=='09'}"><c:out value="selected"/></c:if>>9</option>
				 <option value="10" <c:if test="${participants.time2=='10'}"><c:out value="selected"/></c:if>>10</option>
					<option value="11"  <c:if test="${participants.time2=='11'}"><c:out value="selected"/></c:if>>11</option>
					<option value="12" <c:if test="${participants.time2=='12'}"><c:out value="selected"/></c:if>>12</option>					
															
												</select>
												
												<select name="time2_am_pm" class="input_cmbbx1" style="width:50px;">
											<option value="AM" <c:if test="${participants.time2_am_pm=='AM'}"><c:out value="selected"/></c:if>>AM&nbsp;</option>
											<option value="PM" <c:if test="${participants.time2_am_pm=='PM'}"><c:out value="selected"/></c:if>>PM&nbsp;</option>
								   </select>
					<br/>
												</td>
											</tr>
											<tr class="row2">
												<td valign="middle" align="left" class="input_txt"><span
													class="err"></span> Time3 :</td>
												<td valign="top" align="left" class="input_txt">
												<select name="time3" class="input_cmbbx1" id="msg">
												<option value="null"  <c:if test="${participants.time3=='null'}"><c:out value="selected"/></c:if>>--Select--</option> 
														 <option value="01" <c:if test="${participants.time3=='01'}"><c:out value="selected"/></c:if>>1</option>
                   <option value="02"  <c:if test="${participants.time3=='02'}"><c:out value="selected"/></c:if>>2</option>
				   <option value="03" <c:if test="${participants.time3=='03'}"><c:out value="selected"/></c:if>>3</option>
				   <option value="04" <c:if test="${participants.time3=='04'}"><c:out value="selected"/></c:if>>4</option>
				   <option value="05" <c:if test="${participants.time3=='05'}"><c:out value="selected"/></c:if>>5</option>
				   <option value="06" <c:if test="${participants.time3=='06'}"><c:out value="selected"/></c:if>>6</option>
				   <option value="07" <c:if test="${participants.time3=='07'}"><c:out value="selected"/></c:if>>7</option>
				   <option value="08"  <c:if test="${participants.time3=='08'}"><c:out value="selected"/></c:if>>8</option>
					<option value="09" <c:if test="${participants.time3=='09'}"><c:out value="selected"/></c:if>>9</option>
				 <option value="10" <c:if test="${participants.time3=='10'}"><c:out value="selected"/></c:if>>10</option>
					<option value="11"  <c:if test="${participants.time3=='11'}"><c:out value="selected"/></c:if>>11</option>
					<option value="12" <c:if test="${participants.time3=='12'}"><c:out value="selected"/></c:if>>12</option>					
															
												</select>
												
												<select name="time3_am_pm" class="input_cmbbx1" style="width:50px;">
											<option value="AM" <c:if test="${participants.time3_am_pm=='AM'}"><c:out value="selected"/></c:if>>AM&nbsp;</option>
											<option value="PM" <c:if test="${participants.time3_am_pm=='PM'}"><c:out value="selected"/></c:if>>PM&nbsp;</option>
								   </select>
					<br/>
												</td>
											</tr>
											
											<tr>
												<td><p class="quck-txt">Provider & Groups</p></td>
											</tr>
<tr class="row2">
												<td valign="top" align="left" class="input_txt"><span
													class="err">*</span> Provider Name :</td>
												<td valign="top" align="left" class="input_txt">
												<select onchange="doAjaxPost()" id="Provider_name"	name="Provider_name" class="input_cmbbx1">
													<option value="null">--Select--</option>
														<c:forEach items="${adminuserform.adminuser}"
															var="adminuser" varStatus="status">
															
															<option value="${adminuser.admin_username}" <c:if test="${provider==adminuser.admin_username}"><c:out value="selected"/></c:if>>${adminuser.admin_username}</option>
														</c:forEach>

												</select>
												</br> <font color="Red" size="+1"><span id="">
												<c:if test="${provider=='null'}">												
												<form:errors path="participant.group_name"></form:errors>			
												</c:if> </span></font>
												 </td>
											</tr>
											<!-- <tr>
												<td><p class="quck-txt">Group</p></td>
											</tr>		 -->									
											<tr class="row2">
												<td valign="top" align="left" class="input_txt"><span
													class="err">*</span> Select
													Group :</td>
												<td valign="top" align="left" class="input_txt">
												<%-- <select
													name="group_name" multiple>
														<c:forEach
															items="${participantGroupForm.participantGroups}"
															var="participantGroups" varStatus="status">
															<option value="${participantGroups.group_name}">${participantGroups.group_name}</option>
														</c:forEach>

												</select> --%>
												
												<div id="info" style="color: green;"><select class="input_cmbbx1" multiple="multiple" name="group_name" id="group_name">
												<c:out value="${groups}"></c:out>
												<c:forEach items="${groups}"
															var="group" varStatus="status">
															<option value="${group}" <c:if test="${fn:contains(group_select,group)}"><c:out value="selected"/></c:if>>${group}</option>
														</c:forEach>
												
												
												</select></div>
												
												 </br> <font color="Red" size="+1"><span id="spngrp"><form:errors
																path="participant.group_name"></form:errors> </span></font><br>Note:	To Select Multiple Groups use ctrl+click</td>
											</tr>
										</table>
										<div></div>	
									</td>
								</tr>			
					
							
									
							
					
							
							</c:otherwise>
						</c:choose>
						
						
						
							<table align="right"><tr><td valign="middle"  style="padding-left:500px;"><input type="submit" class="submit_btn" value="Register" onclick="return validate('this')"></td>
							<td valign="middle" style="padding-left:10px;"><a href="showRegisterParticipant" class="submit_btn" style="color:white">Reset</a></td>
							<td valign="middle" style="padding-left:10px;" ><a href="login" class="submit_btn" style="color:white" text-decoration: none;>Cancel</a></td></tr></table>
					</table>
			

<jsp:include page="footer.jsp"></jsp:include>