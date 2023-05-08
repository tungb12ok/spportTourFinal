/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.PostDAO;
import DAO.ServiceDAO;
import Model.Account;
import Model.Post;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author toden
 */
public class UpdatePost extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdatePost</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdatePost at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
        int postid = Integer.parseInt(request.getParameter("id"));
        if(postid!=0){
            Post post = PostDAO.getPostById(postid);
            request.setAttribute("post", post);
            
        }
        request.getRequestDispatcher("EditPost.jsp").forward(request, response);
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
        //processRequest(request, response);
        HttpSession session = request.getSession();
        int cateId = Integer.parseInt(request.getParameter("location"));
        int vehId = Integer.parseInt(request.getParameter("vehicle"));
        String tittle = request.getParameter("title");
        String description = request.getParameter("description");
        String content = request.getParameter("content");
        String[] services = request.getParameterValues("services");
        int postid = Integer.parseInt(request.getParameter("postid"));
        String imageLink = request.getParameter("imageLink");
        Account acc = (Account)session.getAttribute("acc");
        if(acc !=null&&acc.getAccountId()!=0){
            PostDAO.UpdatePost(tittle, description, imageLink, acc.getAccountId(), cateId, vehId, postid);
            PostDAO.UpdatePostDetail(content, postid);
            ServiceDAO.updateServiceOf(postid, services);
            response.sendRedirect("PostList");
        }
        else{
            response.sendRedirect("SignIn.jsp");
        }
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
