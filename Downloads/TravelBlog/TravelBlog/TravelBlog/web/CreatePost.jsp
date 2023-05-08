
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="Component/header.jsp" %>
        <link rel="stylesheet" href="css/CreatePost.css">
    </head>
    <body>
        <%@include file="Component/navbar.jsp" %>
        <div class="container" style="margin-bottom: 100px">
            <div class="row">

                <div class="col-md-8 col-md-offset-2">

                    <h1>Create post</h1>

                    <form action="CreatePost" method="POST">
                        <div class="form-group">
                            <div class="dropdown" style="margin-bottom: 30px">
                                <button
                                    class="btn btn-primary dropdown-toggle"
                                    type="button"
                                    id="dropdownMenuButton"
                                    data-mdb-toggle="dropdown"
                                    aria-expanded="false"
                                    >
                                    Location
                                </button>
                                <select name="location" class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                    <c:forEach items="${sessionScope.cates}" var="cate">
                                        <option value="${cate.getCategoryId()}"><a class="dropdown-item" href="#">${cate.getCategoryName()}</a></option>
                                        </c:forEach>
                                </select>
                            </div>

                            <div class="dropdown" style="margin-bottom: 30px">
                                <button
                                    class="btn btn-primary dropdown-toggle"
                                    type="button"
                                    id="dropdownMenuButton"
                                    data-mdb-toggle="dropdown"
                                    aria-expanded="false"
                                    >
                                    Vehicle
                                </button>
                                <select name="vehicle" class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                    <c:forEach items="${sessionScope.vehs}" var="veh">
                                        <option value="${veh.getVehicleId()}"><a class="dropdown-item" href="#">${veh.getVehicleName()}</a></option>
                                        </c:forEach>
                                </select>
                            </div>
                        </div>


                        <div class="form-group has-error">
                            <label for="slug">ImageLink <span class="require">*</span> <small>(This field use in url path.)</small></label>
                            <input type="text" class="form-control" name="imageLink" />
                            <!--                            <span class="help-block">Field not entered!</span>-->
                        </div>

                        <div class="form-group">
                            <label for="title">Title <span class="require">*</span></label>
                            <input type="text" class="form-control" name="title" required/>
                        </div>

                        <div class="form-group">
                            <label for="description">Description</label><span class="require">*</span>
                            <textarea rows="5" class="form-control" name="description" required></textarea>
                        </div>

                        <div class="form-group">
                            <label for="content">Content</label><span class="require">*</span>
                            <textarea rows="10" class="form-control" name="content" minlength="100" required ></textarea>
                        </div>

                        <div class="form-group">
                            <p><span class="require">*</span> - required fields</p>
                        </div>

                        <div class="dropdown">
                            <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton"
                                    data-mdb-toggle="dropdown" aria-expanded="false">
                                Service
                            </button>
                            <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
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

                            </ul>
                        </div>

                        <div class="form-group" style="margin-top: 30px">
                            <button type="submit" class="btn btn-primary">
                                Create
                            </button>
                            <a href="PostList">
                                <button type="button" class="btn btn-default">
                                    Cancel
                                </button>
                            </a>
                        </div>

                    </form>
                </div>

            </div>
        </div>
        <%@include file="Component/footer.jsp" %>
    </body>
</html>
