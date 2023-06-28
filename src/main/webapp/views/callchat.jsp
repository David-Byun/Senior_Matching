<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
    <title>봄생봄사 1:1 채팅</title>
    <link rel="stylesheet" href="/css/chat.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
          rel="stylesheet">
    <!-- Css Styles -->
    <link rel="stylesheet" href="/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="/css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="/css/style.css" type="text/css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body background="18.jpg"
      style="background-position: center; background-repeat: no-repeat; background-size: cover;">
<noscript>
    <h2>Sorry! Your browser doesn't support Javascript</h2>
</noscript>
<script>
    $(function(){
        if(!("webkitSpeechRecognition") in window){
            alert("Connect in Chrome Browser");
        }else{
            const speech = new webkitSpeechRecognition;

            document.getElementById("rcdStart").addEventListener("click",()=>{
                speech.start();
            });
            document.getElementById("rcdStop").addEventListener("click",()=>{
                speech.stop();
            });

            speech.addEventListener("result", (event)=>{
                console.log(event);
                const { transcript } = event["results"][0][0];
                console.log(transcript);
                resultListView(transcript);
            });

            function resultListView(transcript){
                document.getElementById("message").value = transcript;
            }
        }
    })
</script>
<!-- Offcanvas Menu Begin -->
<div class="offcanvas-menu-overlay"></div>
<div class="offcanvas-menu-wrapper">
    <div class="offcanvas__option">
        <div class="offcanvas__links">
            <a href="/login">Log in</a>
            <a href="/signin">Sign in</a>
            <a href="/faq">FAQs</a>
            <a href="#">${loginmember.name}님</a>
        </div>
    </div>
    <div class="offcanvas__nav__option">
        <a href="#" class="search-switch"><img src="/img/icon/search.png" alt=""></a>
        <a href="#"><img src="/img/icon/heart.png" alt=""></a>
        <a href="#"><img src="/img/icon/cart.png" alt=""> <span>0</span></a>
        <div class="price">$0.00</div>
    </div>
    <div id="mobile-menu-wrap"></div>
    <div class="offcanvas__text">
        <p>구입 후 30일까지 환불가능</p>
    </div>
</div>

<!-- Offcanvas Menu End -->

<!-- Header Section Begin -->
<header class="header">
    <div class="header__top">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-7">

                </div>
                <div class="col-lg-6 col-md-5">
                    <div class="header__top__right">
                        <div class="header__top__links">
                                <a href="#" id="logout">로그아웃</a>

                            <a href="/faq">FAQs</a>
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
                    <a href="/mate/profile/${loginmate.id}"><i class="fa-solid fa-user"></i></a>
                    <a href="/memberdetail" class="search-switch"><i class="fa-solid fa-edit" style="color:black"></i></a>
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

<div id="username-page">
    <div class="username-page-container">
        <h4 style="margin-bottom: 30px">사용할 닉네임을 정해주세요</h4>
        <form id="usernameForm" name="usernameForm">
            <div class="form-group">
                <input type="text" id="name" placeholder="닉네임"
                       autocomplete="off" class="form-control" />
            </div>
            <div class="form-group">
                <button type="submit" class="accent username-submit" style="background-color: #64D6AB">상담시작</button>
            </div>
        </form>
    </div>
</div>

<div id="chat-page" class="hidden">
    <div class="chat-container">
        <div class="chat-header">
            <h2>봄생봄사 1:1 상담</h2>
        </div>
        <div class="connecting">대기중...</div>
        <ul id="messageArea">

        </ul>
        <form id="messageForm" name="messageForm" nameForm="messageForm">
            <div class="form-group">
                <div class="input-group clearfix">
                    <input type="text" id="message" placeholder="Type a message..."
                           autocomplete="off" class="form-control" />
                    <button type="submit" class="btn btn-outline-warning"><i class="fa-solid fa-circle-arrow-up" style="font-size: 25px"></i></button>
                </div>
            </div>
        </form>
        <button id="rcdStart" class="btn btn-warning">Record</button>
        <button id="rcdStop" class="btn btn-danger">Stop</button>
    </div>
</div>

<script
        src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.4/sockjs.min.js"></script>
<script
        src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<script src="/js/chat.js"></script>
</body>
</html>