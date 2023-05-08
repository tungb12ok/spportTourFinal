/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Account;
import Model.Post;
import Model.Service;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author toden
 */
public class PostDAO extends DAO {

    public PostDAO() {
        super();
    }

    public static Post getPostById(int id) {
        String sql = "select * from Post where post_id = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int postId = rs.getInt(1);
                return new Post(postId, rs.getNString(2), rs.getDate(3), rs.getNString(4), rs.getString(5),
                        AccountDAO.getAccountById(rs.getInt(6)),
                        CategoryDAO.getCateById(rs.getInt(7)),
                        VehicleDAO.getVehicleById(rs.getInt(8)),
                        ServiceDAO.getServiceByPostId(postId),
                        getContentPost(postId),
                        CommentDAO.getCommentByPostId(postId));
            }
        } catch (Exception e) {
            status = "Error at getPostById " + e.getMessage();
        }
        return null;
    }

    public static List<Post> getAllPost() {
        String sql = "select * from Post";
        List<Post> posts = new ArrayList<>();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int postId = rs.getInt(1);
                posts.add(new Post(postId, rs.getNString(2), rs.getDate(3), rs.getNString(4), rs.getString(5),
                        AccountDAO.getAccountById(rs.getInt(6)),
                        CategoryDAO.getCateById(rs.getInt(7)),
                        VehicleDAO.getVehicleById(rs.getInt(8)),
                        ServiceDAO.getServiceByPostId(postId),
                        getContentPost(postId),
                        CommentDAO.getCommentByPostId(postId))
                );
            }
            return posts;
        } catch (Exception e) {
            status = "Error at getAllPost " + e.getMessage();
        }
        return null;
    }

    public static List<Post> FilterCatePost(int CateId, List<Post> posts) {
        List<Post> fillterPosts = new ArrayList<>();
        for (Post p : posts) {
            if (p.getCate().getCategoryId() == CateId) {
                fillterPosts.add(p);
            }
        }
        return fillterPosts;
    }

    public static List<Post> FilterVehPost(int VehId, List<Post> posts) {
        List<Post> fillterPosts = new ArrayList<>();
        for (Post p : posts) {
            if (p.getVehicle().getVehicleId() == VehId) {
                fillterPosts.add(p);
            }
        }
        return fillterPosts;
    }

    public static List<Post> FilterAccPost(int AccId, List<Post> posts) {
        List<Post> fillterPosts = new ArrayList<>();
        for (Post p : posts) {
            if (p.getAccount().getAccountId() == AccId) {
                fillterPosts.add(p);
            }
        }
        return fillterPosts;
    }

    public static List<Post> FilterSerPost(List<Service> SerId, List<Post> posts) {
        List<Post> fillterPosts = new ArrayList<>();
        for (Post p : posts) {
            if (Compare(SerId, p.getServices())) {
                fillterPosts.add(p);
            }
        }
        return fillterPosts;
    }

    public static boolean Compare(List<Service> SerId, List<Service> postServices) {
        for (Service s : SerId) {
            for (Service s1 : postServices) {
                if (s.getServiceId() == s1.getServiceId()) {
                    return true;
                }
            }
        }
        return false;
    }

    public static String getContentPost(int id) {
        String sql = "select content from PostDetail where post_id = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getString(1);
            }
        } catch (Exception e) {
            status = "Error at getContentPost " + e.getMessage();
        }
        return null;
    }

    public static boolean DelOnePost(int id) {
        String sql = "delete from service_of where post_id = ? delete from PostDetail where post_id = ? delete from Post where post_id = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.setInt(2, id);
            ps.setInt(3, id);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            status = "Error at DelOnePost " + e.getMessage();
        }
        return false;
    }

    public static boolean AddPost(String tittle, String description, String imageLink, int acc_id, int cate_id, int veh_id) {
        String sql = "insert into Post(tittle,description,image_link, account_id, category_id, vehicle_id) values(?,?,?,?,?,?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setNString(1, tittle);
            ps.setNString(2, description);
            ps.setNString(3, imageLink);
            ps.setInt(4, acc_id);
            ps.setInt(5, cate_id);
            ps.setInt(6, veh_id);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            status = "Error at AddPost " + e.getMessage();
        }
        return false;
    }

    public static boolean UpdatePost(String tittle, String description, String imageLink, int acc_id, int cate_id, int veh_id, int post_id) {
        String sql = "update Post set tittle = ?,description = ?,image_link = ?, account_id= ?, category_id = ?, vehicle_id = ? where post_id = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setNString(1, tittle);
            ps.setNString(2, description);
            ps.setNString(3, imageLink);
            ps.setInt(4, acc_id);
            ps.setInt(5, cate_id);
            ps.setInt(6, veh_id);
            ps.setInt(7, post_id);
            ps.executeUpdate();
            status = "success at UpdatePost ";
            return true;
        } catch (Exception e) {
            status = "Error at UpdatePost " + e.getMessage();
        }
        return false;
    }

    public static int newestPostId() {
        String sql = "select top 1 * from Post order by post_id desc";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            status = "Error at newestPostId " + e.getMessage();
        }
        return 0;
    }

    public static boolean AddPostDetail(String content, int postId) {
        String sql = "insert into PostDetail values (?,?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, postId);
            ps.setNString(2, content);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            status = "Error at AddPostDetail " + e.getMessage();
        }
        return false;
    }

    public static boolean UpdatePostDetail(String content, int postId) {
        String sql = "delete from PostDetail where post_id = ? insert into PostDetail values (?,?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, postId);
            ps.setInt(2, postId);
            ps.setNString(3, content);
            ps.executeUpdate();
            status = "success at UpdatePostDetail ";
            return true;
        } catch (Exception e) {
            status = "Error at UpdatePostDetail " + e.getMessage();
        }
        return false;
    }

    //Cách 1: Search 
    public static ArrayList<Post> getPostByTittle(String name) {
        try {
            String sql = "SELECT * FROM Post WHERE tittle LIKE ? or description LIKE ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, "%" + name + "%");
            ps.setString(2, "%" + name + "%");
            ResultSet rs = ps.executeQuery();
            ArrayList<Post> posts = new ArrayList<>();
            while (rs.next()) {
                int postId = rs.getInt(1);
                posts.add(new Post(postId, rs.getNString(2), rs.getDate(3), rs.getNString(4), rs.getString(5),
                        AccountDAO.getAccountById(rs.getInt(6)),
                        CategoryDAO.getCateById(rs.getInt(7)),
                        VehicleDAO.getVehicleById(rs.getInt(8)),
                        ServiceDAO.getServiceByPostId(postId),
                        getContentPost(postId),
                        CommentDAO.getCommentByPostId(postId))
                );
            }
            return posts;
        } catch (Exception e) {
            status = "Error at getPostByTittle" + e.getMessage();
        }
        return null;
    }

}
