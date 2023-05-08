/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import static DAO.DAO.con;
import static DAO.DAO.status;
import Model.Category;
import Model.Service;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author toden
 */
public class ServiceDAO extends DAO {

    public ServiceDAO() {
        super();
    }

    public static List<Service> getAllService() {
        String sql = "select * from Service";
        List<Service> services = new ArrayList<>();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                services.add(new Service(rs.getInt(1), rs.getNString(2), rs.getDouble(3), rs.getString(4)));
            }
            return services;
        } catch (Exception e) {
            status = "Error at getAllService " + e.getMessage();
        }
        return null;
    }

    public static List<Service> getServiceByPostId(int id) {
        String sql = "select s.service_id, s.service_name, s.price, s.iconclass from Service as s JOIN service_of so ON s.service_id = so.service_id JOIN Post p ON p.post_id = so.post_id WHERE so.post_id = ?";
        List<Service> services = new ArrayList<>();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                services.add(new Service(rs.getInt(1), rs.getNString(2), rs.getDouble(3), rs.getString(4)));
            }
            return services;
        } catch (Exception e) {
            status = "Error at getServiceByPostId " + e.getMessage();
        }
        return null;

    }

    public static Service getServiceById(int id) {
        String sql = "select * from Service where service_id = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Service(rs.getInt(1), rs.getNString(2), rs.getDouble(3), rs.getString(4));
            }
        } catch (Exception e) {
            status = "Error at getServiceById " + e.getMessage();
        }
        return null;

    }

    public static boolean addServiceOf(int postId, String[] serId) {
        String sql = "insert into service_of values(?,?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            for (String serid : serId) {
                ps.setInt(1, postId);
                ps.setInt(2, Integer.parseInt(serid));
                ps.executeUpdate();
            }
        } catch (Exception e) {
            status = "Error at addServiceOf " + e.getMessage();
        }
        return false;
    }
    
    public static boolean updateServiceOf(int postId, String[] serId) {
        String delsql = "delete from service_of where post_id = ?";
        String sql = "insert into service_of values(?,?)";
        try {
            PreparedStatement ps = con.prepareStatement(delsql);
            ps.setInt(1, postId);
            ps.executeUpdate();
            ps = con.prepareStatement(sql);
            for (String serid : serId) {
                ps.setInt(1, postId);
                ps.setInt(2, Integer.parseInt(serid));
                ps.executeUpdate();
            }
            status = "success at updateServiceOf ";
        } catch (Exception e) {
            status = "Error at addServiceOf " + e.getMessage();
        }
        return false;
    }

}
