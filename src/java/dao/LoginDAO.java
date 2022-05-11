/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import untils.DBUtils;
import dto.UserDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

/**
 *
 * @author phamt
 */
public class LoginDAO {

    private static final String LOGIN
            = "SELECT [userID]\n"
            + "      ,[fullName]\n"
            + "      ,[password]\n"
            + "      ,[roleID]\n"
            + "      ,[address]\n"
            + "      ,[birthday]\n"
            + "      ,[phone]\n"
            + "      ,[email]\n"
            + "      ,[status]\n"
            + "  FROM [SHOPPING].[dbo].[tblUsers]"
            + "WHERE [userID]=? AND [password]=?";

    public UserDTO checkLogin(String userID, String password) throws SQLException {
        UserDTO user = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(LOGIN);
                ptm.setString(1, userID);
                ptm.setString(2, password);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    String fullName = rs.getString("fullName");
                    String roleID = rs.getString("roleID");
                    String address = rs.getString("address");
                    Date birthday = rs.getDate("birthday");
                    int phone = rs.getInt("phone");
                    String email = rs.getString("email");
                    String status = rs.getString("status");
                    user = new UserDTO(userID, fullName, "", roleID, address, birthday, phone, email, status);
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
        return user;
    }
}
