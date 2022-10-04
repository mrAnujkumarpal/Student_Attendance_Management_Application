<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head><title>BGI | ${mode} Branch </title></head>
    <body>
        <%@include file="/WEB-INF/jsp/common/header.jsp"%>
        <%@include file="/WEB-INF/jsp/common/footer.jsp"%>



        <!-- Page Content -->
        <div id="page-content-wrapper">
            <div class="container-fluid">
                <div class="row">

                    <div class="col s12">
                        <h5 class="grey-text"><i class="Small material-icons profile-card-i">add_circle_outline</i>${mode} Branch/Semester</h5>
                    </div>

                    <div class="col s12 m12    z-depth-4 card-panel">
                        <form  method="post" action="/addBranch">
                            <div class="row">
                                <div class="input-field col s12 m10 l8 offset-m1 offset-l2">
                                    <c:if test="${success eq  'true'}">
                                        <span class="green-text accent-4">${message} </span>
                                    </c:if>
                                    <c:if test="${success eq  'false'}">
                                        <div class="red-text accent-4">
                                            <ul>  <c:forEach var="validateMsg" items="${validationList}">   <li> ${validateMsg}</li>  </c:forEach>  </ul>
                                            </div>
                                    </c:if>
                                </div>
                            </div>
                            <div class="row">
                                <input  name="id" type="hidden"   value="${branch.id}">

                                <div class="col s12">
                                    <select class="browser-default" name="courseId">
                                        <option value="" disabled selected>Choose Main Course</option>
                                        <%--   <c:forEach items="${courses}" var="c">
                                               <option value="${c.id}"> ${c.id}-${c.courseName}</option>
                                           </c:forEach>--%>
                                        <c:forEach items="${courses}" var="course">
                                            <option value="${course.id}"<c:if test="${course.id == branch.courseId}">selected</c:if>>${course.courseName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="row">
                                <div class="input-field col s6">
                                    <input name="branchCode" type="text" class="validate" data-length="30"value="${branch.branchCode}">
                                    <label for="branchCode">Branch Code</label>
                                </div>

                                <div class="input-field col s6">
                                    <input name="branchName" type="text" class="validate" data-length="50"value="${branch.branchName}">
                                    <label for="branchName">Branch Name</label>
                                </div>
                            </div>

                            <div class="row">
                                <div class="input-field col s12">
                                    <textarea name="description" class="materialize-textarea" data-length="120" value="${branch.description}"></textarea>
                                    <label for="description">Description</label>
                                </div>
                            </div>

                            <div class="row">
                                <div class="input-field col s12">
                                    <button href="#" class="btn  btn-large waves-effect waves-light col s12">
                                        ${mode} Branch
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>           
            <!-- /#page-content-wrapper -->
        </div>
        <!-- /#wrapper -->
        <!-- jQuery -->
    </body>
</html>