<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head><title>BGI | ${mode} Subjects</title></head>
    <body>
        <%@include file="/WEB-INF/jsp/common/header.jsp"%>
        <%@include file="/WEB-INF/jsp/common/footer.jsp"%>



        <!-- Page Content -->

        <div class="container-fluid">
            <div class="row">
                <div class="row">
                    <div class="input-field col s12 m6 l8">
                        <b class="grey-text">
                            <i class="material-icons profile-card-i">format_align_justify</i>All Subjects
                        </b>
                    </div>
                    <div class="input-field col s12 m6 l4 right-align">
                        <a class="btn" id="AddNewBtn"  href="/newSubject">${mode} Subject</a>
                    </div>
                </div>
                <div class="row">
                    <div class="col s12 m12 l12">
                        <table class="striped  responsive-table z-depth-1" id="EmpListTable">
                            <thead>
                                <tr>
                                     <th>Department</th>
                                    <th>Course/ Class</th>
                                    <th>Branch / Semester</th>
                                    <th>Subject code</th>
                                    <th>Subject Name</th>
                                   
                                    
                                </tr>
                            </thead>

                            <tbody style="color:#004d40">
                                <c:forEach var="subject" items="${subjectList}">
                                    <tr>
                                        <td> ${subject.department} </td>
                                        <td>
                                            <c:forEach items="${courseList}" var="c">
                                                <c:if test="${c.id==subject.courseId}">${c.courseName}</c:if>
                                            </c:forEach>
                                        </td>
                                        <td>
                                            <c:forEach items="${branchList}" var="b">
                                                <c:if test="${b.id==subject.subCourseId}">${b.branchName}</c:if>
                                            </c:forEach>
                                        </td>
                                        <td> ${subject.subjectCode}</td>
                                        <td> ${subject.subjectName} </td>
                                        



                                        <td>
                                            <a  href="/viewTeacher/${subject.id}">
                                                <i class="material-icons" style="color:Blue;">visibility</i>
                                            </a>
                                        </td>
                                        <td>
                                            <a  href="/editTeacher/${subject.id}">
                                                <i class="material-icons" style="color:#880e4f">edit</i>
                                            </a>
                                        </td>
                                        <td>
                                            <a id="deleteEmployee" href="<c:url value="deleteTeacher/${subject.id}"/>">
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