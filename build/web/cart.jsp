<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="product.Cart"%>
<%@page import="product.ProductDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
        <link rel="stylesheet" href="css/index.css">
        <title>TechWithMe - Cart</title>
    </head>

    <body>
        <section id="header">
            <a href="#"><img src="img/newLogo.png" style="width: 60px;" class="logo" alt=""></a>

            <div>
                <ul id="navbar">
                    <li><a href="MainController?action=HomePage">Home</a></li>
                    <li><a href="MainController?action=ShopPage">Shop</a></li>
                    <li><a href="MainController?action=ContactPage">Contact</a></li>
                    <li><a href="MainController?action=LoginPage">Login</a></li>
                    <li id="lg-bag"><a class="active" href="MainController?action=CartPage"><i class="fa-solid fa-basket-shopping"></i></a></li>
                    <i id="close" class="fa-solid fa-xmark"></i>
                </ul>
            </div>
            <div id="mobile">
                <a class="active" href="MainController?action=CartPage"><i class="fa-solid fa-basket-shopping"></i></a>
                <i id="bar" class="fas fa-outdent"></i>
            </div>
        </section>

        <section id="page-header">
            <h2>#Cart</h2>
            <p>Save more with coupons & up to 70% off!</p>
        </section>

        <h3 style="text-align: center;
            font-size: 25px; 
            color: red">${requestScope.MESSAGE}</h3>
            
        <form action="MainController">
            <section id="cart" class="section-p1">
                <c:if test="${sessionScope.CART != null}">

                    <table width="100%">
                        <thead>
                            <tr>
                                <td>Image</td>
                                <td>Product</td>
                                <td>Price</td>
                                <td>Quantity</td>
                                <td>Subtotal</td>
                                <td>Remove</td>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="item" items="${sessionScope.CART.cart}">
                                <c:set var="product" value="${item.getValue()}"/>
                                <c:set var="total" value="${total + (product.price * product.quantity)}" />

                            <form action="MainController">
                                <tr>
                                    <td>
                                        <img src="${product.image1}" alt="">
                                    </td>
                                    <td>
                                        ${product.name}
                                    </td>
                                    <td>
                                        $${product.price}
                                    </td>
                                    <td>
                                        <input type="number" name="quantity" value="${product.quantity}" min="1">
                                        <input type="hidden" name="id" value="${product.productID}">
                                        <input type="hidden" name="action" value="EditCart">
                                    </td>
                                    <td>$${product.price * product.quantity}</td>
                                    <td>
                                        <a href="MainController?action=RemoveCart&id=${product.productID}">
                                            <i class="fa fa-times-circle"></i>
                                        </a>
                                    </td>
                                </tr>
                            </form>
                        </c:forEach>
                        </tbody>
                    </table>
                </c:if>
            </section>

            <section id="cart-add" class="section-p1">
                <div id="coupon">
                    <h3>Apply Coupon</h3>
                    <div>
                        <input type="text" placeholder="Enter Your Coupon">
                        <button class="normal">Apply</button>
                    </div>
                </div>

                <div id="subtotal">
                    <h3>Cart Totals</h3>
                    <table>
                        <tr>
                            <td>Cart Subtotal</td>
                            <td>$<c:out value="${total}" /></td>
                        </tr>
                        <tr>
                            <td>Shipping</td>
                            <td>Free</td>
                        </tr>
                        <tr>
                            <td><Strong>Total</Strong></td>
                            <td><Strong>$<c:out value="${total}"/></Strong></td>
                        </tr>
                    </table>
                    <a href="MainController?action=CheckOut" class="normal">Proceed to checkout</a>
                </div>
            </section>
        </form>

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
                <a href="contact.jsp">Contact Us</a>
            </div>
            <div class="col">
                <h4>My Account</h4>
                <a href="login.jsp">Sign In</a>
                <a href="cart.jsp">View Cart</a>
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