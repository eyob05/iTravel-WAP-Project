<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>

<!doctype html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Adda - Social Network HTML Template</title>
    <meta name="robots" content="noindex, follow" />
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="assets/images/favicon.ico">

    <!-- CSS
	============================================ -->
    <!-- google fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,500,500i,700,700i,900" rel="stylesheet">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="assets/css/vendor/bootstrap.min.css">
    <!-- Icon Font CSS -->
    <link rel="stylesheet" href="assets/css/vendor/bicon.min.css">
    <!-- Flat Icon CSS -->
    <link rel="stylesheet" href="assets/css/vendor/flaticon.css">
    <!-- audio & video player CSS -->
    <link rel="stylesheet" href="assets/css/plugins/plyr.css">
    <!-- Slick CSS -->
    <link rel="stylesheet" href="assets/css/plugins/slick.min.css">
    <!-- nice-select CSS -->
    <link rel="stylesheet" href="assets/css/plugins/nice-select.css">
    <!-- perfect scrollbar css -->
    <link rel="stylesheet" href="assets/css/plugins/perfect-scrollbar.css">
    <!-- light gallery css -->
    <link rel="stylesheet" href="assets/css/plugins/lightgallery.min.css">
    <!-- Main Style CSS -->
    <link rel="stylesheet" href="assets/css/style.css">
    <link href='https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css'>

</head>

<body>

<!-- header area start -->
<header>
    <div class="header-top sticky bg-white d-none d-lg-block">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-5">
                    <!-- header (HOME and NOTIFICATION) top navigation start -->
                    <div class="header-top-navigation">
                        <nav>
                            <ul>
                                <li class="active"><a href="home">Home</a></li>

                                <li class="notification-trigger"><a class="msg-trigger-btn" href="#b">Notification</a>
                                    <div class="message-dropdown" id="b">
                                        <div class="dropdown-title">
                                            <p class="recent-msg">Notification</p>
                                            <button>
                                                <i class="flaticon-settings"></i>
                                            </button>
                                        </div>
                                        <ul class="dropdown-msg-list">
                                            <li class="msg-list-item d-flex justify-content-between">
                                                <!-- profile picture end -->
                                                <div class="profile-thumb">
                                                    <figure class="profile-thumb-middle">
                                                        <img src="assets/images/profile/profile-small-3.jpg" alt="profile picture">
                                                    </figure>
                                                </div>
                                                <!-- profile picture end -->

                                                <!-- message content start -->
                                                <div class="msg-content notification-content">
                                                    <a href="profile.html">Robert Faul</a>,
                                                    <a href="profile.html">william jhon</a>
                                                    <p>and 35 other people reacted to your photo</p>
                                                </div>
                                                <!-- message content end -->

                                                <!-- message time start -->
                                                <div class="msg-time">
                                                    <p>25 Apr 2019</p>
                                                </div>
                                                <!-- message time end -->
                                            </li>
                                        </ul>
                                        <div class="msg-dropdown-footer">
                                            <button>See all in messenger</button>
                                            <button>Mark All as Read</button>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </nav>
                    </div>
                    <!-- header (HOME and NOTIFICATION) top navigation start -->
                </div>

                <div class="col-md-2">
                    <!-- brand logo start -->
                    <div class="brand-logo text-center">
                        <a href="home">
                            <img src="assets/images/logo/logo.png" alt="brand logo">
                        </a>
                    </div>
                    <!-- brand logo end -->
                </div>

                <div class="col-md-5">
                    <div class="header-top-right d-flex align-items-center justify-content-end">
                        <!-- profile picture top start -->
                        <div class="profile-setting-box">
                            <div class="profile-thumb-small">
                                <a href="javascript:void(0)" class="profile-triger">
                                    <figure>
                                        <img src="${sessionScope.user.photoLink}" alt="assets/images/profile/male.png">
                                    </figure>
                                </a>
                                <div class="profile-dropdown">
                                    <div class="profile-head">
                                        <h5 class="name"><a href="profile?rf=${sessionScope.user.id}">${sessionScope.user.firstName} ${sessionScope.user.lastName}</a></h5>
                                        <a class="mail" href="#">${sessionScope.user.email}</a>
                                    </div>
                                    <div class="profile-body">
                                        <ul>
                                            <li><a href="profile?rf=${sessionScope.user.id}"><i class="flaticon-user"></i>Profile</a></li>
                                            <li><a href="logout"><i class="flaticon-unlock"></i>Sign out</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- profile picture top end -->
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>
<!-- header area end -->


<main>

    <div class="main-wrapper">
        <div class="profile-banner-large bg-img" data-bg="assets/images/banner/profile-banner.jpg">
        </div>
        <div class="profile-menu-area bg-white">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-3 col-md-3">
                        <div class="profile-picture-box">
                            <figure class="profile-picture">
                                <a href="profile?rf=${user.id}">
                                    <img alt="assets/images/profile/male.png" src="${user.photoLink}">
                                </a>
                            </figure>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 offset-lg-1">
                        <div class="profile-menu-wrapper">
                            <div class="main-menu-inner header-top-navigation">
                                <nav>
                                    <ul class="main-menu">
                                        <li class="active"><a href="profile?rf=${user.id}">timeline</a></li>
                                        <li><a href="following?rf=${user.id}">Following</a></li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-2 col-md-3 d-none d-md-block">
                        <div class="profile-edit-panel">
                            <button class="edit-btn" type="button" data-toggle="modal" data-target="#textbox">Edit Profile</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-3 order-2 order-lg-1">
                    <aside class="widget-area profile-sidebar">
                        <!-- widget single item start -->
                        <div class="card widget-item">
                            <h4 class="widget-title">${user.firstName} ${user.lastName}</h4>
                            <div class="widget-body">
                                <div class="about-author">
                                    <p>I Don’t know how? But i believe that it is possible one day if i stay with my dream all time</p>
                                    <ul class="author-into-list">
                                        <li><a href="#"><i class="bi bi-office-bag"></i>Traveler</a></li>
                                        <li><a href="#"><i class="bi bi-home"></i>${user.city} ${user.state}  </a></li>
                                        <li><a href="#"><i class="bi bi-heart-beat"></i>Travel, Swimming</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>


                    </aside>
                </div>

                <div class="col-lg-6 order-1 order-lg-2">
                    <!-- Modal start -->
                    <div class="modal fade" id="textbox" aria-labelledby="textbox">

                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title">Update Your Profile</h5>
                                    <form method="get" action="change-status" >
                                        <button type="submit" value="${user.id}" name="user_access" class="post-share-btn" style="margin: 8px">Deactivate</button>
                                    </form>


                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <form action="editProfile" method="post">
                                    <div class="modal-body custom-scroll">
                                        <label>First Name:</label><input required type="text" name="fName" class="single-field" value="${user.firstName}">
                                    </div>
                                    <div class="modal-body custom-scroll col-12">
                                        <label >Middle Name:</label> <input required type="text" name="mname" class="single-field" value="${user.middleName}">
                                    </div>

                                    <div class="modal-body custom-scroll">
                                        <label >Last Name:  </label><input required type="text" name="lname" class="single-field" value="${user.lastName}">
                                    </div>
                                    <div class="modal-body custom-scroll">
                                        <label >Password:  </label><input  type="password" name="pass"  class="single-field" value="${user.password}" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}"
                                                                           title="Must contain at least one  number and one uppercase and lowercase letter, and at least 6 or more characters">
                                    </div>

                                    <div class="modal-body custom-scroll">
                                        <label >Street:  </label><input  required type="text" name="street"class="single-field" value="${user.street}">
                                    </div>
                                    <div class="modal-body custom-scroll">
                                        <label >City:  </label><input  required type="text" name="city" class="single-field" value="${user.city}">
                                    </div>
                                    <div class="modal-body custom-scroll">
                                        <label >State:  </label> <input required type="text" name="state" class="single-field" value="${user.state}">
                                    </div>
                                    <div class="modal-body custom-scroll">
                                        <label >Zip Code:  </label> <input required type="text" name="zipcode" class="single-field" value="${user.zipcode}">
                                    </div>

                                    <div class="modal-footer">
                                        <button type="button" class="post-share-btn" data-dismiss="modal">cancel</button>
                                        <button type="submit" class="post-share-btn" >Update Profile</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <!-- Modal end -->

                    <!--FOllowing lists-->
                    <%@include file="extra/following_list.jsp" %>
                    <!--Following lists end -->
                </div>

                <div class="col-lg-3 order-3">
                    <aside class="widget-area">

                        <!-- widget Followers item start -->
                        <div class="card widget-item">
                            <h4 class="widget-title">Followers</h4>
                            <div class="widget-body">
                                <%@include file="extra/user_followers.jsp" %>
                            </div>
                        </div>
                        <!-- widget Followers item end -->
                    </aside>
                </div>
            </div>
        </div>
    </div>
</main>
<!-- Modernizer JS -->
<script src="assets/js/vendor/modernizr-3.6.0.min.js"></script>
<!-- jQuery JS -->
<script src="assets/js/vendor/jquery-3.3.1.min.js"></script>
<!-- Popper JS -->
<script src="assets/js/vendor/popper.min.js"></script>
<!-- Bootstrap JS -->
<script src="assets/js/vendor/bootstrap.min.js"></script>
<!-- Slick Slider JS -->
<script src="assets/js/plugins/slick.min.js"></script>
<!-- nice select JS -->
<script src="assets/js/plugins/nice-select.min.js"></script>
<!-- audio video player JS -->
<script src="assets/js/plugins/plyr.min.js"></script>
<!-- perfect scrollbar js -->
<script src="assets/js/plugins/perfect-scrollbar.min.js"></script>
<!-- light gallery js -->
<script src="assets/js/plugins/lightgallery-all.min.js"></script>
<!-- image loaded js -->
<script src="assets/js/plugins/imagesloaded.pkgd.min.js"></script>
<!-- isotope filter js -->
<script src="assets/js/plugins/isotope.pkgd.min.js"></script>
<!-- Main JS -->
<script src="assets/js/main.js"></script>

<script src='https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
</body>

</html>