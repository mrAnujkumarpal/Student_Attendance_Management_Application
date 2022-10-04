<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head><title>BGI | ${mode} Teachers</title></head>
    <body>
        <%@include file="/WEB-INF/jsp/common/header.jsp"%>
        <%@include file="/WEB-INF/jsp/common/footer.jsp"%>



        <!-- Page Content -->

        <div class="container-fluid">
            <div class="row">
                <div class="row">
                    <div class="input-field col s12 m6 l8">
                        <b class="grey-text">
                            <i class="material-icons profile-card-i">format_align_justify</i>All Teachers
                        </b>
                    </div>
                    <div class="input-field col s12 m6 l4 right-align">
                        <a class="btn" id="AddNewBtn"  href="/newTeacher">${mode} Teachers</a>
                    </div>
                </div>
                <div class="row">
                    <div class="col s12 m12 l12">
                        <table class="striped  responsive-table z-depth-1" id="EmpListTable">
                            <thead>
                                <tr>
                                    <th>Department</th>
                                    <th>Teacher's Designation</th>
                                    <th>Teacher's Name</th>
                                    <th>Mobile Number</th>
                                    <th>Email-ID</th>
                                    <th>Highest Qualification</th>
                                </tr>
                            </thead>

                            <tbody style="color:#004d40">
                                <c:forEach var="teacher" items="${teacherList}">
                                    <tr>
                                        <td> ${teacher.department} </td>
                                        <td> ${teacher.teacherRole} </td>
                                        <td> ${teacher.firstName} ${student.lastName}</td>
                                        <td> ${teacher.mobileNumber} </td>
                                        <td> ${teacher.teacherEmail} </td>
                                        <td> ${teacher.highestQualification} </td>


                                        <td>
                                            <a  href="/viewTeacher/${teacher.id}">
                                                <i class="material-icons" style="color:Blue;">visibility</i>
                                            </a>
                                        </td>
                                        <td>
                                            <a  href="/editTeacher/${teacher.id}">
                                                <i class="material-icons" style="color:#880e4f">edit</i>
                                            </a>
                                        </td>
                                        <td>
                                            <a id="deleteEmployee" href="<c:url value="deleteTeacher/${teacher.id}"/>">
                                                <i class="material-icons" style="color:#f50057">delete</i>
                                            </a>
                                        </td>

                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>

                </div>
            </div>
        </div>
    </body>
</html>