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
 * @author MienTrungComputer
 */
public class TourDAO extends MyDAO {

    public List<Tour> loadAllTour() {
        List<Tour> list = new ArrayList<>();
        String xSql = "SELECT [Tour_ID], [StartDate], [EndDate], [Hotel_ID], t.[City_ID], [NumberPeople], [Content], t.[IMG], [TotalPrice], t.[isDelete], t.[Type_ID] \n"
                + "                FROM [dbo].[Tour] t join [dbo].[City] c  on c.[City_ID] = t.[City_ID] join [dbo].[TourType] a on a.[Type_ID] = t.[Type_ID] join [dbo].[Hotel] h on h.[ID] = t.[Hotel_ID]";
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new Tour(rs.getInt("Tour_ID"),
                        rs.getString("StartDate"),
                        rs.getString("EndDate"),
                        rs.getInt("Hotel_ID"),
                        rs.getInt("City_ID"),
                        rs.getInt("NumberPeople"),
                        rs.getString("Content"),
                        rs.getString("IMG"),
                        rs.getDouble("TotalPrice"),
                        rs.getBoolean("isDelete"),
                        rs.getInt("Type_ID")));
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Tour> getAllTour() {
        List<Tour> tours = new ArrayList<>();
        String sql = "SELECT [Tour_ID], [StartDate], [EndDate], [City_ID], [NumberPeople], [Content], [IMG], [TotalPrice], [isDelete], [Type_ID] FROM [dbo].[Tour]";

        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Tour tour = new Tour();

                tour.setTour_ID(rs.getInt("Tour_ID"));
                tour.setStartDate(rs.getString("StartDate"));
                tour.setEndDate(rs.getString("EndDate"));
                tour.setCity_ID(rs.getInt("City_ID"));
                tour.setNumberPeople(rs.getInt("NumberPeople"));
                tour.setContent(rs.getString("Content"));
                tour.setImg(rs.getString("IMG"));
                tour.setTotalPrice(rs.getDouble("TotalPrice"));
                tour.setIsDelete(rs.getBoolean("isDelete"));
                tour.setType_name(rs.getInt("Type_ID"));

                tours.add(tour);
            }

            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return tours;
    }

    public void deleteTour(String id) {
        String xSql = "DELETE FROM [dbo].[Tour]\n"
                + "      WHERE Tour_ID = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void insertTour(Tour tour) {
        String xSql = "INSERT INTO [dbo].[Tour]\n"
                + "           ([StartDate]\n"
                + "           ,[EndDate]\n"
                + "           ,[Hotel_ID]\n"
                + "           ,[City_ID]\n"
                + "           ,[NumberPeople]\n"
                + "           ,[Content]\n"
                + "           ,t.[IMG]\n"
                + "           ,[TotalPrice]\n"
                + "           ,[isDelete]\n"
                + "           ,[Type_ID])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, tour.getStartDate());
            ps.setString(2, tour.getEndDate());
            ps.setInt(3, tour.getHotel_ID());
            ps.setInt(4, tour.getCity_ID());
            ps.setInt(5, tour.getNumberPeople());
            ps.setString(6, tour.getContent());
            ps.setString(7, tour.getImg());
            ps.setDouble(8, tour.getTotalPrice());
            ps.setBoolean(9, false);
            ps.setInt(10, tour.getType_name());
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void updateTour(Tour tour) {
        String xSql = "UPDATE [dbo].[Tour]\n"
                + "   SET [StartDate] = ?\n"
                + "      ,[EndDate] = ?\n"
                + "      ,[Hotel] = ?\n"
                + "      ,[City_ID] = ?\n"
                + "      ,[NumberPeople] = ?\n"
                + "      ,[Content] = ?\n"
                + "      ,[IMG] = ?\n"
                + "      ,[TotalPrice] = ?\n"
                + "      ,[isDelete] = ?\n"
                + "      ,[Type_ID] = ? \n "
                + " WHERE Tour_ID = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, tour.getStartDate());
            ps.setString(2, tour.getEndDate());
            ps.setInt(3, tour.getHotel_ID());
            ps.setInt(4, 1);
            ps.setInt(5, tour.getNumberPeople());
            ps.setString(6, tour.getContent());
            ps.setString(7, tour.getImg());
            ps.setDouble(8, tour.getTotalPrice());
            ps.setString(9, String.valueOf(tour.getIsDelete()));
            ps.setInt(10, 1);
            ps.setInt(11, tour.getTour_ID());
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public Tour getTourID(String id) {
        String xSql = "SELECT [Tour_ID]　\n"
                + "　     ,[StartDate]　\n"
                + "　     ,[EndDate]　\n"
                + "　     ,t.[Hotel_ID]　\n"
                + "　     ,t.[City_ID]　\n"
                + "　     ,[NumberPeople]　\n"
                + "　     ,[Content]　\n"
                + "　     ,t.[IMG]　\n"
                + "　     ,[TotalPrice]\n"
                + "      ,t.[isDelete]\n"
                + "      ,t.[Type_ID] FROM [dbo].[Tour] t join [dbo].[City] c  on c.[City_ID] = t.[City_ID] join [dbo].[TourType] a on a.[Type_ID] = t.[Type_ID] join [dbo].[Hotel] h on h.[ID] = t.[Hotel_ID] WHERE t.Tour_ID = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Tour(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getDouble(9),
                        rs.getBoolean(10),
                        rs.getInt(11));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public Tour getTourByID(int tourID) {
        String sql = "SELECT [Tour_ID], [StartDate], [EndDate], [City_ID], [NumberPeople], [Content], [IMG], [TotalPrice], [isDelete], [Type_ID] FROM [dbo].[Tour] WHERE [Tour_ID] = ?";

        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, tourID);
            rs = ps.executeQuery();

            if (rs.next()) {
                Tour tour = new Tour();

                tour.setTour_ID(rs.getInt("Tour_ID"));
                tour.setStartDate(rs.getString("StartDate"));
                tour.setEndDate(rs.getString("EndDate"));
                tour.setCity_ID(rs.getInt("City_ID"));
                tour.setNumberPeople(rs.getInt("NumberPeople"));
                tour.setContent(rs.getString("Content"));
                tour.setImg(rs.getString("IMG"));
                tour.setTotalPrice(rs.getDouble("TotalPrice"));
                tour.setIsDelete(rs.getBoolean("isDelete"));
                tour.setType_name(rs.getInt("Type_ID"));

                rs.close();
                ps.close();

                return tour;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null; // Return null if no tour with the given ID is found
    }

    public static void main(String[] args) {
        TourDAO tDao = new TourDAO();
        
//        System.out.println(tDao.getTourByID(1).getStartDate());
//        Tour tour = new Tour(4, "2020-01-02", "2020-01-02", "Nghệ An", "1", 3, "Nghệ An", "Ảnh1", 500, false, "1");
//                dao.updateTour(tour);
        System.out.println(tDao.getTourByID(9));

    }
}
//USE [YadodVivu]
//GO
//
//UPDATE [dbo].[Tour]
//   SET [StartDate] = '2020-01-02'
//      ,[EndDate] = '2020-01-02'
//      ,[Hotel] = 'Nghệ An'
//      ,[City_ID] = 1
//      ,[NumberPeople] = 3
//      ,[Content] = '123'
//      ,[IMG] = 'Ảnh1'
//      ,[TotalPrice] = 500
//      ,[isDelete] = '1'
//      ,[Type_ID] = 1
// WHERE Tour_ID = 4
//GO

