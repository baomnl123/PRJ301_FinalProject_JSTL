/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package order;

import Database.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

/**
 *
 * @author mglon
 */
public class OrderDAO {

    private static final String INSERT = "INSERT INTO tblOrders(OrderID, UserID, Date, Total) VALUES(?,?,?,?)";
    private static final String GET_ORDER = "SELECT * FROM tblOrders WHERE UserID=?";
    private static final String GET_ORDER_ID = "SELECT OrderID FROM tblOrders WHERE UserID=?";

    public static String generateOrderID() {
        Random random = new Random();
        int randomNumber = random.nextInt(10000) + 1;;
        String prefix = "O";
        String code = prefix + String.format("%04d", randomNumber);
        return code;
    }

    public boolean insert(OrderDTO order) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(INSERT);
                ptm.setString(1, order.getOrderID());
                ptm.setString(2, order.getUserID());
                ptm.setTimestamp(3, order.getDate());
                ptm.setDouble(4, order.getTotal());
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
    
    public List<OrderDTO> getOrder(String userID) throws SQLException {
        List<OrderDTO> orderDTO = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        
        try {
            conn = DBUtils.getConnection();
            if(conn != null) {
                ptm = conn.prepareStatement(GET_ORDER);
                ptm.setString(1, userID);
                rs = ptm.executeQuery();
                while(rs.next()) {
                    String orderID = rs.getString("OrderID");
                    Timestamp date = rs.getTimestamp("Date");
                    double total = rs.getDouble("Total");
                    orderDTO.add(new OrderDTO(orderID, userID, date, total));
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return orderDTO;
    }

    public String getOrderID(String userID) throws SQLException {
        String orderID = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        
        try {
            conn = DBUtils.getConnection();
            if(conn != null) {
                ptm = conn.prepareStatement(GET_ORDER_ID);
                ptm.setString(1, userID);
                rs = ptm.executeQuery();
                while(rs.next()) {
                    orderID = rs.getString("OrderID");
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return orderID;
    }
}
