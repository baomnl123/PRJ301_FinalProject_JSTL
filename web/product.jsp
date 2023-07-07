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
        <link rel="stylesheet" href="css/index.css">
        <title>TechWithMe - Product</title>
    </head>

    <body>
        <section id="header">
            <a href="#"><img src="img/newLogo.png" style="width: 60px;" class="logo" alt=""></a>

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
                <a href="MainController?action=CartPage"><i class="fa-solid fa-basket-shopping"></i></a>
                <i id="bar" class="fas fa-outdent"></i>
            </div>
        </section>

        <!--IF forward ID is possible, then try to forward all the object-->
        <%
            ProductDTO productDetails = (ProductDTO) request.getAttribute("PRODUCT_DETAILS");
        %>
    <c:set var="productDetails" value="${requestScope.PRODUCT_DETAILS}"/>
    <section id="prodetails" class="section-p1">
        <div class="single-pro-image">
            <img src="${productDetails.image1}" width="100%" id="MainImage" alt="">

            <div class="small-img-group">
                <div class="small-img-col">
                    <img src="${productDetails.image1}" width="100%" class="small-img" alt="">
                </div>
                <div class="small-img-col">
                    <img src="${productDetails.image2}" width="100%" class="small-img" alt="">
                </div>
                <div class="small-img-col">
                    <img src="${productDetails.image3}" width="100%" class="small-img" alt="">
                </div>
                <div class="small-img-col">
                    <img src="${productDetails.image4}" width="100%" class="small-img" alt="">
                </div>
            </div>
        </div>

        <div class="single-pro-details">
            <!--<h6>Home / T-Shirt</h6>-->
            <h4>${productDetails.name}</h4>
            <h2>$${productDetails.price}</h2>

            <!--Cannot send quantity to MainController-->
            <form action="MainController">
                <input type="number" name="quantity" value="1" min="1">
                <input type="hidden" name="productID" value="${productDetails.productID}">
                <button class="normal" type="submit" name="action" value="AddCart">
                    Add To Cart
                </button>
            </form>
            <h4>Product Details</h4>
            <span>${productDetails.description}
            </span>
        </div>
    </section>

    <section id="product1" class="section-p1">

        <!-- You May Like -->
        <h2>Similar Products</h2>
        <p>You May Like</p>
        <div class="pro-container">
            <c:set var="categoryList" value="${requestScope.SIMILAR_PRODUCT}"/>
            <c:forEach var="similarProduct" items="${categoryList}">
                <div class="pro">
                    <form action="MainController">
                        <a href="MainController?action=ProductPage&productId=${similarProduct.productID}">
                            <img src="${similarProduct.image1}" alt="">
                            <div class="des">
                                <span>${similarProduct.brand}</span>
                                <h5>${similarProduct.name}</h5>
                                <div class="star">
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                </div>
                                <h4>$${similarProduct.price}</h4>
                            </div>
                        </a>
                        <input type="hidden" name="productID" value="${similarProduct.productID}">
                        <input type="hidden" name="quantity" value="1">
                        <button type="submit" name="action" value="AddCart">
                            <i class="fa fa-shopping-cart cart"></i>
                        </button>
                    </form>
                </div>
            </c:forEach>
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

    <script>
        var MainImage = document.getElementById('MainImage');
        var smalling = document.getElementsByClassName('small-img');

        smalling[0].onclick = function () {
            MainImage.src = smalling[0].src;
        };

        smalling[1].onclick = function () {
            MainImage.src = smalling[1].src;
        };

        smalling[2].onclick = function () {
            MainImage.src = smalling[2].src;
        };

        smalling[3].onclick = function () {
            MainImage.src = smalling[3].src;
        };
    </script>
    <script src="js/index.js"></script>
</body>

</html>