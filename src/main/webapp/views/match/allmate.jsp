<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Manup Template">
    <meta name="keywords" content="Manup, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>봄생봄사 | 시니어 매칭</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Work+Sans:400,500,600,700,800,900&display=swap"
          rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Poppins:400,500,600,700&display=swap" rel="stylesheet">


    <!-- Css Styles -->
    <link rel="stylesheet" href="/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="/css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="/css/style.css" type="text/css">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
</head>

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
<header class="header">
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
                            <c:choose>
                                <c:when test="${loginmember == null && loginmate == null}">
                                    <a href="/login">시니어 로그인</a>
                                    <a href="/signin">시니어 가입</a>

                                </c:when>
                                <c:otherwise>
                                    <a href="/chatbot">챗봇문의</a>
                                </c:otherwise>
                            </c:choose>
                            <c:if test="${loginmember != null || loginmate != null}">
                                <a href="#" id="logout">로그아웃</a>
                            </c:if>
                            <a href="/faq">FAQs</a>
                            <a href="/websocket">챗봇문의</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-3">
                <div class="header__logo">
                    <a href="/"><img src="/img/logo.png" alt=""></a>
                </div>
            </div>
            <div class="col-lg-6 col-md-6">
                <nav class="header__menu mobile-menu">
                    <ul>
                        <li><a href="/">홈</a></li>
                        <li><a href="#">매칭</a>
                            <ul class="dropdown">
                                <li><a href="/match">매칭신청</a></li>
                                <li><a href="/listformember">매칭내역</a></li>
                                <li><a href="/listformate">새로운매칭신청확인(향후개발)</a></li>
                                <li><a href="/listformate">매칭내역</a></li>

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
                        <li><a href="/mate/all">후기</a>
                        </li>

                        <li><a href="/contact">위치</a></li>
                        <li><a href="/goldenlife">진료예약</a></li>
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
</header>
<!-- Header Section End -->
<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-option">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb__text">
                    <h4>메이트 리스트</h4>
                    <div class="breadcrumb__links">
                        <a href="/">매칭</a>
                        <a href="/mate/all">메이트 리스트</a>
                        <span>메이트 리스트</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->
<!-- Speaker Section Begin -->
<section class="speaker-section spad">
    <div class="container">
        <div class="row">
            <c:forEach items="${mates}" var="mate">

                <div class="col-sm-6">
                    <div class="speaker-item" style="margin-top:20px">
                        <div class="row">
                            <div class="col-lg-6">
                                <a href="/mate/review/${mate.id}">
                            <c:choose>
                                <c:when test="${mate.img == null || mate.img == ''}">
                                <div class="si-pic">
                                    <img src="https://cdn.pixabay.com/photo/2018/01/21/14/16/woman-3096664_1280.jpg" alt="mateIamge">
                                </div>
                                </c:when>
                                <c:otherwise>
                                            <div class="si-pic">
                                                <img src="/uimg/${mate.img}" alt="">
                                            </div>
                                </c:otherwise>

                            </c:choose>
                            </a>
                            </div>

                            <div class="col-lg-6">
                                <div class="si-text">
                                    <div class="si-title">
                                        <a href="/mate/review/${mate.id}">
                                        <h4>${mate.name}</h4>
                                        </a>
                                        <span>${mate.email}</span>
                                        <div class="d-flex mt-2">
                                            <div class="text-primary mr-2">
                                                <c:set var="fullStars" value="${mate.avgRate / 1}" />
                                                <c:set var="halfStars" value="${5 - mate.avgRate}" />

                                                <c:if test="${mate.avgRate > 0}">
                                                    <c:forEach begin="0" end="${fullStars-1}">
                                                        <small class="fas fa-star" style="color:#FAD00E"></small>
                                                    </c:forEach>
                                                </c:if>

                                                <c:if test="${mate.avgRate % 1 != 0}">
                                                    <small class="fas fa-star-half-alt" style="color:#FAD00E"></small>
                                                    <c:set var="halfStars" value="${halfStars - 1}" />
                                                </c:if>

                                                <c:forEach begin="0" end="${halfStars-1}">
                                                    <small class="far fa-star" style="color:#FAD00E"></small>
                                                </c:forEach>
                                            </div>
                                            <small class="pt-1" style="color: darkgray">(리뷰 ${mate.sum}개)</small>
                                        </div>
                                    </div>
                                    <div class="si-social">
                                        <a href="/callchat"><i class="fa fa-comment"></i></a>
                                        <a href="https://172.16.20.74" target='_blank'><i class="fa fa-video-camera"></i></a>
                                    </div>
                                    <p>가능 지역 : ${mate.area}</p>
                                    <p>보유 자격증 : ${mate.license}</p>
                                    <p>경력 : ${mate.jobPeriod}년</p>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <div class="load-more">
            <a href="#" class="primary-btn">Load More</a>
        </div>
    </div>
</section>
<!-- Speaker Section End -->

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


<!-- Js Plugins -->
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.magnific-popup.min.js"></script>
<script src="js/jquery.countdown.min.js"></script>
<script src="js/jquery.slicknav.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/main.js"></script>
<!-- Js Plugins -->
<script src="/js/jquery.nice-select.min.js"></script>
<script src="/js/jquery.nicescroll.min.js"></script>
<script src="/js/mixitup.min.js"></script>
</body>

</html>