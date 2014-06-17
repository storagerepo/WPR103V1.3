<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet"
	type="text/css" />
<link href="<c:url value="/resources/css/inner-clr.css" />"
	rel="stylesheet" type="text/css" />
<div class="logo">
				<a href="#"><img src="<c:url value="/resources/images/logo_pink.png" />" alt="Company Logo" /></a>
			</div>


<head>
<title>:: Medical SMS ::</title>
</head>
<script type="text/javascript" src="resources/js/jquery-2.0.3.js"></script>
    <script type="text/javascript" src="resources/js/phone-number-validation.js"></script>
<script src="/bcresearchapp/resources/js/jquery.js"></script>
<script type="text/javascript">
$(window).load(function(){
var oldValue = "";
$("#inp_id3").keyup(function() {
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
              var numbers = $('#admin_mobile').val();
              if(numbers!='')
              {
              var result1 = validPhone(numbers);
              if (result1.valid === false) {
              	
              	document.getElementById("adminmobileerr").innerHTML="invalid phone number";
              	
              return false;
              }
              }
           
              }   
function clear()
{
	alert("in only");
var id1=document.getElementById("inp_id1");
var id2=document.getElementById("inp_id2");
var id3=document.getElementById("inp_id3");
var id4=document.getElementById("inp_id4");
id1.value="";
id2.value="";
id3.value="";
id4.value="";

}








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
   	       /*  if ($.trim(sEmail).length == 0) {
   	        	document.getElementById("padminerr").innerHTML="Required Field Should not be empty";
   	        }
   	        */
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
      
</script>

<form method="POST" action="registerprovider" modelAttribute="adminuser">
  <div id="right_content">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <tr>
        <td valign="top" align="left" style="padding:5px 0 10px 0;">
                      
                      
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
              <h2>Register Provider</h2>
            </div>
            <div class="contentbox">
            <c:choose>
						<c:when test="${empty admin}">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
              
                             <tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>First Name :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="admin_firstname" class="input_txtbx" id="inp_id1" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /></br><span class="err"><form:errors path="adminuser.admin_firstname"></form:errors></span></td>
                </tr>
		
                <tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>User Name :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="admin_username" class="input_txtbx" id="inp_id2" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /></br><span class="err"><c:if test="${user_exists==true}"><c:out value="user already exist"/></c:if><form:errors path="adminuser.admin_username"></form:errors></span></td>
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
                  <td valign="top" align="left" class="input_txt"><input type="text" name="admin_mobile"  maxlength="10"  class="input_txtbx" id="admin_mobile" value="" /><br><font color="Red" size="+1"><span id="adminmobileerr"></span><span id="err"><c:if test="${mobile_exists==true}"><c:out value="mobile number  already exist"/></c:if><form:errors path="adminuser.admin_mobile"></form:errors></span></td>
                </tr>
                <tr class="row2">
                  <td valign="middle" align="right" class="input_txt"><span class="err">*</span>Primary E-mail id :</td>
                  <td valign="top" align="left" class="input_txt"><input type="text" name="admin_email" class="input_txtbx" id="admin_email" value="" /><br><font color="Red" size="+1"><span id="padminerr"><c:if test="${email_exist==true}"><c:out value="Email Id  already exist"/></c:if><form:errors path="adminuser.admin_email"></form:errors></span></font></td>
                </tr> 
                  <tr class="row2">
                  <td valign="middle" align="right" class="input_txt"><span class="err"></span>Secondary E-mail id :</td>
                  <td valign="top" align="left" class="input_txt"><input type="text" name="secondary_email" class="input_txtbx" id="secondary_email" value="" /><br><font color="Red" size="+1"><span id="sadminerr"><c:if test="${email_exist==true}"><c:out value="Email Id  already exist"/></c:if><form:errors path="adminuser.admin_email"></form:errors></span></font></td>
                </tr> 
                  <table align="left">
                  <tr valign="center">
                  <td valign="middle" style="padding-left:400px;"><input type="submit" class="submit_btn" onclick="return checkmail('this.value')" id="register" value="Register"></td>
				  <td valign="middle" style="padding-left:20px;"><input type="reset" value="Reset" class="submit_btn"></td>
		    	  <td valign="middle" style="padding-left:20px;"><a href="login" class="submit_btn" style="color:white">Cancel</a></td>
		          </tr>
				  </table>
             
              
              </table>
              </c:when>
              <c:otherwise>
              
               <table cellpadding="0" cellspacing="0" border="0" width="100%">
              
                             <tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>First Name :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="admin_firstname" class="input_txtbx" id="inp_id1" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${admin.admin_firstname}" /></br><span class="err"><font color="Red" size="+1"><form:errors path="adminuser.admin_firstname"></form:errors></span></td>
                </tr>
		
                <tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>User Name :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="admin_username" class="input_txtbx" id="inp_id2" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${admin.admin_username}" /></br><span class="err"><font color="Red" size="+1"><c:if test="${user_exists==true}"><c:out value="User already exist"/></c:if><form:errors path="adminuser.admin_username"></form:errors></span></td>
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
                  <td valign="top" align="left" class="input_txt"><input type="text" name="admin_mobile" class="input_txtbx"  maxlength="10"  id="admin_mobile" value="${admin.admin_mobile}" /><br>  <span class="err"><font color="Red" size="+1"><span id="adminmobileerr"><c:if test="${mobile_exists==true}"><c:out value="Mobile number  already exist"/></c:if><form:errors path="adminuser.admin_mobile"></form:errors></span></span></td>
                </tr>
                <tr class="row2">
                  <td valign="middle" align="right" class="input_txt"><span class="err">*</span>Primary E-mail id:</td>
                  <td valign="top" align="left" class="input_txt"><input type="text" name="admin_email" class="input_txtbx" id="admin_email" value="${admin.admin_email}" /><br><font color="Red" size="+1"><span id="padminerr">
                  <c:choose><c:when test="${empty admin.admin_email}"></c:when><c:otherwise>
                  <c:if test="${email_exist==true}"><c:out value="Email Id  already exist"/></c:if>
                  </c:otherwise>  </c:choose>
                  <form:errors path="adminuser.admin_email"></form:errors></span></td>
            
                </tr>
                <tr class="row2">
                  <td valign="middle" align="right" class="input_txt"><span class="err"></span>Secondary E-mail id :</td>
                  <td valign="top" align="left" class="input_txt">
                   
                  <input type="text" name="secondary_email" class="input_txtbx" id="secondary_email" value="${admin.secondary_email}" /><br>
                  <font color="Red" size="+1">
                  <span id="sadminerr">
                  <c:choose><c:when test="${empty admin.secondary_email}"></c:when><c:otherwise>
                  <c:if test="${email_exist==true}"><c:out value="Email Id  already exist"/></c:if>
                   </c:otherwise></c:choose>
                  <form:errors path="adminuser.secondary_email"></form:errors></span>
                 
                  </td>
                </tr> 
		
</td>
                </tr>
                 
             <table>
                  <tr align="center">
                  <td valign="middle"  style="padding-left:400px;"><input type="submit" class="submit_btn" onclick="return checkmail('this.value')" id="register" value="Register"></td>
							<td valign="middle" style="padding-left:50px;"><a href="showRegisterProvider" class="submit_btn" style="color:white">Reset</a></td>
							<td valign="middle" width="25%"><a href="login" class="submit_btn" style="color:white">Cancel</a></td>
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
