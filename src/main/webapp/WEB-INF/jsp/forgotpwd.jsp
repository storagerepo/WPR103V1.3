<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>:: Medical SMS ::</title>
<link href="resources/css/style.css"  rel="stylesheet" type="text/css" />
<link href="resources/css/home.css" rel="stylesheet" type="text/css" />
</head>
<body>
<form name="login" action="sendforgotpassword" method="post">

<div id="login_div">
  <div class="login-top"></div>
  <div class="login-center">
    <ul class="login-list">
    <!--  <li style="padding-bottom:15px; margin-left:70px;">
        <input type="radio" />
        Admin
        <input type="radio" />
        Accounts
        <input type="radio" />
        Marketing</li>-->

      <li>
       <c:if test="${not empty error}">
        <div class="error_div"><img src="resources/images/Close.png" width="16" height="16" alt="error" /><b><c:out value="${error}"></c:out></b></div>
        </c:if>
      </li>

      <li>
        <p>Enter Your Email Id</p>
      </li>
      <li>
        <input type="text" class="inputbx" name="email_id" />
	 <p><font color="Red"></font></p>
      </li>
      
      
      <li><a href="#">
        <input type="submit" class="submit-btn" value="" />
        </a></li>
      <li><p><a href="login" style="color:White;">Back</a></p></li>
    </ul>
  </div>

  <div class="login-bottom"></div>
</div>

</form>
</body>
</html>