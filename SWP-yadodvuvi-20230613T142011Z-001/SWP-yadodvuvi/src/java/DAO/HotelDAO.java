/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import entities.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author tungl
 */
public class HotelDAO extends MyDAO {

    public Hotel getHotel(int id) {
        Hotel hotel = null;
        String sql = "SELECT [ID], [Name], [Room], [Active], [isDelete], [IMG], [Description] FROM [dbo].[Hotel] WHERE [ID] = ?";

        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
                int hotelID = rs.getInt("ID");
                String hotelName = rs.getString("Name");
                String room = rs.getString("Room");
                boolean active = rs.getBoolean("Active");
                boolean isDelete = rs.getBoolean("isDelete");
                String img = rs.getString("IMG");
                String description = rs.getString("Description");

                hotel = new Hotel(hotelID, hotelName, room, active, isDelete);
                hotel.setIMG(img);
                hotel.setDescription(description);
            }

            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return hotel;
    }

    public static void main(String[] args) {
        HotelDAO hDAO = new HotelDAO();
        CityDAO cDAO = new CityDAO();
        
        
        System.out.println(hDAO.getHotel(cDAO.getCityByID(1).getHotelID()).getHotel_Name());
    }
    
}
