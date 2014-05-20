<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
              <h2>Participant Group Details</h2>
            </div>
            <div class="contentbox">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
            
                
             <c:forEach items="${participantGroupForm.participantGroups}" var="participantGroups" varStatus="status">
                   <tr class="row2">
                  <td width="15%" valign="middle" align="left" > Group Name </td>
                    <td width="1%" valign="middle" align="left" >  :</td>
                  <td width="84%" valign="top" align="left" >${participantGroups.group_name}</td>
                </tr>
              <tr class="row1">
                  <td width="15%" valign="middle" align="left" > Description</td>
                    <td width="1%" valign="middle" align="left" >  :</td>
                  <td width="84%" valign="top" align="left" >${participantGroups.group_decs}</td>
                </tr>
		<tr class="row1">  
              <td width="15%" valign="middle" align="left" ></td>
              <td width="5%" valign="middle" align="left" >
              <a href="viewparticipantgroups" class="paging_select"> <input type="button" value="Back" class="submit_btn"/> </a>
              </td>
              </tr>
		<%-- <tr class="row2">
                  <td width="15%" valign="middle" align="left" > DateOfJoinFrom</td>
                    <td width="1%" valign="middle" align="left" >  :</td>
                  <td width="84%" valign="top" align="left" >${participantGroups.local_dojfrom}</td>
                </tr>
		<tr class="row1">
                  <td width="15%" valign="middle" align="left" >DateOfJoinTo </td>
                    <td width="1%" valign="middle" align="left" >  :</td>
                  <td width="84%" valign="top" align="left" >${participantGroups.local_dojto}</td>
                </tr>
              
               <tr class="row1">
                  <td width="15%" valign="middle" align="left" > Education </td>
                    <td width="1%" valign="middle" align="left" >  :</td>
                  <td width="84%" valign="top" align="left" >${participantGroups.local_educations}</td>
                </tr> --%>
              
                
                
                </c:forEach>
                
              </table>
          
            </div>
          </div>
          </td>
      </tr>
      </table>
      </div>
</form>





<jsp:include page="footer.jsp"></jsp:include>