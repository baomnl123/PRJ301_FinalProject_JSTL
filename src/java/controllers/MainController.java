/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author mglon
 */
@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {

    private static final String HOME_PAGE = "HomePage";
    private static final String HOME_PAGE_VIEW = "index.jsp";
    private static final String SHOP_PAGE = "ShopPage";
    private static final String SHOP_CONTROLLER = "ShopController";
    private static final String PRODUCT_PAGE = "ProductPage";
    private static final String PRODUCT_CONTROLLER = "ProductController";
    private static final String LOGIN_PAGE = "LoginPage";
    private static final String LOGIN_PAGE_VIEW = "login.jsp";
    private static final String CONTACT_PAGE = "ContactPage";
    private static final String CONTACT_PAGE_VIEW = "contact.jsp";
    private static final String CART_PAGE = "CartPage";
    private static final String CART_PAGE_CONTROLLER = "CartController";
    private static final String ORDER_PAGE = "OrderPage";
    private static final String ORDER_CONTROLLER = "OrderController";

    private static final String ADMIN_PAGE = "AdminPage";
    private static final String ADMIN_CONTROLLER = "AdminController";
    private static final String ADMIN_PRODUCT_PAGE = "AdminProductPage";
    private static final String ADMIN_PRODUCT_CONTROLLER = "AdminProductController";

    private static final String LOGIN = "Login";
    private static final String LOGIN_CONTROLLER = "LoginController";

    private static final String SIGNUP = "Signup";
    private static final String SIGNUP_CONTROLLER = "SignupController";

    private static final String LOGOUT = "Logout";
    private static final String LOGOUT_CONTROLLER = "LogoutController";

    private static final String SEARCH_USERS = "SearchUser";
    private static final String SEARCH_PRODUCTS = "SearchProduct";
    private static final String SEARCH_USER_CONTROLLER = "SearchUserController";
    private static final String SEARCH_PRODUCT_CONTROLLER = "SearchProductController";

    private static final String CHECKOUT = "CheckOut";
    private static final String CHECKOUT_CONTROLLER = "CheckOutController";

    private static final String ADD_USER = "AddUser";
    private static final String ADD_PRODUCT = "AddProduct";
    private static final String ADMIN_ADD_PRODUCT_CONTROLLER = "AdminAddProductController";

    private static final String REMOVE_USER = "RemoveUser";
    private static final String REMOVE_PRODUCT = "RemoveProduct";
    private static final String REMOVE_USER_CONTROLLER = "RemoveUserController";
    private static final String REMOVE_PRODUCT_CONTROLLER = "RemoveProductController";

    private static final String ADD_CART = "AddCart";
    private static final String ADD_CART_CONTROLLER = "AddCartController";
    private static final String REMOVE_CART = "RemoveCart";
    private static final String REMOVE_CART_CONTROLLER = "RemoveCartController";
    private static final String EDIT_CART = "EditCart";
    private static final String EDIT_CART_CONTROLLER = "EditCartController";

    private static final String EDIT_USER = "EditUser";
    private static final String EDIT_PRODUCT = "EditProduct";
    private static final String EDIT_USER_CONTROLLER = "EditUserController";
    private static final String EDIT_PRODUCT_CONTROLLER = "EditProductController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String url = HOME_PAGE_VIEW;
        try {
            String action = request.getParameter("action");
            if (action == null) {
                url = HOME_PAGE_VIEW;
            } else if (HOME_PAGE.equals(action)) {
                url = HOME_PAGE_VIEW;
            } else if (SHOP_PAGE.equals(action)) {
                url = SHOP_CONTROLLER;
            } else if (PRODUCT_PAGE.equals(action)) {
                url = PRODUCT_CONTROLLER;
            } else if (CART_PAGE.equals(action)) {
                url = CART_PAGE_CONTROLLER;
            } else if (CONTACT_PAGE.equals(action)) {
                url = CONTACT_PAGE_VIEW;
            } else if (LOGIN_PAGE.equals(action)) {
                url = LOGIN_PAGE_VIEW;
            } else if (ADMIN_PAGE.equals(action)) {
                url = ADMIN_CONTROLLER;
            } else if (ADMIN_PRODUCT_PAGE.equals(action)) {
                url = ADMIN_PRODUCT_CONTROLLER;
            } else if (LOGIN.equals(action)) {
                url = LOGIN_CONTROLLER;
            } else if (SIGNUP.equals(action)) {
                url = SIGNUP_CONTROLLER;
            } else if (LOGOUT.equals(action)) {
                url = LOGOUT_CONTROLLER;
            } else if (SEARCH_USERS.equals(action)) {
                url = SEARCH_USER_CONTROLLER;
            } else if (SEARCH_PRODUCTS.equals(action)) {
                url = SEARCH_PRODUCT_CONTROLLER;
            } else if (ADD_USER.equals(action)) {
                url = SIGNUP_CONTROLLER;
            } else if (ADD_PRODUCT.equals(action)) {
                url = ADMIN_ADD_PRODUCT_CONTROLLER;
            } else if (REMOVE_PRODUCT.equals(action)) {
                url = REMOVE_PRODUCT_CONTROLLER;
            } else if (EDIT_PRODUCT.equals(action)) {
                url = EDIT_PRODUCT_CONTROLLER;
            } else if (EDIT_USER.equals(action)) {
                url = EDIT_USER_CONTROLLER;
            } else if (CHECKOUT.equals(action)) {
                url = CHECKOUT_CONTROLLER;
            } else if (REMOVE_USER.equals(action)) {
                url = REMOVE_USER_CONTROLLER;
            } else if (REMOVE_PRODUCT.equals(action)) {
                url = REMOVE_PRODUCT_CONTROLLER;
            } else if (ADD_CART.equals(action)) {
                url = ADD_CART_CONTROLLER;
            } else if (REMOVE_CART.equals(action)) {
                url = REMOVE_CART_CONTROLLER;
            } else if (EDIT_CART.equals(action)) {
                url = EDIT_CART_CONTROLLER;
            } else if (ORDER_PAGE.equals(action)) {
                url = ORDER_CONTROLLER;
            }
        } catch (Exception e) {
            log("Error at MainController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
