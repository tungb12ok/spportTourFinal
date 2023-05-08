<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Landing Page</title>
        <%
                String lang = request.getParameter("lang");
                if (lang == null) {
                        lang = "en";
                }
        %>
    </head>
    <body>
        <h1>
            <% if (lang.equals("vi")) { %>
            Chào mừng đến với Hệ thống Quản lý Sản phẩm
            <% } else { %>
            Welcome to Item Management System
            <% } %>
        </h1>
        <form id="login-form" action="login.jsp" method="post">
            <input type="hidden" name="lang" value="<%=lang%>">
            <label for="username">
                <% if (lang.equals("vi")) { %>
                Tên đăng nhập:
                <% } else { %>
                Username:
                <% } %>
            </label>
            <input type="text" id="username" name="username">
            <br>
            <label for="password">
                <% if (lang.equals("vi")) { %>
                Mật khẩu:
                <% } else { %>
                Password:
                <% } %>
            </label>
            <input type="password" id="password" name="password">
            <br>

            <% if (lang.equals("vi")) { %>
            <input type="submit" value="Đăng nhập">
            <% } else { %>
            <input type="submit" value="Login">

            <% } %>

        </form>
        <p>
            <% if (lang.equals("vi")) { %>
            Chọn ngôn ngữ của bạn:
            <% } else { %>
            Choose your language:
            <% } %>
        </p>
        <ul>
            <li><a href="?lang=en">English</a></li>
            <li><a href="?lang=vi">Tiếng Việt</a></li>
        </ul>
    </body>
</html>
