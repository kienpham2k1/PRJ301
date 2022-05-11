/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import untils.DBUtils;
import dto.ProductDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

/**
 *
 * @author phamt
 */
public class InsertProductDAO {

    private static final String INSERT_PRD = "INSERT INTO [dbo].[tblProduct]\n"
            + "           ([productID]\n"
            + "           ,[productName]\n"
            + "           ,[image]\n"
            + "           ,[price]\n"
            + "           ,[quantity]\n"
            + "           ,[catagoryID]\n"
            + "           ,[importDate]\n"
            + "           ,[usingDate]\n"
            + "           ,[status])\n"
            + "     VALUES(?,?,?,?,?,?,?,?,?)";
    private static final String DUPLICATE = "SELECT [productID]\n"
            + "  FROM [dbo].[tblProduct]\n"
            + "  WHERE [productID] = ?";

    public boolean insertProduct(ProductDTO prd) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(INSERT_PRD);
            ptm.setString(1, prd.getProductID());
            ptm.setString(2, prd.getProductName());
            ptm.setString(3, prd.getImage());
            ptm.setDouble(4, prd.getPrice());
            ptm.setInt(5, prd.getQuantity());
            ptm.setInt(6, prd.getCatagoryID());
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            String importDate = formatter.format(prd.getImportDate());
            String usingDate = formatter.format(prd.getUsingDate());
            ptm.setString(7, importDate);
            ptm.setString(8, usingDate);
            ptm.setString(9, prd.getStatus());
            check = ptm.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
            return check;
        }
    }

    public boolean checkDuplicatePrdID(String prdID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DUPLICATE);
                ptm.setString(1, prdID);
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
}
