<%-- 
    Document   : Display
    Created on : Mar 20, 2023, 4:25:36 PM
    Author     : toden
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="header.jsp" %>
    </head>
    <body>
        <h1>Hello World!</h1>
        <table border="1">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Description</th>
                <th>Price</th> 
            </tr>


            <c:forEach items="${sessionScope.items}" var="i" begin="${sessionScope.page.getStartItem()}" end="${sessionScope.page.getLastItem()}">
                <tr>
                    <th>${i.getId()}</th>
                    <th>${i.getName()}</th>
                    <th>${i.getDescription()}</th>
                    <th>${i.getPrice()}</th>
                </tr>
            </c:forEach>
        </table>
        <%@include file="pagination.jsp" %>
    </body>
</html>
