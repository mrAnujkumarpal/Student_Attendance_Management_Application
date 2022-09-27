<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head><title>BGI | ${mode} Student</title></head>
    <body>
        <%@include file="/WEB-INF/jsp/common/header.jsp"%>
        <%@include file="/WEB-INF/jsp/common/footer.jsp"%>



        <!-- Page Content -->
      
            <div class="container-fluid">
                <div class="row">
                    <div class="row">
                        <div class="input-field col s12 m6 l8">
                            <b class="grey-text">
                                <i class="material-icons profile-card-i">format_align_justify</i>All Students
                            </b>
                        </div>
                        <div class="input-field col s12 m6 l4 right-align">
                            <a class="btn" id="AddNewBtn"  href="/addStudent">${mode} Student</a>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col s12 m12 l12">
                            <table class="striped  responsive-table z-depth-1" id="EmpListTable">
                                <thead>
                                    <tr>
                                        <th>Roll Number</th>
                                        <th>Student Name</th> 
                                        <th>Email </th> 
                                        <th>course </th>
                                        <th>Year </th>
                                    </tr>
                                </thead>

                                <tbody style="color:#004d40">
                                    <c:forEach var="student" items="${studentList}">
                                        <tr>
                                            <td> ${student.rollNumber} </td>
                                            <td> ${student.firstName} ${student.lastName}</td>
                                            <td> ${student.studentEmail} </td>
                                            <td>
                                                <c:forEach items="${courseList}" var="c">
                                                    <c:if test="${c.id==student.courseId}">${c.courseName}</c:if>
                                                </c:forEach>
                                            </td>
                                            <td>
                                                <c:forEach items="${branchList}" var="b">
                                                    <c:if test="${b.id==student.subCourseId}">${b.branchName}</c:if>
                                                </c:forEach>
                                            </td>

                                            <td>
                                                <a  href="/viewStudent/${student.id}">
                                                    <i class="material-icons" style="color:Blue;">visibility</i> 
                                                </a> 
                                            </td>
                                            <td>
                                                <a  href="/editStudent/${student.id}">
                                                    <i class="material-icons" style="color:#880e4f">edit</i>
                                                </a>
                                            </td>
                                            <td>
                                                <a id="deleteEmployee" href="<c:url value="deleteStudent/${student.id}"/>">
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