<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="register.jsp"></jsp:include>

<div id="right_content">
<sf:form action="submituser" method="POST" modelAttribute="userProfile">         
   <fieldset> 
  <table cellpadding="0" cellspacing="0" border="0" width="98%"
			class="margin_table">
			<%-- <c:out value="${success}"/> --%>
			<tr>
<td valign="top" align="left">
        	<div>
	            <div class="headings altheading">
	              <h2>Create a free account</h2>
	      </div>
	       </div>
	        <div class="contentbox">
            
              <table cellpadding="0" cellspacing="0" border="0" width="100%">       
	            
	            
	            
      <tr class="row1">
         <td  valign="middle" align="left" class="input_txt"><sf:label path="fullName">Full name:</sf:label></td>
         <td valign="top" align="left" class="input_txt"><sf:input path="fullName" size="30" /><br/>
             <font color="Red" size="+1"><span id="spnfullname" ><sf:errors path="fullName"></sf:errors> </span></font>
         </td>
      </tr>
      <tr class="row2">
         <td  valign="middle" align="left" class="input_txt"><sf:label path="username">Username:</sf:label></td>
         <td valign="top" align="left" class="input_txt"><sf:input path="username" size="30" maxlength="15" /><br/>
         <font color="Red" size="+1"><span id="spnusername" ><c:if test="${username_exist==true}"><c:out value="User Name already exist"/></c:if><sf:errors path="username"></sf:errors> </span></font>
             <!--  <small id="username_msg">No spaces, please.</small><br/>
             
 -->
            </td>
      </tr>
      <tr class="row1">
         <td  valign="middle" align="left" class="input_txt"><sf:label path="password">Password:</sf:label></td>
         <td valign="top" align="left" class="input_txt"><sf:password path="password" size="30" 
                            showPassword="true"/> <br/>
                            <font color="Red" size="+1"><span id="spnpassword" ><sf:errors path="password"></sf:errors> </span></font>
           <!--   <small>6 characters or more (be tricky!)</small><br/>
              -->
            </td>
      </tr>

      <tr class="row2">
         <td  valign="middle" align="left" class="input_txt"><sf:label path="email">Email Address:</sf:label></td>

         <td valign="top" align="left" class="input_txt"><sf:input path="email" size="30"/> <br/>
         <font color="Red" size="+1"><span id="spnEmail" ><sf:errors path="email"></sf:errors> </span></font>
           <!--   <small>In case you forget something</small><br/>-->
             
            </td>
      </tr>
      <!--<start id="image_field"/>--> 
      <tr class="row1">
        <td  valign="middle" align="left" class="input_txt"><label for="image">Profile image:</label></td>
        <td valign="top" align="left" class="input_txt"><input name="image" type="file"/>
      </tr>
      <!--<end id="image_field"/>--> 
      <tr class="row2">
         <td></td>
         <td valign="top" align="left" class="input_txt">
            <sf:checkbox path="updateByEmail"/>
            <sf:label path="updateByEmail" 
            >Send me email updates!</sf:label>

         </td>
      </tr>
      <tr class="row1">
         <td></td>
         <td valign="top" align="left" class="input_txt"><input name="commit" type="submit" 
                    value="I accept. Create my account." /></td>
      </tr>
      
      </table>
      </div>
     
      </td>
      </tr>
      
   </table>
</fieldset>
</sf:form>
</div>
<jsp:include page="footer.jsp"></jsp:include>
