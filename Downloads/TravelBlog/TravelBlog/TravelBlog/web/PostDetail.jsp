
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="Component/header.jsp" %>
        <link rel="stylesheet" href="css/PostDetail.css">

    </head>
    <body>
        <%@include file="Component/navbar.jsp" %>
        <section class="banner-section">
        </section>
        <section class="post-content-section">
            <div class="container">

                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 post-title-block">

                        <h1 class="text-center">${requestScope.post.getTittle()}</h1>
                        <ul class="list-inline text-center">
                            <li>Author | ${requestScope.post.getAccount().getFullName()}</li>
                            <li>Category | ${requestScope.post.getCate().getCategoryName()}</li>
                            <li>Date | ${requestScope.post.getCreatedDate()}</li>
                        </ul>
                    </div>
                    <div class="col-lg-9 col-md-9 col-sm-12">
                        <p class="lead">${requestScope.post.getTittle()}.</p>
                        <div class="well ">
                            <div class="image-block" style="margin-bottom: 50px; margin-top: 50px ">
                                <img style="width: 900px; height: 700px" src="${requestScope.post.getImageLink()}" class="img-responsive" >
                            </div>
                        </div>
                        <p style="font-size: 25px">${requestScope.post.getContent()}.</p>

                    </div>
                    <!-- More -->
                    <div class="col-lg-3  col-md-3 col-sm-12">


                        <div class="well">
                            <h2>About Author</h2>
                            <img src="" class="img-rounded" />
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna</p>
                            <a href="#" class="btn btn-default">Read more about ${requestScope.post.getCate().getCategoryName()}</a>
                        </div>
                        <div class="list-group">
                            <!--                            <a class="list-group-item active" href="#"> <h4 class="list-group-item-heading">List group item heading</h4> <p class="list-group-item-text">Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.</p> </a>
                                                        <a class="list-group-item" href="#"> <h4 class="list-group-item-heading">List group item heading</h4> <p class="list-group-item-text">Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.</p> </a>
                                                        <a class="list-group-item" href="#"> <h4 class="list-group-item-heading">List group item heading</h4> <p class="list-group-item-text">Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.</p> </a> </div>-->
                            <div class="well" style="margin-top: 20px">
                                <c:set var = "i"  value = "${1}"/>
                                <c:forEach items="${sessionScope.posts}" var="list">
                                    <c:if test="${list.getCate().getCategoryName()==requestScope.post.getCate().getCategoryName()&&list.getPostId()!=requestScope.post.getPostId()&&i<4}">
                                        <c:set var = "i"  value = "${i+1}"/>
                                        <div class="media"> <div class="media-left"> <a href="PostDetail?id=${list.getPostId()}"> <img data-src="holder.js/64x64" class="media-object" alt="64x64" style="width: 64px; height: 64px;" src="${list.getImageLink()}" data-holder-rendered="true"> </a> </div> <div class="media-body"> <h4 class="media-heading">${list.getTittle()}</h4>${list.getDescription()}.</div> </div>
                                                </c:if>
                                            </c:forEach>
                            </div>
                        </div>
                    </div>   

                    <!--<!-- comment -->
                    <div class="row d-flex justify-content-center mb-4">
                        <div class="col-md-12 col-lg-12">
                            <div class="card shadow-0 border" style="background-color: #f0f2f5;">
                                <div class="card-body p-4">
                                    <div class="form-outline mb-4">
                                        <c:if test="${sessionScope.acc == null}">
                                            <label class="form-label" for="addANote"><s>+ Comment</s><p style="color: red">Sign in to comment</p></label>
                                                </c:if>
                                                <c:if test="${sessionScope.acc != null}">
                                                <form action="PostDetail" method="post">
                                                    <input name="comment" type="text" id="addANote" class="form-control" placeholder="Type comment..." required/>
                                                <label class="form-label" for="addANote">+ Comment</label>
                                                <button class="btn btn-primary " type="submit">Post commment</button>
                                                <input hidden value="${requestScope.post.getPostId()}" name="postid" />
                                            </form> 
                                        </c:if>    

                                    </div>

                                    <c:forEach items="${requestScope.post.getComments()}" var="c" >
                                        <div class="card mb-4">
                                            <div class="card-body">
                                                <p>${c.getContent()}</p>

                                                <div class="d-flex justify-content-between">
                                                    <div class="d-flex flex-row align-items-center">
                                                        <img src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/img%20(32).webp" alt="avatar" width="25"
                                                             height="25" />
                                                        <p class="small mb-0 ms-2">${c.getAcc().getAccountName()}</p>
                                                    </div>
                                                    <div class="d-flex flex-row align-items-center">
                                                        <p class="small text-muted mb-0">Upvote?</p>
                                                        <i class="far fa-thumbs-up mx-2 fa-xs text-black" style="margin-top: -0.16rem;"></i>
                                                        <p class="small text-muted mb-0">4</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>








                                </div>
                            </div>
                        </div>

                    </div>
                </div>


            </div> <!-- /container -->

        </section>
        <%@include file="Component/footer.jsp" %>
    </body>
</html>
