<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
<title>Login Page</title> 
<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet"  type="text/css" />
<link href="<c:url value="/resources/css/home.css" />" rel="stylesheet"  type="text/css" />
<!-- <style>
.errorblock {
	color: #ff0000;
	background-color: #ffEEEE;
	border: 3px solid #ff0000;
	padding: 8px;
	margin: 16px;
}
</style> -->


</head>
<script type="text/javascript">
function validate(form)
{
	var UserName = document.getElementById("user").value;
	var PassWord = document.getElementById("pass").value;
	
	if(UserName == "" && PassWord == "")
	{
	document.getElementById("spnsub").value="submit";
    document.getElementById("spnsub").innerHTML = "*Required Field cannot be blank";
    return false;
	}
	else if (UserName == null || UserName == "") {
          document.getElementById("spnuser").value="user name";
          document.getElementById("spnuser").innerHTML = "*User name is required";
        return false;
    }
 
	else if (PassWord == "" || PassWord == null ) {
		document.getElementById("spnpass").value="password";
        document.getElementById("spnpass").innerHTML = "*password is required";
    	
        return false;
	}
    return true;
}
</script>
<body onload='document.f.j_username.focus();'>
	

	
	<script type="text/javascript">
	function validate(form)
	{
		var UserName = document.getElementById("user").value;
		var PassWord = document.getElementById("pass").value;
		
		if(UserName == "" && PassWord == "")
		{
		document.getElementById("spnsub").value="submit";
		 document.getElementById("spnuser").innerHTML = "*Required Field cannot be blank";
		 document.getElementById("spnpass").innerHTML = "*Required Field cannot be blank";
       // document.getElementById("spnsub").innerHTML = "*Required Field cannot be blank";
        return false;
		}
		else if (UserName == null || UserName == "") {
	          document.getElementById("spnuser").value="user name";
	          document.getElementById("spnuser").innerHTML = "*Required Field cannot be blank";
	        return false;
	    }
	 
		else if (PassWord == "" || PassWord == null ) {
			document.getElementById("spnpass").value="password";
	        document.getElementById("spnpass").innerHTML = "*Required Field cannot be blank";
	    	
	        return false;
		}
	    return true;
	}</script>
	<!-- <script type="text/javascript">
	function validate(form)
	{
		var UserName = document.getElementById("user").value;
		var PassWord = document.getElementById("pass").value;
		
		if(UserName == "" && PassWord == "")
		{
		document.getElementById("spnsub").value="submit";
        document.getElementById("spnsub").innerHTML = "*Required Field cannot be blank";
        return false;
		}
		else if ((UserName == null || UserName == "")&&(PassWord != "" || PassWord != null )) {
	          document.getElementById("spnuser").value="user name";
	          document.getElementById("spnpass").value="";
	          document.getElementById("spnuser").innerHTML = "*User name is required";
	          document.getElementById("spnsub").innerHTML = "";
	        return false;
	    }
	 
		else if ((PassWord == "" || PassWord == null )&&(UserName != null || UserName != "")) {
			document.getElementById("spnpass").value="password";
			 document.getElementById("spnuser").value="";
	        document.getElementById("spnpass").innerHTML = "*password is required";
	        document.getElementById("spnsub").innerHTML = "";
	    	
	        return false;
		}
	    return true;
	}</script>-->

	<form name='f' action="<c:url value='j_spring_security_check'/>" method='POST'>
		<div id="login_div">
		  <div class="login-top"></div>
		  <div class="login-center">
		 <c:if test="${providerRegsuccess==true}">
        <tr>
        <td valign="top" align="left" style="padding:5px 0 10px 0;">&nbsp;
            <div id="success_statusbar" class="status success">
            <p class="closestatus"><a title="Close" href="login">x</a></p>
            <p><img alt="Success" src="resources/images/icons/icon_success.png"><span>Contact administrator to activate your registration!!</span>.</p>
          </div>
      </tr>
    </c:if> 
		  <c:if test="${Regsuccess==true}">
        <tr>
        <td valign="top" align="left" style="padding:5px 0 10px 0;">&nbsp;
            <div id="success_statusbar" class="status success">
            <p class="closestatus"><a title="Close" href="login">x</a></p>
            <p><img alt="Success" src="resources/images/icons/icon_success.png"><span>Registration Successful!!</span>.</p>
          </div>
      </tr>
    </c:if> 
    <c:if test="${passwordsuccess==true}">
        <tr>
        <td valign="top" align="left" style="padding:5px 0 10px 0;">&nbsp;
            <div id="success_statusbar" class="status success">
            <p class="closestatus"><a title="Close" href="login">x</a></p>
            <p><img alt="Success" src="resources/images/icons/icon_success.png"><span>Password Send Successful!!</span>.</p>
          </div>
      </tr>
    </c:if> 
		  <c:if test="${not empty error}">
		<!-- <div class="errorblock"> -->
		<center><font color="red"><img alt="invalid login" src="resources/images/Close.png"><span>	${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}</span></font></center></img>

			
		
	</c:if>
		    <ul class="login-list">
		      <li><br>
		        <p>Enter Your Username</p>
		      </li>
		      <li>
		        <input type="text" class="inputbx" name="j_username" id="user" >
				<p><font color="Red">
				<span id="spnuser" ></span></font></p>
		      </li>
		      <li>
		        <p>Enter Your Password</p>
		      </li>
		      <li>
		        <input type="password" class="inputbx" name="j_password" id="pass"><br>
		        
				<p><font color="Red"><span id="spnpass" ></span></font></p>
		      </li>
		      <li><a href="#">
		         <span id="spnsub" ></span>
		        <input type="submit" class="submit-btn" value=" " name="submit"  onclick="return validate()">
		        
		        </a></li>
		      <li><a href="forgotpwd" class="forgot-password"></a></li>
		     <table>
		     <tr><td>
		     <li> <a href="showRegisterParticipant" font-color:"white" class="participant" style="text-decoration: none; border-bottom: 1px solid white">Register Participant</a>
		     </li>
		     </td><td width="100"></td>
		     <td>
		      <li> <a href="showRegisterProvider" font-color:"white" class="participant" style="text-decoration: none; border-bottom: 1px solid white">Register Provider</a>
		    </li></td></tr>
		     </table>
		      <!-- <li><input name="reset" type="reset" Value="Reset" class="reset-btn" /></li>
		      <li><a href="createuser">Register</a></li> -->
		    </ul>
		  </div>
		  <div class="login-bottom"></div>
		</div>
	</form>
	
	 
		      <input type="submit" value=""></form>
	
	
</body>
</html>