<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="product.ProductDAO"%>
<%@page import="product.ProductDTO"%>
<%@page import="user.UserDAO"%>
<%@page import="user.UserDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<c:if test="${sessionScope.LOGIN_USER == null || sessionScope.LOGIN_USER.roleID ne 'AD'}">
    <c:redirect url="index.jsp"></c:redirect>
</c:if>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
        <link rel="stylesheet" href="css/index.css">
        <title>TechWithMe - Admin Dashboard</title>
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
                    <li><a href="MainController?action=AdminPage">Dashboard</a></li>
                    <li><a class="active" href="MainController?action=AdminProductPage">Product List</a></li>
                    <li id="lg-bag"><a href="MainController?action=HomePage"><i class="fa-solid fa-circle-xmark"></i></a>
                        <i id="close" class="fa-solid fa-xmark"></i>
                </ul>
            </div>
            <div id="mobile">
                <a href="MainController?action=HomePage"><i class="fa-solid fa-circle-xmark"></i></a>
                <i id="bar" class="fas fa-outdent"></i>
            </div>
        </section>

        <h3 style="text-align: center;
            font-size: 25px; 
            color: red">${requestScope.MESSAGE}</h3>

        <c:if test="${requestScope.LIST_PRODUCT != null}">
            <c:if test="${not empty requestScope.LIST_PRODUCT}">

                <section id="cart" class="section-p1">
                    <table width="100%">
                        <thead>
                            <tr>
                                <td>Image</td>
                                <td>Product ID</td>
                                <td>Name</td>
                                <td>Quantity</td>
                                <td>Price</td>
                                <td>Edit/Remove</td>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="product" items="${requestScope.LIST_PRODUCT}">
                            <form action="MainController">
                                <tr>
                                    <td>
                                        <img src="${product.image1}">
                                    </td>
                                    <td>
                                        ${product.productID}
                                    </td>
                                    <td>
                                        ${product.name}
                                    </td>
                                    <td>
                                        <input type="number" name="quantity" value="${product.quantity}" min="0">
                                    </td>
                                    <td>
                                        $<input style="width: 100px;
                                                padding: 10px 5px 10px 15px;" 
                                                type="number" name="price" value="${product.price}" min="0">
                                    </td>
                                    <td>
                                        <!--Can not remove cart-->
                                        <button style="border: none;
                                                color: blue;
                                                cursor: pointer;" 
                                                type="submit" name="action" value="EditProduct">
                                            <input type="hidden" name="productID" value="${product.productID}">
                                            <i class="fa-solid fa-pen-to-square"></i>
                                        </button>
                                        <button style="border: none;
                                                color: red;
                                                cursor: pointer;" 
                                                type="submit" name="action" value="RemoveProduct">
                                            <input type="hidden" name="productID" value="${product.productID}">
                                            <i class="fa fa-times-circle"></i>
                                        </button>
                                    </td>
                                </tr>
                            </form>
                        </c:forEach>
                        </tbody>
                    </table>
                </section>
            </c:if>
        </c:if>

        <script src="js/index.js"></script>
    </body>
</html>

