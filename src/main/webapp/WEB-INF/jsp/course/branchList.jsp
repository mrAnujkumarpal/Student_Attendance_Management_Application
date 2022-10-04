<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
    <head><title>BGI | Courses </title></head>
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
                        <table class="striped  responsive-table z-depth-1" id="branchListTable">
                            <thead>
                                <tr>
                                    <th>Main Course</th> 
                                    <th>Branch Name</th>
                                    <th>Branch Code</th> 
                                    <th>Branch Status</th> 
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
                                            <c:if test="${branch.enable eq  'true'}">Active</c:if>
                                            <c:if test="${branch.enable eq  'false'}">De-Active</c:if>
                                            </td>
                                            <td>
                                                <a  href="/viewBranch/${branch.id}">
                                                <i class="material-icons" style="color:Blue;">visibility</i>
                                            </a>
                                        </td>
                                        <td>
                                            <a  href="/editBranch/${branch.id}">
                                                <i class="material-icons" style="color:#880e4f">edit</i>
                                            </a>
                                        </td>
                                        <td> 
                                            <a href=""  data-uri="<c:url value="/deleteBranch/${branch.id}"/>"  class="modal-trigger red-text  deleteBranch"><i class="material-icons">delete</i> </a>

                                        </td>

                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    
    <script>

        $('#branchListTable').on('click', '.deleteBranch', deleteBranch);
        function deleteBranch(e) {
            e.preventDefault();
            var url = $(this).data('uri');
            Swal.fire({
                title: 'Are you sure?',
                text: "You won't be able to revert this!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#00c853',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, delete it!'
            }).then((result) => {
                if (result.isConfirmed) {
                    $.ajax({
                        type: 'get',
                        url: url,
                        success: function (response) {
                            if (response.success === "true") {
                                Swal.fire(
                                        'Deleted!',
                                        response.message,
                                        'success'
                                        ).then(function () {
                                    window.location.reload(true);
                                });
                            } else {
                                Swal.fire('Oops', response.message, 'error');
                            }
                        },
                        error: function (response) {
                            Swal.fire('Oops', response.message, 'error');
                        }
                    });

                } else {
                    Swal.fire('Oops', 'Changes are not saved', 'info');
                }
            });


        }
        ;
    </script>
</body>
</html>