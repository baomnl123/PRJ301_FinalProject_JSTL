<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
        <link rel="stylesheet" href="css/index.css">
        <title>TechWithMe - Contact</title>
    </head>

    <body>
        <section id="header">
            <a href="#"><img src="img/newLogo.png" style="width: 60px;" class="logo" alt=""></a>

            <div>
                <ul id="navbar">
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="MainController?action=ShopPage">Shop</a></li>
                    <li><a class="active" href="MainController?action=ContactPage">Contact</a></li>
                    <li><a href="MainController?action=LoginPage">Login</a></li>
                    <li id="lg-bag"><a href="MainController?action=CartPage"><i class="fa-solid fa-basket-shopping"></i></a></li>
                    <i id="close" class="fa-solid fa-xmark"></i>
                </ul>
            </div>
            <div id="mobile">
                <a href="MainController?action=CartPage"><i class="fa-solid fa-basket-shopping"></i></a>
                <i id="bar" class="fas fa-outdent"></i>
            </div>
        </section>

        <section id="page-header">
            <h2>#Let's talk</h2>
            <p>LEAVE A MESSAGE, We love to hear from you</p>
        </section>

        <section id="contact-details" class="section-p1">
            <div class="details">
                <span>GET IN TOUCH</span>
                <h2>Visit one of our agency locations or contact us today</h2>
                <h3>Head Office</h3>
                <div>
                    <li>
                        <i class="fa fa-map"></i>
                        <p>Nguyen Xien - Long Thanh My HCM</p>
                    </li>
                    <li>
                        <i class="fa fa-envelope"></i>
                        <p>mglongbao@gmail.com</p>
                    </li>
                    <li>
                        <i class="fa fa-phone-alt"></i>
                        <p>(+84)764418461</p>
                    </li>
                </div>
            </div>
            <div class="map">
                <iframe
                    src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.66393322662!2d106.83641347608246!3d10.837009789315502!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x317521a29c137cc1%3A0x8aab4c5d3304b446!2sVinhomes%20Grand%20Park%20Qu%E1%BA%ADn%209!5e0!3m2!1svi!2s!4v1687218021444!5m2!1svi!2s"
                    width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"
                    referrerpolicy="no-referrer-when-downgrade"></iframe>
            </div>
        </section>

        <section id="newsletter" class="section-p1 section-m1">
            <div class="newstext">
                <h4>Sign Up for Newsletters</h4>
                <p>Get E-mail updates about our latest shop and <span>special offers.</span></p>
            </div>
            <div class="form">
                <input type="text" placeholder="Your Email">
                <button class="normal">Sign Up</button>
            </div>
        </section>

        <footer class="section-p1">
            <div class="col">
                <img class="logo" src="img/newLogo.png" style="width: 60px;" alt="">
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
                <img src="img/pay//pay.png" alt="">
            </div>
        </footer>

        <script src="js/index.js"></script>
    </body>

</html>