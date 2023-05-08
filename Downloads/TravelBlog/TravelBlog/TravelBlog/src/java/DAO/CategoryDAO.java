/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import static DAO.DAO.con;
import static DAO.DAO.status;
import Model.Account;
import Model.Category;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author toden
 */
public class CategoryDAO extends DAO {
     
    public CategoryDAO(){
        super();
    }
    
    public static List<Category> getAllCate(){
        String sql = "select * from Category";
         List<Category> cates = new ArrayList<>();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                cates.add(new Category(rs.getInt(1), rs.getString(2)));
            }
            return cates;
        } catch (Exception e) {
            status = "Error at getAllCate " + e.getMessage();
        }
        return null;
    }
    
    public static Category getCateById(int id){
        String sql = "select * from Category where category_id = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1,id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Category(rs.getInt(1), rs.getString(2));
            }
        } catch (Exception e) {
            status = "Error at getCateById " + e.getMessage();
        }
        return null;
    }
}
