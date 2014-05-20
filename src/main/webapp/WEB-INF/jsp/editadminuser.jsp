<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="header.jsp"></jsp:include>

<form method="POST" action="updateadminuser">
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
              <h2>Edit Provider Details</h2>
            </div>
            
            <div class="contentbox">
            
             <table cellpadding="0" cellspacing="0" border="0" width="100%">
            
            <c:set value="${adminuserForm.adminuser[0]}" var="adminuser"/>
            
             
                
                <tr class="row1">
                <input type="hidden" name="admin_id" class="input_txtbx" id="inp_id3"  value="${adminuser.admin_id}" />
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span> First Name :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="hidden" name="admin_username" class="input_txtbx" id="inp_id3" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${adminuser.admin_username }" /><input type="text" name="admin_firstname" class="input_txtbx" id="inp_id3" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${adminuser.admin_firstname }" /></br><span class="err"><form:errors path="adminuser.admin_username"></form:errors></span></td>
                </tr>
		<tr class="row2">
                  <td valign="middle" align="right" class="input_txt"><span class="err">*</span>Primary E-mail id:</td>
                  <td valign="top" align="left" class="input_txt"><input type="text" name="admin_email" class="input_txtbx" id="admin_email" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${adminuser.admin_email }" /></br><span class="err"><font color="Red" size="+1"><c:if test="${email_exist==true}"><c:out value="Email Id  already exist"/></c:if><form:errors path="adminuser.admin_email"></form:errors></span></td>
                </tr>
                <tr class="row2">
                  <td valign="middle" align="right" class="input_txt"><span class="err"></span>Secondary E-mail id:</td>
                  <td valign="top" align="left" class="input_txt"><input type="text" name="secondary_email" class="input_txtbx" id="secondary_email" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${adminuser.secondary_email}" /></br><span class="err"><font color="Red" size="+1"><c:if test="${semail_exist==true}"><c:out value="Email Id  already exist"/></c:if><form:errors path="adminuser.secondary_email"></form:errors></span></td>
                </tr>
               <!-- <tr class="row2">
                   <td valign="middle" align="right" class="input_txt"><span class="err">*</span> Password :</td>
                  <td valign="top" align="left" class="input_txt"> --><input type="hidden" name="admin_password" class="input_txtbx" id="inp_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${adminuser.admin_password }" /></br><span class="err"><form:errors path="adminuser.admin_password"></form:errors></span></td>
               <!--  </tr>
		<tr class="row1">
                  <td valign="middle" align="right" class="input_txt"><span class="err">*</span> Retype password :</td>
                  <td valign="top" align="left" class="input_txt"> --><input type="hidden" name="repassword" class="input_txtbx" id="inp_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /></br><span class="err"></span></td>
               <!--  </tr> -->
		<tr class="row1">
                  <td valign="middle" align="right" class="input_txt"><span class="err">*</span> Mobile :</td>
                  <td valign="top" align="left" class="input_txt"><input type="text" name="admin_mobile" class="input_txtbx" id="inp_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${adminuser.admin_mobile }" /></br><span class="err"><form:errors path="adminuser.admin_mobile"></form:errors></span></td>
                </tr>
                </table><table cellspacing="0" cellpadding="0" border="0" width="100%">
                 <tr class="row1">  
                               
                  <td valign="top" align="right"><input type="submit" value="Update Provider" class="submit_btn2" onclick="return checkmail('this.value')"></td>
                   <td valign="top" align="left"><a href="viewadminuser" class="submit_btn1" style="color:white;text-decoration: none; font-size:14px;">Cancel</a></td>
               <td width="22%"></td>
                </tr>
              </table>
              </div>
              </div>
              </td>
              </tr>
              </table>
             
              </div>
              <script>
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
              }
              
              </script>
              
              
              
              
              
         
      
</form>
      <jsp:include page="footer.jsp"></jsp:include>
