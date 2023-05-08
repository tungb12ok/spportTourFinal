/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.CategoryDAO;
import DAO.DAO;
import DAO.PostDAO;
import DAO.ServiceDAO;
import DAO.VehicleDAO;
import Model.Category;
import Model.Pagination.Pagination;
import Model.Post;
import Model.Service;
import Model.Vehicle;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author toden
 */
public class PostList extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
//    protected List<Post> ifFilter(HttpServletRequest request, HttpServletResponse response) {
//        HttpSession session = request.getSession();
//        List<Post> posts = PostDAO.getAllPost();
//        List<Post> filterP = new ArrayList<>();
//        //search
//        if (request.getParameter("search") != null && request.getParameter("search") != "") {
//            filterP = new ArrayList<>();
//            String strSearch = request.getParameter("search");
//            for (Post p : posts) {
//                if (p.getTittle().toLowerCase().contains(strSearch.toLowerCase())) {
//                    filterP.add(p);
//                }
//            }
//             if (filterP.size() != 0) {
//                session.setAttribute("posts", filterP);
//            }
//        }
//        return filterP;
//    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        //get all posts
        List<Post> posts = PostDAO.getAllPost();
        //get all cate
        List<Category> cates = CategoryDAO.getAllCate();
        //get all vehicle
        List<Vehicle> vehicles = VehicleDAO.getAllVeh();
        //get all service
        List<Service> services = ServiceDAO.getAllService();
        //set seesion
        session.setAttribute("posts", posts);
        session.setAttribute("cates", cates);
        session.setAttribute("vehs", vehicles);
        session.setAttribute("servs", services);
        //setting pagination
        if (session.getAttribute("page") == null) {
            Page = new Pagination(posts.size(), 5, 1);
            session.setAttribute("page", Page);
        } else if (request.getParameter("cp") != null) {
            int cp = Integer.parseInt(request.getParameter("cp"));
            Page = new Pagination(posts.size(), 5, cp);
            session.setAttribute("page", Page);
        }
    }

    DAO dao;
    Pagination Page;

    public void init() {
        dao = new DAO();
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        HttpSession session = request.getSession();
        String done = request.getParameter("do");
        //if search
//        List<Post> filterP = ifFilter(request, response);
        //redirect to other page
        if (done != null) {
            switch (done) {
                case "add":
                    response.sendRedirect("CreatePost.jsp");
                    break;
                case "del":
                    int delid = Integer.parseInt(request.getParameter("delid"));
                    PostDAO.DelOnePost(delid);
                    List<Post> posts = PostDAO.getAllPost();
                    session.setAttribute("posts", posts);
                    response.sendRedirect("PostList.jsp");
                    //resetting pagination
                    if (session.getAttribute("page") == null) {
                        Page = new Pagination(posts.size(), 5, 1);
                        session.setAttribute("page", Page);
                    } else if (request.getParameter("cp") != null) {
                        int cp = Integer.parseInt(request.getParameter("cp"));
                        Page = new Pagination(posts.size(), 5, cp);
                        session.setAttribute("page", Page);
                    }
                    break;
            }
        } else if (request.getParameter("search") != null && request.getParameter("search") != "") {
            request.getRequestDispatcher("FilterPostList").forward(request, response);
        } else {
            response.sendRedirect("PostList.jsp");
        }

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
