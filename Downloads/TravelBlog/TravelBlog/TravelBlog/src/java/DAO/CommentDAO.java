/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import static DAO.DAO.con;
import static DAO.DAO.status;
import Model.Category;
import Model.Comment;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author toden
 */
public class CommentDAO extends DAO {
    public CommentDAO(){
        super();
    }
    
    public static List<Comment> getCommentByPostId(int id){
        String sql = "Select * from Comment where post_id = ? ";
        List<Comment> comments = new ArrayList<>();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                comments.add(new Comment(rs.getInt(1), rs.getInt(2), AccountDAO.getAccountById(rs.getInt(3)), rs.getString(4), rs.getDate(5)));
            }
            return comments;
        } catch (Exception e) {
            status = "Error at getCommentByPostId " + e.getMessage();
        }
        return null;
    }
    
    public static boolean addComment(int post_id, int acc_id, String content){
        String sql = "Insert into Comment(post_id, account_id, content) values(?,?,?)";
        try{
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, post_id);
            ps.setInt(2, acc_id);
            ps.setString(3, content);
            ps.executeUpdate();
            return true;
        }catch(Exception e){
            status = "Error at addComment " + e.getMessage();
        }
        return false;
    }
}
