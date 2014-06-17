<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="header.jsp"></jsp:include>
<script type="text/javascript" src="js/jquery-1.3.2.js"></script>
<script type="text/javascript" src="resources/js/jquery-2.0.3.js"></script>
<script type="text/javascript" src="resources/js/phone-number-validation.js"></script>
<link rel="stylesheet" href="resources/css/jquery-ui.css" />
<script src="resources/js/jquery-1.9.1.js" type="text/javascript"></script>
<script src="resources/js/jquery-ui.js" type="text/javascript"></script>
<link rel="stylesheet" url="resources/js/jquery.js" />

<!-- <script type="text/javascript" src="js/jquery-1.3.2.js"></script>

<link rel="stylesheet" href="resources/css/jquery-ui.css" />
<script src="resources/js/jquery-1.9.1.js" type="text/javascript"></script>
<script src="resources/js/jquery-ui.js" type="text/javascript"></script>
<link rel="stylesheet" url="resources/js/jquery.js" />

<script type="text/javascript" src="js/jquery-1.3.2.js"></script>
<script src="resources/js/jquery-1.9.1.js" type="text/javascript"></script>
<script src="resources/js/jquery-ui.js" type="text/javascript"></script>
<link rel="stylesheet" url="resources/js/jquery.js" />
<script src="/bcresearchapp/resources/js/jquery.js"></script> -->
<div id="right_content">
	<script type="text/javascript">
											$(function() {
												$("#datepicker").datepicker({minDate: 0});
											});
											
											$(function() {
												$("#datepicker_weekly_survey").datepicker({minDate: 0});
											});
											</script>	
 <script type="text/javascript">
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
 $(document).ready(function () {
	 	
     $("#id").bind('keypress', function (event) {
     	
     	
         var regex = new RegExp("^[a-zA-Z0-9 ]+$");
       
         var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
       
      
        if (!regex.test(key)) {
         	
             event.preventDefault();
             return false;
         }
     });
 			
 });
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
		}
}).keydown(function() {
    oldValue = $(this).val();
})
$("#city").keyup(function() {
	$("#spncity").html('');
	var regex=/(^\d{5}$)|(^\d{5}-\d{4}$)/;
	var intRegex = /^\d+$/;
	if(regex.test($(this).val())||$(this).val()=='') 
	{
		var $in = $(this).val();		 
	}
	else if($(this).val()!='')
		{
		
		$("#spncity").html('Not a valid Zipcode!!!!');
		}
}).keydown(function() {
    oldValue = $(this).val();
})
});
</script>



<script>
function checkdate()
{
	document.getElementById("surveyerr").innerHTML="";	
	document.getElementById("startdateerr").innerHTML="";	
	var datefield=document.getElementById("datepicker_weekly_survey").value;
	var startdate=document.getElementById("datepicker").value;
	//alert(datefield.substring(6,datefield.length)+""+datefield.substring(0,2)+""+datefield.substring(3,5));
	var year1=datefield.substring(6,datefield.length);
	var month1=datefield.substring(0,2);
	var day1=datefield.substring(3,5);
	var year2=startdate.substring(6,startdate.length);
	var month2=startdate.substring(0,2);
	var day2=startdate.substring(3,5);
	var currentDate = new Date()
    var day = currentDate.getDate()
	var month = currentDate.getMonth() + 1
    var year = currentDate.getFullYear()	 

    		if(startdate!='')
		{
    if(year2==year)
		{		
		if(month2<month)
			{			
			document.getElementById("startdateerr").innerHTML="Invalid Date";			
			}
		else 
		{
		//alert("sdsdf");
	if(month2<month)
			{	
		if(day2<day)
			{
			document.getElementById("startdateerr").innerHTML="Invalid Date";
			
			}
		
		
			}
	if(day2<day)
	{
		document.getElementById("startdateerr").innerHTML="Invalid Date";
	
	}

		}
		
		}
	
	
	
	 if(year2<year)
		{
		 document.getElementById("startdateerr").innerHTML="Invalid Date";
		}
		}

    
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
	   document.getElementById("surveyerr").innerHTML="";	
		document.getElementById("startdateerr").innerHTML="";	
		var datefield=document.getElementById("datepicker_weekly_survey").value;
		var startdate=document.getElementById("datepicker").value;
		//alert(datefield.substring(6,datefield.length)+""+datefield.substring(0,2)+""+datefield.substring(3,5));
		var year1=datefield.substring(6,datefield.length);
		var month1=datefield.substring(0,2);
		var day1=datefield.substring(3,5);
		var year2=startdate.substring(6,startdate.length);
		var month2=startdate.substring(0,2);
		var day2=startdate.substring(3,5);
		var currentDate = new Date()
	    var day = currentDate.getDate()
		var month = currentDate.getMonth() + 1
	    var year = currentDate.getFullYear()	 

	    		if(startdate!='')
			{
	    if(year2==year)
			{		
			if(month2<month)
				{			
				document.getElementById("startdateerr").innerHTML="Invalid Date Format";			
		return false;
				}
			else 
			{
			//alert("sdsdf");
		if(month2<month)
				{	
			if(day2<day)
				{
				document.getElementById("startdateerr").innerHTML="Invalid Date Format";
				return false;
				}
			
			
				}
		if(day2<day)
		{
			document.getElementById("startdateerr").innerHTML="Invalid Date Format";
			return false;
		}

			}
			
			}
		
		
		
		 if(year2<year)
			{
			 document.getElementById("startdateerr").innerHTML="Invalid Date Format";
			 return false;
			}
			}

	    
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
			//alert("sdsdf");
		if(month1<month)
				{	
			if(day1<day)
				{
				document.getElementById("surveyerr").innerHTML="Invalid Date Format";
				return false;
				
				}
			
			
				}
		if(day1<day)
		{
			document.getElementById("surveyerr").innerHTML="Invalid Date Format";
			return false;
		
		}

			}
			
			}
		
		
		
		 if(year1<year)
			{
			 document.getElementById("surveyerr").innerHTML="Invalid Date Format";
			 return false;
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
	if (document.getElementById("datepicker").value !="") {
		  if (re.test(document.getElementById("datepicker").value) == false) {
			// alert("fsdfsd");
			  document.getElementById("startdateerr").innerHTML="Invalid Date Format.";
			  return false;
		  }
		}
		var numbers = $('#mno').val();
		if(numbers!='')
		{
		var result1 = validPhone(numbers);
		if (result1.valid === false) {
			
			document.getElementById("spnmno").innerHTML="invalid phone number";				
		return false;
		}
		}
	
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

return false;
}
else
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

	return true;
}
</script>


	<form action="addparticipants" method="POST" name="update" id="update">

		<table cellpadding="0" cellspacing="0" border="0" width="98%"
			class="margin_table" id="su">

			<%-- <c:if test="${merror==true}">
				<tr>
					<td valign="top" align="left" style="padding: 5px 0 10px 0;">&nbsp;
						<div id="success_statusbar" class="status success">
							<p class="closestatus">
								<a title="Close" href="">x</a>
							</p>
							<p>
								<img alt="Success" src="resources/images/icons/icon_success.png"><span>Error!</span>.
							</p>
						</div>
				</tr>
			</c:if> --%>

		</table>
		<table cellpadding="0" cellspacing="0" border="0" width="98%"
			class="margin_table">
			<tr>
				<td valign="top" align="left">
					<div>
						<div class="headings altheading">
							<h2>Add Participant</h2>
						</div>
						<div class="contentbox">
<c:choose>
<c:when test="${empty addparticipants}">
							<table cellpadding="0" cellspacing="0" border="0" width="100%">
								<tr>
									<td align="left" valign="top" width="50%"
										style="padding-right: 25px;">
										<h2 class="quck-txt">Quick Info</h2>
										<table cellpadding="0" cellspacing="0" border="0" width="100%">
										<tr class="row2">
												<td valign="middle" align="left" class="input_txt"><span
													class="err"></span>ID:</td>
												<td valign="top" align="left" class="input_txt"><input
													type="text" class="input_txtbx1" id="id" name="id" /><br />
													<font color="Red" size="+1"> <span id="spnfname">
															<form:errors path="participant.fname"></form:errors>
													</span></font></td>

											</tr>
											<tr class="row1">
												<td valign="middle" align="left" class="input_txt"><span
													class="err">*</span> First Name / Initials:</td>
												<td valign="top" align="left" class="input_txt"><input
													type="text" class="input_txtbx1" id="fname" name="fname" /><br />
													<font color="Red" size="+1"> <span id="spnfname">
															<form:errors path="participant.fname"></form:errors>
													</span></font></td>

											</tr>

											<tr class="row2">
												<td valign="middle" align="left" class="input_txt"><span
													class="err">*</span> User Name :</td>
												<td valign="top" align="left" class="input_txt"><input
													type="text" class="input_txtbx1" id="username"
													onmouseover="showTooltip('tooltip_id','inp_id3');"
													onmouseout="hideTooltip('tooltip_id');" name="username" /> </br> <font
													color="Red" size="+1"><span id="spnlname"></span>
													 <c:if test="${user_exists ==true}"> <font color="Red" size="+1"><span id="spnlname"></span>User name already exists </font>	<br/></c:if>
													 <form:errors
															path="participant.username"></form:errors> </font></td>
											</tr>
											<tr class="row1">
												<td valign="middle" align="left" class="input_txt"><span
													class="err">*</span> Password:</td>
												<td valign="top" align="left" class="input_txt"><input
													type="text" class="input_txtbx1" id="username"
													onmouseover="showTooltip('tooltip_id','inp_id3');"
													onmouseout="hideTooltip('tooltip_id');" name="password" /> </br> <font
													color="Red" size="+1"><span id="spnlname"></span>
													
													 <form:errors
															path="participant.password"></form:errors> </font></td>
											</tr>
											
											<tr class="row2">
												<td valign="middle" align="left" class="input_txt"><span
													class="err">*</span> Mobile No :</td>
												<td valign="top" align="left" class="input_txt"><input
													type="text" class="input_txtbx1" min="10" maxlength="10" id="mno"
													onmouseover="showTooltip('tooltip_id','inp_id3');"
													onmouseout="hideTooltip('tooltip_id');"
													value="${mobile_num}" name="mobile_num" /></br> <font
													color="Red" size="+1"><span id="spnmno">
													 <c:if test="${mobile_exists ==true}"> <font color="Red" size="+1"><span id="spnmno"></span>Mobile Number already exists </font>	<br/></c:if>
												<%--  <c:if test="${merror==true}"> <font color="Red" size="+1"><span id="spnmno"></span>Mobile Number Not Valid</font>	<br/></c:if> --%>
													<font color="Red" size="+1"><span id="spnmno">
													<form:errors path="participant.mobile_num"></form:errors> </span></font></td>
											</tr>
											<tr class="row1">
												<td valign="middle" align="left" class="input_txt"><span
													class="err">*</span> Email-Id :</td>
												<td valign="top" align="left" class="input_txt"><input
													type="text" class="input_txtbx1" id="eid"
													onmouseover="showTooltip('tooltip_id','inp_id3');"
													onmouseout="hideTooltip('tooltip_id');" name="email_id" /></br>
													<font color="Red" size="+1"><span id="spneid">
																			 <c:if test="${email_exists ==true}"> <font color="Red" size="+1"><span id="spnlname"></span>Email already exists </font>	<br/></c:if>
																				
													<form:errors
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
													<option value="null">--Select--</option>
														<option value="Below 12" id="age">Below 12</option>
														<option value="12-20 years" id="age">12-20 &#160 years</option>
														<option value="20-30 years" id="age">21-30 &#160 years</option>
														<option value="30-40 years" id="age">31-40 &#160 years</option>
														<option value="40-50 years" id="age">41-50 &#160 years</option>
														<option value="50-60 years" id="age">51-60 &#160 years</option>
														<option value="60-70 years" id="age">61-70 &#160 years</option>
														<option value="70-80 years" id="age">71-80 &#160 years</option>
														<option value="80-90 years" id="age">81-90 &#160 years</option>
														<option value="90-100 years" id="age">91-100
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
													onmouseout="hideTooltip('tooltip_id');" name="city" /></br> <font
													color="Red" size="+1"><span id="spncity"><form:errors
																path="participant.city"></form:errors> </span></font></td>
											</tr>
											<tr class="row1">
												<td valign="middle" align="left" class="input_txt"><span
													class="err"></span> Education :</td>
												<td valign="top" align="left" class="input_txt"><select
													name="education" class="input_cmbbx1">
														<option selected="selected" value="">--Select--</option>
														<option value="Did not complete High School" id="edu">Did not complete High School</option>
														<option value="High School or GED" id="edu">High School or GED</option>
														<option value="Some College" id="edu">Some College</option>
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
														class="input_txtbx1"  id="det"
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
									<select name="time1_am_pm" class="input_cmbbx1" style="width:80px;">
											<option value="AM">AM&nbsp;</option>
											<option value="PM">PM&nbsp;</option>
								   </select><br/>
												</td>
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
									<select name="time2_am_pm" class="input_cmbbx1" style="width:80px;">
											<option value="AM">AM&nbsp;</option>
											<option value="PM">PM&nbsp;</option>
								   </select>
											<br/>
												</td>
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
									<select name="time3_am_pm" class="input_cmbbx1" style="width:80px;">
											<option value="AM">AM&nbsp;</option>
											<option value="PM">PM&nbsp;</option>
								   </select><br/>
												</td>
											</tr>

											<tr class="row1">
												<td valign="middle" align="left" class="input_txt"><span
													class="err"></span>Start Date :</td>
												<td valign="top" align="left" class="input_txt">									
										
												<input type="text" name="startdate"
										id="datepicker" class="input_txtbx1" maxlength="10" value="" onblur="checkdate()"> </br> <font
													color="Red" size="+1"><span id="startdateerr"></span>
													
													 </font></td>
											</tr>
											<tr class="row2">
												<td valign="middle" align="left" class="input_txt"><span
													class="err"></span>Weekly Survey Start Date :</td>
												<td valign="top" align="left" class="input_txt">									
										
												<input type="text" name="weekly_survey_start_date"
										id="datepicker_weekly_survey" maxlength="10" class="input_txtbx1" value="" onblur="checkdate()"> <br/> <font
													color="Red" size="+1"><span id="surveyerr"></span>
													
													 </font></td>
											</tr>
											<tr class="row1">
												<td valign="middle" align="left" class="input_txt"><span
													class="err">*</span>Provider Primary Email :</td>
												<td valign="top" align="left" class="input_txt">									
										
												<input type="text" name="provider_email1"
										id="id_provider_primary_email" class="input_txtbx1" value=""> <br/> <font
													color="Red" size="+1"><span id="ppemailerr"><form:errors
																path="participant.provider_email1"></form:errors></span>
													
													 </font></td>
											</tr>
											<tr class="row2">
												<td valign="middle" align="left" class="input_txt"><span
													class="err"></span>Provider Secondary Email :</td>
												<td valign="top" align="left" class="input_txt">									
										
												<input type="text" name="provider_email2"
										id="id_provider_secondary_email" class="input_txtbx1" value=""> <br/> <font
													color="Red" size="+1"><span id="pemailerr"><form:errors
																path="provider_email2"></form:errors></span>
													
													 </font></td>
											</tr>
											<tr>
												<td><p class="quck-txt">Group</p></td>
											</tr>
											<tr class="row1">
												<td colspan="2"><p
														style="line-height: 18px; padding: 1px 0pt; text-align: justify;color:#3D3D5C;">
														Group is the internal classification for the better
														understanding of Participant's Demographics.<!-- <a
															href="addparticipantgroups"
															onclick="javascript:CreateGroup()">[Create New Group]</a> -->
													</p></td>
											</tr>
											<tr><td><input type="hidden" id="Provider_name" name="Provider_name" value="<sec:authentication property="principal.username"/>"/></tr>
											
											<tr class="row2">
												<td valign="top" align="left" class="input_txt"><span
													class="err">*</span> Select
													Group :</td>
												<td valign="top" align="left" class="input_txt">
												<select class="input_cmbbx2" id="group_name"
													name="group_name" multiple="multiple">
														<c:forEach
															items="${participantGroupForm.participantGroups}"
															var="participantGroups" varStatus="status">
															<option value="${participantGroups.group_name}">${participantGroups.group_name}</option>
														</c:forEach>

												</select> </br> <font color="Red" size="+1"><span id="spngrp"><form:errors
																path="participant.group_name"></form:errors> </span></font>Note: To Select Multiple Groups use ctrl+click.</td>
											</tr>
										</table>		
									</td>
								</tr></table>
								
							
								
								<table align="right" border="0" cellspacing="0" cellpadding="0">
								<tr >
									<td valign="top" align="left" border="0"><input type="submit" onclick="return validate('this')"
									id="register"	name="insert" class="submit_btn2" value="Add Participant">
										<span id="spnsub"> </span></td>
										<td valign="middle" style="padding-left:10px;" ><input type="reset" class="submit_btn" value="Reset"></td>
										 <td valign="middle" style="padding-left:10px;" ><a href="viewparticipants" class="submit_btn" style="color:white ;font-size:14px;text-decoration: none;">Cancel</a>
										
								</tr>
							</table>
							
							</c:when>
							<c:otherwise>
							 <table cellpadding="0" cellspacing="0" border="0" width="100%">
  <tr>
    <td align="left" valign="top" width="50%" style="padding-right:25px;">
    <h2 class="quck-txt">Quick Info</h2>
    
   
     <table cellpadding="0" cellspacing="0" border="0" width="100%">
     <tr class="row2">
                  <td valign="middle" align="left" class="input_txt"><span class="err"></span> ID:</td>
                
                  <td valign="top" align="left" class="input_txt"><input type="text" class="input_txtbx1" id="inp_id"  value="${addparticipants.id}" name="id" /></br><span class="err"><form:errors path=""></form:errors></span></td>
                </tr>
                        <tr class="row1">
                  <td valign="middle" align="left" class="input_txt"><span class="err">*</span> First Name / Initials:</td>
                  <td valign="top" align="left" class="input_txt"><input type="text" class="input_txtbx1" id="fname" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${addparticipants.fname }" name="fname" /></br><span class="err"><form:errors path="participant.fname"></form:errors></span></td>
                </tr>

		 <tr class="row2">
                  <td valign="middle" align="left" class="input_txt"><span class="err">*</span> User Name :</td>
                  <td valign="top" align="left" class="input_txt"><input type="text" class="input_txtbx1" id="username" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${addparticipants.username }" name="username"/></br><font color="Red" size="+1"><span class="err"><c:if test="${user_exists ==true}"> <font color="Red" size="+1"><span id="spnlname"></span>Username already exists </font>	<br/></c:if><form:errors path="participant.username"></form:errors></font></td>
                </tr> 
                <tr class="row1">
                  <td valign="middle" align="left" class="input_txt"><span class="err">*</span>Password:</td>
                <td valign="top" align="left" class="input_txt"><input type="text" name="password" class="input_txtbx1" value="${addparticipants.password}"><br><font color="Red" size="+1"><form:errors path="participant.password"></form:errors></font></td>
                </tr>
		<tr class="row2">
                  <td valign="middle" align="left" class="input_txt"><span class="err">*</span> Mobile No :</td>
                  <td valign="top" align="left" class="input_txt"><input type="text" min="10" maxlength="10" id="mno" class="input_txtbx1" id="inp_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${addparticipants.mobile_num}" name="mobile_num" /></br><font color="Red" size="+1"><span class="err"><c:if test="${mobile_exists ==true}"> <font color="Red" size="+1"><span id="spnmno">
                  Mobile Number already exists</span> </font>	<br/></c:if> <c:if test="${merror==true}"> <font color="Red" size="+1"><span id="spnmno"></span>Mobile Number Not Valid</font>	<br/></c:if><font color="Red" size="+1"><span id="spnmno"><form:errors path="participant.mobile_num"></form:errors></span> </font></td>
                </tr> 
		<tr class="row1">
                  <td valign="middle" align="left" class="input_txt"><span class="err">*</span> Email-Id :</td>
                  <td valign="top" align="left" class="input_txt"><input type="text" class="input_txtbx1" id="eid" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${addparticipants.email_id}" name="email_id" /></br><font color="Red" size="+1"><span id="spneid">
                  <c:if test="${email_exists ==true}"> 
                  <c:choose>
                  <c:when test="${empty addparticipants.email_id}">
                  
                  </c:when>
                  <c:otherwise><font color="Red" size="+1"><span id="spnlname"></span>Email already exists </font></c:otherwise>
                  </c:choose>
                  	<br/>
                  </c:if><form:errors path="participant.email_id"></form:errors></span> </font></td>
                </tr> 

		<tr class="row2">
                  <td valign="middle" align="left" class="input_txt"><span class="err"></span> Gender :</td>
                  <td valign="top" align="left" class="input_txt">
                  <input type="radio" name="gender" value="0"  class="input_txt" <c:if test="${addparticipants.gender=='0'}"><c:out value="checked=checked"/></c:if>>Male
                  <input type="radio" name="gender" value="1"  class="input_txt" <c:if test="${addparticipants.gender=='1'}"><c:out value="checked=checked"/></c:if>> Female</td>
                </tr>
		 <tr class="row1">
                 <td valign="middle" align="left" class="input_txt"><span class="err"></span> Age :</td>
                 <td valign="top" align="left" class="input_txt"><select name="age" class="input_cmbbx1">
                 <option value="null" <c:if test="${addparticipants.age=='null'}"><c:out value="selected"/></c:if>>--Select--</option> 
                 <option value="Below 12" <c:if test="${addparticipants.age=='Below 12'}"><c:out value="selected"/></c:if>>Below 12</option>
                 <option value="12-20 years" <c:if test="${addparticipants.age=='12-20 years'}"><c:out value="selected"/></c:if>>12-20 &#160 years</option>
                 <option value="20-30 years" <c:if test="${addparticipants.age=='21-30 years'}"><c:out value="selected"/></c:if>>21-30 &#160 years</option>
                 <option value="30-40 years" <c:if test="${addparticipants.age=='31-40 years'}"><c:out value="selected"/></c:if>>31-40 &#160 years</</option>                  
                 <option value="40-50 years" <c:if test="${addparticipants.age=='41-50 years'}"><c:out value="selected"/></c:if>>41-50 &#160 years</option>
                 <option value="50-60 years"  <c:if test="${addparticipants.age=='51-60 years'}"><c:out value="selected"/></c:if>>51-60 &#160 years</option>
                 <option value="60-70 years" <c:if test="${addparticipants.age=='61-70 years'}"><c:out value="selected"/></c:if>>61-70 &#160 years</option>
                 <option value="70-80 years" <c:if test="${addparticipants.age=='71-80 years'}"><c:out value="selected"/></c:if>>71-80 &#160 years</option>
                 <option value="80-90 years" <c:if test="${addparticipants.age=='81-90 years'}"><c:out value="selected"/></c:if>>81-90 &#160 years</option>
                   <option value="90-100 years" <c:if test="${addparticipants.age=='91-100 years'}"><c:out value="selected"/></c:if>>91-100 years</option>
                  
                  </select><%-- <input type="text" class="input_txtbx1" id="inp_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${participantsDetails.age}" name="age" /></br><span class="err"><form:errors path="participant.age"></form:errors></span> --%></td>
                </tr>
		
                <tr class="row2">
                  <td valign="middle" align="left" class="input_txt"><span class="err"></span>Zipcode :</td>
                  <td valign="top" align="left" class="input_txt"><input type="text" class="input_txtbx1" id="city" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${addparticipants.city}" name="city"/></br><font color="Red" size="+1"><span id="spncity"><form:errors path="participant.city"></form:errors></span> </font></td>
                </tr>
		 <tr class="row1">
                  <td valign="middle" align="left" class="input_txt"><span class="err"></span> Education :</td>
                  <td valign="top" align="left" class="input_txt"><select name="education" class="input_cmbbx1">
                          <option value="" <c:if test="${addparticipants.education==''}"><c:out value="selected"/></c:if>>--Select--</option>
			<option value="Did not complete High School" <c:if test="${addparticipants.education=='Did not complete High School'}"><c:out value="selected"/></c:if>>Did not complete High School</option>
			<option value="High School or GED" <c:if test="${addparticipants.education=='High School or GED'}"><c:out value="selected"/></c:if>>High School or GED</option>
			<option value="Some College" <c:if test="${addparticipants.education=='Some College'}"><c:out value="selected"/></c:if> >Some College</option>
			<option value="Undergraduate Degree" <c:if test="${addparticipants.education=='Undergraduate Degree'}"><c:out value="selected"/></c:if>>Undergraduate Degree</option>
			<option value="Post-graduate Degree" <c:if test="${addparticipants.education=='Post-graduate Degree'}"><c:out value="selected"/></c:if>>Post-graduate Degree</option>
                   </select></td>
                </tr>

                <tr class="row2">
                  <td valign="top" align="left" class="input_txt"><span class="err"></span> Medical Details :</td>
                  <td valign="top" align="left" class="input_txt"><textarea class="input_txtbx1" id="inp_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  style="width: 220px; height: 89px;" name="medical_details"/>${addparticipants.medical_details }</textarea></br><font color="Red" size="+1"><span class="err"><form:errors path="participant.medical_details"></form:errors></span></font></td>
                </tr>


		              </table> 
              </td>
    <td align="left" valign="top">
<table cellpadding="0" cellspacing="0" border="0" width="100%">
              
             
<tr><td><p class="quck-txt">Preferred&nbsp;Timings
</p></td></tr>



		<tr class="row2">
												<td valign="middle" align="left" class="input_txt"><span
													class="err"></span> Time1 :</td>
												<td valign="top" align="left" class="input_txt">
												<select name="time1" class="input_cmbbx1" id="msg">
												<option value="null" <c:if test="${addparticipants.time1=='null'}"><c:out value="selected"/></c:if>>--Select--</option>
												
					  <option value="01" <c:if test="${addparticipants.time1=='01'}"><c:out value="selected"/></c:if>>1</option>
                   <option value="02"  <c:if test="${addparticipants.time1=='02'}"><c:out value="selected"/></c:if>>2</option>
				   <option value="03" <c:if test="${addparticipants.time1=='03'}"><c:out value="selected"/></c:if>>3</option>
				   <option value="04" <c:if test="${addparticipants.time1=='04'}"><c:out value="selected"/></c:if>>4</option>
				   <option value="05" <c:if test="${addparticipants.time1=='05'}"><c:out value="selected"/></c:if>>5</option>
				   <option value="06" <c:if test="${addparticipants.time1=='06'}"><c:out value="selected"/></c:if>>6</option>
				   <option value="07" <c:if test="${addparticipants.time1=='07'}"><c:out value="selected"/></c:if>>7</option>
				   <option value="08"  <c:if test="${addparticipants.time1=='08'}"><c:out value="selected"/></c:if>>8</option>
					<option value="09" <c:if test="${addparticipants.time1=='09'}"><c:out value="selected"/></c:if>>9</option>
				 <option value="10" <c:if test="${addparticipants.time1=='10'}"><c:out value="selected"/></c:if>>10</option>
					<option value="11"  <c:if test="${addparticipants.time1=='11'}"><c:out value="selected"/></c:if>>11</option>
					<option value="12" <c:if test="${addparticipants.time1=='12'}"><c:out value="selected"/></c:if>>12</option>					
															
												</select>
												
												<select name="time1_am_pm" class="input_cmbbx1" style="width:80px;">
											<option value="AM" <c:if test="${addparticipants.time1_am_pm=='AM'}"><c:out value="selected"/></c:if>>AM&nbsp;</option>
											<option value="PM" <c:if test="${addparticipants.time1_am_pm=='PM'}"><c:out value="selected"/></c:if>>PM&nbsp;</option>
								   </select>				
												
					<br/>
												</td>
											</tr>
                                               <tr class="row1">
												<td valign="middle" align="left" class="input_txt"><span
													class="err"></span> Time2 :</td>
												<td valign="top" align="left" class="input_txt" >
												<select name="time2" class="input_cmbbx1" id="msg"">
													<option value="null" <c:if test="${addparticipants.time2=='null'}"><c:out value="selected"/></c:if>>--Select--</option>
                    <option value="01" <c:if test="${addparticipants.time2=='01'}"><c:out value="selected"/></c:if>>1</option>
                   <option value="02"  <c:if test="${addparticipants.time2=='02'}"><c:out value="selected"/></c:if>>2</option>
				   <option value="03" <c:if test="${addparticipants.time2=='03'}"><c:out value="selected"/></c:if>>3</option>
				   <option value="04" <c:if test="${addparticipants.time2=='04'}"><c:out value="selected"/></c:if>>4</option>
				   <option value="05" <c:if test="${addparticipants.time2=='05'}"><c:out value="selected"/></c:if>>5</option>
				   <option value="06" <c:if test="${addparticipants.time2=='06'}"><c:out value="selected"/></c:if>>6</option>
				   <option value="07" <c:if test="${addparticipants.time2=='07'}"><c:out value="selected"/></c:if>>7</option>
				   <option value="08"  <c:if test="${addparticipants.time2=='08'}"><c:out value="selected"/></c:if>>8</option>
					<option value="09" <c:if test="${addparticipants.time2=='09'}"><c:out value="selected"/></c:if>>9</option>
				 <option value="10" <c:if test="${addparticipants.time2=='10'}"><c:out value="selected"/></c:if>>10</option>
					<option value="11"  <c:if test="${addparticipants.time2=='11'}"><c:out value="selected"/></c:if>>11</option>
					<option value="12" <c:if test="${addparticipants.time2=='12'}"><c:out value="selected"/></c:if>>12</option>					
															
												</select>
												
												<select name="time2_am_pm" class="input_cmbbx1" style="width:80px;">
											<option value="AM" <c:if test="${addparticipants.time2_am_pm=='AM'}"><c:out value="selected"/></c:if>>AM&nbsp;</option>
											<option value="PM" <c:if test="${addparticipants.time2_am_pm=='PM'}"><c:out value="selected"/></c:if>>PM&nbsp;</option>
								   </select><br/>
												</td>
											</tr>
											<tr class="row2">
												<td valign="middle" align="left" class="input_txt"><span
													class="err"></span> Time3 :</td>
												<td valign="top" align="left" class="input_txt">
												<select name="time3" class="input_cmbbx1" id="msg">
				<option value="null" <c:if test="${addparticipants.time3=='null'}"><c:out value="selected"/></c:if>>--Select--</option>								
				 <option value="01" <c:if test="${addparticipants.time3=='01'}"><c:out value="selected"/></c:if>>1</option>
                   <option value="02"  <c:if test="${addparticipants.time3=='02'}"><c:out value="selected"/></c:if>>2</option>
				   <option value="03" <c:if test="${addparticipants.time3=='03'}"><c:out value="selected"/></c:if>>3</option>
				   <option value="04" <c:if test="${addparticipants.time3=='04'}"><c:out value="selected"/></c:if>>4</option>
				   <option value="05" <c:if test="${addparticipants.time3=='05'}"><c:out value="selected"/></c:if>>5</option>
				   <option value="06" <c:if test="${addparticipants.time3=='06'}"><c:out value="selected"/></c:if>>6</option>
				   <option value="07" <c:if test="${addparticipants.time3=='07'}"><c:out value="selected"/></c:if>>7</option>
				   <option value="08"  <c:if test="${addparticipants.time3=='08'}"><c:out value="selected"/></c:if>>8</option>
					<option value="09" <c:if test="${addparticipants.time3=='09'}"><c:out value="selected"/></c:if>>9</option>
				 <option value="10" <c:if test="${addparticipants.time3=='10'}"><c:out value="selected"/></c:if>>10</option>
					<option value="11"  <c:if test="${addparticipants.time3=='11'}"><c:out value="selected"/></c:if>>11</option>
					<option value="12" <c:if test="${addparticipants.time3=='12'}"><c:out value="selected"/></c:if>>12</option>					
															
												</select>
												
												<select name="time3_am_pm" class="input_cmbbx1" style="width:80px;">
											<option value="AM" <c:if test="${addparticipants.time3_am_pm=='AM'}"><c:out value="selected"/></c:if>>AM&nbsp;</option>
											<option value="PM" <c:if test="${addparticipants.time3_am_pm=='PM'}"><c:out value="selected"/></c:if>>PM&nbsp;</option>
								   </select>
					<br/>
												</td>
											</tr>
<tr class="row1">
												<td valign="middle" align="left" class="input_txt">
													 Start Date :</td>
												<td valign="top" align="left" class="input_txt" >
												<input type="text" name="startdate" id="datepicker" value="${addparticipants.startdate}" class="input_txtbx1" onblur="checkdate()">
												</br> <font
													color="Red" size="+1"><span id="startdateerr"></span>
													
													 </font>
												</td>
											</tr>	
											
											<tr class="row2">
												<td valign="middle" align="left" class="input_txt"><span
													class="err"></span>Weekly Survey Start Date :</td>
												<td valign="top" align="left" class="input_txt">									
										
												<input type="text" name="weekly_survey_start_date"
										id="datepicker_weekly_survey" class="input_txtbx1" value="${addparticipants.weekly_survey_start_date}" onblur="checkdate()" > </br> <font
													color="Red" size="+1"><span id="surveyerr"></span>
													
													 </font></td>
											</tr>
														<tr class="row1">
												<td valign="middle" align="left" class="input_txt"><span
													class="err">*</span>Provider Primary Email :</td>
												<td valign="top" align="left" class="input_txt">									
										
												<input type="text" name="provider_email1"
										id="id_provider_primary_email" class="input_txtbx1" value="${addparticipants.provider_email1}"> <br/> <font
													color="Red" size="+1"><span id="ppemailerr"><form:errors
																path="participant.provider_email1"></form:errors></span>
													
													 </font></td>
											</tr>
											<tr class="row2">
												<td valign="middle" align="left" class="input_txt"><span
													class="err"></span>Provider Secondary Email :</td>
												<td valign="top" align="left" class="input_txt">									
										
												<input type="text" name="provider_email2"
										id="id_provider_secondary_email" class="input_txtbx1" value="${addparticipants.provider_email2}"> <br/> <font
													color="Red" size="+1"><span id="pemailerr"><form:errors
																path="participant.provider_email2"></form:errors></span>
													
													 </font></td>
											</tr>
                
                <tr><td><input type="hidden" id="Provider_name" name="Provider_name" value="<sec:authentication property="principal.username" />"></tr>

<tr><td><p class="quck-txt">Group</p></td></tr>
<tr class="row1"><td colspan="2"><p style=" line-height: 18px; padding: 1px 0pt; text-align: justify; color:#3D3D5C;" >Group is the internal classification for the better understanding of Participant's Demographics.<!-- <a href="addparticipantgroups" onclick="javascript:CreateGroup()">[Create New Group]</a> --></p></td></tr>



    <tr class="row2">
                  <td valign="top" align="left" class="input_txt"><span class="err">*</span>Select Group :</td>
                  <td valign="top" align="left" class="input_txt">
                  <select name="group_name" multiple="multiple" class="input_cmbbx1" id="group_name">
                  <c:forEach items="${participantGroupForm.participantGroups}" var="participantGroups" varStatus="status">
			                 
			        <option value="${participantGroups.group_name}" <c:if test="${fn:contains(groupnames,participantGroups.group_name)}"><c:out value="selected"/></c:if>>${participantGroups.group_name}</option>
			      
			      </c:forEach>
                  
                  </select>
                  
                  
                  </br><font color="Red" size="+1"><span id="spngrp"><form:errors
																path="participant.group_name"></form:errors> </span></font><br>Note: To Select Multiple Groups use ctrl+click.	</td>
                </tr>            
 </table>
 

                  </td>
                </tr></table>
                
                 
              <table align="right" cellspacing="0" cellpadding="0" border="0">
								<tr >
									<td valign="top" align="center">&nbsp;</td>
									<td valign="top" align="left"><input type="submit" onclick="return validate('this')"
									id="register"	name="insert" class="submit_btn2" value="Add Participant">
										<span id="spnsub"> </span></td>			
											 <td valign="middle" style="padding-left:10px;" ><a href="showaddparticipants" class="submit_btn" style="color:white ;font-size:14px;text-decoration: none;">Reset</a></td>
										 <td valign="middle" style="padding-left:10px;" ><a href="viewparticipants" class="submit_btn" style="color:white ;font-size:14px;text-decoration: none;">Cancel</a>
										
								</tr>
							</table>
				</c:otherwise>			
				<%-- </td>
			</tr>
		</table>
	</form>
</div> --%>
</c:choose>
<jsp:include page="footer.jsp"></jsp:include>