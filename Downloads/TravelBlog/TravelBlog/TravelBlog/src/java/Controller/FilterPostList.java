/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.PostDAO;
import DAO.ServiceDAO;
import Model.Post;
import Model.Service;
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
public class FilterPostList extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        response.sendRedirect("FilterPostList.jsp");

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
        //processRequest(request, response);
        HttpSession session = request.getSession();
        List<Post> posts = PostDAO.getAllPost();
        List<Post> filterP = new ArrayList<>();
        //search
        if (request.getParameter("search") != null && request.getParameter("search") != "") {
            String strSearch = request.getParameter("search");
//            for (Post p : posts) {
//                if (p.getTittle().toLowerCase().contains(strSearch.toLowerCase())) {
//                    filterP.add(p);
//                }
//            }
            filterP = PostDAO.getPostByTittle(strSearch);

            session.setAttribute("posts", filterP);

        }
        //Location
        if (request.getParameter("cateid") != null && request.getParameter("cateid") != "") {
            int cateid = Integer.parseInt(request.getParameter("cateid"));
//            for (Post p : posts) {
//                if (p.getCate().getCategoryId()==cateid) {
//                    filterP.add(p);
//                }
//            }
            filterP = PostDAO.FilterCatePost(cateid, posts);

            session.setAttribute("posts", filterP);

        }
        //Vehicle
        if (request.getParameter("vehid") != null && request.getParameter("vehid") != "") {
            int vehid = Integer.parseInt(request.getParameter("vehid"));
//            for (Post p : posts) {
//                if (p.getVehicle().getVehicleId()==vehid) {
//                    filterP.add(p);
//                }
//            }
            filterP = PostDAO.FilterVehPost(vehid, posts);

            session.setAttribute("posts", filterP);

        }
        //Services
        String[] servs = request.getParameterValues("services");
        ArrayList<Service> Services = new ArrayList<>();
        if (servs != null && servs.length > 0) {
            for (String s : servs) {
                int sid = Integer.parseInt(s);
                Services.add(ServiceDAO.getServiceById(sid));
            }
        }

        if (Services != null && Services.size() > 0) {
            filterP = PostDAO.FilterSerPost(Services, posts);
            session.setAttribute("posts", filterP);
            session.setAttribute("Services", Services);
        }
        response.sendRedirect("FilterPostList.jsp");
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
