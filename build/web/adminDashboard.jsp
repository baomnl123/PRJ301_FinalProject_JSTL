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
                    <li><a class="active" href="MainController?action=AdminPage">Dashboard</a></li>
                    <li><a href="MainController?action=AdminProductPage">Product List</a></li>
                    <li id="lg-bag"><a href="MainController?action=HomePage"><i class="fa-solid fa-circle-xmark"></i></a>
                        <i id="close" class="fa-solid fa-xmark"></i>
                </ul>
            </div>
            <div id="mobile">
                <a href="MainController?action=HomePage"><i class="fa-solid fa-circle-xmark"></i></a>
                <i id="bar" class="fas fa-outdent"></i>
            </div>
        </section>

        <div class="dash-content">
            <div class="overview">
                <div class="title">
                    <i class="uil uil-tachometer-fast-alt"></i>
                    <span class="text">Dashboard</span>
                </div>

                <c:set var="totalUsers" value="${requestScope.TOTAL_USER}"/>
                <c:set var="totalProducts" value="${requestScope.TOTAL_PRODUCT}"/>
                <div class="boxes">
                    <div class="box box1">
                        <i class="uil uil-user"></i>
                        <span class="text">Total Users</span>
                        <span class="number"><c:out value="${totalUsers}"></c:out></span>
                    </div>
                    <div class="box box2">
                        <i class="uil uil-comments"></i>
                        <span class="text">Total Products</span>
                        <span class="number"><c:out value="${totalProducts}"></c:out></span>
                    </div>
                    <div class="box box3">
                        <i class="uil uil-clipboard-notes"></i>
                        <span class="text">Total Orders</span>
                        <span class="number">10,120</span>
                    </div>
                </div>
            </div>
        </div>

        <h3 style="text-align: center;
            font-size: 25px; 
            color: red">${requestScope.MESSAGE}</h3>

        <c:if test="${requestScope.USER_LIST != null}">
            <c:if test="${not empty requestScope.USER_LIST}">
                <section id="cart" class="section-p1">
                    <table width="100%">
                        <thead>
                            <tr>
                                <td>User ID</td>
                                <td>Full Name</td>
                                <td>Password</td>
                                <td>Role ID</td>
                                <td>Edit/Remove</td>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="user" items="${requestScope.USER_LIST}">
                            <form action="MainController">
                                <tr>
                                    <td>
                                        ${user.userID}
                                    </td>
                                    <td>
                                        <input style="width: 200px;
                                               padding: 10px 5px 10px 15px;"  
                                               type="text" name="fullName" value="${user.fullName}">
                                    </td>
                                    <td>
                                        ${user.password}
                                    </td>
                                    <td>
                                        <input type="text" name="roleID" value="${user.roleID}" required="">
                                    </td>
                                    <td>
                                        <button style="border: none;
                                                color: blue;
                                                cursor: pointer;" 
                                                type="submit" name="action" value="EditUser">
                                            <input type="hidden" name="userID" value="${user.userID}">
                                            <i class="fa-solid fa-pen-to-square"></i>
                                        </button>
                                        <button style="border: none;
                                                color: red;
                                                cursor: pointer;" 
                                                type="submit" name="action" value="RemoveUser">
                                            <input type="hidden" name="userID" value="${user.userID}">
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
