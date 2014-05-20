<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="header.jsp"></jsp:include>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Change password</title>
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
</head>
<body>

<form method="post" action="changePassword">
  <div id="right_content">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <tr>
        <!-- <td valign="top" align="left" style="padding:5px 0 10px 0;">
		<div class="status success">
            <p class="closestatus"><a title="Close" href="">x</a></p>
            <p><img alt="Success" src="images/icons/icon_success.png"><span>Success!</span></p>
          </div></td> -->
      </tr>
      <tr>
        <td valign="top" align="left"><div>
            <div class="headings altheading">
              <h2>Change My Password</h2>
            </div>
            <div class="contentbox">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
               
									
                <tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span> Old Password :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="password" name="current_pwd" class="input_txtbx" id="inp_id3" value=""/></br><span class="err"><c:if test="${password_mismatch=='true'}"><c:out value="Incorrect Password"></c:out></c:if><form:errors path="updatePwds.current_pwd" ></form:errors></span></td>
                </tr>
                     <tr class="row1">
                  <td valign="middle" align="right" class="input_txt"><span class="err">*</span> New Password :</td>
                  <td valign="top" align="left" class="input_txt"><input type="password" name="new_pwd" class="input_txtbx" id="pass1" value="" /></br><span class="err"><c:if test="${retype_mismatch=='true' }"><c:out value="Password mismatch with retype password"></c:out></c:if><form:errors path="updatePwds.new_pwd"></form:errors></span></td>
                </tr>
		<tr class="row2">
                  <td valign="middle" align="right" class="input_txt"><span class="err">*</span> Retype Password :</td>
                  <td valign="top" align="left" class="input_txt"><input type="password" name="retype_new_pwd" class="input_txtbx" id="pass2" value=""/></br><span class="err"><form:errors path="updatePwds.retype_new_pwd"></form:errors></span></td>
                </tr>
		
                 
                
                  <table align="left">
                  <tr>
                  <td valign="middle"  style="padding-left:500px;"><input type="submit" value="Save" class="submit_btn"></td>
                <td valign="middle" style="padding-left:10px;"><a href="changepassword" class="submit_btn" style="color:white">Reset</a></td>
							<td valign="middle" style="padding-left:10px;"><a href="welcome" class="submit_btn" style="color:white">Cancel</a></td>
                </tr>
              </table>
              
            </div>
          </div></td>
      </tr>
      </table>
      </div>
</form>
  </body>
  </html>
   <jsp:include page="footer.jsp"></jsp:include>   
