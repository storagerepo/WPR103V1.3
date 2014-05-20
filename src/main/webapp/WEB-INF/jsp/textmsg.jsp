<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="header.jsp"></jsp:include>
<form method="post" action="textMsgSettings">

	<div id="right_content">
		<table cellpadding="0" cellspacing="0" border="0" width="98%"
			class="margin_table">
<tr><td colspan="2">
		<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table" id="su" >

    <c:if test="${success==true}">
        <tr>
        <td valign="top" align="left" style="padding:5px 0 10px 0;">&nbsp;
            <div id="success_statusbar" class="status success">
            <p class="closestatus"><a title="Close" href="welcome">x</a></p>
            <p><img alt="Success" src="resources/images/icons/icon_success.png"><span>Success!</span>.</p>
          </div>
      </tr>
    </c:if>  
      
      </table> </td></tr>
			<tr>
				<td valign="top" align="left">
					<div>
						<div class="headings altheading">
							<h2>Text Message API Setting</h2>
						</div>
						<div class="contentbox">
							<table cellpadding="0" cellspacing="0" border="0" width="100%">
								<tr class="row1">
									<td valign="top" align="left" class="input_txt" colspan="2"><img
										src="resources/images/twillo.jpg" width="150px"></td>
								</tr>
								<c:set value="${form.textMsgSettings[0]}" var="textMsgSettings"> </c:set>
								<%-- <c:forEach items="${form.textMsgSettings}" var="textMsgSettings"
									varStatus="status"> --%>
									<tr class="row2">
										<td valign="middle" align="right" class="input_txt"
											width="30%"><span class="err">*</span> ACCOUNT SID :</td>
										<td valign="top" align="left" class="input_txt" width="70%">
											<input type="text" name="account_sid" class="input_txtbx"
											id="inp_id3" value="${textMsgSettings.account_sid }" /></br>
										<span class="err"><form:errors path="textMsgSettings.account_sid"></form:errors></span>
										</td>
									</tr>
									<tr class="row1">
										<td valign="middle" align="right" class="input_txt"><span
											class="err">*</span> AUTH TOKEN :</td>
										<td valign="top" align="left" class="input_txt"><input
											type="text" name="auth_token" class="input_txtbx" id="inp_id"
											value="${textMsgSettings.auth_token}" /></br>
										<span class="err"><form:errors path="textMsgSettings.auth_token"></form:errors></span></td>
									</tr>
									<tr class="row2">
										<td valign="middle" align="right" class="input_txt"><span
											class="err">*</span> NUMBER :</td>
										<td valign="top" align="left" class="input_txt"><input
											type="text" name="mob_num" class="input_txtbx" id="inp_id"
											value="${textMsgSettings.mob_num}" /></br>
										<span class="err"><form:errors path="textMsgSettings.mob_num"></form:errors></span></td>
									</tr>
									<!-- <tr class="row1">
										<td valign="top" align="right">&nbsp;</td>
										<td valign="top" align="left"><input type="submit"
											value="Save" class="submit_btn"></td>
									</tr> --><!--  -->
								<%-- </c:forEach> --%>
							</table>
							
							<table cellspacing="0" cellpadding="0" align="center" border="0" width="100%">
									<tr class="row1"> 
										<td valign="top" align="right" width="22%">&nbsp;</td>
										<td valign="top" align="right"><input type="submit"
											value="Save" class="submit_btn1"></td>											
											 <td> <a href="welcome" class="submit_btn1" style="color:white; text-decoration: none;font-size:14px;">Cancel</a></td><td width="40%"></td>
											
									</tr>
							
							</table>
							
							
						</div>
					</div>
				</td>
			</tr>
		</table>
	</div>
</form>

<jsp:include page="footer.jsp"></jsp:include>