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
public class CityDAO extends MyDAO {

    public List<City> getAllCity() {
        List<City> cities = new ArrayList<>();
        String sql = "SELECT c.[City_ID], c.[CityName], hc.[HotelID] FROM [dbo].[City] c JOIN [dbo].[Hotel_City] hc ON hc.[CityID] = c.[City_ID]";

        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                int cityID = rs.getInt("City_ID");
                String cityName = rs.getString("CityName");
                int hotelID = rs.getInt("HotelID");

                City city = new City(cityID, cityName);
                city.setHotelID(hotelID);
                cities.add(city);
            }

            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return cities;
    }

    public City getCityByID(int cityID) {
        String sql = "SELECT [City_ID], [CityName], [HotelID] FROM [dbo].[City] c JOIN [dbo].[Hotel_City] hc ON hc.[CityID] = c.[City_ID] WHERE c.[City_ID] = ?";

        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, cityID);
            rs = ps.executeQuery();

            if (rs.next()) {
                City city = new City();

                city.setCity_ID(rs.getInt("City_ID"));
                city.setCity_Name(rs.getString("CityName"));
                city.setHotelID(rs.getInt("HotelID"));

                rs.close();
                ps.close();

                return city;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null; // Return null if no city with the given ID is found
    }

    public static void main(String[] args) {
        CityDAO dao = new CityDAO();
        System.out.println(dao.getAllCity().size()
        );
    }
}
