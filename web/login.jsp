<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="user.UserDTO"%>
<%@page import="user.UserDAO"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- reCAPTCHA -->
        <script
        src="https://www.google.com/recaptcha/enterprise.js?render=6Lcrl4wmAAAAABimNd8ZbUwSkc1iW-26UcwN8npq"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
        <link rel="stylesheet" href="css/index.css">
        <link rel="stylesheet" href="css/login.css">
        <title>Document</title>
    </head>

    <body>

        <section id="header">
            <a href="#"><img src="img/newLogo.png" style="width: 60px;" class="logo" alt=""></a>

            <div>
                <ul id="navbar">
                    <li><a href="MainController?action=HomePage">Home</a></li>
                    <li><a href="MainController?action=ShopPage">Shop</a></li>
                    <li><a href="MainController?action=ContactPage">Contact</a></li>
                    <li><a class="active" href="MainController?action=LoginPage">Login</a></li>
                    <li id="lg-bag"><a href="MainController?action=CartPage"><i class="fa-solid fa-basket-shopping"></i></a></li>
                    <i id="close" class="fa-solid fa-xmark"></i>
                </ul>
            </div>
            <div id="mobile">
                <a class="active" href="MainController?action=CartPage"><i class="fa-solid fa-basket-shopping"></i></a>
                <i id="bar" class="fas fa-outdent"></i>
            </div>
        </section>

        <c:if test="${sessionScope.LOGIN_USER == null}">
            <!--If user haven't login yet, then show login form
            If already login, show account information-->
            <section class="container forms">
                <div class="form login">
                    <div class="form-content">
                        <header>Login</header>
                        <form action="MainController" method="POST">
                            <div class="field input-field">
                                <input type="text" name="userID" placeholder="User ID" class="input" required="">
                            </div>

                            <div class="field input-field">
                                <input type="password" name="password" placeholder="Password" class="password" required="">
                                <i class='bx bx-hide eye-icon'></i>
                            </div>

                            <div class="form-link">
                                <a href="#" class="forgot-pass">Forgot password?</a>
                            </div>

                            <div class="field button-field">
                                <button type="submit" name="action" value="Login">Login</button>
                            </div>
                        </form>

                        <div class="form-link">
                            <span>Don't have an account? <a href="#" class="link signup-link">Signup</a></span>
                        </div>
                    </div>

                    <div class="line"></div>

                    <div class="media-options">
                        <a href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8080/PRJ301_Assignment/GoogleLogin/LoginGoogleHandler&response_type=code
                           &client_id=336952551812-sbld49ic4nb4qp65rnh3jqmrabh0f886.apps.googleusercontent.com&approval_prompt=force"
                           class="field google">
                            <img src="img/google.png" alt="" class="google-img">
                            <span>Login with Google</span>
                        </a>
                    </div>

                </div>

                <!-- Signup Form -->

                <div class="form signup">
                    <div class="form-content">
                        <header>Signup</header>
                        <form action="MainController">
                            <div class="field input-field">
                                <input type="text" name="userID" placeholder="User ID" class="input" required="">
                            </div>
                            
                            <div class="field input-field">
                                <input type="text" name="fullName" placeholder="Full Name" class="input" required="">
                            </div>

                            <div class="field input-field">
                                <input type="password" name="password" placeholder="Password" class="password" required="">
                                <i class='bx bx-hide eye-icon'></i>
                            </div>

                            <div class="field input-field">
                                <input type="password" name="confirmPassword" placeholder="Confirm Your Password" class="password" required="">
                                <i class='bx bx-hide eye-icon'></i>
                            </div>

                            <div class="field button-field">
                                <button type="submit" name="action" value="Signup">Signup</button>
                            </div>
                        </form>

                        <div class="form-link">
                            <span>Already have an account? <a href="#" class="link login-link">Login</a></span>
                        </div>
                    </div>

                    <div class="line"></div>

                    <div class="media-options">
                        <a href="https://accounts.google.com/o/oauth2/auth?scope=profile&redirect_uri=http://localhost:8080/LoginGoogle/LoginGoogleHandler&response_type=code
                           &client_id=336952551812-sbld49ic4nb4qp65rnh3jqmrabh0f886.apps.googleusercontent.com&approval_prompt=force"
                           class="field google">
                            <img src="img/google.png" alt="" class="google-img">
                            <span>Login with Google</span>
                        </a>
                    </div>

                </div>
            </section>
        </c:if>

        <c:if test="${sessionScope.LOGIN_USER.roleID eq 'AD'}">
            <c:set var="loginUser" value="${sessionScope.LOGIN_USER}"/>

            <section class="container forms">
                <div class="form login">
                    <div class="form-content">
                        <header>Profile</header>
                        <p><strong>Name</strong> ${loginUser.fullName}</p>
                        <p><strong>Phone:</strong> (+84)764418461</p>
                        <p><strong>Email:</strong> mglongbao@gmail.com</p>

                        <div class="form-link">
                            <div>
                                <a href="MainController?action=OrderPage&userID=${loginUser.userID}">
                                    <span>See you Orders</span>
                                </a>
                            </div>
                        </div>
                        <div class="form-link">
                            <div>
                                <a href="MainController?action=AdminPage">
                                    <span>Go to Admin Page</span>
                                </a>
                            </div>
                        </div>

                        <div class="line"></div>

                        <div class="form-link">
                            <span>
                                <a href="MainController?action=Logout">
                                    <i class="uil uil-signout"></i>
                                    <span>Logout</span>
                                </a>
                            </span>
                        </div>
                    </div>
                </div>
            </section>
        </c:if>

        <c:if test="${sessionScope.LOGIN_USER.roleID eq 'US'}">
            <c:set var="loginUser" value="${sessionScope.LOGIN_USER}"/>
            <section class="container forms">
                <div class="form login">
                    <div class="form-content">
                        <header>Profile</header>
                        <p><strong>Name:</strong> ${loginUser.fullName}</p>
                        <p><strong>Phone:</strong> (+84)764418461</p>
                        <p><strong>Email:</strong> mglongbao@gmail.com</p>

                        <div class="form-link">
                            <span>
                                <a href="MainController?action=OrderPage&userID=${loginUser.userID}">
                                    <span>See you Orders</span>
                                </a>
                            </span>
                        </div>
                        <div class="line"></div>

                        <div class="form-link">
                            <span><a href="MainController?action=Logout">
                                    <i class="uil uil-signout"></i>
                                    <span>Logout</span>
                                </a></span>
                        </div>
                    </div>
                </div>
            </section>
        </c:if>

        <footer class="section-p1">
            <div class="col">
                <img class="logo" src="img/newLogo.png" style="width: 60px;" alt="" />
                <h4>Contact</h4>
                <p><strong>Address:</strong> Nguyen Xien, Long Thanh My, HCM</p>
                <p><strong>Phone:</strong> (+84)764418461</p>
                <p><strong>Email:</strong> mglongbao@gmail.com</p>
            </div>

            <div class="col">
                <h4>About</h4>
                <a href="#">About Us</a>
                <a href="#">Delivery Information</a>
                <a href="#">Privacy Policy</a>
                <a href="#">Terms & Conditions</a>
                <a href="#">Contact Us</a>
            </div>
            <div class="col">
                <h4>My Account</h4>
                <a href="#">Sign In</a>
                <a href="#">View Cart</a>
                <a href="#">My Wishlist</a>
                <a href="#">Track My Order</a>
                <a href="#">Help</a>
            </div>

            <div class="col payment">
                <p>Secured Payment Gateways</p>
                <img src="img/pay//pay.png" alt="" />
            </div>
        </footer>

        <!-- JavaScript -->
        <script src="js/index.js"></script>
        <script src="js/login.js"></script>
        <script
        src="https://www.google.com/recaptcha/enterprise.js?render=6Lcrl4wmAAAAABimNd8ZbUwSkc1iW-26UcwN8npq"></script>
        <script>
            grecaptcha.enterprise.ready(async () => {
                const token = await grecaptcha.enterprise.execute('6Lcrl4wmAAAAABimNd8ZbUwSkc1iW-26UcwN8npq', {action: 'homepage'});
                // IMPORTANT: The 'token' that results from execute is an encrypted response sent by
                // reCAPTCHA Enterprise to the end user's browser.
                // This token must be validated by creating an assessment.
                // See https://cloud.google.com/recaptcha-enterprise/docs/create-assessment
            });
        </script>
    </body>

</html>