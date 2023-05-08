/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import static DAO.DAO.con;
import static DAO.DAO.status;
import Model.Category;
import Model.Vehicle;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author toden
 */
public class VehicleDAO extends DAO {

    public VehicleDAO() {
        super();
    }

    public static Vehicle getVehicleById(int id) {
        String sql = "select * from Vehicle where vehicle_id = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Vehicle(rs.getInt(1), rs.getString(2));
            }
        } catch (Exception e) {
            status = "Error at getVehicleById " + e.getMessage();
        }
        return null;
    }

    public static List<Vehicle> getAllVeh() {
        String sql = "select * from Vehicle";
        List<Vehicle> vehicles = new ArrayList<>();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                vehicles.add(new Vehicle(rs.getInt(1), rs.getString(2)));
            }
            return vehicles;
        } catch (Exception e) {
            status = "Error at getAllVeh " + e.getMessage();
        }
        return null;
    }

}
