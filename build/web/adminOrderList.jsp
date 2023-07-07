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
        <title>TechWithMe - Admin Order List</title>
    </head>

    <body>
        <section id="header">
            <a href="#"><img src="img/newLogo.png" style="width: 60px;" class="logo" alt=""></a>

            <%
                String search = request.getParameter("SearchUsers");
                if (search == null) {
                    search = "";
                }
            %>

            <div class="search-box">
                <form action="MainController">
                    <button type="submit" name="action" value="SearchProduct">
                        <i class="uil uil-search"></i>
                    </button>
                    <input type="text" name="Search" value="<%= search%>" placeholder="Search here...">
                    <input type="hidden" name="SearchPage" value="SearchUser">
                </form>
            </div>

            <div>
                <ul id="navbar">
                    <li><a href="MainController?action=AdminPage">Dashboard</a></li>
                    <li><a href="MainController?action=AdminUserPage">User List</a></li>
                    <li><a href="MainController?action=AdminProductPage">Product List</a></li>
                    <li><a class="active" href="MainController?action=AdminOrderPage">Order List</a></li>
                    <li><a href="MainController?action=AdminAccountPage">Account</a></li>
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
            
            <section id="cart" class="section-p1">

                <table width="100%">
                    <thead>
                        <tr>
                            <td>User ID</td>
                            <td>Full Name</td>
                            <td>Password</td>
                            <td>Role ID</td>
                            <td>Remove</td>
                        </tr>
                    </thead>
                    <tbody>
                        <!--Show customer cart-->
                        <%
                        %>
                    <form action="MainController">
                        <%
                            List<UserDTO> userList = (List<UserDTO>) request.getAttribute("USER_LIST");
                            if (userList != null) {
                                if (userList.size() > 0) {
                                    for (UserDTO user : userList) {
                        %>
                        <tr>
                            <td>
                                <%= user.getUserID()%>
                            </td>
                            <td>
                                <%= user.getFullName()%>
                            </td>
                            <td>
                                <input type="text" name="roleID" value="<%= user.getRoleID()%>" required="">
                                <input type="hidden" name="id" value="<%= user.getUserID()%>">
                                <input type="hidden" name="action" value="EditUser">
                            </td>
                            <td>
                                <!--Can not remove cart-->
                                <a href="MainController?action=RemoveCart&id=<%= user.getUserID()%>">
                                    <i class="fa fa-times-circle"></i>
                                </a>
                            </td>
                        </tr>
                    </form>
                    <%
                                }
                            }
                        }
                    %>
                    </tbody>
                </table>
            </section>

        <script src="js/index.js"></script>
    </body>
</html>

