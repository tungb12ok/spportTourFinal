/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import static DAO.DAO.con;
import static DAO.DAO.status;
import Model.Account;
import Model.Role;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author toden
 */
public class AccountDAO extends DAO {

    public AccountDAO() {
        super();
    }

    public static Account checkAuthen(String email) {
        String sql = "SELECT * FROM Account WHERE email = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getBoolean(6), rs.getString(7), RoleDAO.getRoleId(rs.getInt(8)));
            }
        } catch (Exception e) {
            status = "Error at checkAuthen: " + e.getMessage();
        }
        return null;
    }

    public static Account getAccountById(int id) {
        String sql = "select * from Account where account_id = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
                         rs.getBoolean(6), rs.getString(7), RoleDAO.getRoleId(rs.getInt(8)));
            }
        } catch (Exception e) {
            status = "Error at getAccountById " + e.getMessage();
        }
        return null;
    }

    public static List<Account> getAllAcc() {
        String sql = "select * from Account";
        List<Account> accounts = new ArrayList<>();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                accounts.add(new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
                         rs.getBoolean(6), rs.getString(7), RoleDAO.getRoleId(rs.getInt(8))));
            }
            return accounts;
        } catch (Exception e) {
            status = "Error at getAllAcc " + e.getMessage();
        }
        return null;
    }

    public static Account getAccountByEmailAndPass(String email, String pass) {
        String sql = "select * from Account where email = ? and password = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, pass);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
                         rs.getBoolean(6), rs.getString(7), RoleDAO.getRoleId(rs.getInt(8)));
            }
        } catch (Exception e) {
            status = "Error at getAccountByEmailAndPass " + e.getMessage();
        }
        return null;
    }

    public static Account addAccount(String pass, String accname, String fullname, String address, int gender, String email) {
        String sql = "insert into Account values(?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, pass);
            ps.setString(2, accname);
            ps.setString(3, fullname);
            ps.setString(4, address);
            ps.setInt(5, gender);
            ps.setString(6, email);
            ps.setInt(7, 2);
            ps.executeUpdate();
            return getAccountByEmailAndPass(email, pass);
        } catch (Exception e) {
            status = "Error at addAccount " + e.getMessage();
        }
        return null;
    }

    public static boolean checkAccEmail(String email) {
        String sql = "Select * from Account where email = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            status = "Error at checkAccEmail " + e.getMessage();
        }
        return false;
    }

    public static void main(String[] args) {
        System.out.println(AccountDAO.checkAuthen("Ngocnlhe160359@fpt.edu.vn"));
    }
}
