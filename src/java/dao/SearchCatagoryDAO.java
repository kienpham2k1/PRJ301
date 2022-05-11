/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import untils.DBUtils;
import dto.CategoryDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author phamt
 */
public class SearchCatagoryDAO {

    private static final String SEARCH_CATEGORY = "SELECT [catagoryID]\n"
            + "      ,[catagoryName]\n"
            + "  FROM [SHOPPING].[dbo].[tblCategory]";

    public List<CategoryDTO> getListCatagory() throws SQLException {
        List<CategoryDTO> listCata = new ArrayList();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH_CATEGORY);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String catagoryID = rs.getString("catagoryID");
                    String catagoryName = rs.getString("catagoryName");
                    listCata.add(new CategoryDTO(catagoryID, catagoryName));
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
        return listCata;
    }
}
