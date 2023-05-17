/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import controller.Authentication.MD5;
import java.util.ArrayList;
import java.util.List;
import entity.*;
import java.sql.Date;

/**
 *
 * @author msi
 */
public class UserDao extends MyDAO {

    public User checkAuthentication(String user, String pass) {
        User userObj = null;
        String xSql = "SELECT [username], [password] FROM [dbo].[User] WHERE [username] = ? AND [password] = ?";

        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, user);
            ps.setString(2, pass);
            rs = ps.executeQuery();

            if (rs.next()) {
                userObj = new User();
                userObj.setUsername(rs.getString("username"));
                userObj.setPassword(rs.getString("password"));
            }

            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return userObj;
    }

    public boolean registerUser(String username, String password, String fullName, String email, String phone, int role) {
        String insertSql = "INSERT INTO [dbo].[User] "
                + "([Username], [Password], [Full_name], [E-mail], [Role], [Phone]) "
                + "VALUES (?, ?, ?, ?, ?, ?)";

        try {
            ps = con.prepareStatement(insertSql);
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, fullName);
            ps.setString(4, email);
            ps.setInt(5, role);
            ps.setString(6, phone);

            int rowsAffected = ps.executeUpdate();
            ps.close();

            return rowsAffected > 0; // Return true if the registration was successful
        } catch (Exception e) {
            e.printStackTrace();
        }

        return false; // Return false if an error occurred during registration
    }

    public User searchAccount(String username) {
        User userObj = null;
        String selectSql = "SELECT [Username], [Password], [Role] FROM [dbo].[User] WHERE [username] = ?";

        try {
            ps = con.prepareStatement(selectSql);
            ps.setString(1, username);

            rs = ps.executeQuery();

            if (rs.next()) {
                userObj = new User();
                userObj.setUsername(rs.getString("Username"));
                userObj.setRoleID(rs.getInt("Role"));
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return userObj;
    }

    public static void main(String[] args) {
        UserDao dao = new UserDao();
        MD5 m = new MD5();
        System.out.println(dao.searchAccount("tung123"));
    }

}
