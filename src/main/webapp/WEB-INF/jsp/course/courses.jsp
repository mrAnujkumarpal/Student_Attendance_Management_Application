<%--
    Document   : homePage
    Author     : Anuj
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
    <head><title>BGI | Courses </title></head>
    <body>
        <%@include file="/WEB-INF/jsp/common/header.jsp"%>
        <%@include file="/WEB-INF/jsp/common/footer.jsp"%>

        <style>
            #AddNewBtn{
                background: linear-gradient(45deg, #FF5252 0%, #f48fb1 100%);
                box-shadow: 0 6px 20px 0 rgba(244, 143, 177, 0.5);
                border-radius: 25px;
            }
            #editLocationSubmitBtn,#addNewLocationBtn{
                background: linear-gradient(45deg, #8e24aa 0%, #ff6e40 100%);
            }
        </style> 
        <div class="container-fluid">
            <div class="row">
                <div class="input-field col s12 m6 l8">
                    <b class="grey-text"><i class="Small material-icons profile-card-i">format_align_justify</i>All Courses</b>
                </div>
                <div class="input-field col s12 m6 l4 right-align">
                    <button data-target="locationModelWindow" id="AddNewBtn" class="btn modal-trigger addNewLocationBtn">Add New Course</button>
                </div>
            </div>
            <div class="row">
                <div class="col s12 m8   offset-m2">
                    <table class="striped  responsive-table z-depth-1" id="allLocationList">
                        <thead>
                            <tr style="color:#4e342e">
                                <th>ID</th>
                                <th>Course Code</th>
                                <th>Course Name</th>
                                <th>Course Status</th>
                                <th>Edit/Delete</th>
                            </tr>
                        </thead>

                        <tbody style="color:#004d40">
                            <c:forEach var="course" items="${courseList}">
                                <tr>
                                    <td>${course.id} </td>
                                    <td> ${course.courseCode} </td>
                                    <td> ${course.courseName} </td>
                                    <td>
                                        <c:if test="${course.enable eq  'true'}">Active</c:if>
                                        <c:if test="${course.enable eq  'false'}">De-Active</c:if>
                                        </td>
                                        <td>
                                            <a href="" data-target="locationModelWindow" data-uri="<c:url value="/editCourse/${course.id}"/>"  class="modal-trigger editLocationBtn"><i class="material-icons"style="color:#880e4f;">edit</i> </a>

                                        <a href=""  data-uri="<c:url value="/deleteCourse/${course.id}"/>"  class="modal-trigger red-text  deleteLocationBtn"><i class="material-icons">delete</i> </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <!--Import jQuery before materialize.js-->
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/materialize/0.98.2/js/materialize.min.js"></script>
        <script src="assets/js/main.js" type="text/javascript"></script>
        <script>

            $(document).ready(function () {
                $('.modal').modal();
            });

            $('.editLocationBtn').click(function () {
                var url = $(this).data('uri');

                $.ajax({
                    type: 'get',
                    url: url,
                    success: function (response) {
                        if (response.success === "true") {

                            var id = response.id;
                            var name = response.courseName;
                            var courseCode = response.courseCode;

                            $(".editableCourseId").attr("value", id);
                            $(".editableCourseCode").attr("value", courseCode);
                            $(".editableCourseName").attr("value", name);
                        } else {
                            swal("Oops", response.message, "error");
                        }
                    },
                    error: function (response) {
                        swal("Oops", response.message, "error");
                    },
                    complete: function (response) {
                        swal("Oops", response.message, "error");
                    }
                });

                $(".modeName").html("Edit Course");
                $('#addNewLocationBtn').hide();
                $('#editLocationSubmitBtn').show();
            });


            $('.addNewLocationBtn').click(function () {
                $('.modeName').html("Add New Course");
                $(".editableCourseId").attr("value", "");
                $(".editableCourseCode").attr("value", "");
                $(".editableCourseName").attr("value", "");
                $('#addNewLocationBtn').show();
                $('#editLocationSubmitBtn').hide();
            });

        </script>
        <!-- Modal Structure -->
        <div id="locationModelWindow" class="modal">
            <div class="modal-content">
                <div class="col s12">
                    <h5 class="modal-title modeName"></h5>
                </div>
                <form id="locationModalForm"  method="post">
                    <input name="courseId"   type="text" class="editableCourseId hide">
                    <div class="row">
                        <div class="input-field col s12 m6 l6">
                            <input name="courseCode" placeholder="Course code"  type="text" class="editableCourseCode">
                        </div>
                        <div class="input-field col s12 m6 l6">
                            <input name="courseName" placeholder="Course Name"  type="text" class="editableCourseName">
                        </div>
                    </div>
                    <button id="addNewLocationBtn"   data-uri="<c:url value="/clickEventOnCourseModel"/>" class="btn waves-effect waves-light locEventUrl" type="submit" name="action">  <i class="material-icons right">send</i> Add New Course </button>
                    <button id="editLocationSubmitBtn" data-uri="<c:url value="/clickEventOnCourseModel"/>" class="btn waves-effect waves-light locEventUrl" type="submit" name="action">  <i class="material-icons right">send</i> Edit Course </button>
                </form>
            </div>
        </div>

        <script>
            $('#locationModelWindow').on('submit', '#locationModalForm', addEditLocationModalForm);

            function addEditLocationModalForm(e) {
                e.preventDefault();
                var uri = $('#locationModalForm .locEventUrl').data('uri');
                var data = $('#locationModalForm').serialize();
                var editableLocId = $(".editableCourseId").val();

                if (editableLocId === null || editableLocId === '')
                    var uri = uri.concat("/add");
                else
                    var uri = uri.concat("/update");

                $.ajax({
                    type: 'post',
                    url: uri,
                    data: data,
                    success: function (response) {
                        if (response.success === "true") {
                            swal.fire({
                                text: response.message,
                                type: 'success',
                                icon: 'success'
                            }).then(function () {
                                location.reload();

                            });
                        } else {
                            Swal.fire("Oops", response.message, "error");
                            // alert(response.message);
                        }
                    },
                    error: function (response) {
                        Swal.fire("Oops", "Server error encountered", "error");
                        //alert("Server error encountered");
                    },
                    complete: function (response) {

                    }
                });
            }
            ;

            $('#allLocationList').on('click', '.deleteLocationBtn', deleteLocButton);
            function deleteLocButton(e) {
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