<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>봄생봄사 | 시니어 매칭</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"

    <!-- Favicon -->
    <link href="/img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="/lib/animate/animate.min.css" rel="stylesheet">
    <link href="/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="/css/matereview.css" rel="stylesheet" type="text/css">
    <!-- Css Styles -->
    <link rel="stylesheet" href="/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="/css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="/css/style.css" type="text/css">
</head>
<style>
    #myform fieldset{
        display: inline-block;
        direction: rtl;
        border:0;
    }
    #myform fieldset legend{
        text-align: right;
    }
    #myform input[type=radio]{
        display: none;
    }
    #myform label{
        font-size: 3em;
        color: transparent;
        text-shadow: 0 0 0 #f0f0f0;
    }
    #myform label:hover{
        text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
    }
    #myform label:hover ~ label{
        text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
    }
    #myform input[type=radio]:checked ~ label{
        text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
    }
</style>

<body>

<!-- Offcanvas Menu Begin -->
<div class="offcanvas-menu-overlay"></div>
<div class="offcanvas-menu-wrapper">
    <div class="offcanvas__option">
        <div class="offcanvas__links">
            <c:choose>
                <c:when test="${loginmember == null}">
                    <a href="/login">로그인</a><a href="/signin"> 회원가입</a>
                </c:when>
                <c:otherwise>
                    <a href="#">${loginmember.name}님</a>
                    <a href="/logout">로그아웃</a>
                </c:otherwise>
            </c:choose>
        </div>

    </div>
    <div class="offcanvas__nav__option">
        <a href="#" class="search-switch"><img src="/img/icon/search.png" alt=""></a>
        <a href="#"><img src="/img/icon/heart.png" alt=""></a>
        <a href="#"><img src="/img/icon/cart.png" alt=""> <span>0</span></a>
    </div>
    <div id="mobile-menu-wrap"></div>
    <div class="offcanvas__text">
        <p>당신의 행복한 인생을 위해!</p>
    </div>
    <div class="offcanvas__links" style="margin-top: 10px">
        <p style="font-size: 13px">메이트 : <a href="/login">로그인</a><a href="/signin"> 회원가입</a></p>


    </div>
</div>


<!-- Header Section Begin -->
<header class="header" style="">
    <div class="header__top">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-7">
                    <div class="header__top__links">
                        <c:if test="${loginmember == null && loginmate == null}">
                            <a href="/mate/signin">메이트 가입</a>
                            <a href="/mate/login">메이트 로그인</a>
                        </c:if>

                    </div>
                </div>
                <div class="col-lg-6 col-md-5">
                    <div class="header__top__right">
                        <div class="header__top__links">
                            <a href="/api/qr/tistory">QR TO 봄생봄사</a>
                            <c:choose>
                                <c:when test="${loginmember == null && loginmate == null}">
                                    <a href="/login">시니어 로그인</a>
                                    <a href="/signin">시니어 가입</a>

                                </c:when>
                            </c:choose>
                            <c:if test="${loginmember != null || loginmate != null}">
                                <a href="/logout" id="logout">로그아웃</a>
                            </c:if>
                            <a href="/faq">FAQs</a>
                        </div>

                    </div>

                </div>

            </div>

        </div>

    </div>
    <marquee scrolldelay="100" bgcolor="#259FF7" behavior="slide" style="color:whitesmoke" loop="100">
        <c:forEach items="${allNotice}" var="notice">

            <b>[${notice.title}]</b> ${notice.content} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

        </c:forEach>
    </marquee>

    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-3">
                <div class="header__logo">
                    <a href="/"><img src="/img/logo.png" alt="" style="height: 100%;"></a>
                </div>
            </div>

            <div class="col-lg-6 col-md-6" style="padding-top: 25px;">
                <nav class="header__menu mobile-menu">
                    <ul>
                        <li><a href="/">홈</a></li>
                        <li><a href="/match">매칭</a>
                            <ul class="dropdown">
                                <li><a href="/match">매칭신청</a></li>
                                <li><a href="/mate/samplemate">메이트 리스트</a></li>
                                <li><a href="/listformember">회원 매칭내역</a></li>
                                <li><a href="/listformate">메이트 매칭내역</a></li>

                                <%--                                <c:if test="${loginmember != null}">--%>
                                <%--                                    <li><a href="/match">매칭신청</a></li>--%>
                                <%--                                    <li><a href="/listformember">매칭내역(멤버기준)</a></li>--%>
                                <%--                                </c:if>--%>
                                <%--                                <c:if test="${loginmate != null}">--%>
                                <%--                                    <li><a href="/listformate">매칭내역(메이트기준)</a></li>--%>
                                <%--                                </c:if>--%>
                            </ul>
                        </li>
                        <li><a href="/shop">몰</a>
                            <c:if test="${loginmember != null}">
                                <ul class="dropdown">
                                    <li><a href="/order/confirm/${loginmember.id}">주문내역</a></li>
                                </ul>
                            </c:if>
                        </li>
                        <li><a href="/video">AI진단</a></li>
                        <li><a href="/contact">본사 문의</a>

                    </ul>
                </nav>
            </div>

            <div class="col-lg-3 col-md-3">
                <div class="header__nav__option">
                    <c:if test="${loginmate != null}">
                        <a href="/mate/profile/${loginmate.id}"><i class="fa-solid fa-user"></i></a>
                    </c:if>
                    <c:if test="${loginmember != null}">
                        <a href="/memberdetail" class="search-switch"><i class="fa-solid fa-edit" style="color:black"></i></a>
                        <c:if test="${coupon == 'Y'}">
                            <a href="/mycoupon">
                                <i class="fas fa-gift"></i>
                            </a>
                        </c:if>
                    </c:if>
                    <a href="/reserve/${loginmember.id}">
                        <c:choose>
                            <c:when test="${myreserve == 0 || myreserve == null}">
                                <img src="/img/icon/heart.png" alt="">
                            </c:when>
                            <c:when test="${myreserve == 1}">
                                <i class="fa-solid fa-heart" style="color:blueviolet"></i>
                            </c:when>
                        </c:choose>
                    </a>
                    <a href="/cart/${loginmember.id}">
                        <c:choose>
                            <c:when test="${mycart == 0 || mycart == null}">
                                <img src="/img/icon/cart.png" alt="">
                            </c:when>
                            <c:when test="${mycart == 1}">
                                <i class="fa-solid fa-cart-shopping" style="color:deeppink"></i>
                            </c:when>
                        </c:choose>
                    </a>

                </div>
            </div>
        </div>
        <div class="canvas__open"><i class="fa fa-bars"></i></div>
    </div>
    <!-- Header Section End -->
</header>

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-option">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb__text">
                    <h4>메이트 후기</h4>
                    <div class="breadcrumb__links">
                        <a href="/">홈</a>
                        <a href="/matereviews">메이트 후기</a>
                        <span>메이트 후기</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->
<!-- Shop Detail Start -->

<div class="container-fluid">
    <div class="row px-sm-10" >
        <div class="col-sm-6 mb-30">
            <div id="product-carousel" >
                <div >
                    <c:choose>
                        <c:when test="${mate.img == null || mate.img == ''}">
                            <img class="w-40 h-25 d-block mx-auto" src="https://cdn.pixabay.com/photo/2018/01/21/14/16/woman-3096664_1280.jpg" alt="Image">
                        </c:when>
                        <c:otherwise>
                            <img class="w-40 h-25 d-block mx-auto pt-5" src="/uimg/${mate.img}" alt="Image">
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>

        <div class="col-sm-6 h-auto mb-30" >
            <div class="h-100 p-30">
                <h3>${mate.name}</h3>
                <h4>${mate.email}</h4>
                <div class="d-flex mt-3">
                    <div class="text-primary mr-2">
                        <c:set var="fullStars" value="${avg / 1}" />
                        <c:set var="halfStars" value="${5 - avg}" />

                        <c:if test="${avg > 0}">
                            <c:forEach begin="0" end="${fullStars-1}">
                                <small class="fas fa-star" style="color:#FAD00E"></small>
                            </c:forEach>
                        </c:if>

                        <c:if test="${avg % 1 != 0}">
                            <small class="fas fa-star-half-alt" style="color:#FAD00E"></small>
                            <c:set var="halfStars" value="${halfStars - 1}" />
                        </c:if>

                        <c:forEach begin="1" end="${halfStars}">
                            <small class="far fa-star" style="color:#FAD00E"></small>
                        </c:forEach>
                    </div>

                    <small class="pt-1">(리뷰 ${countReview}개)</small>
                </div>
                <div class="d-flex align-items-center mb-4 pt-2">
                </div>
                    <h5>자격증 : ${mate.license}등 보유</h5>
                <div class="d-flex align-items-center mb-4 pt-2">
                    <h5>경력 : ${mate.jobPeriod}년</h5>
                </div>
                <div class="d-flex align-items-center mb-4 pt-2">
                    <h>가능지역 : ${mate.area}</h>
                </div>
                <div class="d-flex pt-2">
                    <strong class="text-dark mr-2">상담 :</strong>
                    <div class="d-inline-flex">
                        <a class="text-dark px-2" href="/callchat">
                            <i class="fa fa-comment"></i>
                        </a>
                        <a class="text-dark px-2" href="https://172.16.20.74" target='_blank'>
                            <i class="fa fa-video-camera"></i>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="px-xl-5">
        <div class="col px-xl-5">
            <div class="px-xl-5">
                <div class="nav nav-tabs mb-4">
                    <a class="nav-item nav-link text-dark active" data-toggle="tab" href="#tab-pane-3">리뷰 (${countReview})</a>
                </div>
                <div class="tab-content">
                    <div class="tab-pane active" id="tab-pane-3">
                        <div class="row">
                            <div class="col-md-6">
                                <h4 class="mb-4">${mate.name} 님에 대한 리뷰</h4>
                                <c:forEach items="${mateReviewList}" var="review">
                                <div class="media mb-4">
                                    <img src="/uimg/${mate.img}" alt="Image" class="img-fluid mr-3 mt-1" style="width: 45px; border-radius: 60%" id="senior_photo">
                                    <div class="media-body">
                                        <h6>${review.name} / ${review.email}<small> - <i>${review.rdate}</i></small></h6>
                                        <div class="text-primary mb-2">
                                            <c:forEach begin="1" end="${review.rate}">
                                                <i class="fas fa-star" style="color:#FAD00E"></i>
                                            </c:forEach>
                                            <c:forEach begin="${review.rate}" end="4">
                                                <i class="far fa-star" style="color:#FAD00E"></i>
                                            </c:forEach>

                                        </div>
                                        <p>${review.content}</p>
                                    </div>
                                </div>
                                </c:forEach>
                            </div>
                            <div class="col-md-6">
                                <form id="myform" method="post" action="/mate/review">
                                <h4 class="mb-4">리뷰 남기기</h4>
                                <div class="d-flex my-3">
                                    <fieldset>
                                        <span class="text-warning" >별점을 선택해주세요</span>
                                        <input type="radio" name="rate" value="5" id="rate1"><label
                                            for="rate1">★</label>
                                        <input type="radio" name="rate" value="4" id="rate2"><label
                                            for="rate2" >★</label>
                                        <input type="radio" name="rate" value="3" id="rate3"><label
                                            for="rate3">★</label>
                                        <input type="radio" name="rate" value="2" id="rate4"><label
                                            for="rate4">★</label>
                                        <input type="radio" name="rate" value="1" id="rate5"><label
                                            for="rate5">★</label>
                                    </fieldset>
                                </div>
                                    <div class="form-group">
                                        <textarea id="message" cols="30" rows="5" class="form-control" name="content"></textarea>
                                    </div>
                                    <input type="hidden" name="mateId" value="${mate.id}">
                                    <input type="hidden" name="memberId" value="${loginmember.id}">
                                    <div class="form-group mb-0">
                                        <input type="submit" value="리뷰 등록" class="btn btn-warning px-3" style="color: white">
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Shop Detail End -->


<!-- Footer Section Begin -->
<footer class="footer">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-6 col-sm-6">
                <div class="footer__about">
                    <div class="footer__logo">
                        <a href="#"><img src="/img/footer-logo.png" alt=""></a>
                    </div>
                    <p>당신의 삶을 응원합니다!</p>
                    <a href="#"><img src="/img/payment.png" alt=""></a>
                </div>
            </div>
            <div class="col-lg-2 offset-lg-1 col-md-3 col-sm-6">
                <div class="footer__widget">
                    <h6>메이트 서비스</h6>
                    <ul>
                        <li><a href="#">메이트 결제 확인</a></li>
                        <li><a href="/listformember">메이트 이력 확인</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-2 col-md-3 col-sm-6">
                <div class="footer__widget">
                    <h6>금융 서비스</h6>
                    <ul>
                        <li><a href="https://okbfex.kbstar.com/quics?page=opensn#loading">퇴직연금</a></li>
                        <li><a href="https://minwon.nps.or.kr/jsppage/service/personal/subMainPage.jsp?menuGBN=A01">내 연금 확인하기</a></li>
                        <li><a href="https://omoney.kbstar.com/quics?page=C042014#loading">세무 문의</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-3 offset-lg-1 col-md-6 col-sm-6">
                <div class="footer__widget">
                    <h6>문의하기</h6>
                    <div class="footer__newslatter">
                        <p>365일 24시간 문의주세요!</p>
                        <form action="#">
                            <input type="text" placeholder="Your email">
                            <button type="submit"><span class="icon_mail_alt"></span></button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>
<!-- Footer Section End -->

<!-- Back to Top -->
<a href="#" class="btn back-to-top" style="background-color: #64D6AB; color: whitesmoke"><i class="fa fa-angle-double-up"></i></a>


<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
<script src="lib/easing/easing.min.js"></script>
<script src="lib/owlcarousel/owl.carousel.min.js"></script>

<!-- Contact Javascript File -->
<script src="mail/jqBootstrapValidation.min.js"></script>
<script src="mail/contact.js"></script>

<!-- Template Javascript -->
<script src="js/main.js"></script>
<script src="js/ratestar.js"></script>
</body>

</html>