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

/**
 *
 * @author mglon
 */
public class OrderDetailsDAO {

    private static final String INSERT = "INSERT INTO tblOrderDetails(productID, orderID, price, quantity) VALUES(?,?,?,?)";
    private static final String GET_ORDER_DETAILS = "SELECT productID, price, quantity FROM tblOrderDetails WHERE orderID=?";
    
    public boolean insert(OrderDetailsDTO orderDetailsDTO) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(INSERT);
                ptm.setString(1, orderDetailsDTO.getProductID());
                ptm.setString(2, orderDetailsDTO.getOrderID());
                ptm.setDouble(3, orderDetailsDTO.getPrice());
                ptm.setInt(4, orderDetailsDTO.getQuantity());
                check =  ptm.executeUpdate() > 0 ? true : false;
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

    public List<OrderDetailsDTO> getOrderDetails(String orderID) throws SQLException {
        List<OrderDetailsDTO> orderDetailsDTO = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        
        try {
            conn = DBUtils.getConnection();
            if(conn != null) {
                ptm = conn.prepareStatement(GET_ORDER_DETAILS);
                ptm.setString(1, orderID);
                rs = ptm.executeQuery();
                
                while(rs.next()) {
                    String productID = rs.getString("productID");
                    Double price = rs.getDouble("price");
                    int quantity = rs.getInt("quantity");
                    orderDetailsDTO.add(new OrderDetailsDTO(0, productID, orderID, price, quantity));
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
        return orderDetailsDTO;
    }
}
