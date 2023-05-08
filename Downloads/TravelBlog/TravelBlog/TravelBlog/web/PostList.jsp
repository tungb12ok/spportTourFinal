
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="Component/header.jsp" %>
        <link rel="stylesheet" href="css/PostList.css">
    </head>
    <body>
        <%@include file="Component/navbar.jsp" %>
        <div class="container">


            <div class="card" style="width: 18rem; margin: 30px; margin-left: 14%">
                <div class="card-body">
                    <h5 class="card-title">Welcome to our website</h5>
                    <h6 class="card-subtitle mb-2 text-muted"></h6>
                    <p class="card-text">Create your own Review Post.</p>
                    <c:if test="${sessionScope.acc==null}">
                        <s>Add New Post</s><p style="color: red">you have to sign in to make a post.</p>
                        </c:if>
                        <c:if test="${sessionScope.acc!=null}">
                        <a href="PostList?do=add" class="card-link">Add New Post</a>
                    </c:if>    

                    <!--                    <a href="#" class="card-link">Another link</a>-->
                </div>
            </div>

            <div class="col-md-12 col-lg-12">

                <c:forEach items="${sessionScope.posts}" var="p" begin="${sessionScope.page.getStartItem()}" end="${sessionScope.page.getLastItem()}">
                    <article class="post vt-post" style="width: 70%; margin-left: 13%; border-radius: 30px">
                        <div class="row">
                            <div class="col-xs-12 col-sm-5 col-md-5 col-lg-4">
                                <div class="post-type post-img">
                                    <a href="#"><img src="${p.getImageLink()}" class="img-responsive" alt="image post"></a>
                                </div>
                                <div class="author-info author-info-2">
                                    <ul class="list-inline">
                                        <li>
                                            <div class="info">
                                                <p>Posted on:</p>
                                                <strong>${p.getCreatedDate()}</strong>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="info">
                                                <p>Comments: ${p.getComments().size()}</p>
                                                <strong></strong>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-7 col-md-7 col-lg-8">
                                <div class="caption">
                                    <h3 class="md-heading"><a href="#">${p.getTittle()}</a></h3>
                                    <p> ${p.getDescription()} </p>
                                    <a class="btn btn-default" href="PostDetail?id=${p.getPostId()}" role="button">Read More</a> 
                                    <c:if test="${p.getAccount().getAccountId()==sessionScope.acc.getAccountId()}">
                                        <a class="btn btn-default" href="UpdatePost?id=${p.getPostId()}" role="button">Edit Post</a> 
                                        <a class="btn btn-danger" href="PostList?delid=${p.getPostId()}&do=del" role="button">Delete Post</a> 
                                    </c:if>
                                    <br>
                                    <div class="d-flex flex-row bd-highlight mb-3">
                                        <c:forEach items="${p.getServices()}" var="serv">
                                            <div class="p-2 bd-highlight">
                                                <i class="${serv.getIconclass()}"></i><p>${serv.getServiceName()}</p>
                                            </div>
                                            </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </article>
                </c:forEach>

                <%@include file="Component/pagination.jsp" %>

                <div class="clearfix"></div>
            </div>
        </div>
        <%@include file="Component/footer.jsp" %>
    </body>
</html>
