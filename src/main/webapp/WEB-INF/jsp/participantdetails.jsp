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
          <%--    <c:set value="${participantsDetailsForm.participantsDetails}" var="participantsDetails"/>
          --%>    <c:forEach items="${participantsDetailsForm.participantsDetails}" var="participantsDetails" varStatus="status">
              
              <h2>Participants Details&nbsp;&nbsp;&nbsp;<%-- <span style="padding:5px;width:100px;border:solid 1px #eaeaea;background-color:#eaeaea; "><a href="viewresponse?id=${participantsDetails.participants_id}">View Responses</a></span> --%></h2></c:forEach>
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
             <c:forEach items="${participantsDetailsForm.participantsDetails}" var="participantsDetails" varStatus="status">
                   <tr class="row1">
                  <td width="15%" valign="middle" align="left" > First Name </td>
                    <td width="1%" valign="middle" align="left" >  :</td>
                  <td width="84%" valign="top" align="left" >${participantsDetails.fname}</td>
                </tr>
              <%-- <tr class="row1">
                  <td width="15%" valign="middle" align="left" > Last Name </td>
                    <td width="1%" valign="middle" align="left" >  :</td>
                  <td width="84%" valign="top" align="left" >${participantsDetails.lname}</td>
                </tr>
		 --%>
		<tr class="row2">
                  <td width="15%" valign="middle" align="left" > Mobile Number </td>
                    <td width="1%" valign="middle" align="left" >  :</td>
                  <td width="84%" valign="top" align="left" >${participantsDetails.mobile_num}</td>
                </tr>
		<tr class="row1">
                  <td width="15%" valign="middle" align="left" > Email-Id </td>
                    <td width="1%" valign="middle" align="left" >  :</td>
                  <td width="84%" valign="top" align="left" >${participantsDetails.email_id}</td>
                </tr>
              <tr class="row2">
                  <td width="15%" valign="middle" align="left" > Gender </td>
                    <td width="1%" valign="middle" align="left" >  :</td>
                    
                    <c:choose>
                    <c:when test="${participantsDetails.gender==0}">
                     <td width="84%" valign="top" align="left" >Male</td>
                    </c:when>                
                    <c:when test="${participantsDetails.gender==1}">
                     <td width="84%" valign="top" align="left" >Female</td>
                    </c:when>
                  </c:choose>
                  
                  
                </tr><tr class="row1">
                  <td width="15%" valign="middle" align="left" > Zipcode </td>
                    <td width="1%" valign="middle" align="left" >  :</td>
                  <td width="84%" valign="top" align="left" >${participantsDetails.city}</td>
                </tr>
              <tr class="row2">
                  <td width="15%" valign="middle" align="left" > Education </td>
                    <td width="1%" valign="middle" align="left" >  :</td>
                  <td width="84%" valign="top" align="left" >${participantsDetails.education}</td>
                </tr>
              <tr class="row1">
                  <td width="15%" valign="middle" align="left" > Medical Details </td>
                    <td width="1%" valign="middle" align="left" >  :</td>
                  <td width="84%" valign="top" align="left" >${participantsDetails.medical_details}</td>
                </tr>
              <tr class="row2">
                  <td width="15%" valign="middle" align="left" > Group Name </td>
                    <td width="1%" valign="middle" align="left" >  :</td>
                  <td width="84%" valign="top" align="left" >${participantsDetails.group_name}</td>
                </tr>
                
                <tr class="row1">
                  <td width="15%" valign="middle" align="left" > Provider Name </td>
                    <td width="1%" valign="middle" align="left" >  :</td>
                  <td width="84%" valign="top" align="left" >${participantsDetails.provider_name}</td>
                </tr>
                
                
                <tr class="row1">
                  <td width="15%" valign="middle" align="left" > Age</td>
                    <td width="1%" valign="middle" align="left" >  :</td>
                  <td width="84%" valign="top" align="left" ><c:if test="${participantsDetails.age ne 'null'}"><c:out value="${participantsDetails.age}"></c:out></c:if></td>
                </tr>
              <tr class="row2">
                  <td width="15%" valign="middle" align="left" > Date Of Join </td>
                    <td width="1%" valign="middle" align="left" >  :</td>
                  <td width="84%" valign="top" align="left" >${participantsDetails.date_of_join}</td>
                </tr>   
              <tr class="row1">  
                <td width="15%" valign="middle" align="right" >              
              <c:choose> 
              <c:when test="${menu=='dashboard'}">
               <a style="text-decoration: none;" class="paging_select" href="welcome"><input type="button" onclick="goBack()" value="Back" class="submit_btn"/></a>
              </c:when>
              <c:otherwise>
                 <a style="text-decoration: none;" class="paging_select" href="viewparticipants"><input type="button" onclick="goBack()" value="Back" class="submit_btn"/></a>
            
              </c:otherwise>
              </c:choose></td>
                <td width="1%" valign="middle" align="left" ></td>
              <td width="42%" valign="middle" align="left" >
              <span><a  style="text-decoration: none;" class="paging_select" href="viewresponse?id=${participantsDetails.participants_id}"><input type="button" value="View Responses" class="submit_btn2"></a></span>
              </td>
           
           
              </tr>
             
           </c:forEach>
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



<jsp:include page="footer.jsp"></jsp:include>