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
import user.UserDAO;
import user.UserDTO;
import user.UserError;

/**
 *
 * @author mglon
 */
@WebServlet(name = "SignupController", urlPatterns = {"/SignupController"})
public class SignupController extends HttpServlet {

    private static final String LOGIN = "login.jsp";
    private static final String ADMIN_DASHBOARD = "AdminController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String url = LOGIN;
        UserError error = new UserError();

        try {
            String Signup = request.getParameter("Signup");
            String confirmPassword = null;
            
            if (Signup != null) {
                confirmPassword = request.getParameter("confirmPassword");
            } else {
                url = ADMIN_DASHBOARD;
            }

            String userID = request.getParameter("userID");
            String fullName = request.getParameter("fullName");
            String roleID = request.getParameter("roleID");
            String password = request.getParameter("password");
            boolean check = true;
            UserDAO dao = new UserDAO();

            if (Signup != null) {
                confirmPassword = request.getParameter("confirmPassword");
                if (!password.equals(confirmPassword)) {
                    error.setPasswordError("The confirm password does not match!");
                    check = false;
                }
            }

            if (userID.length() < 2 || userID.length() > 10) {
                error.setUserIDError("userID must be in (2, 10)");
                check = false;
            }

//            boolean checkDuplicate = dao.checkDuplicateV2(userID);
            boolean checkDuplicate = dao.checkDuplicate(userID);
            if (checkDuplicate) {
                error.setUserIDError("Duplicate userID");
                check = false;
            }
            if (fullName.length() < 5 || fullName.length() > 20) {
                error.setFullNameError("Full Name must be in (5, 20)");
                check = false;
            }
            if (check) {
                UserDTO user = new UserDTO(userID, fullName, roleID, password);
                boolean checkInsert = dao.insert(user);
                if (!checkInsert) {
                    request.setAttribute("ERROR", "Unknown error!");
                }
            } else {
                request.setAttribute("USER_ERROR", error);
            }
        } catch (Exception e) {
            log("Error at CreateController: " + e.toString());
            if (e.toString().contains("duplicate")) {
                error.setUserIDError("Duplicate ID");
                request.setAttribute("USER_ERROR", error);
            }
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
