/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import static DAO.DAO.con;
import static DAO.DAO.status;
import Model.Role;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author toden
 */
public class RoleDAO extends DAO {
    public RoleDAO(){
        super();
    }
    
    public static Role getRoleByAccId(int id){
        String sql = "select r.role_id, r.role_name from Role as r JOIN Account as a on a.role_id = r.role_id where a.account_id = ? ";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1,id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Role(rs.getInt(1), rs.getString(2));
            }
        } catch (Exception e) {
            status = "Error at getRoleByAccId " + e.getMessage();
        }
        return null;
    }
    
    public static Role getRoleId(int id){
        String sql = "select * from Role where role_id = ? ";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1,id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Role(rs.getInt(1), rs.getString(2));
            }
        } catch (Exception e) {
            status = "Error at getRoleId " + e.getMessage();
        }
        return null;
    }
}
