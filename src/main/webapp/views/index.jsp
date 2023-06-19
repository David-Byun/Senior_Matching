<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%--firebase 관련 키 변수화 셋팅--%>
<%--<spring:eval expression="@environment.getProperty('firebase.apiKey')" var="apiKey"/>--%>
<%--<spring:eval expression="@environment.getProperty('firebase.authDomain')" var="authDomain"/>--%>
<%--<spring:eval expression="@environment.getProperty('firebase.projectId')" var="projectId"/>--%>
<%--<spring:eval expression="@environment.getProperty('firebase.storageBucket')" var="storageBucket"/>--%>
<%--<spring:eval expression="@environment.getProperty('firebase.messagingSenderId')" var="messagingSenderId"/>--%>
<%--<spring:eval expression="@environment.getProperty('firebase.appId')" var="appId"/>--%>
<%--<spring:eval expression="@environment.getProperty('firebase.measurementId')" var="measurementId"/>--%>

<!DOCTYPE html>
<html lang="en" data-bs-theme="dark">

<head>
    <!-- The core Firebase JS SDK is always required and must be listed first -->
    <script src="https://www.gstatic.com/firebasejs/6.5.0/firebase-app.js"></script>

    <!-- TODO: Add SDKs for Firebase products that you want to use
         https://firebase.google.com/docs/web/setup#config-web-app -->

    <meta charset="UTF-8">
    <meta name="description" content="Male_Fashion Template">
    <meta name="keywords" content="Male_Fashion, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>봄생봄사 메이트 매칭</title>
    <script src="https://www.gstatic.com/firebasejs/5.9.2/firebase.js"></script>
    <script src="https://www.gstatic.com/firebasejs/5.9.2/firebase-app.js"></script>
    <script src="https://www.gstatic.com/firebasejs/5.9.2/firebase-messaging.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=877b72a4084b62dd3183b611e21359eb"></script>

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
    <%--jquery와 부트스트랩--%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <%--카카오맵api --%>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="https://www.gstatic.com/firebasejs/5.9.2/firebase.js"></script>
    <script src="https://www.gstatic.com/firebasejs/5.9.2/firebase-app.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://www.gstatic.com/firebasejs/5.9.2/firebase-messaging.js"></script>
<%--    push 발송 관련--%>

<%--    캘린더--%>
    <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
</head>
<body>
<script>

    $(function () {
        let web = null;
        function getBrowserName ()
        {
            //agent에 브라우저 종류 삽입
            var agent = navigator.userAgent.toLowerCase();
            if(  (navigator.appName == 'Netscape'
                && navigator.userAgent.search('Trident') != -1
                || (agent.indexOf("msie") != -1)  )){

                return "ie";
            } else if ( agent.indexOf("chrome") != -1 ) {

                return "chrome";
            } else if ( agent.indexOf("safari") != -1 ) {

                return "safari";
            } else if ( agent.indexOf("firefox") != -1 ) {

                return "firefox";
            }
        }
        let firebaseConfig = {
            //cloud 게시시 키 변수 셋팅으로 진행 예정
            <%--apiKey: "<c:out value='${apiKey}' />",--%>
            <%--authDomain: "<c:out value='${authDomain}' />",--%>
            <%--projectId: "<c:out value='${projectId}' />",--%>
            <%--storageBucket: "<c:out value='${storageBucket}' />",--%>
            <%--messagingSenderId: "<c:out value='${messagingSenderId}' />",--%>
            <%--appId: "<c:out value='${appId}' />",--%>
            <%--measurementId: "<c:out value='${measurementId}' />"--%>
            apiKey: "AIzaSyCfchQsojha5qRfexQ7faKMa0p4ebjH260",
            authDomain: "nwitter-4c3ea.firebaseapp.com",
            projectId: "nwitter-4c3ea",
            storageBucket: "nwitter-4c3ea.appspot.com",
            messagingSenderId: "613082594223",
            appId: "1:613082594223:web:54d455061bff28bb9c0d5a",
            measurementId: "G-KH0RN141KL"
        };
        web = getBrowserName();
        console.log(web);
        // Initialize Firebase
        firebase.initializeApp(firebaseConfig);

        // Show Notification
        // 메시지 기능 활성화를 알림
        const messaging = firebase.messaging();
        // RequestPermission 첫 어플 시작 시 알림 허용 or 불허를 사용자에게 안내합니다.
        // 허용하지 않을 시 알람 메시지는 가지 않습니다.
        messaging.requestPermission()
            .then(function () {
                // 알람이 허용되었을 때 토큰을 반환합니다.
                // 해당 토큰을 통해 FCM 특정 사용자에게 메시지를 보낼 수 있습니다.
                return messaging.getToken();
            })
            .then(async function (token) {
                console.log(token);
                $.ajax({
                    method:'post',
                    url:'/token',
                    data : {token : token, web : web}
                })
                // 해당 onMessage는 데이터메시지로, 포그라운드인 상태에서
                // FCM 메시지를 전송하는 경우 콘솔에 표기하도록 작성된 코드입니다.

                messaging.onMessage(payload => {
                    Swal.fire({
                        title: payload.notification.title,
                        text: payload.notification.body,
                        imageUrl : 'https://help.miricanvas.com/hc/article_attachments/4403560627353/_____________4_.png',
                        // imageUrl: 'https://unsplash.it/400/200',
                        imageWidth: 400,
                        imageHeight: 200,
                        imageAlt: 'Custom image',
                        showClass: {
                            popup: 'animate__animated animate__fadeInDown'
                        },
                        hideClass: {
                            popup: 'animate__animated animate__fadeOutUp'
                        }
                    })
                })
            })
        $('#logout').on("click", () => {
            location.href = "/logout"
        });
    });
</script>
<!-- Page Preloder -->
<div id="preloder">
    <div class="loader"></div>
</div>

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

<!-- Offcanvas Menu End -->

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
                        <li><a href="/matelocation">위치</a>
                            <ul class="dropdown">
                                <li><a href="/matelocation">근처 메이트 찾기</a></li>
                                <li><a href="/contact">사무실 위치 및 연락</a></li>
                            </ul>
                        <li><a href="/chatgpt">문의</a></li>
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

<c:choose>
    <c:when test="${center == null}">
        <jsp:include page="center.jsp"/>
    </c:when>
    <c:otherwise>
        <jsp:include page="${center}.jsp"/>
    </c:otherwise>
</c:choose>

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
                        <li><a href="/mate/all">메이트 리스트 보기</a></li>
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
<script src="/js/jquery-3.3.1.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/jquery.nice-select.min.js"></script>
<script src="/js/jquery.nicescroll.min.js"></script>
<script src="/js/jquery.magnific-popup.min.js"></script>
<script src="/js/jquery.countdown.min.js"></script>
<script src="/js/jquery.slicknav.js"></script>
<script src="/js/mixitup.min.js"></script>
<script src="/js/owl.carousel.min.js"></script>
<script src="/js/main.js"></script>
</body>

</html>
