/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import java.sql.Timestamp;
import java.time.Instant;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import order.OrderDAO;
import order.OrderDTO;
import order.OrderDetailsDAO;
import order.OrderDetailsDTO;
import product.Cart;
import product.ProductDAO;
import product.ProductDTO;
import user.UserDTO;

/**
 *
 * @author mglon
 */
@WebServlet(name = "CheckOutController", urlPatterns = {"/CheckOutController"})
public class CheckOutController extends HttpServlet {

    private static final String ERROR = "cart.jsp";
//    change success to bill page
    private static final String SUCCESS = "OrderController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("CART");

            if (cart != null) {
                double total = 0;
                int stock = 0;
                UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");
                if (user == null) {
                    request.setAttribute("MESSAGE", "You must login before check out!");
                    return;
                }
                String userID = user.getUserID();
                Timestamp orderDate = Timestamp.from(Instant.now());
                ProductDAO dao = new ProductDAO();

                for (ProductDTO product : cart.getCart().values()) {
                    int productQuantity = dao.getProductQuantity(product.getProductID());
                    int purchaseQuantity = product.getQuantity();
                    stock = productQuantity - purchaseQuantity;
//                    check stock quantity
                    if (stock < 0) {
                        request.setAttribute("MESSAGE", "Product out of stock");
                        return;
                    }
                    // Update quantity to tblProduct
//                    dao.updateQuantity(product.getProductID(), stock);
//                    total += product.getQuantity() * product.getPrice();
                }
                // Table Order
                OrderDAO orderDAO = new OrderDAO();
                String orderID = orderDAO.generateOrderID();
                OrderDTO order = new OrderDTO(orderID, userID, orderDate, total);
                boolean checkInsert = orderDAO.insert(order);

                if (checkInsert) {
                    // table OrderDetail
                    OrderDetailsDAO orderDetailsDAO = new OrderDetailsDAO();
                    for (ProductDTO product : cart.getCart().values()) {
                        int purchaseQuantity = product.getQuantity();
                        String productID = product.getProductID();
                        double price = product.getPrice();
                        OrderDetailsDTO orderDetailsDTO = new OrderDetailsDTO(0, productID, orderID, price, purchaseQuantity);
                        boolean check = orderDetailsDAO.insert(orderDetailsDTO);

                        if (check) {
                            request.setAttribute("userID", userID);
                            session.removeAttribute("CART");
                            url = SUCCESS;
                        }
                    }
                }

            } else {
                request.setAttribute("MESSAGE", "You must login before check out!");
            }
        } catch (Exception e) {
            log("Error at CheckOutController: " + e.toString());
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
