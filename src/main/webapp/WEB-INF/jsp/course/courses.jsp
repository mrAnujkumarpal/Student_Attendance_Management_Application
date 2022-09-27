<%--
    Document   : homePage
    Author     : Anuj Kumar Pal
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
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
            #addCourseBtn,#editCourseSubmitBtn{
                background: linear-gradient(45deg, #8e24aa 0%, #ff6e40 100%);
            }
        </style>
 
        <script src="link">
              $('.addCourseBtn').click(function () {
                $('.modeName').html("Add New Course");
                $(".editableCourseId").attr("value", "");
                $(".editableCourseCode").attr("value", "");
                $(".editableCourseName").attr("value", "");
                $('#addCourseBtn').show();
                $('#editCourseSubmitBtn').hide();
            });
        </script>
        <div class="container-fluid">
            <div class="row">
                <div class="input-field col s12 m6 l8">
                    <b class="grey-text"><i class="Small material-icons profile-card-i">format_align_justify</i>All Courses</b>
                </div>
                <div class="input-field col s12 m6 l4 right-align">
                    <button data-target="courseModelWindow" id="AddNewBtn"  class="btn modal-trigger addCourseBtn">Add New Course</button>
                </div>
            </div>
            <div class="row">
                <div class="col s12 m8 l8    offset-m2 offset-l2">
                    <table class="striped  responsive-table z-depth-1" id="allExpTypList">
                        <thead>
                            <tr style="color:#4e342e">
                                <th>ID</th> 
                                <th>Course Code</th>
                                <th>Course Name</th>
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
                                        <a href="" data-target="courseModelWindow" data-uri="<c:url value="/editCourse/${course.id}"/>"  class="modal-trigger"><i class="material-icons" style="color:#880e4f;">edit</i> </a>
                                        <a href="" data-target="courseModelWindow" data-uri="<c:url value="/deleteCourse/${course.id}"/>"  class="modal-trigger red-text"><i class="material-icons">delete</i> </a>
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
            $('.editCourseSubmitBtn').click(function () {
                var url = $(this).data('uri');
                alert(url);
                $.ajax({
                    type: 'get',
                    url: url,
                    success: function (response) {
                        if (response.success === "true") {
                            alert("here..");
                            var id = response.id;
                            var name = response.courseName;
                            var courseCode = response.courseCode;
                          
                            $(".editableCourseId").attr("value", id);
                            $(".editableCourseCode").attr("value", courseCode);
                            $(".editableCourseName").attr("value", name);
                        } else {
                            alert(response.message);
                        }
                    },
                    error: function (response) {
                        alert("server not good.");
                    },
                    complete: function (response) {
                    }
                });
                $(".modeName").html("Edit Course");
                $('#editCourseSubmitBtn').show();
                $('#addCourseBtn').hide();

            });
            
          
        </script>
        <!-- Modal Structure -->
        <div id="courseModelWindow" class="modal">
            <div class="modal-content">
                <div class="col s12">
                    <h5 class="modal-title modeName"></h5>
                </div>
                <form id="addEditCourseModalForm"  method="post">

                    <div class="input-field col s12 ">
                        <input name="courseId"   type="text" class="editableCourseId hide">
                    </div>
                    <div class="row">
                        <div class="input-field col s12 m6 l6">
                            <input name="courseCode" placeholder="Course code"  type="text" class="editableCourseCode">
                        </div>
                        <div class="input-field col s12 m6 l6">
                            <input name="courseName" placeholder="Course Name"  type="text" class="editableCourseName">
                        </div>
                        </row>
                        <button id="addCourseBtn"  data-uri="<c:url value="/course"/>" class="btn waves-effect waves-light esEventUrl" type="submit" name="action">  <i class="material-icons right">send</i> Add New Course </button>
                        <button id="editCourseSubmitBtn" data-uri="<c:url value="/course"/>" class="btn waves-effect waves-light esEventUrl" type="submit" name="action">  <i class="material-icons right">send</i> Edit Course</button>
                </form>
            </div>
        </div>
        <script>
            $('#courseModelWindow').on('submit', '#addEditCourseModalForm', addCourseModalForm);
            function addCourseModalForm(e) {
                e.preventDefault();
                var uri = $('#addEditCourseModalForm .esEventUrl').data('uri');
                var data = $('#addEditCourseModalForm').serialize();
                var editableESId = $(".editableCourseId").val();
                if (editableESId === null || editableESId === '')
                    var uri = uri.concat("/add");
                else
                    var uri = uri.concat("/update");
                alert(uri);
                $.ajax({
                    type: 'post',
                    url: uri,
                    data: data,
                    success: function (response) {
                        if (response.success === "true") {
                            location.reload();
                        } else {
                            alert(response.message);
                        }
                    },
                    error: function (response) {
                        alert("Server error encountered...");
                    },
                    complete: function (response) {
                    }
                });
            }
            ;
        </script>
    </body>
</html>