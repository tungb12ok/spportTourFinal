<%-- 
    Document   : navbar
    Created on : Mar 10, 2023, 4:01:09 PM
    Author     : toden
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark" style="margin-bottom: 50px">
    <div class="container-fluid">
        <a class="navbar-brand" href="PostList">TravelBlog</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="PostList">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Link</a>
                </li>
                <li class="nav-item dropdown">
                    <button
                        class="btn btn-dark dropdown-toggle"
                        type="button"
                        id="dropdownMenuButton"
                        data-mdb-toggle="dropdown"
                        aria-expanded="false"
                        >
                        Location
                    </button>
                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                        <c:forEach items="${sessionScope.cates}" var="cate">
                            <li><a class="dropdown-item" href="FilterPostList?cateid=${cate.getCategoryId()}">${cate.getCategoryName()}</a></li>
                            </c:forEach>
                    </ul>
                </li>

                <li class="nav-item dropdown">
                    <button
                        class="btn btn-dark dropdown-toggle"
                        type="button"
                        id="dropdownMenuButton"
                        data-mdb-toggle="dropdown"
                        aria-expanded="false"
                        >
                        Vehicle
                    </button>
                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                        <c:forEach items="${sessionScope.vehs}" var="veh">
                            <li><a class="dropdown-item" href="FilterPostList?vehid=${veh.getVehicleId()}">${veh.getVehicleName()}</a></li>
                            </c:forEach>
                    </ul>
                </li>

                <div class="dropdown">
                    <button class="btn btn-dark dropdown-toggle" type="button" id="dropdownMenuButton"
                            data-mdb-toggle="dropdown" aria-expanded="false">
                        Service
                    </button>
                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                        <form action="FilterPostList" method="get">
                            <c:forEach items="${sessionScope.servs}" var="serv">
                                <li>
                                    <a class="dropdown-item">
                                        <div class="form-check">
                                            <i class="${serv.getIconclass()}"></i>
                                            <input name="services" value="${serv.getServiceId()}" class="form-check-input" type="checkbox" value="" id="Checkme1" />
                                            <label class="form-check-label" for="Checkme1">${serv.getServiceName()}</label>
                                        </div>
                                    </a>
                                </li>
                            </c:forEach>
                            <li><hr class="dropdown-divider" /></li>
                            <li>
                                <a class="dropdown-item">
                                    <div class="form-check">
                                        <button class="btn btn-outline-success" type="submit">Filter</button>
                                    </div>
                                </a>
                            </li>
                        </form>

                    </ul>
                </div>
            </ul>
            <form class="d-flex" method="get" action="PostList">
                <input name="search" class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
            <c:choose>
                <c:when test="${sessionScope.acc!=null}">
                    <span id="avatar" style="color: white; margin-left: 20px;"><i class="fas fa-user-alt fa-lg"></i>
                        ${sessionScope.acc.getAccountName()}</span>
                    <a href="LogOut" style="margin-left: 12px">
                        <button type="button" id="btnSignIn" onmouseout="hoverOutSignIn()" onmouseover="hoverSignIn()" class="btn btn-primary">LogOut</button>
                    </a>
                </c:when>
                <c:otherwise>
                    <a href="SignIn.jsp" style="margin-left: 12px">
                        <button type="button" id="btnSignIn" onmouseout="hoverOutSignIn()" onmouseover="hoverSignIn()" class="btn btn-primary">SignIn</button>
                    </a>  
                </c:otherwise>
            </c:choose>

        </div>
    </div>
</nav>

<script>
    function hoverSignIn() {
        var element = document.getElementById("btnSignIn");
        element.classList.remove("btn-primary");
        element.classList.add("btn-light");
    }
    function hoverOutSignIn() {
        var element = document.getElementById("btnSignIn");
        element.classList.remove("btn-light");
        element.classList.add("btn-primary");
    }
    function hoverAvatar() {
        var element = document.getElementById("btnSignIn");
        element.classList.remove("btn-primary");
        element.classList.add("btn-light");
    }
    function hoverOutAva() {
        var element = document.getElementById("btnSignIn");
        element.classList.remove("btn-primary");
        element.classList.add("btn-light");
    }
</script>