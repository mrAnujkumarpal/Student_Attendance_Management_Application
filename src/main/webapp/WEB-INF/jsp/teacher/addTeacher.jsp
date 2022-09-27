<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head><title>BGI | ${mode} Teacher</title></head>
    <body>
        <%@include file="/WEB-INF/jsp/common/header.jsp"%>
        <%@include file="/WEB-INF/jsp/common/footer.jsp"%>



        <!-- Page Content -->
        <div id="page-content-wrapper">
            <div class="container-fluid">
                <div class="row">

                    <div class="col s12">
                        <h5 class="grey-text"><i class="Small material-icons profile-card-i">add_circle_outline</i>${mode} Teacher</h5>
                    </div>

                    <div class="col s12 m12    z-depth-4 card-panel">
                        <form  method="post" action="/newTeacher">
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
                                
                                <input  name="id" type="hidden"   value="${teacher.id}">
                                <div class="col s12 m6 l6">
                                    <select class="browser-default"  name="department" style="margin: 5px;">
                                        <option value="" disabled selected>Select Department</option>
                                        <c:forEach items="${departments}" var="dept">
                                            <option value="${dept}"<c:if test="${dept == teacher.department}">selected</c:if>>${dept}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="col s12 m6 l6">
                                    <select class="browser-default"   name="teacherRole" style="margin: 5px;">
                                        <option value="" disabled selected>Select Your Role</option>

                                        <c:forEach items="${roles}" var="role">
                                            <option value="${role}"<c:if test="${role == teacher.teacherRole}">selected</c:if>>${role}</option>
                                        </c:forEach>
                                    </select>
                                </div>

                            </div>
                            <div class="row">
                                <div class="input-field col s6">
                                    <input name="firstName" type="text" class="validate" data-length="30"value="${teacher.firstName}"/>
                                    <label for="firstName">First Name</label>
                                </div>

                                <div class="input-field col s6">
                                    <input name="lastName" type="text" class="validate" data-length="30"value="${teacher.lastName}"/>
                                    <label for="lastName">Last Name</label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="input-field col s6">
                                    <input name="mobileNumber" type="text" class="validate" data-length="30"value="${teacher.mobileNumber}"/>
                                    <label for="mobileNumber">Mobile Number</label>
                                </div>

                                <div class="col s6 m6 l6">
                                    <select class="browser-default"  id="subCourseDropdown" name="highestQualification">
                                        <option value="" disabled selected>Highest Qualification</option>

                                        <c:forEach items="${qualifications}" var="qual">
                                            <option value="${qual}"<c:if test="${qual == teacher.highestQualification}">selected</c:if>>${qual}</option>
                                        </c:forEach>
                                    </select>
                                </div>


                            </div>

                            <div class="row">
                                <div class="input-field col s6">
                                    <input name="teacherEmail" type="email" class="validate" data-length="30"value="${teacher.teacherEmail}"/>
                                    <label for="teacherEmail">Email-Id</label>
                                </div>
                                <div class="input-field col s6">
                                    <input name="password" type="password" class="validate" data-length="30"/>
                                    <label for="password">Password</label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="input-field col s12">
                                    <button href="#" class="btn  btn-large waves-effect waves-light col s12">${mode} Teacher</button>
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