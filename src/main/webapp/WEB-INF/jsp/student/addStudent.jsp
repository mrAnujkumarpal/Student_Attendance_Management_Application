<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head><title>BGI | ${mode} Student</title></head>
    <body>
        <%@include file="/WEB-INF/jsp/common/header.jsp"%>
        <%@include file="/WEB-INF/jsp/common/footer.jsp"%>



        <!-- Page Content -->
        <div id="page-content-wrapper">
            <div class="container-fluid">
                <div class="row">

                    <div class="col s12">
                        <h5 class="grey-text"><i class="Small material-icons profile-card-i">add_circle_outline</i>${mode} Student</h5>
                    </div>

                    <div class="col s12 m12    z-depth-4 card-panel">
                        <form  method="post" action="/addStudent">
                            <div class="row">
                                <div class="input-field col s10 offset-s1 center-align">
                                    <c:if test="${success ne null}">
                                        <c:if test="${success eq  'true'}">

                                            <span class="green-text accent-4">${message} </span>
                                        </c:if>
                                        <c:if test="${success eq  'false'}">
                                            <div class="red-text accent-4">${message} </div>
                                        </c:if>
                                    </c:if>
                                </div>
                            </div>

                            <div class="row">
                                <input  name="id" type="hidden"   value="${student.id}">
                                <div class="input-field col s6">
                                    <input name="firstName" type="text" class="validate" data-length="30"value="${student.firstName}"/>
                                    <label for="firstName">First Name</label>
                                </div>

                                <div class="input-field col s6">
                                    <input name="lastName" type="text" class="validate" data-length="30"value="${student.lastName}"/>
                                    <label for="lastName">Last Name</label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="input-field col s6">
                                    <input name="rollNumber" type="text" class="validate" data-length="30"value="${student.rollNumber}"/>
                                    <label for="rollNumber">Roll Number</label>
                                </div>

                                <div class="input-field col s6">
                                    <input name="studentEmail" type="email" class="validate" data-length="30"value="${student.studentEmail}"/>
                                    <label for="studentEmail">Email-Id</label>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col s12 m6 l6">
                                    <select class="browser-default"  id="mainCourseDropdown" name="courseId" style="margin: 5px;">
                                        <option value="" disabled selected>Select Branch</option>

                                        <c:forEach items="${courseList}" var="course">
                                            <option value="${course.id}"<c:if test="${course.id == student.courseId}">selected</c:if>>${course.courseName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="col s12 m6 l6">
                                    <select class="browser-default"  id="subCourseDropdown" name="subCourseId" style="margin: 5px;">
                                        <option value="" disabled selected>Select Year</option>
                                        <%--
                                        <c:forEach items="${branchList}" var="b">
                                            <option value="${b.id}"<c:if test="${b.id == student.subCourseId}">selected</c:if>>${b.branchName}</option>
                                        </c:forEach>--%>
                                    </select>
                                </div>

                            </div>

                            <div class="row">
                                <div class="input-field col s12">
                                    <textarea name="description" class="materialize-textarea" data-length="120"value="${student.description}"></textarea>
                                    <label for="description">Description</label>
                                </div>
                            </div>

                            <div class="row">
                                <div class="input-field col s12">
                                    <button href="#" class="btn  btn-large waves-effect waves-light col s12">  ${mode} Student   </button>
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
        <script type="text/javascript">
            $(document).ready(function () {

                $('#mainCourseDropdown').on('change', function () {
                    var countryId = $(this).val();
                    $.ajax({
                        type: 'GET',
                        url: '/findBranchesByCourseId/' + countryId,
                        success: function (result) {
                            var result = JSON.parse(result);
                            var s = '';
                            for (var i = 0; i < result.length; i++) {
                                s += '<option value="' + result[i].id + '">' + result[i].branchName + '</option>';
                            }
                            $('#subCourseDropdown').html(s);
                        }
                    });
                });
            });
        </script>
    </body>
</html>