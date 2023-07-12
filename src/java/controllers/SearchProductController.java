/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import product.ProductDAO;
import product.ProductDTO;

/**
 *
 * @author mglon
 */
@WebServlet(name = "SearchProductController", urlPatterns = {"/SearchProductController"})
public class SearchProductController extends HttpServlet {

    private static final String SHOP_PAGE = "shop.jsp";
    private static final String ADMIN_PAGE = "adminDashboard.jsp";
    private static final String PRODUCT_LIST_PAGE = "adminProductList.jsp";
    private static final String SEARCH_USER = "SearchUser";
    private static final String SEARCH_ADMIN = "SearchAdmin";
    private static final String SEARCH_PRODUCT_LIST = "SearchProductList";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String url = SHOP_PAGE;
        try {
            String search = request.getParameter("Search");
            String searchPage = request.getParameter("SearchPage");
            ProductDAO dao = new ProductDAO();
            List<ProductDTO> listProduct = dao.getListProducts(search);

            if (listProduct.size() > 0) {
                request.setAttribute("LIST_PRODUCT", listProduct);
                if (SEARCH_USER.equals(searchPage)) {
                    url = SHOP_PAGE;
                } else if(SEARCH_ADMIN.equals(searchPage)) {
                    url = ADMIN_PAGE;
                } else if(SEARCH_PRODUCT_LIST.equals(searchPage)) {
                    url = PRODUCT_LIST_PAGE;
                }
            } else {
                request.setAttribute("ERROR", "Cannot find your search");
            }
        } catch (Exception e) {
            log("Error at SearchProductController: " + e.toString());
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
