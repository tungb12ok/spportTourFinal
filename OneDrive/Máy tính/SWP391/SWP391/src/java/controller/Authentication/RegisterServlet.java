/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.Authentication;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import DAO.*;
import java.sql.Date;

/**
 *
 * @author tungl
 */
public class RegisterServlet extends HttpServlet {

    private final String passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d).{8,}$";
    private String messUser, messPass, messRe_pass;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("signup.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserDao dao = new UserDao();
        MD5 m = new MD5();
        // Get Parameter from signup.jsp
        String name = request.getParameter("name");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("pass");
        String confirmPassword = request.getParameter("re_pass");
        // get data jsp after user input
        request.setAttribute("name", name);
        request.setAttribute("username", username);
        request.setAttribute("email", email);
        request.setAttribute("phone", phone);
        request.setAttribute("pass", password);
        request.setAttribute("re_pass", confirmPassword);
        if (dao.searchAccount(username) != null) {
            messUser = "Username exist in DB!";
            request.setAttribute("messUser", messUser);

        }
        if (!password.matches(passwordRegex)) {
            messPass = "Password not Strong";
            request.setAttribute("messPass", messPass);

        }
        if (!password.equals(confirmPassword)) {
            messRe_pass = "password and confirm password not same!";
            request.setAttribute("messRe_pass", messRe_pass);
        } else {
            dao.registerUser(username, m.md5Hash(password), name, email, phone, 3);
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
        request.getRequestDispatcher("signup.jsp").forward(request, response);
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
