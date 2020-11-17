<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>

<!doctype html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>iTravel</title>
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
    <link href='https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css'>

    <link rel="stylesheet" href="resources/css/weather.css">
</head>

<body>
    <!-- header area(Home and Notification) start -->
    <header>
        <div class="header-top sticky bg-white d-none d-lg-block">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-md-4">
                        <!-- header top navigation start -->
                        <div class="header-top-navigation">
                            <nav>
                                <ul>
                                    <li class="active"><a href="home">home</a></li>
                                  
                                    <li class="notification-trigger"><a class="msg-trigger-btn" href="#b">notification</a>
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
                                                        <a href="profile.jsp">Robert Faul</a>,
                                                        <a href="profile.jsp">william jhon</a>
                                                        <p>and 35 other people reacted to your photo</p>
                                                    </div>
                                                    <!-- message content end -->

                                                    <!-- message time start -->
                                                    <div class="msg-time">
                                                        <p>25 Apr 2019</p>
                                                    </div>
                                                    <!-- message time end -->
                                                </li>
                                                <li class="msg-list-item d-flex justify-content-between">
                                                    <!-- profile picture end -->
                                                    <div class="profile-thumb">
                                                        <figure class="profile-thumb-middle">
                                                            <img src="assets/images/profile/profile-small-4.jpg" alt="profile picture">
                                                        </figure>
                                                    </div>
                                                    <!-- profile picture end -->

                                                    <!-- message content start -->
                                                    <div class="msg-content notification-content">
                                                        <a href="profile.jsp">Robert mushkil</a>,
                                                        <a href="profile.jsp">Terry jhon</a>
                                                        <p>and 20 other people reacted to your photo</p>
                                                    </div>
                                                    <!-- message content end -->

                                                    <!-- message time start -->
                                                    <div class="msg-time">
                                                        <p>20 May 2019</p>
                                                    </div>
                                                    <!-- message time end -->
                                                </li>
                                                <li class="msg-list-item d-flex justify-content-between">
                                                    <!-- profile picture end -->
                                                    <div class="profile-thumb">
                                                        <figure class="profile-thumb-middle">
                                                            <img src="assets/images/profile/profile-small-6.jpg" alt="profile picture">
                                                        </figure>
                                                    </div>
                                                    <!-- profile picture end -->

                                                    <!-- message content start -->
                                                    <div class="msg-content notification-content">
                                                        <a href="profile.jsp">Horijon Mbala</a>,
                                                        <a href="profile.jsp">Bashu jhon</a>
                                                        <p>and 55 other people reacted to your post</p>
                                                    </div>
                                                    <!-- message content end -->

                                                    <!-- message time start -->
                                                    <div class="msg-time">
                                                        <p>15 Jan 2019</p>
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
                        <!-- header top navigation start -->
                    </div>

                    <div class="col-md-1">
                        <!-- brand logo start -->
                        <div class="brand-logo text-center">
                            <a href="home">
                                <img src="assets/images/logo/logo.png" alt="brand logo">
                            </a>
                        </div>
                        <!-- brand logo end -->
                    </div>

                    <div class="col-md-7">
                        <div class="header-top-right d-flex align-items-center justify-content-end">
                            <!-- header by user search start -->
                            <div class="header-top-search">
                                <form class="top-search-box">
                                    <input type="text" placeholder="Search by User" class="top-search-field">
                                    <button class="top-search-btn"><i class="flaticon-search"></i></button>
                                </form>
                            </div>
                            <!-- header by user search end -->

                            <!-- header by post search start -->
                            <div class="header-top-search">
                                <form class="top-search-box">
                                    <input type="text" placeholder="Search by Post" class="top-search-field">
                                    <button class="top-search-btn"><i class="flaticon-search"></i></button>
                                </form>
                            </div>
                            <!-- header by post search end -->

                            <!-- profile picture start -->
                            <div class="profile-setting-box">
                                <div class="profile-thumb-small">
                                    <a href="javascript:void(0)" class="profile-triger">
                                        <figure>
                                            <img src="${user.photoLink}" alt="assets/images/profile/male.png">
                                        </figure>
                                    </a>
                                    <div class="profile-dropdown">
                                        <div class="profile-head">
                                            <h5 class="name"><a href="profile?rf=${user.id}">${user.firstName} ${user.lastName}</a></h5>
                                            <a class="mail" href="#">${user.email}</a>
                                        </div>
                                        <div class="profile-body">
                                            <ul>
                                                <li><a href="profile?rf=${user.id}"><i class="flaticon-user"></i>Profile</a></li>
                                                <li><a href="logout"><i class="flaticon-unlock"></i>Sign out</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- profile picture end -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!-- header area(Home and Notification) end -->

    <main>

        <div class="main-wrapper pt-80">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 order-2 order-lg-1">
                        <aside class="widget-area">
                            <!-- Profile Picture and User start-->
                            <div class="card card-profile widget-item p-0">
                                <div class="profile-banner">

                                    <figure class="profile-banner-small">
                                        <a href="profile?rf=${user.id}" class="">
                                            <img src="assets/images/profile/male.png" alt="">
                                        </a>
                                    </figure>

                                    <div class="profile-desc text-center">
                                        <h6 class="author"><a href="profile?rf=${user.id}">${user.firstName} ${user.lastName}</a></h6>
                                        <p>Any one can join with but Social network us if you want Any one can join with us if you want</p>
                                    </div>
                                </div>
                            </div>
                            <!-- Profile Picture and User end-->


                            <!-- widget Weather Condition start -->
                            <div class="card widget-item">
                                <h4 class="widget-title">Weather Condition</h4>
                                <div class="containe">
                                    <div class="notification"> </div>
                                    <div class="weather-container">
                                        <div class="weather-icon">
                                            <img src="resources/images/icons/unknown.png" alt="">
                                        </div>
                                        <div class="temperature-value">
                                            <p>- °<span>C</span></p>
                                        </div>
                                        <div class="temperature-description">
                                            <p> - </p>
                                        </div>
                                        <div class="location">
                                            <p>-</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- widget weather condition end -->

                            <!-- widget top news start -->
                            <div class="card widget-item">
                                <h4 class="widget-title">latest top news</h4>
                                <div class="widget-body">
                                    <ul class="like-page-list-wrapper">
                                        <li class="unorder-list">
                                            <!-- profile picture end -->
                                            <div class="profile-thumb">
                                                <a href="#">
                                                    <figure class="profile-thumb-small">
                                                        <img src="assets/images/profile/cnn.png" alt="profile picture">
                                                    </figure>
                                                </a>
                                            </div>
                                            <!-- profile picture end -->

                                            <div class="unorder-list-info">
                                                <h3 class="list-title"><a href="https://www.cnn.com/">CNN News</a></h3>
                                                <p class="list-subtitle">2 min ago</p>
                                            </div>
                                        </li>
                                        <li class="unorder-list">
                                            <!-- profile picture end -->
                                            <div class="profile-thumb">
                                                <a href="#">
                                                    <figure class="profile-thumb-small">
                                                        <img src="assets/images/profile/eri.jpg" alt="profile picture">
                                                    </figure>
                                                </a>
                                            </div>
                                            <!-- profile picture end -->

                                            <div class="unorder-list-info">
                                                <h3 class="list-title"><a href="https://www.tesfanews.net/">Eritrean News</a></h3>
                                                <p class="list-subtitle">20 min ago</p>
                                            </div>
                                        </li>
                                        <li class="unorder-list">
                                            <!-- profile picture end -->
                                            <div class="profile-thumb">
                                                <a href="#">
                                                    <figure class="profile-thumb-small">
                                                        <img src="assets/images/profile/cctv.jpeg" alt="profile picture">
                                                    </figure>
                                                </a>
                                            </div>
                                            <!-- profile picture end -->

                                            <div class="unorder-list-info">
                                                <h3 class="list-title"><a href="https://english.cctv.com/">CCTV Chinese</a></h3>
                                                <p class="list-subtitle">30 min ago</p>
                                            </div>
                                        </li>
                                        <li class="unorder-list">
                                            <!-- profile picture end -->
                                            <div class="profile-thumb">
                                                <a href="#">
                                                    <figure class="profile-thumb-small">
                                                        <img src="assets/images/profile/bbc.png" alt="profile picture">
                                                    </figure>
                                                </a>
                                            </div>
                                            <!-- profile picture end -->

                                            <div class="unorder-list-info">
                                                <h3 class="list-title"><a href="https://www.bbc.com/news">BBC News</a></h3>
                                                <p class="list-subtitle">40 min ago</p>
                                            </div>
                                        </li>
                                        <li class="unorder-list">
                                            <!-- profile picture end -->
                                            <div class="profile-thumb">
                                                <a href="#">
                                                    <figure class="profile-thumb-small">
                                                        <img src="assets/images/profile/voa.png" alt="profile picture">
                                                    </figure>
                                                </a>
                                            </div>
                                            <!-- profile picture end -->

                                            <div class="unorder-list-info">
                                                <h3 class="list-title"><a href="https://www.voanews.com/">VOA News</a></h3>
                                                <p class="list-subtitle">39 min ago</p>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <!-- widget top news end -->
                        </aside>
                    </div>

                    <div class="col-lg-6 order-1 order-lg-2">
                        <!-- share box start -->
                        <div class="card card-small">
                            <div class="share-box-inner">
                                <!-- profile picture end -->
                                <div class="profile-thumb">
                                    <a href="profile?rf=${user.id}">
                                        <figure class="profile-thumb-middle">
                                            <img alt="assets/images/profile/male.png" src="${user.photoLink}">
                                        </figure>
                                    </a>
                                </div>
                                <!-- profile picture end -->

                                <!-- post content box start -->
                                <div class="share-content-box w-100">
                                    <form class="share-text-box">
                                        <textarea name="share" class="share-text-field" aria-disabled="true" placeholder="Post travel moments..." data-toggle="modal" data-target="#textbox" id="email"></textarea>
                                        <button class="btn-share" type="submit">share</button>
                                    </form>
                                </div>
                                <!-- post content box end -->

                                <!-- Post Modal start -->
                                <div class="modal fade" id="textbox" aria-labelledby="textbox">
                                    <div class="modal-dialog">
                                        <form class="share-text-box" method="post" action="addPost" enctype="multipart/form-data" >
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title">Share Your Mood</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                    <%--                                                <%@include file="post_form.jsp"%>--%>
                                                </div>
                                                <div class="modal-body custom-scroll">
                                                    <textarea name="postDetails" id="postDetails" class="share-field-big custom-scroll" placeholder="say something..."></textarea>
                                                </div>
                                                <div class="modal-footer">
                                                    <input type="file" class="post-share-btn" name="image" id="image">
                                                    <%--                                                <button type="submit">Post</button>--%>
                                                    <button type="button" class="post-share-btn" data-dismiss="modal">cancel</button>
                                                    <button type="submit" class="post-share-btn">post</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                <!--Post Modal end -->
                            </div>
                        </div>


                        <!-- Post cards start -->
                        <div>
                            <%@include file="extra/post_body.jsp" %>
                        </div>
                        <!-- Post cards start -->
                    </div>

                    <div class="col-lg-3 order-3">
                        <aside class="widget-area">
                            <!-- widget single Suggestions start -->
                            <div class="card widget-item">
                                <h4 class="widget-title">Suggestions</h4>
                                <div class="widget-body">
                                    <%@include file="extra/people_nearby_list.jsp" %>
                                </div>
                            </div>
                            <!-- widget single Suggestions end -->
                        </aside>
                    </div>
                </div>
            </div>
        </div>

    </main>

    <!-- Scroll to top start -->
    <div class="scroll-top not-visible">
        <i class="bi bi-finger-index"></i>
    </div>
    <!-- Scroll to Top End -->

    <!-- JS
============================================ -->

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

    <script src="resources/js/app.js"></script>

</body>

</html>