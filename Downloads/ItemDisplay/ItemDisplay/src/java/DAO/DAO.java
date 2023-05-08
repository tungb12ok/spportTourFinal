/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DBContext.DBContext;
import Model.Item;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author toden
 */
public class DAO {
    protected static Connection con;
    protected static String status="";
    public DAO(){
        try{
            con = new DBContext().getConnection();
        } catch (Exception e) {
            status = "Error Connection "+e.getMessage();
        }
    }
    
    public static List<Item> getAllItem(){
        String sql = "select * from Item";
        List<Item> items = new ArrayList<Item>();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                int Id = rs.getInt(1);
                String name = rs.getNString(2);
                String des = rs.getNString(3);
                double price = rs.getDouble(4);
                
                items.add(new Item(Id, name,des,price));
            }
        } catch (Exception e) {
            status = "Error at read Category "+e.getMessage();
        }
        return items;
    }
//    public static List<Item> getAllItem(){
//        String sql = "select * from Item";
//        List<Item> items = new ArrayList<Item>();
//        try {
//            PreparedStatement ps = con.prepareStatement(sql);
//            ResultSet rs = ps.executeQuery();
//            while(rs.next()){
//                int Id = rs.getInt(1);
//                String name = rs.getNString(2);
//                String des = rs.getNString(3);
//                double price = rs.getDouble(4);
//                
//                items.add(new Item(Id, name,des,price));
//            }
//        } catch (Exception e) {
//            status = "Error at read Category "+e.getMessage();
//        }
//        return items;
//    }
}
