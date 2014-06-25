<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="header.jsp"></jsp:include>
<html>
<head>
</head>
<script type="text/javascript" src="resources/js/jquery-2.0.3.js"></script>
    <script type="text/javascript" src="resources/js/phone-number-validation.js"></script>
<script src="/bcresearchapp/resources/js/jquery.js"></script>
<script type="text/javascript">
$(window).load(function(){
var oldValue = "";
$("#inp_id").keyup(function() {
	$("#err").html('');
	var intRegex = /^\d+$/;
	if(intRegex.test($(this).val())||$(this).val()=='') 
	{
		var $in = $(this).val();
		var $newdiv="";
	  var $i=0;
	  if($in.length>10)
		  {
		  $("#err").html('Mobile number is not valid. Should be of length 10!!');		
		   }	
			
	}
	else if($(this).val()!='')
		{
		
		$("#err").html('Kindly give numbers only!!');
		}
}).keydown(function() {
    oldValue = $(this).val();
})
});
</script>


<script type="text/javascript">
function validate()
{
var password1=document.getElementById("pass1");
var password2=document.getElementById("pass2");


if(password1.value == password2.value)
{
    return true;
}

else {
    alert("Passwords Do Not Match!");	
    return false;
}
}
</script>
 <script>
 
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
 $(document).ready(function() {
	   $('#register').click(function() {
			document.getElementById("padminerr").innerHTML="";
	   		document.getElementById("sadminerr").innerHTML="";
		    var sEmail = $('#admin_email').val();
	        var hmail=$('#secondary_email').val();
	        if ($.trim(sEmail).length == 0) {
	        	document.getElementById("padminerr").innerHTML="";
	        }
	       
	        if(sEmail!='')
	        	{
	        if (validateEmail(sEmail)) {	        
	        	                
	        }
 
	        else{
	        	document.getElementById("padminerr").innerHTML="Invalid EmailId";	          
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
	        	document.getElementById("sadminerr").innerHTML="Invalid EmailId";	          
	            return false;
	            e.preventDefault();
	        		}
	        	}

	    });

	});

 
              function checkmail()
              {  
            	  
            	  
              var p=document.getElementById("admin_email").value; 
              var s=document.getElementById("secondary_email").value; 
                     	
            	if(p!="" && s!="")
            	{
            	if(p==s)
            		{
            		alert("Please Give Different E-Mail id");
            		return false;
            		}
              } 
            /* 	var numbers = $('#admin_mobile').val();
            	if(numbers!='')
            	{
            	var result1 = validPhone(numbers);
            	if (result1.valid === false) {
            		
            		document.getElementById("adminmobileerr").innerHTML="invalid phone number";
            		
            	return false;
            	}
            	}	 */
            	
            	
              }      </script>
                 



<form method="POST" action="addadminuser"  onSubmit="validate();">
  <div id="right_content">
   <c:choose>
						<c:when test="${empty admin}">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <tr>
        <td valign="top" align="left" style="padding:5px 0 10px 0;"><!--<div class="info_div">
            <label><img src="images/icons/icon_edit.png" alt="Edit" /> Edit</label>
            <label><img src="images/icons/icon_approve.png" alt="Approve" /> Approve</label>
            <label><img src="images/icons/icon_unapprove.png" alt="Unapprove" /> Unapprove</label>
            <label><img src="images/icons/icon_delete.png" alt="Delete" /> Remove</label>
          </div>
		<div class="status error">
            <p class="closestatus"><AJDF:output>foreach name=err item=err from=$errmsg</AJDF:output><a href="" title="Close">x</a></p>
            <p><img src="images/icons/icon_error.png" alt="Error" /><span>Error!</span> 
                      </div></td>-->
                      
                      
                      <c:if test="${success==true}">
        <tr>
        <td valign="top" align="left" style="padding:5px 0 10px 0;">&nbsp;
            <div id="success_statusbar" class="status success">
            <p class="closestatus"><a title="Close" href="">x</a></p>
            <p><img alt="Success" src="resources/images/icons/icon_success.png"><span>Success!</span>.</p>
          </div>
      </tr>
    </c:if>  
                      
                      
                      
                      
      </tr>
      <tr>
        <td valign="top" align="left"><div>
            <div class="headings altheading">
              <h2>Add Provider</h2>
            </div>
            <div class="contentbox">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
              
                             <tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>First Name :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" min="4" maxlength="32"  name="admin_firstname" class="input_txtbx" id="inp_id3" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /></br><span class="err"><form:errors path="adminuser.admin_firstname"></form:errors></span></td>
                </tr>
		
                <tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>User Name :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="admin_username" min="4" maxlength="32"  class="input_txtbx" id="inp_id3" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /></br><span class="err"><form:errors path="adminuser.admin_username"></form:errors></span></td>
                </tr>
              <%--   <tr class="row2">
                  <td valign="middle" align="right" class="input_txt"><span class="err">*</span> Password :</td>
                  <td valign="top" align="left" class="input_txt"><input type="password" name="admin_password" class="input_txtbx" id="pass1" value="" /></br><span class="err"><form:errors path="adminuser.admin_password"></form:errors></span></td>
                </tr>
		<tr class="row1">
                  <td valign="middle" align="right" class="input_txt"><span class="err">*</span> Retype password :</td>
                  <td valign="top" align="left" class="input_txt"><input type="password" name="repassword" class="input_txtbx" id="pass2" value="" /></br><span class="err" id="spnsub_pass"></span></td>
                </tr> --%>
		<tr class="row1">
                  <td valign="middle" align="right" class="input_txt"><span class="err">*</span> Mobile :</td>
                  <td valign="top" align="left" class="input_txt"><input type="text" name="admin_mobile" class="input_txtbx" maxlength="17"  id="admin_mobile" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /></br><font color="Red" size="+1"><span id="adminmobileerr" ><c:if test="${invalid=='error'}"><c:out value="Invalid Mobile Number"/></c:if><form:errors path="adminuser.admin_mobile"></form:errors></span></span></td>
                </tr>
                <tr class="row2">
                  <td valign="middle" align="right" class="input_txt"><span class="err">*</span> Primary E-mail id :</td>
                  <td valign="top" align="left" class="input_txt"><input type="text" name="admin_email" class="input_txtbx" id="admin_email" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /></br><font color="Red" size="+1"><span id="padminerr" ><form:errors path="adminuser.admin_email"></form:errors></span></font></td>
                </tr>
                   <tr class="row2">
                  <td valign="middle" align="right" class="input_txt"><span class="err"></span>Secondary E-mail id :</td>
                  <td valign="top" align="left" class="input_txt"><input type="text" name="secondary_email" class="input_txtbx" id="secondary_email" value="" /><br></br><font color="Red" size="+1"><span id="sadminerr"><c:if test="${semail_exist==true}"><c:out value="Email Id  already exist"/></c:if><form:errors path="adminuser.secondary_email"></form:errors></span></font></td>
                </tr> 
		
</td>
                </tr>
                 
                 <tr class="row1">
                 <table align="left"><tr><td valign="middle"  style="padding-left:400px;"><input type="submit" class="submit_btn" onclick="return checkmail('this.value')" value="Register" id="register"></td>
							<td valign="middle" style="padding-left:10px;"><input type="reset" value="Reset" class="submit_btn"></td>
							<td valign="middle" style="padding-left:10px;"><a href="viewadminuser" class="submit_btn" style="color:white">Cancel</a></td></tr></table>
					
              </tr>
              </table>
            </c:when>
              <c:otherwise>
              <tr>
        <td valign="top" align="left"><div>
            <div class="headings altheading">
              <h2>Add Provider</h2>
            </div>
            <div class="contentbox">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
              
               <table cellpadding="0" cellspacing="0" border="0" width="100%">
              
                             <tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>First Name :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text"  min="4" maxlength="32" name="admin_firstname" class="input_txtbx" id="inp_id3" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${admin.admin_firstname}" /></br><span class="err"><form:errors path="adminuser.admin_firstname"></form:errors></span></td>
                </tr>
		
                <tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>User Name :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="admin_username" min="4" maxlength="32"  class="input_txtbx" id="inp_id3" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${admin.admin_username}" /></br><span class="err"><font color="Red" size="+1"><c:if test="${user_exists==true}"><c:out value="user already exist"/></c:if><form:errors path="adminuser.admin_username"></form:errors></span></td>
                </tr>
                <%-- <tr class="row1">
                  <td valign="middle" align="right" class="input_txt"><span class="err">*</span> Password :</td>
                  <td valign="top" align="left" class="input_txt"><input type="password" name="admin_password" class="input_txtbx" id="pass1" value="" /></br><span class="err"><form:errors path="adminuser.admin_password"></form:errors></span></td>
                </tr>
		<tr class="row2">
                  <td valign="middle" align="right" class="input_txt"><span class="err">*</span> Retype password :</td>
                  <td valign="top" align="left" class="input_txt"><input type="password" name="repassword" class="input_txtbx" id="pass2" value="" /></br><span class="err" id="spnsub_pass"></span></td>
                </tr> --%>
		<tr class="row1">
                  <td valign="middle" align="right" class="input_txt"><span class="err">*</span> Mobile :</td>
                  <td valign="top" align="left" class="input_txt"><input type="text" name="admin_mobile"  maxlength="17"  class="input_txtbx" id="admin_mobile" value="${admin.admin_mobile}" /><br><font color="Red" size="+1"><c:if test="${invalid=='error'}"><c:out value="Invalid Mobile Number"/></c:if><span id="adminmobileerr"><c:if test="${mobile_exists==true}"><c:out value="mobile number  already exist"/></c:if><form:errors path="adminuser.admin_mobile"></form:errors></span></td>
                </tr>
                <tr class="row2">
                  <td valign="middle" align="right" class="input_txt"><span class="err">*</span>Primary E-mail id :</td>
                  <td valign="top" align="left" class="input_txt"><input type="text" name="admin_email" class="input_txtbx" id="admin_email" value="${admin.admin_email}" />
                   <br><font color="Red" size="+1"><span id="padminerr">
                   <c:choose><c:when test="${empty admin.admin_email}"></c:when><c:otherwise>
                  <c:if test="${email_exist==true}"><c:out value="Email Id  already exist"/></c:if>
                  </c:otherwise>  </c:choose>                  
              <form:errors path="adminuser.admin_email"></form:errors></span></td>
                </tr>
		   <tr class="row2">
                  <td valign="middle" align="right" class="input_txt"><span class="err"></span>Secondary E-mail id :</td>
                  <td valign="top" align="left" class="input_txt"><input type="text" name="secondary_email" class="input_txtbx" id="secondary_email" value="${admin.secondary_email}" /><br><font color="Red" size="+1"><span id="sadminerr">
                   <c:choose><c:when test="${empty admin.secondary_email}"></c:when><c:otherwise>
                  <c:if test="${semail_exist==true}"><c:out value="Email Id  already exist"/></c:if>
                  </c:otherwise>  </c:choose>                  
                 <form:errors path="adminuser.secondary_email"></form:errors></span></td>
                </tr> 
</td>
                </tr>
                 
                 <tr class="row1">
                
                 
                 <table align="left"><tr><td valign="middle" style="padding-left:410px;" ><input type="submit" class="submit_btn" id="register"  value="Register" onclick="return checkmail('this.value')"></td>
							<td valign="middle" style="padding-left:10px;"><a href="showaddadminuser" class="submit_btn" style="color:white">Reset</a></td>
							<td valign="middle" style="padding-left:10px;"><a href="viewadminuser" class="submit_btn" style="color:white">Cancel</a></td></tr></table>
					
              </tr>
              </table>
              
              
              
              </c:otherwise>
              </c:choose>
            </div>
          </div></td>
      </tr>
      </table>
      </div>
      
</form>
</html>
      <jsp:include page="footer.jsp"></jsp:include>
