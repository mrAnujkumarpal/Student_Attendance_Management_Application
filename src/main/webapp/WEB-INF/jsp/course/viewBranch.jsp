<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<html>
    <head><title>BGI | ${mode} Student</title></head>
    <body>
        <%@include file="/WEB-INF/jsp/common/header.jsp"%>
        <%@include file="/WEB-INF/jsp/common/footer.jsp"%>



        <!-- Page Content -->
        <div id="page-content-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="row">
                        <div class="input-field col s12 m12 l12">
                            <b class="grey-text"><i class="Small material-icons profile-card-i">format_align_justify</i>View Branch Details</b>
                        </div>
                    </div>
                    <c:choose>
                        <c:when test="${viewBranch ne null && not empty viewBranch}">
                            <div class="row">
                                <div class="col s12 m12 l12">
                                    <div class="row">
                                        <div class="col s12 m12 l10  offset-l1">
                                            <div class="row card">
                                                <div class="col s12 m12 l12  z-depth-1">
                                                    <h5>Branch/Semester :  &nbsp; ${viewBranch.branchName}
                                                        <small class="right-align">  </small>
                                                    </h5>
                                                </div>
                                                <div class="col s12 m12 l12 z-depth-2">
                                                    <div class="" style="padding:10px 0px; margin:10px 0px;">
                                                        <div class="row"><div class="col l3  m4 s5"><strong>Creation Date  </strong></div><div class="col l9  m8 s7"> <fmt:formatDate   dateStyle = "long"  value = "${viewBranch.createdOn}"/> </div></div>
                                                        <div class="row"><div class="col l3  m4 s5"><strong>Branch Name   </strong></div><div class="col l9  m8 s7"> ${viewBranch.branchName}</div></div>
                                                        <div class="row"><div class="col l3  m4 s5"><strong>Branch Code  </strong></div><div class="col l9  m8 s7"> ${viewBranch.branchCode}<br></div></div>
                                                        <div class="row"><div class="col l3  m4 s5"><strong>Course Name    </strong></div><div class="col l9  m8 s7">
                                                                <c:forEach items="${courses}" var="c">
                                                                    <c:if test="${c.id==viewBranch.courseId}">${c.courseName}</c:if>
                                                                </c:forEach>
                                                            </div>
                                                        </div>

                                                        <div class="row"><div class="col l3  m4 s5"><strong>Enable / Disable</strong></div><div class="col l9  m8 s7">
                                                                <c:choose>
                                                                    <c:when test="${viewStudent.enable eq  'true'}">
                                                                        Active 
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        Not Active
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </div>
                                                        </div>
                                                        <div class="row"><div class="col l3  m4 s5"><strong>Description     </strong></div><div class="col l9  m8 s7"> ${viewBranch.description}  </div></div>
                                                        <div class="row"><div class="col l3  m4 s5"><strong>Class Coordinator</strong></div><div class="col l9  m8 s7"> ${viewBranch.classCoordinatorId}</div></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="row">
                                <div class="col s12 m8 l6  offset-m2  offset-l3  z-depth-5 card-panel center-align " id="panelBck">
                                    <div class="center-align">
                                        <img class="responsive-img center-align "   src="http://insidetimeshare.com/wp-content/uploads/2018/03/not_available.jpg">
                                    </div>
                                    <h6>OOps, You are on wrong track.</h5>
                                </div>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    
    </body>
</html>