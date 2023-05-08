/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Context.DBContext;
import java.sql.Connection;

/**
 *
 * @author toden
 */
public class DAO {
    protected static Connection con;
    public static String status="";
    public DAO(){
        try{
            con =  DBContext.getConnection();
        } catch (Exception e) {
            status = "Error Connection "+e.getMessage();
        }
    }
   
}
