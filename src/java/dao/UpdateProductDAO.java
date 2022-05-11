/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import untils.DBUtils;
import dto.ProductDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

/**
 *
 * @author phamt
 */
public class UpdateProductDAO {

    private static final String UPDATE_PRODUCT = "UPDATE [dbo].[tblProduct]\n"
            + "   SET [productName] = ?\n"
            + "      ,[image] = ?\n"
            + "      ,[price] = ?\n"
            + "      ,[quantity] = ?\n"
            + "      ,[catagoryID] = ?\n"
            + "      ,[importDate] = ?\n"
            + "      ,[usingDate] = ?\n"
            + "      ,[status] = ?\n"
            + " WHERE [productID] = ?\n";

    public boolean updateProduct(ProductDTO prd) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE_PRODUCT);
                ptm.setString(1, prd.getProductName());
                ptm.setString(2, prd.getImage());
                ptm.setDouble(3, prd.getPrice());
                ptm.setInt(4, prd.getQuantity());
                ptm.setInt(5, prd.getCatagoryID());
                SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
                String importDate = formatter.format(prd.getImportDate());
                String usingDate = formatter.format(prd.getUsingDate());
                ptm.setString(6, importDate);
                ptm.setString(7, usingDate);
                ptm.setString(8, "Approve");
                ptm.setString(9, prd.getProductID());
                check = ptm.executeUpdate() > 0;
            }
        } catch (SQLException e) {
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
}
