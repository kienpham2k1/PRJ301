package dao;

import untils.DBUtils;
import dto.ProductDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author phamt
 */
public class SearchProductDAO {

    private static final String SEARCH_PRODUCT
            = "SELECT [productID],[productName],[image],[price],[quantity],[catagoryID],[importDate],[usingDate],[status] \n"
            + " FROM (SELECT ROW_NUMBER() OVER (ORDER BY [productID] ASC) AS [count],\n"
            + "		[productID],[productName],[image],[price],[quantity],[catagoryID],[importDate],[usingDate],[status]  \n"
            + "		FROM [SHOPPING].[dbo].[tblProduct]\n"
            + "		WHERE UPPER([productName]) LIKE UPPER(?) AND [quantity] > ? AND [usingDate] > (?) AND [status] LIKE (?)) AS x \n"
            + "		WHERE [count] BETWEEN (?*6-5) AND (?*6)";

    public List<ProductDTO> getListProduct(String search, Date dateCheck, int quantityCheck, String statusCheck, int index) throws SQLException {
        List<ProductDTO> listProd = new ArrayList();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String strDate = formatter.format(dateCheck);
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH_PRODUCT);
                ptm.setString(1, "%" + search + "%");
                ptm.setInt(2, quantityCheck);
                ptm.setString(3, strDate);
                ptm.setString(4, "%" + statusCheck + "%");
                ptm.setInt(5, index);
                ptm.setInt(6, index);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");
                    String productName = rs.getString("productName");
                    String image = rs.getString("image");
                    double price = rs.getDouble("price");
                    int quantity = rs.getInt("quantity");
                    int catagoryID = rs.getInt("catagoryID");
                    Date importDate = rs.getDate("importDate");
                    Date usingDate = rs.getDate("usingDate");
                    String status = rs.getString("status");
                    listProd.add(new ProductDTO(productID, productName, image, price, quantity, catagoryID, importDate, usingDate, status));
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
        return listProd;
    }
    private static final String SEARCH_DETAIL_PRODUCT = "SELECT [productID]\n"
            + "      ,[productName]\n"
            + "      ,[image]\n"
            + "      ,[price]\n"
            + "      ,[quantity]\n"
            + "      ,[catagoryID]\n"
            + "      ,[importDate]\n"
            + "      ,[usingDate]\n"
            + "      ,[status]\n"
            + "  FROM [SHOPPING].[dbo].[tblProduct]\n"
            + "	WHERE [productID] = ?";

    public ProductDTO getDetailProduct(String productID) throws SQLException {
        ProductDTO prod = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH_DETAIL_PRODUCT);
                ptm.setString(1, productID);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    String productName = rs.getString("productName");
                    String image = rs.getString("image");
                    double price = rs.getDouble("price");
                    int quantity = rs.getInt("quantity");
                    int catagoryID = rs.getInt("catagoryID");
                    Date importDate = rs.getDate("importDate");
                    Date usingDate = rs.getDate("usingDate");
                    String status = rs.getString("status");
                    prod = new ProductDTO(productID, productName, image, price, quantity, catagoryID, importDate, usingDate, status);
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
        return prod;

    }
    private static final String COUNT_PAGE
            = "SELECT COUNT ([productID]) FROM [SHOPPING].[dbo].[tblProduct]\n"
            + "		WHERE UPPER([productName]) LIKE UPPER(?) \n"
            + "		AND [quantity] > ? \n"
            + "		AND [usingDate] > (?) \n"
            + "		AND [status] LIKE ?";

    public int getCountPage(String search, int quantityCheck, Date dateCheck, String statusCheck) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(COUNT_PAGE);
                SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
                String strDate = formatter.format(dateCheck);
                ptm.setString(1, "%" + search + "%");
                ptm.setInt(2, quantityCheck);
                ptm.setString(3, strDate);
                ptm.setString(4, "%" + statusCheck + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    return rs.getInt(1);
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
        return 0;
    }

}
