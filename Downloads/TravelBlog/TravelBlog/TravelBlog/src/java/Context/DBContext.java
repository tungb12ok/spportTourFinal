/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Context;

import DAO.AccountDAO;
import DAO.CategoryDAO;
import DAO.CommentDAO;
import static DAO.DAO.status;
import static DAO.PostDAO.getContentPost;
import DAO.ServiceDAO;
import DAO.VehicleDAO;
import Model.Post;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author toden
 */
public class DBContext {

    public static Connection getConnection()throws Exception {        
        String url = "jdbc:sqlserver://"+serverName+":"+portNumber +
                ";databaseName="+dbName;//+"; integratedSecurity=true";
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");         
        return DriverManager.getConnection(url, userID, password);
//        return DriverManager.getConnection(url);
    }
    public DBContext(){
        
    }
    public DBContext(String u, String p){
        userID = u;
        password = p;
    }
    /*Insert your other code right after this comment*/
   
    /*Change/update information of your database connection, DO NOT change name of instance variables in this class*/
    private static final String serverName = "localhost";
    private static final String dbName = "TravelBlog";
    private static final String portNumber = "1433";
    private static  String userID = "sa";
    private static  String password = "sa";
    
    public static void main(String[] args){
        try{
            new DBContext().getConnection();
            System.out.println("Ket noi thanh cong");
        } catch(Exception e){
            System.out.println("Ket noi that bai"+e.getLocalizedMessage()+" "+e.getMessage());
        }
    }
}