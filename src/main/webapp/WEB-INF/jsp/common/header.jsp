
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<link type="text/css" rel="stylesheet" href="/css/materialize.min.css"  media="screen,projection"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/materialize/0.98.2/js/materialize.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="/assets/main.css" rel="stylesheet" type="text/css"/>
<script src="/assets/main.js" type="text/javascript"></script>


<!-- Sweet Alert -->
<%--
<script src="https://common.olemiss.edu/_js/sweet-alert/sweet-alert.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://common.olemiss.edu/_js/sweet-alert/sweet-alert.css">
--%>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" integrity="sha512-c42qTSw/wPZ3/5LBzD+Bw5f7bSF2oxou6wEb+I/lqeaKV5FDIfMvvRp772y4jcJLKuGUOpbJMdg/BTl50fJYAw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/11.1.9/sweetalert2.min.css" integrity="sha512-cyIcYOviYhF0bHIhzXWJQ/7xnaBuIIOecYoPZBgJHQKFPo+TOBA+BY1EnTpmM8yKDU4ZdI3UGccNGCEUdfbBqw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/11.1.9/sweetalert2.all.min.js" integrity="sha512-IZ95TbsPTDl3eT5GwqTJH/14xZ2feLEGJRbII6bRKtE/HC6x3N4cHye7yyikadgAsuiddCY2+6gMntpVHL1gHw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>



<style>
    .profile-card-i {
        position: relative;
        top: 6px;
        margin-right: 10px;
    }
</style>

<nav class="navbar navbar-default no-margin" style="background-color:#fff;box-shadow: 0 6px 20px 0 #aed581;">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header fixed-brand">
        <button type="button" class="navbar-toggle  btn-floating red  z-depth-1"  style="margin:7px;" data-toggle="collapse" id="menu-toggle">
            <span class="glyphicon glyphicon-th-large" aria-hidden="true">
                <i class="fa fa-bars"></i>
            </span>
        </button>
        <a class="navbar-brand" href="#"></a>
        <a href="#" class="brand-logo center">
            <img class="responsive-img" style="height: 60px;"  src="https://www.bhagwantgroup.com/img/logo.png"/>
        </a>
    </div> 
</nav>






<div id="wrapper">
    <!-- Sidebar -->
    <div id="sidebar-wrapper">
        <ul class="sidebar-nav nav-pills nav-stacked" id="menu">
            <li class="active">
                <a href="/">
                    <span class="fa-stack fa-lg pull-left"><i class="fa fa-dashboard fa-stack-1x "></i></span> Dashboard
                </a>
            </li>

            <!--   <li>
                   <a href="#"><span class="fa-stack fa-lg pull-left"><i class="fa fa-flag fa-stack-1x "></i></span>Ticket</a>
                   <ul class="nav-pills nav-stacked" style="list-style-type:none;">
                       <li><a href="#"><span class="fa-stack fa-lg pull-left"><i class="fa fa-flag fa-stack-1x "></i></span>Create Ticket </a></li>
                       <li><a href="#"><span class="fa-stack fa-lg pull-left"><i class="fa fa-flag fa-stack-1x "></i></span>Ticket List</a></li>
                   </ul>
               </li>-->
            <li>
                <a href="/course"><span class="fa-stack fa-lg pull-left"><i class="fa fa-book fa-stack-1x "></i></span>Courses</a>
            </li>
            <li>
                <a href="/allBranch"> <span class="fa-stack fa-lg pull-left"><i class="fa fa-pencil fa-stack-1x "></i></span>Branches</a>
            </li>
            <li>
                <a href="/students"><span class="fa-stack fa-lg pull-left"><i class="fa fa-graduation-cap fa-stack-1x "></i></span>Students</a>
            </li>
            <li>
                <a href="/allSubjectList"><span class="fa-stack fa-lg pull-left"><i class="fa fa-wrench fa-stack-1x "></i></span>Subjects</a>
            </li>
            <li>
                <a href="/teachers"><span class="fa-stack fa-lg pull-left"><i class="fa fa-flag fa-stack-1x "></i></span>Teachers</a>
            </li>


            <li>
                <a href="#">
                    <span class="fa-stack fa-lg pull-left"><i class="fa fa-smile-o fa-stack-1x "></i></span> Account
                </a>
                <ul class="nav-pills nav-stacked" style="list-style-type:none;">
                    <li><a href="#">My Profile</a></li>
                    <li><a href="#">Logout</a></li>
                </ul>
            </li>
        </ul>
    </div>

    <!-- /#sidebar-wrapper -->

























    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var elems = document.querySelectorAll('select');
            var instances = M.FormSelect.init(elems, options);
        });
        $(document).ready(function () {
            $('input#input_text, textarea#textarea2').characterCounter();
        });
        $(document).ready(function () {
            $('select').formSelect();
        });
    </script>


    <script>
        $("#menu-toggle").click(function (e) {
            e.preventDefault();
            $("#wrapper").toggleClass("toggled");
        });
        $("#menu-toggle-2").click(function (e) {
            e.preventDefault();
            $("#wrapper").toggleClass("toggled-2");
            $('#menu ul').hide();
        });
        function initMenu() {
            $('#menu ul').hide();
            $('#menu ul').children('.current').parent().show();
            //$('#menu ul:first').show();
            $('#menu li a').click(
                    function () {
                        var checkElement = $(this).next();
                        if ((checkElement.is('ul')) && (checkElement.is(':visible'))) {
                            return false;
                        }
                        if ((checkElement.is('ul')) && (!checkElement.is(':visible'))) {
                            $('#menu ul:visible').slideUp('normal');
                            checkElement.slideDown('normal');
                            return false;
                        }
                    }
            );
        }
        $(document).ready(function () {
            initMenu();
        });


    </script>