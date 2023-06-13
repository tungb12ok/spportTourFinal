/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import entities.Activiti;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author MienTrungComputer
 */
public class ActivityTourDAO extends MyDAO {

    public List<Activiti> loadAllActivityTour(String tourID) {
        List<Activiti> list = new ArrayList<>();
        String xSql = "SELECT [Tour_ID], c.[Activity_ID], c.[ActivityName], [landscape_Address], [time] \n"
                + "              FROM [dbo].[TourActivity] t join [dbo].[Activity] c  on c.[Activity_ID] = t.[Activity_ID] \n"
                + "			  Where [Tour_ID] = ?  ";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, tourID);
            rs = ps.executeQuery();

            while (rs.next()) {
                Activiti t = new Activiti();
                list.add(new Activiti(rs.getInt("Activity_ID"),
                        rs.getInt("Tour_ID"),
                        rs.getString("landscape_Address"),
                        rs.getString("ActivityName"),
                        rs.getString("time")));
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public void insertActivity(String activityName, String landscape_Address) {
        // Activiti act = new Activiti();
        String xSql = "INSERT INTO [dbo].[Activity]\n"
                + "           ([ActivityName]\n"
                + "           ,[Landscape_Address])\n"
                + "     VALUES\n"
                + "           (?, ?)";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, activityName);
            ps.setString(2, landscape_Address);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public int getID_Activity() {
        int id = 0;
        String xSql = "SELECT TOP 1 * FROM　Activity a ORDER BY a.Activity_ID DESC";
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                id = rs.getInt("Activity_ID");
            }
        } catch (Exception e) {
        }
        return id;
    }

    public void insertTourActivity(int id_tour, int id_activity, String time) {
        //Activiti act = new Activiti();
        String xSql = "INSERT INTO [dbo].[TourActivity]\n"
                + "           ([Tour_ID]\n"
                + "           ,[Activity_ID]\n"
                + "           ,[Time])\n"
                + "     VALUES\n"
                + "           (?, ?, ?)";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, id_tour);
            ps.setInt(2, id_activity);
            ps.setString(3, time);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void deleteActivity(String id) {
        String xSql = "DELETE FROM [dbo].[TourActivity]\n"
                + "      WHERE Activity_ID = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public static void main(String[] args) {
        ActivityTourDAO dao = new ActivityTourDAO();
//       Activiti list = dao.insertTourActivity(new Activiti(1, 0, "Bờ Biển", "Hóng Gió", "17:00:00"), dao.getID_Activity());
        dao.insertTourActivity(2, dao.getID_Activity(), "17:00 AM");
//        int id = dao.getID_Activity();

    }
}
