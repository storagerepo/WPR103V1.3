<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script language="javascript" type="text/javascript"
	src="resources/js/tinymce_2_1_1_1/tinymce/jscripts/tiny_mce/tiny_mce.js"></script>

<jsp:include page="header.jsp"></jsp:include>
<html>
<head>
<script type="text/javascript">
	tinyMCE
			.init({
				// General options
				mode : "exact",
				elements : "inp_id5",
				theme : "advanced",

				plugins : "safari,pagebreak,style,layer,table,save,advhr,advimage,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template",

				// Theme options
				//theme_advanced_buttons1 : "save,newdocument,|,bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,|,styleselect,formatselect,fontselect,fontsizeselect",
				theme_advanced_buttons1 : "bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,|,formatselect,fontselect,fontsizeselect",
				//theme_advanced_buttons2 : "cut,copy,paste,pastetext,pasteword,|,search,replace,|,bullist,numlist,|,outdent,indent,blockquote,|,undo,redo,|,link,unlink,anchor,image,cleanup,help,code,|,insertdate,inserttime,preview,|,forecolor,backcolor",
				theme_advanced_buttons2 : "search,replace,|,bullist,numlist,|,outdent,indent,blockquote,|,undo,redo,|,link,unlink,anchor,image,cleanup,code,|,insertdate,inserttime,preview,|,forecolor,backcolor",
				//theme_advanced_buttons3 : "tablecontrols,|,hr,removeformat,visualaid,|,sub,sup,|,charmap,emotions,iespell,media,advhr,|,print,|,ltr,rtl,|,fullscreen",
				theme_advanced_buttons3 : "tablecontrols,|,hr,removeformat,visualaid,|,sub,sup,|,charmap,emotions,iespell,advhr,|,print,|,ltr,rtl,|",
				//theme_advanced_buttons4 : "insertlayer,moveforward,movebackward,absolute,|,styleprops,|,cite,abbr,acronym,del,ins,attribs,|,visualchars,nonbreaking,template,pagebreak",
				theme_advanced_buttons4 : "pagebreak",
				theme_advanced_toolbar_location : "top",
				theme_advanced_toolbar_align : "left",
				theme_advanced_statusbar_location : "bottom",
				theme_advanced_resizing : true,

				// Example content CSS (should be your site CSS)
				content_css : "css/content.css",

				// Drop lists for link/image/media/template dialogs
				template_external_list_url : "lists/template_list.js",
				external_link_list_url : "lists/link_list.js",
				external_image_list_url : "lists/image_list.js",
				media_external_list_url : "lists/media_list.js",

			});
</script>
<script type="text/javascript">
	function showmailtemp1(str) {

		if (str == "") {
			document.getElementById("txtHint").innerHTML = "";
			return;
		}
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
			xmlhttp = new XMLHttpRequest();
		} else {// code for IE6, IE5
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				document.getElementById("txtHint").innerHTML = xmlhttp.responseText;
			}
		}

		var url = "?do=selectmailtemp&mail_id=" + str;

		xmlhttp.open("GET", url, true);
		xmlhttp.send();
	}

	function showmailtemp(str) {
		window.location = "?do=addmailtemplate&id=" + str;
	}
</script>
</head>
<body>
	<form name="templates" action="showmailtempates" method="post">
		<div id="right_content">

			<table cellpadding="0" cellspacing="0" border="0" width="98%"
				class="margin_table">

				<tr>

					<td valign="top" align="left" style="padding: 5px 0 10px 0;">
						<div class="status success">
							<p class="closestatus">
								<a title="Close" href="">x</a>
							</p>
							<p>
								<img alt="Success" src="resources/images/icons/icon_success.png"><span>Success!</span>
							</p>
						</div>
					</td>

				</tr>
				<tr>

					<td valign="top" align="left"><div>

							<div class="headings altheading">

								<h2>Mail Templates</h2>

							</div>

							<div class="contentbox">

							 <c:set value="${mailTemplateForm.mailTemplateDetails[0]}" var="mailTemplateDetails"/>
								
									<%-- <table cellpadding="0" cellspacing="0" border="0" width="100%">

										<tr class="row1">

											<td valign="middle" align="right" class="input_txt"
												width="30%"><span class="err">*</span> Mail Template
												Name :</td>

											<td valign="top" align="left" class="input_txt" width="70%">
												<select name="select" class="input_cmbbx"
												onchange="showmailtemp(this.value)">
													<option value="welcomeadminuser">Welcome Admin
														User</option>

													<option value="forgetpassword" selected="selected">Forgot
														Password</option>

													<option value="youraccountsuspend" selected="selected">Your
														Account Suspened</option>

													<option value="youraccountactivated" selected="selected">Your
														Account Activated</option>

													<option value="youraccountdeletes" selected="selected">Your
														Account Deleted</option>

											</select></br> <span id="spnmtn"></span>
											</td>

										</tr>
									</table>

									<table cellpadding="0" cellspacing="0" border="0" width="100%">
										<tr>
											<TD>
												<div id="txtHint">
													<table cellpadding="0" cellspacing="0" border="0"
														width="100%">
														<c:forEach items="${mailTemplateForm.mailTemplateDetails}"
														var="mailTemplateDetails" varStatus="status">
														<tr class="row2">

															<td valign="middle" align="right" class="input_txt"
																width="30%"><span class="err">*</span> Subject :</td>

															<td valign="top" align="left" class="input_txt"
																width="70%"><input type="text" name="subject"
																class="input_txtbx" id="inp_id3"
																onmouseover="showTooltip('tooltip_id','inp_id3');"
																onmouseout="hideTooltip('tooltip_id');"
																value="${mailTemplateDetails.mail_subject}" /></br> <span
																class="err" id="spnsjt"></span></td>

														</tr> --%>
				<table cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
											<TD>
												<div id="txtHint">
													<table cellpadding="0" cellspacing="0" border="0"
														width="100%">
																								

														<tr class="row1">

															<td valign="middle" align="right" class="input_txt"
																width="30%"><span class="err">*</span> From Name :</td>

															<td valign="top" align="left" class="input_txt"
																width="70%"><input type="text" name="fname"
																class="input_txtbx" id="inp_id"
																onmouseover="showTooltip('tooltip_id','inp_id3');"
																onmouseout="hideTooltip('tooltip_id');"
																value="${mailTemplateDetails.from_name}" /></br> <span
																class="err" id="spnfn"></span></td>

														</tr>

														<tr class="row2">

															<td valign="middle" align="right" class="input_txt"
																width="30%"><span class="err">*</span> From Email :</td>

															<td valign="top" align="left" class="input_txt"
																width="70%"><input type="text" name="fmail"
																class="input_txtbx" id="inp_id"
																onmouseover="showTooltip('tooltip_id','inp_id3');"
																onmouseout="hideTooltip('tooltip_id');"
																value="${mailTemplateDetails.from_mail}" /></br> <span
																class="err" id="spnfem"></span></td>

														</tr>

														<tr class="row1">

															<td valign="middle" align="right" class="input_txt"
																width="30%"><span class="err">*</span> Reply to
																Email :</td>

															<td valign="top" align="left" class="input_txt"
																width="70%"><input type="text" name="rmail"
																class="input_txtbx" id="inp_id"
																onmouseover="showTooltip('tooltip_id','inp_id3');"
																onmouseout="hideTooltip('tooltip_id');"
																value="${mailTemplateDetails.replay_mail}" /></br> <span
																class="err" id="spnrte"></span></td>

														</tr>

														<tr class="row2">

															<td valign="middle" align="right" class="input_txt"
																width="30%"><span class="err">*</span> SMTP
																Servername :</td>

															<td valign="top" align="left" class="input_txt"
																width="70%"><input type="text" name="smtp"
																class="input_txtbx" id="inp_id"
																onmouseover="showTooltip('tooltip_id','inp_id3');"
																onmouseout="hideTooltip('tooltip_id');"
																value="${mailTemplateDetails.smtp_servername}" /></br> <span
																class="err" id="spnssn"></span></td>

														</tr>

														<tr class="row1">

															<td valign="middle" align="right" class="input_txt"
																width="30%"><span class="err">*</span> Port :</td>

															<td valign="top" align="left" class="input_txt"
																width="70%"><input type="text" name="port"
																class="input_txtbx" id="inp_id"
																onmouseover="showTooltip('tooltip_id','inp_id3');"
																onmouseout="hideTooltip('tooltip_id');"
																value="${mailTemplateDetails.port}" /></br> <span
																class="err" id="spnprt"></span></td>

														</tr>


														<tr class="row2">

															<td valign="middle" align="right" class="input_txt"
																width="30%"><span class="err">*</span> Username :</td>

															<td valign="top" align="left" class="input_txt"
																width="70%"><input type="text" name="uname"
																class="input_txtbx" id="inp_id"
																onmouseover="showTooltip('tooltip_id','inp_id3');"
																onmouseout="hideTooltip('tooltip_id');"
																value="${mailTemplateDetails.username}" /></br> <span
																class="err" id="spnun"></span></td>

														</tr>

														<tr class="row1">

															<td valign="middle" align="right" class="input_txt"
																width="30%"><span class="err">*</span> Password :</td>

															<td valign="top" align="left" class="input_txt"
																width="70%"><input type="password" name="password"
																class="input_txtbx" id="inp_id"
																onmouseover="showTooltip('tooltip_id','inp_id3');"
																onmouseout="hideTooltip('tooltip_id');"
																value="${mailTemplateDetails.password}" /></br> <span
																class="err" id="spnpwd"></span></td>

														</tr>

														<%-- <tr class="row2">
															<td align="right" valign="middle" class="input_txt"
																width="30%"><span class="err">*</span> Message :</td>
															<td align="left" valign="top" class="input_txt"
																width="70%"><textarea
																	onmouseout="hideTooltip('tooltip_id');"
																	onmouseover="showTooltip('tooltip_id','inp_id5');"
																	id="inp_id5" cols="100%" rows="1" name="message"
																	class="input_txtarea"
																	onchange="${mailTemplateDetails.message}"></textarea></br> <span
																class="err" id="spnmsg"></span></td>
														</tr>
													</table>

												</div>
											</TD>
										</tr> --%>
									</table>
								
								<table cellpadding="0" cellspacing="0" border="0" width="100%">
									<tr class="row1">
										<td valign="top" align="right" colspan="2" width="30%"></td>
										<td valign="top" align="left" colspan="2" width="70%"><input
											type="submit" class="submit_btn1" value="Save" /></td>

									</tr>

								</table>



							</div>

						</div></td>

				</tr>
				</form>
</body>
</html>