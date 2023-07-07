<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="product.ProductDAO"%>
<%@page import="product.ProductDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
        <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
        <link rel="stylesheet" href="css/index.css">
        <title>TechWithMe - Shop</title>
    </head>

    <body>
        <section id="header">
            <a href="#"><img src="img/newLogo.png" style="width: 60px;" class="logo" alt=""></a>


            <div class="search-box">
                <form action="MainController">
                    <button type="submit" name="action" value="SearchProduct">
                        <i class="uil uil-search"></i>
                    </button>
                    <input type="text" name="Search" value="${param.search}" placeholder="Search here...">
                    <input type="hidden" name="SearchPage" value="SearchUser">
                </form>
            </div>

            <div>
                <ul id="navbar">
                    <li><a href="MainController?action=HomePage">Home</a></li>
                    <li><a class="active" href="MainController?action=ShopPage">Shop</a></li>
                    <li><a href="MainController?action=ContactPage">Contact</a></li>
                    <li><a href="MainController?action=LoginPage">Login</a></li>
                    <li id="lg-bag"><a href="MainController?action=CartPage"><i class="fa-solid fa-basket-shopping"></i></a></li>
                    <i id="close" class="fa-solid fa-xmark"></i>
                </ul>
            </div>
            <div id="mobile">
                <a href="cart.jsp"><i class="fa-solid fa-basket-shopping"></i></a>
                <i id="bar" class="fas fa-outdent"></i>
            </div>
        </section>

        <section id="page-header">
            <h2>#Stayhome</h2>
            <p>Save more with coupons & up to 70% off!</p>
        </section>

        <!-- Add more product to this section -->
        <section id="product1" class="section-p1">

            <h3 style="text-align: center;
                font-size: 25px; 
                color: red">${requestScope.MESSAGE}</h3>

            <div class="pro-container">
                <c:set var="listProduct" value="${requestScope.LIST_PRODUCT}"/>
                <c:if test="${listProduct != null}">
                    <c:if test="${not empty listProduct}">
                        <c:forEach var="product" items="${listProduct}">
                             <div class="pro">
                                <form action="MainController">
                                    <a href="MainController?action=ProductPage&productId=${product.productID}">
                                        <img src="${product.image1}" alt="">
                                        <div class="des">
                                            <span>${product.brand}</span>
                                            <h5>${product.name}</h5>
                                            <div class="star">
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                            </div>
                                            <h4>$${product.price}</h4>
                                        </div>
                                    </a>
                                    <input type="hidden" name="productID" value="${product.productID}">
                                    <input type="hidden" name="quantity" value="1">
                                    <button type="submit" name="action" value="AddCart">
                                        <i class="fa fa-shopping-cart cart"></i>
                                    </button>
                                </form>
                            </div>
                        </c:forEach>
                    </c:if>
                </c:if>
            </div>
        </section>

        <!--Remove pagination-->
        <section id="pagination" class="section-p1">
            <a href="#">1</a>
            <a href="#">2</a>
            <a href="#"><i class="fa fa-long-arrow-alt-right"></i></a>
        </section>

        <!--Add function to send Email-->
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