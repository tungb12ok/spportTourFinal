<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="entity.*"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Yadovuvi</title>
        <link rel="stylesheet" href="style.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link
            href="https://fonts.googleapis.com/css2?family=Merienda:wght@400;700&family=Poppins:wght@400;500;600&display=swap"
            rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
        <link rel="stylesheet" href="css/common.css">
        <style>
            .check-form {
                margin-top: -50px;
                z-index: 2;
                position: relative;
            }
        </style>

    </head>

    <body class="bg-light">
        !<!-- navbar include by components -->
        <%@include file="conponents/navbar.jsp" %>
        <div class="untree_co-section">
            <div class="container">
                <h2 class="section-title text-left mb-4">Take a look at Tour Video</h2>
                <div class="row justify-content-between align-items-center">
                    <div class="col-lg-10">
                        <figure class="img-play-video">
                            <img src="${t.getImg()}" alt="Image" class="img-fluid rounded-20" style="width: 100%; height: auto;">
                        </figure>
                    </div>



                    <div class="col-lg-10">

                        <h5>- Thông tin:</h5>
                        <p>
                            ${t.getContent()}
                        </p>

                    </div>
                        <h5>- Các hoạt động:</h5>
                        <ul class="list-unstyled two-col clearfix list_active">

                            <c:forEach var="i" items="${requestScope.lat}">
                                <li>+ ${i.getActivityName()} : ${i.getTime()}</li>
                                </c:forEach>
                            <style>
                                .list_active li{
                                    padding-left: 15px;
                                    padding-bottom: 10px;
                                }
                            </style>
                        </ul>
                    <div  class="col-lg-12">
                        <h4 style="color: red">${t.getTotalPrice()}VND</h4>
                        <p><a href="BookingTour?id=${id}" class="btn btn-primary">Booking</a></p>
                    </div>
                </div>
            </div>
        </div>

        <!--popular-->
        <div class="container">
            <h1 class=" mt-5 pt-4 mb-4 text-center">Tour dành cho các bạn</h1>
            <p class="mb-4 text-center">Hãy cùng trải nghiệm với chúng tôi</p>
            <div class="row popular-list">
                <c:forEach var="i" items="${requestScope.tour}">
                    <div class="col-lg-4 col-md-6 my-3">
                        <a href="TourDetail?id=${i.getTour_ID()}">
                            <div class="popular-card">
                                <img src="${i.getImg()}" alt="Image description">

                                <div class="card-content">

                                    <div class="card-rating">
                                        <ion-icon name="star"></ion-icon>
                                        <ion-icon name="star"></ion-icon>
                                        <ion-icon name="star"></ion-icon>
                                        <ion-icon name="star"></ion-icon>
                                        <ion-icon name="star"></ion-icon>
                                    </div>
                                    <p class="card-subtitle">
                                        <a href="TourDetail?id=${i.getTour_ID()}">${cDAO.getCityByID(i.getCity_ID()).getCity_Name()}</a>
                                    </p>
                                    <h3 class="h3 card-title">         

                                        <a href="TourDetail?id=${i.getTour_ID()}">Hotel: ${hDAO.getHotel(cDAO.getCityByID(i.getCity_ID()).getHotelID()).getHotel_Name()}</a>
                                    </h3>
                                    <h4 class="h3 card-title">
                                        <a href="TourDetail?id=${i.getTour_ID()}" style="color: red">${String.format("%.1f",i.getTotalPrice())}VNĐ</a>
                                    </h4>
                                </div>
                            </div>
                        </a>
                    </div>
                </c:forEach>

                <div class="col-lg-12 text-center mt-5">
                    <a href="#" class="btn btn-sm btn-outline-dark rounded-0 fw-bold shadow-none">More >>></a>
                </div>
            </div>


            <!-- <div class="container">
                <div class="row">
                    <div class="col-xs-12 col-sm-6 col-md-4">
                        <div class="card border-0 shadow" style="max-width: 350px; margin: auto;">
                            <img src="images/tours/1.jfif" class="card-img-top">
                            <div class="card-body">
                                <h5 class="card-title">Tour TÃ¢y NguyÃªn 3N2Ä: KhÃ¡m PhÃ¡ TÃ  ÄÃ¹ng - BuÃ´n MÃª Thuá»t - ThÃ¡c
                                    Draysap
                                </h5>
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 v-margin-bottom-5 ">
        
                                    <ul class="tourListPros list-inline" style="font-size: 13px;">
                                        <li>KDL Há» TÃ  ÄÃ¹ng</li>
                                        <li>KhÃ¡m PhÃ¡ Xá»© Sá» TÃ¢y NguyÃªn</li>
                                        <li>áº¨m Thá»±c TÃ¢y NguyÃªn</li>
                                        <li>Báº£o TÃ ng Tháº¿ Giá»i CÃ  PhÃª</li>
                                    </ul>
                                </div>
                                <span class="price vcolor-info">73.999.000 <small class="textCurrency">VND</small></span>
                            </div>
        
                        </div>
                    </div>
                </div>
            </div> -->
            <!-- footer -->
            <%@include file="conponents/footer.jsp" %>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                    integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
            <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
            <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
            <script src="js/call_api.js"></script>
            <script>
                var swiper = new Swiper(".swiper-container", {
                    spaceBetween: 30,
                    effect: "fade",
                    loop: true,
                    autoplay: {
                        delay: 3500,
                        disableOnInteraction: false,
                    }
                });
            </script>

    </body>

</html>