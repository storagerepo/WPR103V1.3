<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="header.jsp"></jsp:include>
<div id="right_content">



<form method="post" action="">
  <div id="right_content">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <tr>
        <td valign="top" align="left" style="padding:5px 0 10px 0;"></td>
      </tr>
      <tr>
        <td valign="top" align="left"><div>
            <div class="headings altheading">
          <%--    <c:set value="${participantsDetailsForm.participantsDetails}" var="participantsDetails"/>
          --%>  
              
              <h2>Response Details&nbsp;&nbsp;&nbsp;</h2>
            </div>
            <div class="contentbox">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
            
            
            
   <%--            <c:forEach items="${currentuser.participantsDetails}" var="currentuser" varStatus="status">
   --%>          <%--  <tr class="row2">
                  <td width="15%" valign="middle" align="left" > Current User: </td>
                    <td width="1%" valign="middle" align="left" >  :</td>
                 <td width="84%" valign="top" align="left" >${currentuser.adminuser[0].admin_username}</td>
                </tr>  --%>
          <%--   </c:forEach>  
          --%>      
             <c:set  value="${participantAnswersForm.participantAnswers}" var="participantAnswers"></c:set>
             <tr class="row2">
                  <td width="15%" valign="middle" align="left" > Date </td>
                    <td width="1%" valign="middle" align="left" >  :</td>
                  <td width="84%" valign="top" align="left" >${participantAnswers[0].attend_date}</td>
             </tr>
             <tr class="row1">
                  <td width="15%" valign="middle" align="left" > Question 1 </td>
                    <td width="1%" valign="middle" align="left" >  :</td>
                  <td width="84%" valign="top" align="left" >${participantAnswers[0].question}</td>
             </tr>
		<tr class="row2">
                  <td width="15%" valign="middle" align="left" > Answer </td>
                    <td width="1%" valign="middle" align="left" >  :</td>
                  <td width="84%" valign="top" align="left" >${participantAnswers[0].answer1}</td>
                </tr>
		<tr class="row1">
                  <td width="15%" valign="middle" align="left" > Question 2 </td>
                    <td width="1%" valign="middle" align="left" >  :</td>
                  <td width="84%" valign="top" align="left" >${participantAnswers[1].question}</td>
                </tr>
              <tr class="row2">
                   <td width="15%" valign="middle" align="left" > Answer </td>
                    <td width="1%" valign="middle" align="left" >  :</td>
                  <td width="84%" valign="top" align="left" >${participantAnswers[0].answer2}</td>
                  
                </tr><tr class="row1">
                  <td width="15%" valign="middle" align="left" > Question 3 </td>
                    <td width="1%" valign="middle" align="left" >  :</td>
                  <td width="84%" valign="top" align="left" >${participantAnswers[2].question}</td>
                </tr>
              <tr class="row2">
                   <td width="15%" valign="middle" align="left" > Answer </td>
                    <td width="1%" valign="middle" align="left" >  :</td>
                  <td width="84%" valign="top" align="left" >${participantAnswers[0].answer3}</td>
                </tr>
                <tr class="row1">
                   <td width="15%" valign="middle" align="left" > Text Message </td>
                    <td width="1%" valign="middle" align="left" >  :</td>
                  <td width="84%" valign="top" align="left" ><textarea rows="5" cols="70">${participantAnswers[0].text_message}</textarea></td>
                </tr>
               <tr height="10"></tr>
              
            <!--     <tr><td width="15%" valign="middle" align="left" >Audio Message</td>
                    <td width="1%" valign="middle" align="left" >:</td></tr>
              -->
                <c:forEach items="${audio}" var="audio">
                
                <tr class="row1">
                   <td width="15%" valign="middle" align="left" >Audio Message</td>
                    <td width="1%" valign="middle" align="left" >:</td>
                    <c:if test=""></c:if>
                     <c:set var="string3" value="${(fn:length(audio))}" />
                      <c:set var="string2" value="${fn:substring(audio, 2, string3)}" />
                      
                      <c:if test="${fn:contains(audio, '.m4a')}">

                  <td width="84%" valign="top" align="left" ><a href="http://www.medsmonit.com/bcreasearch${string2}" id="ccolor" onclick="color()">Audio Recorded File</a></td>
                </c:if>
                 <c:if test="${fn:contains(string2, '.3gp')}">

                  <td width="84%" valign="top" align="left" ><a href="http://www.medsmonit.com/bcreasearchT${string2}" id="bcolor" onclick="color1()">Audio Recorded File</a></td>
                </c:if>
                </tr>  </c:forEach>
              <tr class="row1">              
              <td colspan="2" width="50%" valign="middle" align="right" > <!-- <a style="text-decoration: none;" class="paging_select" href="welcome"> --><input type="button" value="Back" onclick="goBack()" class="submit_btn"/><!-- </a> -->
              </td>
              </tr>
             
           
              </table>
          
          </div>
          </div>
          </td>
          </tr>
          </table>
          </div>
          </form>
          </div>
         

<script>
function goBack()
  {
  window.history.back();
  }
</script>

 <script>
              function color()
              {
            	
            	  document.getElementById("ccolor").style.color="brown";
            	  
              }
              function color1()
              {
            	
            	  document.getElementById("bcolor").style.color="brown";
            	  
              }
              </script>
              

<jsp:include page="footer.jsp"></jsp:include>