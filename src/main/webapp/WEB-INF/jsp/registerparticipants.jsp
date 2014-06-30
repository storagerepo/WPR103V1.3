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
 <script type="text/javascript" src="resources/js/jquery-2.0.3.js"></script>
    <script type="text/javascript" src="resources/js/phone-number-validation.js"></script>
<script type="text/javascript" src="js/jquery-1.3.2.js"></script>
<link rel="stylesheet" href="resources/css/jquery-ui.css" />
<script src="resources/js/jquery-1.9.1.js" type="text/javascript"></script>
<script src="resources/js/jquery-ui.js" type="text/javascript"></script>

<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet"
	type="text/css" />
<link href="<c:url value="/resources/css/inner-clr.css" />"
	rel="stylesheet" type="text/css" />
<script type="text/javascript">
$(function() {
	$("#datepicker_weekly_survey").datepicker({minDate: 0});
});
</script>
<script>


$(document).ready(function () {
	 	
     $("#id").bind('keypress', function (event) {
     	
     	
         var regex = new RegExp("^[A-Z0-9]+$");
       
         var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
       
      
        if (!regex.test(key)) {
         	
             event.preventDefault();
             return false;
         }
     });
 			
 });
function validateEmail(sEmail) {
    var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
    if (filter.test(sEmail)) {
        return true;
    }
    else {
        return false;
    }
    

}

function validateEmail(hmail) {
    var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
    if (filter.test(hmail)) {
        return true;
    }
    else {
        return false;
    }
    

}
function validateEmail(pemail) {
    var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
    if (filter.test(pemail)) {
        return true;
    }
    else {
        return false;
    }
    

}
$(document).ready(function() {
   $('#register').click(function() {

		document.getElementById("spneid").innerHTML="";
   		document.getElementById("pemailerr").innerHTML="";
   		document.getElementById("ppemailerr").innerHTML="";
	    var sEmail = document.getElementById('eid').value;		   
        var hmail=document.getElementById('id_provider_secondary_email').value;
       var pemail=document.getElementById('id_provider_primary_email').value; 
      
        if ($.trim(sEmail).length == 0) {
        	document.getElementById("spneid").innerHTML="Required Field Should not be empty";
        }
       
        if(sEmail!='')
        	{
        if (validateEmail(sEmail)) {	        
        	                
        }

        else{
        	document.getElementById("spneid").innerHTML="Invalid EmailId";	          
            return false;
            e.preventDefault();
        }
        	}
     
        if(hmail!='')
        	{
        
        	if (validateEmail(hmail)) {	        
                
	        }
        	else
        		{
        	
        	document.getElementById("pemailerr").innerHTML="Invalid EmailId";	        	
            return false;
         
        		}
        	}
        if(pemail!='')
    	{
    
    	if (validateEmail(pemail)) {	        
            
        }
    	else
    		{
    	
    	document.getElementById("ppemailerr").innerHTML="Invalid EmailId";	        	
        return false;
     
    		}
    	}


    });

});

	 
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
     	
     	
         var regex = new RegExp("^[a-zA-Z ]+$");
       
         var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
      //  alert("subs"+key.substring(0,1));
        if (event.which === 32 && !this.value.length)
     	   {
            event.preventDefault();
     	   }
      
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
 $(function() {
	    $("#password").keydown(function(e) {
	        if (e.keyCode == 32) // 32 is the ASCII value for a space
	            e.preventDefault();
	    });
	});
    </script>


<script>
function phonenumber(inputtxt)  
{
	
  var phoneno = /^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/;  
  var mobile=document.getElementById("mno").value;
 
  if(mobile.match(/^(\+\d{1,3}[- ]?)?\d{10}$/) && ! (mobile.match(/0{5,}/)))  
     {  
       return true;    
     }  
   else  
     {  
       alert("Not a valid Phone Number");  
       return false;  
     }  
}  
function checkdate()
{
	document.getElementById("surveyerr").innerHTML="";	
	var datefield=document.getElementById("datepicker_weekly_survey").value;
	//alert(datefield.substring(6,datefield.length)+""+datefield.substring(0,2)+""+datefield.substring(3,5));
	var year1=datefield.substring(6,datefield.length);
	var month1=datefield.substring(0,2);
	var day1=datefield.substring(3,5);
	var currentDate = new Date()
    var day = currentDate.getDate()
   // alert("day1"+day1+"day"+day);
	var month = currentDate.getMonth() + 1
    var year = currentDate.getFullYear()	 
	if(datefield!='')
		{
    if(year1==year)
		{		
		if(month1<month)
			{			
			document.getElementById("surveyerr").innerHTML="Invalid Date";			
			}
		else 
		{
		//alert("sdsdf");
	if(month1<month)
			{	
		if(day1<day)
			{
			document.getElementById("surveyerr").innerHTML="Invalid Date";
			
			}
		
		
			}
	if(day1<day)
	{
		document.getElementById("surveyerr").innerHTML="Invalid Date";
	
	}

		}
		
		}
	
	
	
	 if(year1<year)
		{
		 document.getElementById("surveyerr").innerHTML="Invalid Date";
		}
		}
	 // alert(day + "/" + month + "/" + year)
var re = /^(0[1-9]|1[0-2])\/(0[1-9]|1\d|2\d|3[01])\/(19|20)\d{2}$/ ;


if (document.getElementById("datepicker_weekly_survey").value !="") {
  if (re.test(document.getElementById("datepicker_weekly_survey").value) == false) {
	// alert("fsdfsd");
	  document.getElementById("surveyerr").innerHTML="Invalid Date Format.";
	  return false;
  }
}
}


function validate(){
	 var numbers = $('#mno').val();
		if(numbers!='')
		{
		var result1 = validPhone(numbers);
		if (result1.valid === false) {
			
			document.getElementById("spnmno").innerHTML="invalid phone number";				
		return false;
		}
		} 

	var datefield=document.getElementById("datepicker_weekly_survey").value;
	//alert(datefield.substring(6,datefield.length)+""+datefield.substring(0,2)+""+datefield.substring(3,5));
	var year1=datefield.substring(6,datefield.length);
	var month1=datefield.substring(0,2);
	var day1=datefield.substring(3,5);
	var currentDate = new Date()
    var day = currentDate.getDate()
   // alert("day1"+day1+"day"+day);
	var month = currentDate.getMonth() + 1
    var year = currentDate.getFullYear()	 
	if(datefield!='')
		{
    if(year1==year)
		{			
		if(month1<month)
			{			
			document.getElementById("surveyerr").innerHTML="Invalid Date Format";
			return false;
			}
		else 
		{		
	if(month1<month)
			{	
		if(day1<day)
			{
			document.getElementById("surveyerr").innerHTML="Invalid Date Format";
			return false;
			}}
	if(day1<day)
	{
		document.getElementById("surveyerr").innerHTML="Invalid Date Format";
		return false;
	}}}
 if(year1<year)
		{
		 document.getElementById("surveyerr").innerHTML="Invalid Date Format";
		return false;
		}
		}	

var re = /^(0[1-9]|1[0-2])\/(0[1-9]|1\d|2\d|3[01])\/(19|20)\d{2}$/ ;


if (document.getElementById("datepicker_weekly_survey").value !="") {
  if (re.test(document.getElementById("datepicker_weekly_survey").value) == false) {
	// alert("fsdfsd");
	  document.getElementById("surveyerr").innerHTML="Invalid Date Format";
	  return false;
  }
}
//document.getElementById("pro").innerHTML='';
document.getElementById("spngrp").innerHTML='';
var $zipcode=document.getElementById("city").value;
var zipcodesub=$zipcode;
//	alert("sub"+zipcodesub.substring(0,3));
if(zipcodesub.substring(0,3)=='000')
	{
	$("#spncity").html('Not a valid Zipcode!!');
	return false;
	}

//alert("sdasd"+$zipcode);	

var $regex=/(^\d{5}$)|(^\d{5}-\d{4}$)/;


if($regex.test($zipcode)||$zipcode=='') 
{

	var $in = $zipcode;		 
}

else if($zipcode!='')
	{
	//	alert($zipcode);	
	$("#spncity").html('Not a valid Zipcode!!');
	return false;
	}

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
		return false;
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
		return false;
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
<!-- 
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.10.2.min.js"> -->
</head>
<body>


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
										<tr class="row1">
												<td valign="middle" align="left" class="input_txt"><span
													class="err"></span>ID:</td>
												<td valign="top" align="left" class="input_txt" style="height: 30px"><input
													type="text" class="input_txtbx1" id="id" name="id" onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"/><br />
													<font color="Red" size="+1"> <span id="spnfname">
														
													</span></font></td>

											</tr>
										
										
											<tr class="row2">
												<td valign="middle" align="left" class="input_txt"><span class="err">*</span>Name :</td>
												<td valign="top" align="left" class="input_txt" style="height: 35px"><input type="text"  onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}"  class="input_txtbx1" id="fname" min="4" maxlength="32" onmouseover="showTooltip('tooltip_id','inp_id3');"
													onmouseout="hideTooltip('tooltip_id');" name="fname" /><br />
													<font color="Red" size="+1"> <span id="spnfname">
															<form:errors path="participant.fname"></form:errors>
													</span></font></td>

											</tr>

											
											<tr class="row1">
												<td valign="middle" align="left" class="input_txt"><span
													class="err">*</span><span
													class="err"></span> UserName :</td>
												<td valign="top" align="left" class="input_txt" height="35px">
												
												<input type="hidden" id="password" name="password" value="saaaaaa"/>
												<input height="35px"
													type="text" class="input_txtbx1" id="username"
													onmouseover="showTooltip('tooltip_id','inp_id3');"
													onmouseout="hideTooltip('tooltip_id');"  onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}" min="4" maxlength="32"  name="username" /> </br>
													 <c:if test="${user_exists ==true}"> <font color="Red" size="+1"><span id="spnlname"></span>User name already exists  <form:errors
															path="participant.username"></form:errors></c:if> </font></td>
											</tr>
											
											
											<tr class="row2">
												<td valign="middle" align="left" class="input_txt" height="35px"><span
													class="err">*</span> Mobile No :</td>
												<td valign="top" align="left" class="input_txt">+1<input min="10" maxlength="10"
													type="text" class="input_txtbx1" id="mno"
													onmouseover="showTooltip('tooltip_id','inp_id3');"
													onmouseout="hideTooltip('tooltip_id');"
													value="${mobile_num}" name="mobile_num" style="width:155px" placeholder="0000000000" /></br> 
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
												<td valign="middle" align="left" class="input_txt" height="35px"><span
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
												<td valign="middle" align="left" class="input_txt" height="35px"><span
													class="err"></span> Gender :</td>
												<td valign="top" align="left" class="input_txt"><input
													type="radio" name="gender" value="0" class="input_txt"
													checked="true">Male&nbsp;&nbsp;&nbsp;<input
													type="radio" name="gender" value="1" class="input_txt">Female&nbsp;&nbsp;&nbsp;</td>
											</tr>
											<tr class="row1">
												<td valign="middle" align="left" class="input_txt" height="35px"><span
													class="err"></span> <%--  Age :<c:forEach begin="1" end="100" var="i">
                                 <option value="${i}" <c:if test ="${participantsDetails.age == i}">select</c:if>>${i}</option>
                                                       </c:forEach>   --%>
													Age :</td>
												<td valign="top" align="left" class="input_txt">
												<select name="age" class="input_cmbbx1">
														<option selected="selected" value="null">--Select--</option>
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
															years</option></select>
														
														<span id="spnage"><form:errors
																path="participant.age"></form:errors> </span>
														</font></td>
											</tr>

											<tr class="row2">
												<td valign="middle" align="left" class="input_txt" height="35px"><span
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
												<td valign="middle" align="left" class="input_txt" height="35px"><span
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
												<td valign="top" align="left" class="input_txt" height="125px"><span
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

                                            <tr class="row1">
												<td valign="middle" align="left" class="input_txt"><span
													class="err"></span> Time1 :</td>
												<td valign="top" align="left" class="input_txt">
												<select name="time1" class="input_cmbbx1" id="msg" style="height: 25px">
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
									<select name="time1_am_pm" class="input_cmbbx1" style="width:80px;">
											<option value="AM">AM&nbsp;</option>
											<option value="PM">PM&nbsp;</option>
								   </select><br/>
																								
												<font color="Red" size="+1"><span
														id="spnedu"><form:errors
																path="participant.time1"></form:errors> </span></font></td>
											</tr>
                                               <tr class="row2">
												<td valign="middle" align="left" class="input_txt"><span
													class="err"></span> Time2 :</td>
												<td valign="top" align="left" class="input_txt" style="height: 25px">
												<select name="time2" class="input_cmbbx1" id="msg" style="height: 25px">														
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
									<select name="time2_am_pm" class="input_cmbbx1" style="width:80px;">
											<option value="AM">AM&nbsp;</option>
											<option value="PM">PM&nbsp;</option>
								   </select>
														
														
														
														
														<br/>
																							<font color="Red" size="+1"><span
														id="spnedu"><form:errors
																path="participant.time2"></form:errors> </span></font></td>
											</tr>
											<tr class="row1">
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
									<select name="time3_am_pm" class="input_cmbbx1" style="width:80px;">
											<option value="AM">AM&nbsp;</option>
											<option value="PM">PM&nbsp;</option>
								   </select><br/>																					
												<font color="Red" size="+1"><span
														id="spnedu"><form:errors
																path="participant.time3"></form:errors> </span></font></td>
											</tr>
											
											<tr class="row2">
												<td valign="middle" align="left" class="input_txt" height="35px"><span
													class="err"></span>Weekly Survey Start Date :</td>
												<td valign="top" align="left" class="input_txt">									
										
										<input type="text" name="weekly_survey_start_date" id="datepicker_weekly_survey"		
										 class="input_txtbx1" value="" onblur="checkdate()"> <br/> <font
													color="Red" size="+1"><span id="surveyerr"></span>
													
													 </font>
													 
													 </td>
											</tr>
											
											<tr class="row1">
												<td valign="middle" align="left" class="input_txt" height="35px"><span
													class="err">*</span>Provider Primary Email :</td>
												<td valign="top" align="left" class="input_txt">									
										
												<input type="text" name="provider_email1"
										id="id_provider_primary_email" class="input_txtbx1" value=""> <br/> <font
													color="Red" size="+1"><span id="ppemailerr"></span>
													
													 </font></td>
											</tr>
											<tr class="row2">
												<td valign="middle" align="left" class="input_txt" height="35px"><span
													class="err"></span>Provider Secondary Email :</td>
												<td valign="top" align="left" class="input_txt">									
										
												<input type="text" name="provider_email2"
										id="id_provider_secondary_email" class="input_txtbx1" value=""> <br/> <font
													color="Red" size="+1"><span id="pemailerr"></span>
													
													 </font></td>
											</tr>
											
											
											<tr>
												<td><p class="quck-txt">Provider & Groups</p></td>
											</tr>
<tr class="row1">
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
											<tr height="7px" class="row1" style="border: none;"></tr>									
											<tr class="row2" height="100">
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
										<tr class="row1">
												<td valign="middle" align="left" class="input_txt"><span
													class="err"></span>ID:</td>
												<td valign="top" align="left" class="input_txt"><input
													type="text" class="input_txtbx1" onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}" id="id" name="id" value="${participants.id}"/><br />
													<font color="Red" size="+1"> <span id="spnfname">
														
													</span></font></td>

											</tr>
										
											<tr class="row2">
												<td valign="middle" align="left" class="input_txt" height="50px"><span
													class="err">*</span>Name :</td>
													<input type="hidden" class="input_txtbx1" id="inp_id" value="${participants.participants_id }" name="participants_id" />
												<td valign="top" align="left" class="input_txt">
												<input
													type="text"  class="input_txtbx1" onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}" min="4" maxlength="32"  id="fname" name="fname" value="${participants.fname }"/><br />
													<font color="Red" size="+1"> <span id="spnfname">
															<form:errors path="participant.fname"></form:errors>
													</span></font></td>

											</tr>											
												<tr class="row1">
												<td valign="middle" align="left" class="input_txt"><span
													class="err">*</span><span
													class="err"></span> UserName :</td>
												<td valign="top" align="left" class="input_txt"><input
													type="text" class="input_txtbx1" id="username"
													onmouseover="showTooltip('tooltip_id','inp_id3');"
													onmouseout="hideTooltip('tooltip_id');"  onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}" min="4" maxlength="32" name="username"  value="${participants.username}"/> </br><font color="Red" size="+1"> <c:if test="${user_exists ==true}"><span id="spnlname"></span>User name already exists </c:if> <form:errors
															path="participant.username"></form:errors></font></td>
											</tr>
											<input type="hidden" id="password" name="password" value="saaaaaaa"/>
											<tr class="row2">
												<td valign="middle" align="left" class="input_txt"><span
													class="err">*</span> Mobile No :</td>
												<td valign="top" align="left" class="input_txt">+1<input
													type="text" class="input_txtbx1" id="mno" min="10" maxlength="10" style="width:155px" placeholder="0000000000"
													onmouseover="showTooltip('tooltip_id','inp_id3');"
													onmouseout="hideTooltip('tooltip_id');"
													name="mobile_num" value="${participants.mobile_num}"  onkeydown="if(event.ctrlKey && event.keyCode==86){return false;}" /></br> <font
													color="Red" size="+1"><span id="spnmno"><c:if test="${invalid=='error'}"><c:out value="Invalid Mobile Number"/></c:if><c:if test="${mobile_exists ==true}">Mobile number already exists</c:if> <c:if test="${merror==true}"> <font color="Red" size="+1"><span id="spnmno"></span>Mobile Number Not Valid</font>	<br/></c:if><form:errors
																path="participant.mobile_num"></form:errors> </span></font></td>
											</tr>
											<tr class="row1">
												<td valign="middle" align="left" class="input_txt"><span
													class="err">*</span> Email-Id :</td>
												<td valign="top" align="left" class="input_txt"><input
													type="text" class="input_txtbx1" id="eid"
													onmouseover="showTooltip('tooltip_id','inp_id3');"
													onmouseout="hideTooltip('tooltip_id');" name="email_id" value="${participants.email_id}" /></br>
													 <font color="Red" size="+1"><span id="spneid">
													 <c:if test="${email_exists ==true}">
				  <c:choose>
                  <c:when test="${empty participants.email_id}">
                  
                  </c:when>
                  <c:otherwise><font color="Red" size="+1"><span id="spnlname"></span>Email already exists </font></c:otherwise>
                  </c:choose>											 
			    </c:if><form:errors
															path="participant.email_id"></form:errors></span></font></td>
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
				 <option value="Below 12" <c:if test="${participants.age=='Below 12'}"><c:out value="selected"/></c:if>>Below 12</option>
                 <option value="12-20 years" <c:if test="${participants.age=='12-20 years'}"><c:out value="selected"/></c:if>>12-20 &#160 years</option>
                 <option value="21-30 years" <c:if test="${participants.age=='21-30 years'}"><c:out value="selected"/></c:if>>21-30 &#160 years</option>
                 <option value="31-40 years" <c:if test="${participants.age=='31-40 years'}"><c:out value="selected"/></c:if>>31-40 &#160 years</</option>                  
                 <option value="41-50 years" <c:if test="${participants.age=='41-50 years'}"><c:out value="selected"/></c:if>>41-50 &#160 years</option>
                 <option value="51-60 years"  <c:if test="${participants.age=='51-60 years'}"><c:out value="selected"/></c:if>>51-60 &#160 years</option>
                 <option value="61-70 years" <c:if test="${participants.age=='61-70 years'}"><c:out value="selected"/></c:if>>61-70 &#160 years</option>
                 <option value="71-80 years" <c:if test="${participants.age=='71-80 years'}"><c:out value="selected"/></c:if>>71-80 &#160 years</option>
                 <option value="81-90 years" <c:if test="${participants.age=='81-90 years'}"><c:out value="selected"/></c:if>>81-90 &#160 years</option>
                   <option value="91-100 years" <c:if test="${participants.age=='91-100 years'}"><c:out value="selected"/></c:if>>91-100 years</option>
                 
														
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
			<option value="" <c:if test="${participants.education==''}"><c:out value="selected"/></c:if>>--Select--</option>
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

                                       <tr class="row1">
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
												
												<select name="time1_am_pm" class="input_cmbbx1" style="width:80px;">
											<option value="AM" <c:if test="${participants.time1_am_pm=='AM'}"><c:out value="selected"/></c:if>>AM&nbsp;</option>
											<option value="PM" <c:if test="${participants.time1_am_pm=='PM'}"><c:out value="selected"/></c:if>>PM&nbsp;</option>
								   </select>				
												
												
												
												
												
												
											
												</td>
											</tr>
                                               <tr class="row2">
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
												
												<select name="time2_am_pm" class="input_cmbbx1" style="width:80px;">
											<option value="AM" <c:if test="${participants.time2_am_pm=='AM'}"><c:out value="selected"/></c:if>>AM&nbsp;</option>
											<option value="PM" <c:if test="${participants.time2_am_pm=='PM'}"><c:out value="selected"/></c:if>>PM&nbsp;</option>
								   </select>
					<br/>
												</td>
											</tr>
											<tr class="row1">
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
												
												<select name="time3_am_pm" class="input_cmbbx1" style="width:80px;">
											<option value="AM" <c:if test="${participants.time3_am_pm=='AM'}"><c:out value="selected"/></c:if>>AM&nbsp;</option>
											<option value="PM" <c:if test="${participants.time3_am_pm=='PM'}"><c:out value="selected"/></c:if>>PM&nbsp;</option>
								   </select>
					<br/>
												</td>
											</tr>
											<tr class="row2">
												<td valign="middle" align="left" class="input_txt"><span
													class="err"></span>Weekly Survey Start Date :</td>
												<td valign="top" align="left" class="input_txt">									
										
										<input type="text" name="weekly_survey_start_date" id="datepicker_weekly_survey"		
										 class="input_txtbx1" value="${participants.weekly_survey_start_date}" onblur="checkdate()"> <br/> <font
													color="Red" size="+1"><span id="surveyerr"></span>
													
													 </font>
													 
													 </td>
											</tr>
											
											<tr class="row1">
												<td valign="middle" align="left" class="input_txt"><span
													class="err">*</span>Provider Primary Email :</td>
												<td valign="top" align="left" class="input_txt">									
										
												<input type="text" name="provider_email1" id="id_provider_primary_email" class="input_txtbx1" value="${participants.provider_email1}"> <br/> <font
													color="Red" size="+1"><span id="ppemailerr">
													<form:errors path="participant.provider_email1"></form:errors>
													 </font></span></td>
											</tr>
											<tr class="row2">
												<td valign="middle" align="left" class="input_txt"><span
													class="err"></span>Provider Secondary Email :</td>
												<td valign="top" align="left" class="input_txt">									
										
												<input type="text" name="provider_email2"
										id="id_provider_secondary_email" class="input_txtbx1" value="${participants.provider_email2}"> <br/> <font
													color="Red" size="+1"><span id="pemailerr"></span>
													
													 </font></td>
											</tr>
											
											<tr>
												<td><p class="quck-txt">Provider & Groups</p></td>
											</tr>
<tr class="row1">
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
												</br> <font color="Red" size="+1">
												<script>
												document.getElementId("pro").innerHTML="";
												</script>
												<c:if test="${provider=='null'}">												
											<span id="pro">	<form:errors path="participant.group_name"></form:errors>			
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
						
						
						
							<table align="right"><tr><td valign="middle"  style="padding-left:500px;"><input type="submit" class="submit_btn" value="Register" id="register" onclick="return validate('this')"></td>
							<td valign="middle" style="padding-left:10px;"><a href="showRegisterParticipant" class="submit_btn" style="color:white">Reset</a></td>
							<td valign="middle" style="padding-left:10px;" ><a href="login" class="submit_btn" style="color:white" text-decoration: none;>Cancel</a></td></tr></table>
					</table>
					
					
			

<jsp:include page="footer.jsp"></jsp:include>