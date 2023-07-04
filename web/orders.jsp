<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="order.OrderDetailsDTO"%>
<%@page import="order.OrderDTO"%>
<%@page import="java.util.List"%>
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
        <title>TechWithMe - Your Order</title>
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


        <h3 style="text-align: center;
            font-size: 25px; 
            color: red">${requestScope.MESSAGE}</h3>
        <c:if test="${requestScope.ORDER_LIST != null}">

            <c:forEach var="orderID" varStatus="totalOrders" items="${requestScope.ORDER_LIST}">
                ${totalOrders.count}
                <section id="cart" class="section-p1">
                    <h3>Your order ID: #${orderID.orderID}</h3>
                    <table width="100%">
                        <thead>
                            <tr>
                                <td>Image</td>
                                <td>Product</td>
                                <td>Price</td>
                                <td>Quantity</td>
                                <td>Subtotal</td>
                            </tr>
                        </thead>
                        <tbody>
                            <!--Show customer orders-->
                            <c:forEach var="orderDetails" items="${requestScope.ORDER_DETAILS}">
                                <c:if test="${orderID.orderID eq orderDetails.orderID}">
                                    <c:set var="totalPrice" value="${totalPrice + (orderDetails.price * orderDetails.quantity)}"/>
                                    <tr>
                                        <td>
                                            <c:forEach var="product" items="${requestScope.PRODUCT_LIST}">
                                                <c:if test="${orderDetails.productID eq product.productID}">
                                                    <img src="${product.image1}">
                                                </c:if>
                                            </c:forEach>
                                        </td>
                                        <td>
                                            <c:forEach var="product" items="${requestScope.PRODUCT_LIST}">
                                                <c:if test="${orderDetails.productID eq product.productID}">
                                                    ${product.name}
                                                </c:if>
                                            </c:forEach>
                                        </td>
                                        <td>
                                            $${orderDetails.price}
                                        </td>
                                        <td>
                                            ${orderDetails.quantity}
                                        </td>
                                        <td>$${orderDetails.price * orderDetails.quantity}</td>
                                    </tr>
                                </c:if>
                            </c:forEach>
                        </tbody>
                        <h3>Total: $<c:out value="${totalPrice}"/></h3>
                    </table>
                </section>
            </c:forEach>
            <h3 style="margin-left: 80px;">Your total orders: <c:out value="${totalOrders}"/></h3>
        </c:if>

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