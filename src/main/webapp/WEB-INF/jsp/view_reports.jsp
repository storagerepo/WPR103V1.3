<jsp:include page="header.jsp"></jsp:include>
<script type="text/javascript" src="<c:url value="/resources/js/ajaxpaging.js" />"></script>

<form name="grid" onSubmit="return validate(this)" action="" method="POST">

  <div id="right_content">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">

     <tr>
        <td valign="top" align="left" style="padding:5px 0 10px 0;">
		<AJDF:output>if $smarty.session.adduser_new !=''</AJDF:output>
		<div class="status success">
            <p class="closestatus"><a title="Close" href="">x</a></p>
            <p><img alt="Success" src="images/icons/icon_success.png"><span><AJDF:output> $smarty.session.adduser_new</AJDF:output></span> .</p>
          </div><AJDF:output>/if</AJDF:output><AJDF:output>if $smarty.session.deletepart !=''</AJDF:output>
		<div class="status error">
            <p class="closestatus"><a title="Close" href="">x</a></p>
            <p><img alt="Error" src="images/icons/icon_error.png"><span><AJDF:output>$smarty.session.deletepart</AJDF:output></span> .</p>
          </div><AJDF:output>/if</AJDF:output><AJDF:output>if $smarty.session.upuser_new !=''</AJDF:output>
		<div class="status success">
            <p class="closestatus"><a title="Close" href="">x</a></p>
            <p><img alt="Success" src="images/icons/icon_success.png"><span><AJDF:output> $smarty.session.upuser_new</AJDF:output></span> .</p>
          </div><AJDF:output>/if</AJDF:output>
		</td>
      </tr>
      <tr>
        <td valign="top" align="left"><div>
            <div class="headings altheading">
              <h2>Broadcast Reports</h2>
            </div>
            <div class="contentbox">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
                <tr class="title">
                  <td valign="top" align="left" width="10%">Broadcast&nbsp;Id</td>
                  <td valign="top" align="left" width="10%">Stream&nbsp;Name</td>
                  <td valign="top" align="left" width="10%">Send&nbsp;to&nbsp;Group</td>
		   <td valign="top" align="left" width="15%">No.&nbsp;of&nbsp;Particpants</td>

		<td valign="top" align="left" width="15%">Frequency</td>
		  <td valign="top" align="left" width="10%">Start&nbsp;Date</td>
                  <td valign="top" align="left" width="10%">Status</td>
                  <td valign="top" align="left" width="20%">No.&nbsp;of&nbsp;Msg&nbsp;Delivered</td>
                </tr>


</table>
<table cellpadding="0" cellspacing="0" border="0" width="100%" id="user_ajax">
<AJDF:output>include file="ajaxuser.html"</AJDF:output>
</table>
<AJDF:output>include file="footer.html"</AJDF:output>
</form>
<script>
function myFunction(str) {
	var answer = confirm("Are you sure want to delete this User?")
	if (answer){
		window.location = "?do=deleteuser&userid="+str;
	}
	else{
	}
}
</script>





