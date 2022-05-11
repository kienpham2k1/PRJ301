/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import untils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author phamt
 */
public class CheckQuantityProductDAO {

    private static final String CHECK_QUANTITY = "SELECT [quantity]\n"
            + "  FROM [dbo].[tblProduct]\n"
            + "  WHERE [productID] = ? AND [quantity] >= ?";

    private static final String GET_QUANTITY = "SELECT [quantity]\n"
            + "          FROM [dbo].[tblProduct]\n"
            + "   WHERE [productID] = ?";

    public boolean checkQuantity(String productID, int quantityCheck) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_QUANTITY);
                ptm.setString(1, productID);
                ptm.setInt(2, quantityCheck);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    check = true;
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
        return check;
    }

    public int getStockQuantity(String productID) throws SQLException {
        int stockQuantity = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_QUANTITY);
                ptm.setString(1, productID);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    stockQuantity = rs.getInt("quantity");
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
        return stockQuantity;
    }
}
