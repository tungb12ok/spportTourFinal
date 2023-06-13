/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import entities.City;
import entities.Hotel;
import entities.Type;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author MienTrungComputer
 */
public class CommonTourDAO extends MyDAO {

    public List<Type> loadAllType() {
        List<Type> list = new ArrayList<>();
        String xSql = " SELECT [Type_ID]\n"
                + "      ,[Type_name]\n"
                + "      ,[Is_Delete]\n"
                + "  FROM [dbo].[TourType]\n"
                + "ORDER BY Type_name ASC";
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new Type(rs.getInt("Type_ID"),
                        rs.getString("Type_name"),
                        rs.getBoolean("Is_Delete")));
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<City> loadAllCity() {
        List<City> list = new ArrayList<>();
        String xSql = "SELECT [City_ID]\n"
                + "      ,[CityName]\n"
                + "  FROM [dbo].[City]\n"
                + "ORDER BY CityName ASC";

        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new City(rs.getInt("City_ID"),
                        rs.getString("CityName")));
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Hotel> loadAllHotel() {
        List<Hotel> list = new ArrayList<>();
        String xSql = "SELECT [ID]\n"
                + "      ,[Name]\n"
                + "      ,[Room]\n"
                + "      ,[Active]\n"
                + "      ,[isDelete]\n"
                + "  FROM [dbo].[Hotel]\n"
                + "ORDER BY NAME ASC";
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new Hotel(rs.getInt("ID"),
                        rs.getString("Name"),
                        rs.getString("Room"),
                        rs.getBoolean("Active"),
                        rs.getBoolean("isDelete")));
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public Hotel getHotelById(int hotelId) {
        String sql = "SELECT [ID], [Name], [Room], [Active], [isDelete] FROM [dbo].[Hotel] WHERE [ID] = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, hotelId);
            rs = ps.executeQuery();

            if (rs.next()) {
                return new Hotel(rs.getInt("ID"),
                        rs.getString("Name"),
                        rs.getString("Room"),
                        rs.getBoolean("Active"),
                        rs.getBoolean("isDelete"));
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public City CityName(String id) {
        City name = new City();
        String xSql = "SELECT \n"
                + "          c.[City_ID],\n"
                + "          c.[CityName]\n"
                + "          FROM [dbo].[City] c join [dbo].[Tour] t on c.City_ID = t.City_ID where t.Tour_ID = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, id);
            rs = ps.executeQuery();

            while (rs.next()) {
                name = new City(rs.getInt("City_ID"),
                        rs.getString("CityName"));
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return name;
    }

    public static void main(String[] args) {
        OrderDAO dao = new OrderDAO();
        TourDAO tDao = new TourDAO();
        CommonTourDAO cDao = new CommonTourDAO();
        CityDAO ciDAO = new CityDAO();
        System.out.println(ciDAO.getCityByID(tDao.getTourByID(2).getCity_ID()).getCity_Name());
    }
}
