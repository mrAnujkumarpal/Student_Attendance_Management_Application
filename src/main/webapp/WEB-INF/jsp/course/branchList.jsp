<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head><title>BGI | ${mode} Branch </title></head>
    <body>
        <%@include file="/WEB-INF/jsp/common/header.jsp"%>
        <%@include file="/WEB-INF/jsp/common/footer.jsp"%>



        <!-- Page Content -->
       
            <div class="container-fluid">
                <div class="row">
                    <div class="row">
                        <div class="input-field col s12 m6 l8">
                            <b class="grey-text">
                                <i class="Small material-icons profile-card-i">format_align_justify</i>All Branches
                            </b>
                        </div>
                        <div class="input-field col s12 m6 l4 right-align">
                            <a class="btn" id="AddNewBtn"  href="/addBranch">Add New Branch</a>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col s12 m12 l12">
                            <table class="striped  responsive-table z-depth-1" id="EmpListTable">
                                <thead>
                                    <tr>
                                        <th>Main Course</th> 
                                        <th>Branch Name</th>
                                        <th>Branch Code</th> 

                                        <th>View</th>
                                        <th>Edit </th>
                                        <th>Delete </th>

                                    </tr>
                                </thead>

                                <tbody style="color:#004d40">
                                    <c:forEach var="branch" items="${branchList}">
                                        <tr>
                                            <td>
                                                <c:forEach items="${courseList}" var="c">
                                                    <c:if test="${c.id==branch.courseId}">${c.courseName}</c:if>
                                                </c:forEach>


                                            </td>



                                            <td> ${branch.branchName} </td>
                                            <td> ${branch.branchCode} </td>

                                            <td>
                                                <a  href="/viewEmployeeDetails/${emp.id}">
                                                    <i class="material-icons" style="color:Blue;">visibility</i>
                                                </a>
                                            </td>
                                            <td>
                                                <a  href="/editEmployeeDetails/${emp.id}">
                                                    <i class="material-icons" style="color:#880e4f">edit</i>
                                                </a>
                                            </td>
                                            <td>
                                                <a id="deleteEmployee" href="<c:url value="deleteEmployee/${emp.id}"/>">
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