/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import untils.DBUtils;
import dto.CartDTO;
import dto.ProductDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author phamt
 */
public class CreateOrderDAO {

    private static final String CREATE_ORDER = "INSERT INTO [dbo].[tblOrder]\n"
            + "           ([orderDate]\n"
            + "           ,[total]\n"
            + "           ,[userID]\n"
            + "           ,[status])\n"
            + "     VALUES(?,?,?,?)";
    private static final String CREATE_ORDER_DETAIL = "INSERT INTO [dbo].[tblOrderDetail]\n"
            + "           ([price]\n"
            + "           ,[quantity]\n"
            + "           ,[orderID]\n"
            + "           ,[productID])\n"
            + "     VALUES(?,?,?,?)";
    private static final String GET_ORDER_ID = "SELECT MAX(orderID) AS [orderID] FROM tblOrder";
    private static final String UPDATE_PRODUCT_QUANTITY = "UPDATE [tblProduct]\n"
            + "SET [quantity] = ?-?\n"
            + "WHERE [productID] = ?";
    private static final String GET_PRODUCT_QUANTITY_CURRENT = "SELECT [quantity] FROM tblProduct WHERE [productID] = ?";

//    public boolean createOrder(String userID, double total, CartDTO cart) throws SQLException {
//        boolean check = false;
//        Connection conn = null;
//        PreparedStatement ptm = null;
//        ResultSet rs = null;
//        try {
//            conn = DBUtils.getConnection();
//            Date nowDate = new Date();
//            SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd");
//            String strNowDate = formater.format(nowDate);
//            String status = "Request";
//            ptm = conn.prepareStatement(CREATE_ORDER);
//            ptm.setString(1, strNowDate);
//            ptm.setDouble(2, total);
//            ptm.setString(3, userID);
//            ptm.setString(4, status);
//            check = ptm.executeUpdate() > 0;
//            if (check) {
//                ptm = null;
//                ptm = conn.prepareStatement(GET_ORDER_ID);
//                rs = ptm.executeQuery();
//                if (rs.next()) {
//                    int orderID = rs.getInt("orderID");
//                    for (ProductDTO prod : cart.getList()) {
//                        ptm = null;
//                        ptm = conn.prepareStatement(CREATE_ORDER_DETAIL);
//                        ptm.setDouble(1, prod.getPrice());
//                        ptm.setInt(2, prod.getQuantity());
//                        ptm.setInt(3, orderID);
//                        ptm.setString(4, prod.getProductID());
//                        check = ptm.executeUpdate() > 0;
//                        if (check) {
//                            int currentQuanity = 0;
//                            ptm = null;
//                            ptm = conn.prepareStatement(GET_PRODUCT_QUANTITY_CURRENT);
//                            ptm.setString(1, prod.getProductID());
//                            rs = ptm.executeQuery();
//                            if (rs.next()) {
//                                currentQuanity = rs.getInt("quantity");
//                                ptm = null;
//                                ptm = conn.prepareStatement(UPDATE_PRODUCT_QUANTITY);
//                                ptm.setInt(1, currentQuanity);
//                                ptm.setInt(2, prod.getQuantity());
//                                ptm.setString(3, prod.getProductID());
//                                check = ptm.executeUpdate() > 0;
//                            }
//                        }
//                    }
//                }
//            }
//        } catch (SQLException e) {
//        } finally {
//            if (rs != null) {
//                rs.close();
//            }
//            if (ptm != null) {
//                ptm.close();
//            }
//            if (conn != null) {
//                conn.close();
//            }
//        }
//        return check;
//    }

    public boolean createOrder2(String userID, double total, CartDTO cart) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            Date nowDate = new Date();
            SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd");
            String strNowDate = formater.format(nowDate);
            String status = "Request";
            ptm = conn.prepareStatement(CREATE_ORDER);
            ptm.setString(1, strNowDate);
            ptm.setDouble(2, total);
            ptm.setString(3, userID);
            ptm.setString(4, status);
            check = ptm.executeUpdate() > 0;
            if (check) {
                check = createOderDetail(cart);
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
        return check;
    }

    public boolean createOderDetail(CartDTO cart) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(GET_ORDER_ID);
            rs = ptm.executeQuery();
            if (rs.next()) {
                int orderID = rs.getInt("orderID");
                for (ProductDTO prod : cart.getList()) {
                    ptm = null;
                    ptm = conn.prepareStatement(CREATE_ORDER_DETAIL);
                    ptm.setDouble(1, prod.getPrice());
                    ptm.setInt(2, prod.getQuantity());
                    ptm.setInt(3, orderID);
                    ptm.setString(4, prod.getProductID());
                    check = ptm.executeUpdate() > 0;
                    if (check) {
                        updateProduct(prod);
                    }
                }
            }
        } catch (SQLException e) {
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
        return check;
    }

    public boolean updateProduct(ProductDTO prod) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            int currentQuanity = 0;
            ptm = conn.prepareStatement(GET_PRODUCT_QUANTITY_CURRENT);
            ptm.setString(1, prod.getProductID());
            rs = ptm.executeQuery();
            if (rs.next()) {
                currentQuanity = rs.getInt("quantity");
                ptm = null;
                ptm = conn.prepareStatement(UPDATE_PRODUCT_QUANTITY);
                ptm.setInt(1, currentQuanity);
                ptm.setInt(2, prod.getQuantity());
                ptm.setString(3, prod.getProductID());
                check = ptm.executeUpdate() > 0;
            }
        } catch (SQLException e) {
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
        return check;
    }
}
