<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

</head>

<body class="bg-img" >

    <main>
        <div class="main-wrapper pb-0 mb-0">
            <div class="timeline-wrapper">
                <div class="timeline-header">
                    <div class="container-fluid p-0">
                        <div class="row no-gutters align-items-center">
                            <div class="col-lg-6">
                                <div class="timeline-logo-area d-flex align-items-center">
                                    <div class="timeline-logo">
                                        <a href="indexs.html">
                                            <img src="assets/images/logo/logo.png" alt="timeline logo">
                                        </a>
                                    </div>
                                    <div class="timeline-tagline">
                                        <h2 class="tagline">Let’s see what’s happening to you and your world. Welcome in itravel.</h2>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="login-area">
                                    <form  id="loginForm"  name="loginForm" method="post" action = "">
                                        <div class="row align-items-center">
                                            <div class="col-12 col-sm">
                                                <input type="text" id="input" name="username" required="required" placeholder="Email or Userame" class="single-field">
                                                <span style="color:#dc4734"  >span</span>
                                            </div>
                                            <div class="col-12 col-sm">
                                                <input type="password" name="password"  required="required" placeholder="Password" class="single-field">
                                                <span id = "tries">You have 1 try only.</span>
                                            </div>
                                            <div class="col-12 col-sm">
                                                <button id="loginBtn" type="submit" class="login-btn">Login</button>
                                                <span style="color:#dc4734; display: block" >spanfsadfdsafdsafdsafdsafdsafsafdsafdsaf</span>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="timeline-page-wrapper">
                    <div class="container-fluid p-0">
                        <div class="row no-gutters">
                            <div class="col-lg-6 order-2 order-lg-1">
                                <div class="timeline-bg-content bg-img" data-bg="assets/images/timeline/adda-timeline.jpg"></div>
                            </div>
                            <div class="col-lg-6 order-1 order-lg-2 d-flex align-items-center justify-content-center">
                                <div class="signup-form-wrapper">
                                    <h1 class="create-acc text-center">iTravel</h1>
                                    <div class="signup-inner text-center">
                                        <h3 class="title">Welcome to iTravel</h3>
                                        <form method="post"  action="users" class="signup-inner--form">
                                            <div class="row">
                                                <div class="col-12">
                                                    <input required id="emailCreate" type="email" name="email" class="single-field" placeholder="Email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"
                                                           title="Must be written in Email format">
                                                    <span style="color:red" id="emailError">Email already used!</span>
                                                </div>
                                                <div class="col-md-5">
                                                    <input required type="text" name="fname" class="single-field" placeholder="First Name">
                                                </div>
                                                <div class="col-md-2">
                                                    <input type="text" name="mname" class="single-field" placeholder="M.I">
                                                </div>
                                                <div class="col-md-5">
                                                    <input required type="text" name="lname" class="single-field" placeholder="Last Name">
                                                </div>
                                                <div class="col-12">
                                                    <input required type="password" name="pass"  class="single-field" placeholder="Password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}"
                                                           title="Must contain at least one  number and one uppercase and lowercase letter, and at least 6 or more characters">
                                                </div>
                                                <div class="col-md-6">
                                                    <select required name="gender" class="nice-select" name="sortby">
                                                        <option disabled selected value="trending">Gender</option>
                                                        <option value="Male">Male</option>
                                                        <option value="Female">Female</option>
                                                    </select>
                                                </div>

                                                <div class="col-12">
                                                    <input required type="text" name="street"class="single-field" placeholder="Street">
                                                </div>
                                                <div class="col-md-4">
                                                    <input required type="text" name="city" class="single-field" placeholder="City">
                                                </div>
                                                <div class="col-md-4">
                                                    <input required type="text" name="state" class="single-field" placeholder="State">
                                                </div>
                                                <div class="col-md-4">
                                                    <input required type="text" name="zipcode" class="single-field" placeholder="ZIP">
                                                </div>
<%--                                                <div class="col-12">--%>

<%--                                                    <select class="nice-select" name="sortby">--%>
<%--                                                        <option value="trending">Country</option>--%>
<%--                                                        <option value="sales">Bangladesh</option>--%>
<%--                                                        <option value="sales">Noakhali</option>--%>
<%--                                                        <option value="sales">Australia</option>--%>
<%--                                                        <option value="sales">China</option>--%>
<%--                                                    </select>--%>
<%--                                                </div>--%>
                                                <div class="col-12">
                                                    <button type="submit" id="createBtn" class="submit-btn">Create Account</button>
                                                </div>
                                            </div>
                                            <h6 class="terms-condition">Login as <a href="admin-login.jsp">ADMIN</a></h6>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>

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
    <!--our java script -->
    <script src="resources/js/index.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</body>

</html>