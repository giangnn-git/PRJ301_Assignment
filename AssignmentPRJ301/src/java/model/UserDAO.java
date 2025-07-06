/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import utils.DbUtils;

/**
 *
 * @author Admin
 */
public class UserDAO {

    private static final String FIND_USER_BY_NAME
            = "SELECT userId, userName, email, password, phone, address, role, fullName FROM tblUsers WHERE userName = ?";

    private static final String GET_ALL_USER
            = "SELECT userId, userName, email, password, phone, address, role, fullName FROM tblUsers ORDER BY userName";

    public boolean login(String userName, String password) {
        UserDTO user = getUserByUserName(userName);
        if (user != null) {
            if (user.getPassword().equals(password)) {
                return true;
            }
        }
        return false;
    }

    public UserDTO getUserByUserName(String uName) {
        UserDTO user = null;
        
        try (
            Connection conn = DbUtils.getConnection();  
            PreparedStatement pr = conn.prepareStatement(FIND_USER_BY_NAME)) {
            pr.setString(1, uName);
            ResultSet rs = pr.executeQuery();

            if (rs.next()) {
                int userId = rs.getInt("userId");
                String userName = rs.getString("userName");
                String fullName = rs.getString("fullName");
                String email = rs.getString("email");
                String password = rs.getString("password");
                String phone = rs.getString("phone");
                String address = rs.getString("address");
                String role = rs.getString("role");

                user = new UserDTO(userId, userName, fullName, email, password, phone, address, role);
            }

            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

    public List<UserDTO> getAllUsers() {
        List<UserDTO> userList = new ArrayList<>();

        try (
                Connection conn = DbUtils.getConnection();  
                PreparedStatement ps = conn.prepareStatement(GET_ALL_USER);  
                ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                int userId = rs.getInt("userId");
                String userName = rs.getString("userName");
                String fullName = rs.getString("fullName");
                String email = rs.getString("email");
                String password = rs.getString("password");
                String phone = rs.getString("phone");
                String address = rs.getString("address");
                String role = rs.getString("role");

                UserDTO user = new UserDTO(userId, userName, fullName, email, password, phone, address, role);
                userList.add(user);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return userList;
    }

}
