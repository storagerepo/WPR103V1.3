<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="header.jsp"></jsp:include>
<div id="right_content">
<script type="text/javascript" src="js/jquery-1.3.2.js"></script>

<link rel="stylesheet" href="resources/css/jquery-ui.css" />
<script src="resources/js/jquery-1.9.1.js" type="text/javascript"></script>
<script src="resources/js/jquery-ui.js" type="text/javascript"></script>
<link rel="stylesheet" url="resources/js/jquery.js" />


<!-- <script type="text/javascript" src="js/jquery-1.3.2.js"></script>

<link rel="stylesheet" href="resources/css/jquery-ui.css" />
<script src="resources/js/jquery-1.9.1.js" type="text/javascript"></script>
<script src="resources/js/jquery-ui.js" type="text/javascript"></script>
<link rel="stylesheet" url="resources/js/jquery.js" />
<link rel="stylesheet" url="resources/js/jquery.js" />
<script src="/bcresearchapp/resources/js/jquery.js"></script> -->
<script type="text/javascript">
$(function() {
$("#datepicker").datepicker({minDate: 0});
});	
$(function() {
	$("#datepicker_weekly_survey").datepicker({minDate: 0});
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
		  $("#spnmno").html('');
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
		function validate() {
			var fld = document.getElementById('group_names1');
			var values = [];
			for ( var i = 0; i < fld.options.length; i++) {
				if (fld.options[i].selected) {
					values.push(fld.options[i].value);
				}
			}

			if (values.length > 4) {
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
			} else
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


	<script type="text/javascript">
		function listbox_moveacross(sourceID, destID) {
			var src = document.getElementById(sourceID);
			var dest = document.getElementById(destID);
			var dest1=document.getElementById("group_names1");
			var values = [];
			var values1 = [];
			for ( var i = 0; i < src.options.length; i++) {
				if (src.options[i].selected) {
					values.push(src.options[i].value);
					
				}
			}
			for ( var i = 0; i < dest.options.length; i++) {

				values1.push(dest.options[i].value);
				

			}
			for ( var i = 0; i < values.length; i++) {
				for ( var j = 0; j < values1.length; j++) {
					if (values[i] == values1[j]) {
						alert("Group Exists");
						return false;
					}
				}
			}

			for ( var count = 0; count < src.options.length; count++) {

				if (src.options[count].selected == true) {
					var option = src.options[count];

					var newOption = document.createElement("option");
					var newOption1=document.createElement("option");
					newOption.value = option.value;
					newOption.text = option.text;
					newOption1.value = option.value;
					newOption1.text = option.text;
					newOption1.selected = true;
					//newOption.selected = true;
					try {
						dest.add(newOption, null);
						dest1.add(newOption1,null); //Standard
						src.remove(count, null);
					} catch (error) {
						dest.add(newOption); // IE only
						src.remove(count);
					}
					count--;
				}
			}
		}
		function listbox_moveacrossright(sourceID, destID) {
			var src = document.getElementById(sourceID);
			var dest = document.getElementById(destID);
			var dest1=document.getElementById("group_names1");
			for ( var count = 0; count < src.options.length; count++) {

				if (src.options[count].selected == true) {
					var option = src.options[count];

					var newOption = document.createElement("option");
					newOption.value = option.value;
					newOption.text = option.text;
					newOption.selected = true;
					
					try {
						dest.add(newOption, null); //Standard
						src.remove(count, null);
						dest1.remove(count,null);
					} catch (error) {
						dest.add(newOption); // IE only
						src.remove(count);
						dest1.remove(count);
					}
					count--;
				}
			}
		}

	</script>
	<script type="text/javascript">
		function doAjaxPost() {
			// get the form values  
			var name = $('#Provider_name').val();
			/*   var education = $('#education').val();	 */
			$.ajax({
				type : "POST",
				url : "/bcresearchapp/AddUser.htm",
				data : "Provider_name=" + name,
				success : function(response) {
					// we have the response  
					$('#info').html(response);
					/*     $('#education').val(''); */
				},
				error : function(e) {
					alert('Error: ' + e);
				}
			});
		}
	</script>

	

	<form action="updateparticipant" method="POST" name="update"
		id="update">

    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
        <tr>
        <td valign="top" align="left">
        <div>
        
            <div class="headings altheading">
              <h2>Edit Participant Details</h2> </div>   
               
           <%--     <c:choose>
<c:when test="${empty addparticipants}"> --%>
               <div class="contentbox">   
               
    <c:set value="${participantsDetailsForm.participantsDetails[0]}" var="participantsDetails"/>  
    
              <table cellpadding="0" cellspacing="0" border="0" width="100%">       
             <tr>     

    <td align="left" valign="top" width="50%" style="padding-right:25px;">
    <p class="quck-txt">Quick Info</p>
         <table cellpadding="0" cellspacing="0" border="0" width="100%">
         
            <tr class="row2">
                  <td valign="middle" align="left" class="input_txt"><span class="err"></span> ID:</td>
                
                  <td valign="top" align="left" class="input_txt"><input type="text" class="input_txtbx1" id="inp_id"  value="${participantsDetails.id}" name="id" /></br><span class="err"><form:errors path=""></form:errors></span></td>
                </tr>
                        <tr class="row1">
                  <td valign="middle" align="left" class="input_txt"><span class="err">*</span> First Name :</td>
                  <input type="hidden" class="input_txtbx1" id="inp_id" value="${participantsDetails.participants_id }" name="participants_id" />
                  <td valign="top" align="left" class="input_txt"><input type="text" class="input_txtbx1" id="inp_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${participantsDetails.fname }" name="fname" /></br><span class="err"><form:errors path="participant.fname"></form:errors></span></td>
                </tr>
                  <tr class="row2">
                  <td valign="middle" align="left" class="input_txt"><span class="err">*</span> User Name:</td>
                <td valign="top" align="left" class="input_txt"><c:out value="${participantsDetails.username}"></c:out></td>
                </tr>
                <tr class="row1">
                  <td valign="middle" align="left" class="input_txt"><span class="err">*</span>Password:</td>
                <td valign="top" align="left" class="input_txt"><input type="text" name="password" class="input_txtbx1" value="${participantsDetails.password}">
               <br> <font color="Red" size="+1"><span id="spnmno">   <form:errors path="participant.password"></form:errors></span> </font>
                </td>
                </tr>

		
                <input type="hidden" class="input_txtbx1" id="inp_id" name="username" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${participantsDetails.username }"/><font color="Red" size="+1"><span class="err"></font>
               
		<tr class="row2">
                  <td valign="middle" align="left" class="input_txt"><span class="err">*</span> Mobile No :</td>
                  <td valign="top" align="left" class="input_txt"><input type="text" class="input_txtbx1" min="10" maxlength="10" id="mno" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${participantsDetails.mobile_num}" name="mobile_num" /></br><font color="Red" size="+1"><span class="err"><c:if test="${mobile_exists ==true}"> <font color="Red" size="+1"><span id="spnmno"></span>Mobile Number already exists </font>	<br/></c:if> <font
													color="Red" size="+1"><span id="spnmno">   <form:errors path="participant.mobile_num"></form:errors></span> </font></td>
                </tr> 
		<tr class="row1">
                  <td valign="middle" align="left" class="input_txt"><span class="err">*</span> Email-Id :</td>
                  <td valign="top" align="left" class="input_txt"><input type="text" class="input_txtbx1" id="inp_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${participantsDetails.email_id}" name="email_id" /></br><font color="Red" size="+1"><span class="err"><c:if test="${email_exist ==true}"> <font color="Red" size="+1"><span id="spnlname"></span>Email already exists </font>	<br/></c:if><form:errors path="participant.email_id"></form:errors></span> </font></td>
                </tr> 

		<tr class="row2">
                  <td valign="middle" align="left" class="input_txt"> Gender :</td>
                  <td valign="top" align="left" class="input_txt">
                  <input type="radio" name="gender" value="0"  class="input_txt" <c:if test="${participantsDetails.gender=='0'}"><c:out value="checked=checked"/></c:if>>Male&nbsp;&nbsp;&nbsp;  <c:out value="${participantDetails.gender}"/>
                  <input type="radio" name="gender" value="1"  class="input_txt" <c:if test="${participantsDetails.gender=='1'}"><c:out value="checked=checked"/></c:if>> Female</td>
                </tr>
		 <tr class="row1">
                 <td valign="middle" align="left" class="input_txt"> Age :</td>
                 <td valign="top" align="left" class="input_txt"><select name="age" class="input_cmbbx1">
                 <option value="null" <c:if test="${participantsDetails.age=='null'}"><c:out value="selected"/></c:if>>--Select--</option>
                 <option value="" <c:if test="${participantsDetails.age=='Below 12'}"><c:out value="selected"/></c:if>>Below 12</option>
                 <option value="12-20 years" <c:if test="${participantsDetails.age=='12-20 years'}"><c:out value="selected"/></c:if>>12-20 &#160 years</option>
                 <option value="21-30 years" <c:if test="${participantsDetails.age=='21-30 years'}"><c:out value="selected"/></c:if>>21-30 &#160 years</option>
                 <option value="31-40 years" <c:if test="${participantsDetails.age=='31-40 years'}"><c:out value="selected"/></c:if>>31-40 &#160 years</</option>                  
                 <option value="41-50 years" <c:if test="${participantsDetails.age=='41-50 years'}"><c:out value="selected"/></c:if>>41-50 &#160 years</option>
                 <option value="51-60 years"  <c:if test="${participantsDetails.age=='51-60 years'}"><c:out value="selected"/></c:if>>51-60 &#160 years</option>
                 <option value="61-70 years" <c:if test="${participantsDetails.age=='61-70 years'}"><c:out value="selected"/></c:if>>61-70 &#160 years</option>
                 <option value="71-80 years" <c:if test="${participantsDetails.age=='71-80 years'}"><c:out value="selected"/></c:if>>71-80 &#160 years</option>
                 <option value="81-90 years" <c:if test="${participantsDetails.age=='81-90 years'}"><c:out value="selected"/></c:if>>81-90 &#160 years</option>
                   <option value="91-100 years" <c:if test="${participantsDetails.age=='91-100 years'}"><c:out value="selected"/></c:if>>91-100 years</option>
                  
                  </select><%-- <input type="text" class="input_txtbx1" id="inp_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${participantsDetails.age}" name="age" /></br><span class="err"><form:errors path="participant.age"></form:errors></span> --%></td>
                </tr>
		
                <tr class="row2">
                  <td valign="middle" align="left" class="input_txt">Zipcode :</td>
                  <td valign="top" align="left" class="input_txt"><input type="text" class="input_txtbx1" id="city" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${participantsDetails.city}" name="city"/></br><font color="Red" size="+1"><span id="spncity"><form:errors path="participant.city"></form:errors></span> </font></td>
                </tr>
		 <tr class="row1">
                  <td valign="middle" align="left" class="input_txt"> Education :</td>
                  <td valign="top" align="left" class="input_txt"><select name="education" class="input_cmbbx1">
                    <option value="" <c:if test="${participantsDetails.education==''}"><c:out value="selected"/></c:if>>--Select--</option>
			<option value="Did not complete High School" <c:if test="${participantsDetails.education=='Did not complete High School'}"><c:out value="selected"/></c:if>>Did not complete High School</option>
			<option value="High School or GED" <c:if test="${participantsDetails.education=='High School or GED'}"><c:out value="selected"/></c:if>>High School or GED</option>
			<option value="Some College" <c:if test="${participantsDetails.education=='Some College'}"><c:out value="selected"/></c:if> >Some College</option>
			<option value="Undergraduate Degree" <c:if test="${participantsDetails.education=='Undergraduate Degree'}"><c:out value="selected"/></c:if>>Undergraduate Degree</option>
			<option value="Post-graduate Degree" <c:if test="${participantsDetails.education=='Post-graduate Degree'}"><c:out value="selected"/></c:if>>Post-graduate Degree</option>
												</select>
                   </select></td>
                </tr>         
  
              
            <tr class="row1" height="114">
                  <td valign="top" align="left" class="input_txt"> Medical Details :</td>
                  <td valign="top" align="left" class="input_txt"><textarea class="input_txtbx1" id="inp_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  style="width: 220px; height: 89px;" name="medical_details"/>${participantsDetails.medical_details }</textarea></br><font color="Red" size="+1"><span class="err"><form:errors path="participant.medical_details"></form:errors></span></font></td></tr>
               
</table></td>
  <td align="left" valign="top"> 
<table cellpadding="0" cellspacing="0" border="0" width="100%">

<tr><td><p class="quck-txt">Preferred&nbsp;Timings
</p></td></tr>


<tr class="row2">
												<td valign="middle" align="left" class="input_txt">
													 Time1 :</td>
												<td valign="top" align="left" class="input_txt">
												<select name="time1" class="input_cmbbx1" id="msg">
												<option value="null" <c:if test="${participantsDetails.time1=='null'}"><c:out value="selected"/></c:if>>--Select--</option>
				<option value="01" <c:if test="${participantsDetails.time1=='01'}"><c:out value="selected"/></c:if>>1</option>
                   <option value="02"  <c:if test="${participantsDetails.time1=='02'}"><c:out value="selected"/></c:if>>2</option>
				   <option value="03" <c:if test="${participantsDetails.time1=='03'}"><c:out value="selected"/></c:if>>3</option>
				   <option value="04" <c:if test="${participantsDetails.time1=='04'}"><c:out value="selected"/></c:if>>4</option>
				   <option value="05" <c:if test="${participantsDetails.time1=='05'}"><c:out value="selected"/></c:if>>5</option>
				   <option value="06" <c:if test="${participantsDetails.time1=='06'}"><c:out value="selected"/></c:if>>6</option>
				   <option value="07" <c:if test="${participantsDetails.time1=='07'}"><c:out value="selected"/></c:if>>7</option>
				   <option value="08"  <c:if test="${participantsDetails.time1=='08'}"><c:out value="selected"/></c:if>>8</option>
					<option value="09" <c:if test="${participantsDetails.time1=='09'}"><c:out value="selected"/></c:if>>9</option>
				 <option value="10" <c:if test="${participantsDetails.time1=='10'}"><c:out value="selected"/></c:if>>10</option>
					<option value="11"  <c:if test="${participantsDetails.time1=='11'}"><c:out value="selected"/></c:if>>11</option>
					<option value="12" <c:if test="${participantsDetails.time1=='12'}"><c:out value="selected"/></c:if>>12</option>					
															
												</select>
												
												<select name="time1_am_pm" class="input_cmbbx1" style="width:50px;">
											<option value="AM" <c:if test="${participantsDetails.time1_am_pm=='AM'}"><c:out value="selected"/></c:if>>AM&nbsp;</option>
											<option value="PM" <c:if test="${participantsDetails.time1_am_pm=='PM'}"><c:out value="selected"/></c:if>>PM&nbsp;</option>
								   </select>				
											
												</td>
											</tr>
                                               <tr class="row1">
												<td valign="middle" align="left" class="input_txt">
													 Time2 :</td>
												<td valign="top" align="left" class="input_txt">
												<select name="time2" class="input_cmbbx1" id="msg">
														<option value="null" <c:if test="${participantsDetails.time2=='null'}"><c:out value="selected"/></c:if>>--Select--</option>
                   	 <option value="01" <c:if test="${participants.time2=='01'}"><c:out value="selected"/></c:if>>1</option>
                   <option value="02"  <c:if test="${participantsDetails.time2=='02'}"><c:out value="selected"/></c:if>>2</option>
				   <option value="03" <c:if test="${participantsDetails.time2=='03'}"><c:out value="selected"/></c:if>>3</option>
				   <option value="04" <c:if test="${participantsDetails.time2=='04'}"><c:out value="selected"/></c:if>>4</option>
				   <option value="05" <c:if test="${participantsDetails.time2=='05'}"><c:out value="selected"/></c:if>>5</option>
				   <option value="06" <c:if test="${participantsDetails.time2=='06'}"><c:out value="selected"/></c:if>>6</option>
				   <option value="07" <c:if test="${participantsDetails.time2=='07'}"><c:out value="selected"/></c:if>>7</option>
				   <option value="08"  <c:if test="${participantsDetails.time2=='08'}"><c:out value="selected"/></c:if>>8</option>
					<option value="09" <c:if test="${participantsDetails.time2=='09'}"><c:out value="selected"/></c:if>>9</option>
				 <option value="10" <c:if test="${participantsDetails.time2=='10'}"><c:out value="selected"/></c:if>>10</option>
					<option value="11"  <c:if test="${participantsDetails.time2=='11'}"><c:out value="selected"/></c:if>>11</option>
					<option value="12" <c:if test="${participantsDetails.time2=='12'}"><c:out value="selected"/></c:if>>12</option>					
															
												</select>
												
												<select name="time2_am_pm" class="input_cmbbx1" style="width:50px;">
											<option value="AM" <c:if test="${participantsDetails.time2_am_pm=='AM'}"><c:out value="selected"/></c:if>>AM&nbsp;</option>
											<option value="PM" <c:if test="${participantsDetails.time2_am_pm=='PM'}"><c:out value="selected"/></c:if>>PM&nbsp;</option>
								   </select>
												</td>
											</tr>
											<tr class="row2">
												<td valign="middle" align="left" class="input_txt">
													 Time3 :</td>
												<td valign="top" align="left" class="input_txt">
												<select name="time3" class="input_cmbbx1" id="msg">
														
                   <option value="null"
					<c:if test="${participantsDetails.time3=='null'}"><c:out value="selected"/></c:if>>--Select--</option>
					<option value="01"  <c:if test="${participantsDetails.time3=='01'}"><c:out value="selected"/></c:if>>1</option>
					<option value="02"  <c:if test="${participantsDetails.time3=='02'}"><c:out value="selected"/></c:if>>2</option>
				   <option value="03" <c:if test="${participantsDetails.time3=='03'}"><c:out value="selected"/></c:if>>3</option>
				   <option value="04" <c:if test="${participantsDetails.time3=='04'}"><c:out value="selected"/></c:if>>4</option>
				   <option value="05" <c:if test="${participantsDetails.time3=='05'}"><c:out value="selected"/></c:if>>5</option>
				   <option value="06" <c:if test="${participantsDetails.time3=='06'}"><c:out value="selected"/></c:if>>6</option>
				   <option value="07" <c:if test="${participantsDetails.time3=='07'}"><c:out value="selected"/></c:if>>7</option>
				   <option value="08"  <c:if test="${participantsDetails.time3=='08'}"><c:out value="selected"/></c:if>>8</option>
					<option value="09" <c:if test="${participantsDetails.time3=='09'}"><c:out value="selected"/></c:if>>9</option>
				 <option value="10" <c:if test="${participantsDetails.time3=='10'}"><c:out value="selected"/></c:if>>10</option>
					<option value="11"  <c:if test="${participantsDetails.time3=='11'}"><c:out value="selected"/></c:if>>11</option>
					<option value="12" <c:if test="${participantsDetails.time3=='12'}"><c:out value="selected"/></c:if>>12</option>					
															
                   
															
												</select>
												
												
												<select name="time3_am_pm" class="input_cmbbx1" style="width:50px;">
											<option value="AM" <c:if test="${participantsDetails.time3_am_pm=='AM'}"><c:out value="selected"/></c:if>>AM&nbsp;</option>
											<option value="PM" <c:if test="${participantsDetails.time3_am_pm=='PM'}"><c:out value="selected"/></c:if>>PM&nbsp;</option>
												
												
												
												
												</td>
											</tr>
											<tr class="row1">
												<td valign="middle" align="left" class="input_txt">
													 Start Date :</td>
												<td valign="top" align="left" class="input_txt" >
												<input type="text" name="startdate" id="datepicker" value="${participantsDetails.startdate}" class="input_txtbx1">
												</td>
											</tr>
											
											
											<tr class="row2">
												<td valign="middle" align="left" class="input_txt"><span
													class="err"></span>Weekly Survey Start Date :</td>
												<td valign="top" align="left" class="input_txt">									
										<c:choose>
										<c:when test="${not empty participantsDetails.weekly_survey_start_date}">
										<input type="hidden" name="weekly_survey_start_date" 	
										 class="input_txtbx1" value="${participantsDetails.weekly_survey_start_date}">
										 <label>${participantsDetails.weekly_survey_start_date}</label>
										</c:when>
										<c:otherwise>
										<input type="text" name="weekly_survey_start_date" id="datepicker_weekly_survey"		
										 class="input_txtbx1" value="${participantsDetails.weekly_survey_start_date}"> <br/> <font
													color="Red" size="+1"><span id="spnlname"></span>
													
													 </font>
													 </c:otherwise>
											</c:choose>		 
													 
													 
													 </td>
											</tr>
											<tr class="row1">
												<td valign="middle" align="left" class="input_txt"><span
													class="err"></span>Provider Primary Email :</td>
												<td valign="top" align="left" class="input_txt">									
										
												<input type="text" name="provider_primary_email"
										id="id_provider_primary_email" class="input_txtbx1" value="${participantsDetails.provider_primary_email}"> <br/> <font
													color="Red" size="+1"><span id="spnlname"><form:errors
																path="participant.provider_primary_email"></form:errors></span>
													
													 </font></td>
											</tr>
											<tr class="row2">
												<td valign="middle" align="left" class="input_txt"><span
													class="err"></span>Provider Secondary Email :</td>
												<td valign="top" align="left" class="input_txt">									
										
												<input type="text" name="provider_secondary_email"
										id="id_provider_secondary_email" class="input_txtbx1" value="${participantsDetails.provider_secondary_email}"> <br/> <font
													color="Red" size="+1"><span id="spnlname"><form:errors
																path="participant.provider_secondary_email"></form:errors></span>
													
													 </font></td>
											</tr>
				<tr>
				
				<td><p class="quck-txt">Group</p></td></tr>

<tr class="row1"><td colspan="2"><p style=" line-height: 18px; padding: 1px 0pt; text-align: justify"><span class="err">*</span>Group is the internal classification for the better understanding of Participant's Demographics.<!-- <a href="#" onclick="javascript:CreateGroup()">[Create New Group]</a> --></p></td></tr>
                
                
                

<%-- 



    <tr class="row1">
                  <td valign="top" align="left" class="input_txt">Select Group :</td>
                  <td valign="top" align="left" class="input_txt">
                  <select name="group_name">
                  <c:forEach items="${group}" var="participantGroups" varStatus="status">
			                   <option value="${participantGroups}" >${participantGroups}</option>
			                   </c:forEach>
                  
                  </select>
                  
                  
                  </br><font color="Red" size="+1"><span class="err"></span></font></td>
                </tr>     --%>        
 </table>
 

											<table cellspacing="0" cellpadding="0" border="0" width="100%">
											<tr class="row2" >
												<td width="85"><span class="err">*</span> Select Group :</td>
												<td class="input_txt">
                                                    <p>Provider Groups</p>
													<select class="input_cmbbx2"
													 multiple="multiple" id="group_name">
														<c:forEach
															items="${participantGroupForm.participantGroups}"
															var="participantGroups" varStatus="status">
															<option value="${participantGroups.group_name}">${participantGroups.group_name}</option>
														</c:forEach>

												</select>
												</td>
																							<td>
													<ul class="pagination">
														<li class="page_unselect"><a 
															onclick="listbox_moveacross('group_name','group_names')">&gt;&gt;</a>
															</li></ul>

															<!-- input type="submit" value=">>" onclick=""/> --> </br>
															<ul class="pagination">
																<li class="page_unselect"><a
																	onclick="listbox_moveacrossright('group_names','group_name')">&lt;&lt</a></li>
															</ul> <%-- <input type="submit" value="<<"" onclick="listbox_moveacross('group_names', 'group_name')"/> --%>
												</td>
												<td>
												<p>Participant Joined Groups</p>
												<select id="group_names" name="group_name1"
													multiple="multiple" class="input_cmbbx1">
														<c:forEach items="${group}" var="group2"
															varStatus="status">

															<option value="${group2}">${group2}</option>
														

														</c:forEach>
												</select>
												
												<select style="display: none"  id="group_names1"  name="group_name"
													multiple="multiple" class="input_cmbbx1">
														<c:forEach items="${group}" var="group2"
															varStatus="status">

															<option value="${group2}" selected="selected">${group2}</option>
														

														</c:forEach>
												</select>
												
												
												
												
												
												
												
												</br> <font color="Red" size="+1"><span id="spngrp"><form:errors
																path="participant.group_name"></form:errors> </span></font>
															
															Note:	To Select Multiple Groups use ctrl+click	
																</td>
											</tr></table>
 
											
 

                  </td>
                </tr>
                
                
                
                <%-- <c:otherwise>
                
                 <div class="contentbox"> 
                
                  <table cellpadding="0" cellspacing="0" border="1" width="100%">       
             <tr>
           

    <td align="left" valign="top" width="50%" style="padding-right:25px;">
    <p class="quck-txt">Quick Info</p>
         <table cellpadding="0" cellspacing="0" border="1" width="100%">
                        <tr class="row2">
                  <td valign="middle" align="left" class="input_txt"><span class="err">*</span> First Name :</td>
                  <input type="hidden" class="input_txtbx1" id="inp_id" value="${addparticipants.participants_id }" name="participants_id" />
                  <td valign="top" align="left" class="input_txt"><input type="text" class="input_txtbx1" id="inp_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${addparticipants.fname }" name="fname" /></br><span class="err"><form:errors path="participant.fname"></form:errors></span></td>
                </tr>

		
                <input type="hidden" class="input_txtbx1" id="inp_id" name="username" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${addparticipants.username }"/></br><font color="Red" size="+1"><span class="err"></font>
               
		<tr class="row1">
                  <td valign="middle" align="left" class="input_txt"><span class="err">*</span> Mobile No :</td>
                  <td valign="top" align="left" class="input_txt"><input type="text" min="10" maxlength="10" class="input_txtbx1" id="mno" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${addparticipants.mobile_num}" name="mobile_num" /></br><font color="Red" size="+1"><span class="err"><c:if test="${mobile_exists ==true}"> <font color="Red" size="+1"><span id="spnmno"></span>Mobile Number already exists </font>	<br/></c:if> <font
													color="Red" size="+1"><span id="spnmno">   <form:errors path="participant.mobile_num"></form:errors></span> </font></td>
                </tr> 
		<tr class="row2">
                  <td valign="middle" align="left" class="input_txt"><span class="err">*</span> Email-Id :</td>
                  <td valign="top" align="left" class="input_txt"><input type="text" class="input_txtbx1" id="inp_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${addparticipants.email_id}" name="email_id" /></br><font
													color="Red" size="+1"><span id="spnlname"><c:if test="${email_exist ==true}"> <font color="Red" size="+1"><span id="spnlname"></span>Email already exists </font>	<br/></c:if><form:errors path="participant.email_id"></form:errors></span> </font></td>
                </tr> 

		<tr class="row1">
                  <td valign="middle" align="left" class="input_txt"> Gender :</td>
                  <td valign="top" align="left" class="input_txt">
                  <input type="radio" name="gender" value="0"  class="input_txt" <c:if test="${addparticipants.gender=='0'}"><c:out value="checked=checked"/></c:if>>Male&nbsp;&nbsp;&nbsp;  
                  <input type="radio" name="gender" value="1"  class="input_txt" <c:if test="${addparticipants.gender=='1'}"><c:out value="checked=checked"/></c:if>> Female</td>
                </tr>
		 <tr class="row2">
                 <td valign="middle" align="left" class="input_txt"> Age :</td>
                 <td valign="top" align="left" class="input_txt"><select name="age" class="input_cmbbx1">
                 <option value="" <c:if test="${addparticipants.age=='Below 12'}"><c:out value="selected"/></c:if>>Below 12</option>
                 <option value="12-20 years" <c:if test="${addparticipants.age=='12-20 years'}"><c:out value="selected"/></c:if>>12-20 &#160 years</option>
                 <option value="20-30 years" <c:if test="${addparticipants.age=='20-30 years'}"><c:out value="selected"/></c:if>>20-30 &#160 years</option>
                 <option value="30-40 years" <c:if test="${addparticipants.age=='30-40 years'}"><c:out value="selected"/></c:if>>30-40 &#160 years</</option>                  
                 <option value="40-50 years" <c:if test="${addparticipants.age=='40-50 years'}"><c:out value="selected"/></c:if>>40-50 &#160 years</option>
                 <option value="50-60 years"  <c:if test="${addparticipants.age=='50-60 years'}"><c:out value="selected"/></c:if>>50-60 &#160 years</option>
                 <option value="60-70 years" <c:if test="${addparticipants.age=='60-70 years'}"><c:out value="selected"/></c:if>>60-70 &#160 years</option>
                 <option value="70-80 years" <c:if test="${addparticipants.age=='70-80 years'}"><c:out value="selected"/></c:if>>70-80 &#160 years</option>
                 <option value="80-90 years" <c:if test="${addparticipants.age=='80-90 years'}"><c:out value="selected"/></c:if>>80-90 &#160 years</option>
                   <option value="90-100 years" <c:if test="${addparticipants.age=='90-100 years'}"><c:out value="selected"/></c:if>>90-100 years</option>
                  
                  </select><input type="text" class="input_txtbx1" id="inp_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${participantsDetails.age}" name="age" /></br><span class="err"><form:errors path="participant.age"></form:errors></span></td>
                </tr>
		
                <tr class="row1">
                  <td valign="middle" align="left" class="input_txt">Zipcode :</td>
                  <td valign="top" align="left" class="input_txt"><input type="text" class="input_txtbx1" id="city" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${addparticipants.city}" name="city"/></br><font color="Red" size="+1"><span id="spncity"><form:errors path="participant.city"></form:errors></span> </font></td>
                </tr>
		 <tr class="row2">
                  <td valign="middle" align="left" class="input_txt"> Education :</td>
                  <td valign="top" align="left" class="input_txt"><select name="education" class="input_cmbbx1">
                    <option value="" <c:if test="${addparticipants.education==''}"><c:out value="selected"/></c:if>>--Select--</option>
			<option value="Did not complete High School" <c:if test="${addparticipants.education=='Did not complete High School'}"><c:out value="selected"/></c:if>>Did not complete High School</option>
			<option value="High School or GED" <c:if test="${addparticipants.education=='High School or GED'}"><c:out value="selected"/></c:if>>High School or GED</option>
			<option value="Some College" <c:if test="${addparticipants.education=='Some College'}"><c:out value="selected"/></c:if> >Some College</option>
			<option value="Undergraduate Degree" <c:if test="${addparticipants.education=='Undergraduate Degree'}"><c:out value="selected"/></c:if>>Undergraduate Degree</option>
			<option value="Postgraduate Degree" <c:if test="${addparticipants.education=='Postgraduate Degree'}"><c:out value="selected"/></c:if>>Postgraduate Degree</option>
                   </select></td>
                </tr>         
  
              
            <tr class="row1">
                  <td valign="top" align="left" class="input_txt"> Medical Details :</td>
                  <td valign="top" align="left" class="input_txt"><textarea class="input_txtbx1" id="inp_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  style="width: 220px; height: 89px;" name="medical_details"/>${addparticipants.medical_details }</textarea></br><font color="Red" size="+1"><span class="err"><form:errors path="participant.medical_details"></form:errors></span></font></td></tr>
               
</table></td>
  <td align="left" valign="top"> 
<table cellpadding="0" cellspacing="0" border="1" width="100%">
<tr><td><p class="quck-txt">Preferred&nbsp;Timings
</p></td></tr>


<tr class="row2">
												<td valign="middle" align="left" class="input_txt">
													 Time1 :</td>
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
												
												<select name="time1_am_pm" class="input_cmbbx1" style="width:50px;">
											<option value="AM" <c:if test="${addparticipants.time1_am_pm=='AM'}"><c:out value="selected"/></c:if>>AM&nbsp;</option>
											<option value="PM" <c:if test="${addparticipants.time1_am_pm=='PM'}"><c:out value="selected"/></c:if>>PM&nbsp;</option>
								   </select>				
						
												</td>
											</tr>
                                               <tr class="row1">
												<td valign="middle" align="left" class="input_txt">
													 Time2 :</td>
												<td valign="top" align="left" class="input_txt">
												<select name="time2" class="input_cmbbx1" id="msg">
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
												
												<select name="time2_am_pm" class="input_cmbbx1" style="width:50px;">
											<option value="AM" <c:if test="${addparticipants.time2_am_pm=='AM'}"><c:out value="selected"/></c:if>>AM&nbsp;</option>
											<option value="PM" <c:if test="${addparticipants.time2_am_pm=='PM'}"><c:out value="selected"/></c:if>>PM&nbsp;</option>
								   </select>
												</td>
											</tr>
											<tr class="row2">
												<td valign="middle" align="left" class="input_txt">
													 Time3:</td>
												<td valign="top" align="left" class="input_txt">
												<select name="time3" class="input_cmbbx1" id="msg">
														<option value="null"  <c:if test="${addparticipants.time3=='null'}"><c:out value="selected"/></c:if>>--Select--</option>								
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
												
												<select name="time3_am_pm" class="input_cmbbx1" style="width:50px;">
											<option value="AM" <c:if test="${addparticipants.time3_am_pm=='AM'}"><c:out value="selected"/></c:if>>AM&nbsp;</option>
											<option value="PM" <c:if test="${addparticipants.time3_am_pm=='PM'}"><c:out value="selected"/></c:if>>PM&nbsp;</option>
								   </select>
			
												</td>
											</tr>
				<tr>
				
				<td><p class="quck-txt">Group</p></td></tr>

<tr class="row1"><td colspan="2"><p style=" line-height: 18px; padding: 1px 0pt; text-align: justify"><span class="err">*</span>Group is the internal classification for the better understanding of Participant's Demographics.<!-- <a href="#" onclick="javascript:CreateGroup()">[Create New Group]</a> --></p></td></tr>
                
                
                





    <tr class="row1">
                  <td valign="top" align="left" class="input_txt">Select Group :</td>
                  <td valign="top" align="left" class="input_txt">
                  <select name="group_name">
                  <c:forEach items="${group}" var="participantGroups" varStatus="status">
			                   <option value="${participantGroups}" >${participantGroups}</option>
			                   </c:forEach>
                  
                  </select>
                  
                  
                  </br><font color="Red" size="+1"><span class="err"></span></font></td>
                </tr>            
 </table>
 

											<table>
											<tr class="row2" >
												<td><span class="err">*</span> Select Group :</td>
												<td class="input_txt">
                                                    <p>Provider Groups</p>
													<select class="input_cmbbx2"
													 multiple="multiple" id="group_name">
														<c:forEach
															items="${participantGroupForm.participantGroups}"
															var="participantGroups" varStatus="status">
															<option value="${participantGroups.group_name}">${participantGroups.group_name}</option>
														</c:forEach>

												</select>
												</td>
												<td>
												<td>
													<ul class="pagination">
														<li class="page_unselect"><a 
															onclick="listbox_moveacross('group_name','group_names')">&gt;&gt;</a>
															</li></ul>

															<!-- input type="submit" value=">>" onclick=""/> --> </br>
															<ul class="pagination">
																<li class="page_unselect"><a
																	onclick="listbox_moveacrossright('group_names','group_name')">&lt;&lt</a></li>
															</ul> <input type="submit" value="<<"" onclick="listbox_moveacross('group_names', 'group_name')"/>
												</td>
												<td>
												<p>Participant Joined Groups</p>
												<select id="group_names" name="group_name"
													multiple="multiple" class="input_cmbbx1">
														<c:forEach items="${groupnames}" var="group2"
															varStatus="status">

															<option value="${group2}" selected>${group2}</option>
														

														</c:forEach>
												</select> </br> <font color="Red" size="+1"><span id="spngrp"><form:errors
																path="participant.group_name"></form:errors> </span></font>
																
																</td>
											</tr></table>
											
 <div>Note:	To Select Multiple Groups use ctrl+click</div>	
											
 

                  </td>
                </tr>
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                </c:otherwise></c:choose>        
 --%>                
                
                </table>
                 <table align="right">
                 <tr>
                  <td valign="top" align="center">&nbsp;</td>
                  <td valign="top" align="left"><input type="submit" class="submit_btn2" value="Update Participant" onclick="return validate(this)"></td>
                <td valign="middle" style="padding-left:10px;" ><a href="viewparticipants" class="submit_btn" style="color:white ;font-size:14px;text-decoration: none;">Cancel</a>
               
                </tr>
              </table>
         
              
              </td>
  </tr>



</table>
             
           </div> </div></form>

      

<jsp:include page="footer.jsp"></jsp:include>