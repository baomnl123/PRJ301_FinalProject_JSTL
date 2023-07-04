/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package product;

import Database.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author mglon
 */
public class ProductDAO {

    private static final String SEARCH_SPECIFIC_PRODUCT = "SELECT * FROM tblProduct WHERE productID=? AND Status=1";
    private static final String SEARCH_CATEGORY = "SELECT * FROM tblProduct WHERE category LIKE ? AND Status=1";
    private static final String SEARCH_PRODUCT = "SELECT * FROM tblProduct WHERE name LIKE ? AND Status=1";
    private static final String SEARCH_ALL_PRODUCT = "SELECT * FROM tblProduct WHERE Status=1";
    private static final String GET_TOTAL_PRODUCT = "SELECT COUNT(productID) FROM tblProduct WHERE Status=1";
    private static final String GET_PRODUCT_QUANTITY = "SELECT quantity FROM tblProduct WHERE productID=? AND Status=1";
    private static final String UPDATE = "UPDATE tblProduct SET price=?, quantity=? WHERE productID=?";
    private static final String DELETE = "UPDATE tblProduct SET Status=0 WHERE productID=?";

    public String getTotalProducts() throws SQLException {
        String totalProducts = "0";
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_TOTAL_PRODUCT);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    totalProducts = rs.getString(1);
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
        return totalProducts;
    }

    public ProductDTO getSpecificProducts(String search) throws SQLException {
        ProductDTO product = new ProductDTO();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH_SPECIFIC_PRODUCT);
                ptm.setString(1, search);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");
                    String name = rs.getString("name");
                    String brand = rs.getString("Brand");
                    String category = rs.getString("category");
                    double price = rs.getDouble("price");
                    int quantity = rs.getInt("quantity");
                    String description = rs.getNString("description");
                    String Image1 = rs.getString("Image1");
                    String Image2 = rs.getString("Image2");
                    String Image3 = rs.getString("Image3");
                    String Image4 = rs.getString("Image4");
                    product = new ProductDTO(productID, name, brand, category, price, quantity, description, Image1, Image2, Image3, Image4);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
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
        return product;
    }

    public List<ProductDTO> getCategoryList(String search) throws SQLException {
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH_CATEGORY);
                ptm.setString(1, "%" + search + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");
                    String name = rs.getString("name");
                    String brand = rs.getString("brand");
                    String category = rs.getString("category");
                    double price = rs.getDouble("price");
                    int quantity = rs.getInt("quantity");
                    String image1 = rs.getString("image1");
                    String image2 = rs.getString("image2");
                    String image3 = rs.getString("image3");
                    String image4 = rs.getString("image4");
                    list.add(new ProductDTO(productID, name, brand, category, price, quantity, productID, image1, image2, image3, image4));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
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
        return list;
    }

    public List<ProductDTO> getListProducts(String search) throws SQLException {
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH_PRODUCT);
                ptm.setString(1, "%" + search + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");
                    String name = rs.getString("name");
                    String brand = rs.getString("brand");
                    String category = rs.getString("category");
                    double price = rs.getDouble("price");
                    int quantity = rs.getInt("quantity");
                    String image1 = rs.getString("image1");
                    String image2 = rs.getString("image2");
                    String image3 = rs.getString("image3");
                    String image4 = rs.getString("image4");
                    list.add(new ProductDTO(productID, name, brand, category, price, quantity, productID, image1, image2, image3, image4));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
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
        return list;
    }

    public List<ProductDTO> listAllProducts() throws SQLException {
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH_ALL_PRODUCT);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");
                    String name = rs.getString("name");
                    String brand = rs.getString("brand");
                    String category = rs.getString("category");
                    int price = rs.getInt("price");
                    int quantity = rs.getInt("quantity");
                    String image1 = rs.getString("image1");
                    String image2 = rs.getString("image2");
                    String image3 = rs.getString("image3");
                    String image4 = rs.getString("image4");
                    list.add(new ProductDTO(productID, name, brand, category, price, quantity, productID, image1, image2, image3, image4));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
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
        return list;
    }

    public boolean update(ProductDTO product) throws SQLException {
        boolean checkUpdate = false;
        Connection conn = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE);
                ptm.setDouble(1, product.getPrice());
                ptm.setDouble(2, product.getQuantity());
                ptm.setString(3, product.getProductID());
                checkUpdate = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return checkUpdate;
    }

    public int getProductQuantity(String productID) throws SQLException, ClassNotFoundException {
        int quantity = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;

        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(GET_PRODUCT_QUANTITY);
            ptm.setString(1, productID);
            rs = ptm.executeQuery();

            if (rs.next()) {
                quantity = rs.getInt("quantity");
            }

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
        return quantity;
    }

    public boolean deleteProduct(String productID) throws SQLException {
        boolean checkDelete = false;
        Connection conn = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETE);
                ptm.setString(1, productID);
                checkDelete = ptm.executeUpdate() > 0 ? true : false;
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
        return checkDelete;
    }
}
