<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    function loadMateData(orderKind) {
        $.ajax({
            url: '/api/mateall',
            method: 'GET',
            data: { orderKind: orderKind },
            success: function(result) {
                console.log(result);
            }
        });
    }
    let tab = {
        init: function () {
            $('#tabs1').on('click', function() {
                loadMateData('REVIEW_COUNT_DESC');
            });

            $('#tabs2').on('click', function() {
                loadMateData('AREA_DESC');
            });

            $('#tabs3').on('click', function() {
                loadMateData('JOB_DESC');
            });

            $('#tabs4').on('click', function () {
                loadMateData('LICENSE_DESC');
            })
        },
        set: function () {
            $.ajax({
                url: '/api/mateall',
                method: 'get',
                data: {orderKind: 'REVIEW_COUNT_DESC'},
                success: function (result) {
                    console.log(result);
                }
            });
        }

    };
    $(function(){
        tab.init();
        tab.set();

    })
</script>
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

<!-- Schedule Section Begin -->
<section class="schedule-section spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section-title">
                    <h2>알고리즘 추천 메이트 현황</h2>
                    <p>좋은 메이트를 만나보세요!</p>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="schedule-tab">
                    <ul class="nav nav-tabs" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" data-toggle="tab" href="#tabs-1" id="tabs1" role="button" >
                                <h5>평점별</h5>
                                <p>추천 메이트</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab">
                                <h5>지역별</h5>
                                <p>추천 메이트</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab">
                                <h5>경력별</h5>
                                <p>추천 메이트</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#tabs-4" role="tab">
                                <h5>성별</h5>
                                <p>추천 메이트</p>
                            </a>
                        </li>
                    </ul><!-- Tab panes -->
                    <div class="tab-content">
                        <div class="tab-pane active" id="tabs-1" role="tabpanel">
                            <div class="st-content">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-lg-3">
                                            <div class="sc-pic">
                                                <img src="img/schedule/schedule-1.jpg" alt="">
                                            </div>
                                        </div>
                                        <div class="col-lg-5">
                                            <div class="sc-text">
                                                <h4 id="mate_name">Dealing with Difficult People</h4>
                                                <ul>
                                                    <li id="mate_license"><i class="fa fa-user"></i> John Smith</li>
                                                    <li id="mate_email"><i class="fa fa-envelope"></i> john@Colorlib.com
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <ul class="sc-widget">
                                                <li id="mate_period"><i class="fa fa-clock-o"></i> 08:00 am - 10:00 AM</li>
                                                <li id="mate_region"><i class="fa fa-map-marker"></i> 59 Breanne Canyon Suite, USA
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="st-content">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-lg-3">
                                            <div class="sc-pic">
                                                <img src="img/schedule/schedule-2.jpg" alt="">
                                            </div>
                                        </div>
                                        <div class="col-lg-5">
                                            <div class="sc-text">
                                                <h4>V7 Digital Photo Printing</h4>
                                                <ul>
                                                    <li><i class="fa fa-user"></i> John Smith</li>
                                                    <li><i class="fa fa-envelope"></i> john@Colorlib.com
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <ul class="sc-widget">
                                                <li><i class="fa fa-clock-o"></i> 08:00 am - 10:00 AM</li>
                                                <li><i class="fa fa-map-marker"></i> 59 Breanne Canyon Suite, USA
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="st-content">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-lg-3">
                                            <div class="sc-pic">
                                                <img src="img/schedule/schedule-3.jpg" alt="">
                                            </div>
                                        </div>
                                        <div class="col-lg-5">
                                            <div class="sc-text">
                                                <h4>Beyond The Naked Eye</h4>
                                                <ul>
                                                    <li><i class="fa fa-user"></i> John Smith</li>
                                                    <li><i class="fa fa-envelope"></i> john@Colorlib.com
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <ul class="sc-widget">
                                                <li><i class="fa fa-clock-o"></i> 08:00 am - 10:00 AM</li>
                                                <li><i class="fa fa-map-marker"></i> 59 Breanne Canyon Suite, USA
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="st-content">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-lg-3">
                                            <div class="sc-pic">
                                                <img src="img/schedule/schedule-4.jpg" alt="">
                                            </div>
                                        </div>
                                        <div class="col-lg-5">
                                            <div class="sc-text">
                                                <h4>Influencing The Influencer</h4>
                                                <ul>
                                                    <li><i class="fa fa-user"></i> John Smith</li>
                                                    <li><i class="fa fa-envelope"></i> john@Colorlib.com
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <ul class="sc-widget">
                                                <li><i class="fa fa-clock-o"></i> 08:00 am - 10:00 AM</li>
                                                <li><i class="fa fa-map-marker"></i> 59 Breanne Canyon Suite, USA
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="tabs-2" role="tabpanel">
                            <div class="st-content">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-lg-3">
                                            <div class="sc-pic">
                                                <img src="img/schedule/schedule-1.jpg" alt="">
                                            </div>
                                        </div>
                                        <div class="col-lg-5">
                                            <div class="sc-text">
                                                <h4>Dealing with Easy People</h4>
                                                <ul>
                                                    <li><i class="fa fa-user"></i> John Smith</li>
                                                    <li><i class="fa fa-envelope"></i> john@Colorlib.com
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <ul class="sc-widget">
                                                <li><i class="fa fa-clock-o"></i> 08:00 am - 10:00 AM</li>
                                                <li><i class="fa fa-map-marker"></i> 59 Breanne Canyon Suite, USA
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="st-content">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-lg-3">
                                            <div class="sc-pic">
                                                <img src="img/schedule/schedule-2.jpg" alt="">
                                            </div>
                                        </div>
                                        <div class="col-lg-5">
                                            <div class="sc-text">
                                                <h4>V7 Digital Photo Printing</h4>
                                                <ul>
                                                    <li><i class="fa fa-user"></i> John Smith</li>
                                                    <li><i class="fa fa-envelope"></i> john@Colorlib.com
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <ul class="sc-widget">
                                                <li><i class="fa fa-clock-o"></i> 08:00 am - 10:00 AM</li>
                                                <li><i class="fa fa-map-marker"></i> 59 Breanne Canyon Suite, USA
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="st-content">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-lg-3">
                                            <div class="sc-pic">
                                                <img src="img/schedule/schedule-3.jpg" alt="">
                                            </div>
                                        </div>
                                        <div class="col-lg-5">
                                            <div class="sc-text">
                                                <h4>Beyond The Naked Eye</h4>
                                                <ul>
                                                    <li><i class="fa fa-user"></i> John Smith</li>
                                                    <li><i class="fa fa-envelope"></i> john@Colorlib.com
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <ul class="sc-widget">
                                                <li><i class="fa fa-clock-o"></i> 08:00 am - 10:00 AM</li>
                                                <li><i class="fa fa-map-marker"></i> 59 Breanne Canyon Suite, USA
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="st-content">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-lg-3">
                                            <div class="sc-pic">
                                                <img src="img/schedule/schedule-4.jpg" alt="">
                                            </div>
                                        </div>
                                        <div class="col-lg-5">
                                            <div class="sc-text">
                                                <h4>Influencing The Influencer</h4>
                                                <ul>
                                                    <li><i class="fa fa-user"></i> John Smith</li>
                                                    <li><i class="fa fa-envelope"></i> john@Colorlib.com
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <ul class="sc-widget">
                                                <li><i class="fa fa-clock-o"></i> 08:00 am - 10:00 AM</li>
                                                <li><i class="fa fa-map-marker"></i> 59 Breanne Canyon Suite, USA
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="tabs-3" role="tabpanel">
                            <div class="st-content">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-lg-3">
                                            <div class="sc-pic">
                                                <img src="img/schedule/schedule-1.jpg" alt="">
                                            </div>
                                        </div>
                                        <div class="col-lg-5">
                                            <div class="sc-text">
                                                <h4>Dealing with Intermediate People</h4>
                                                <ul>
                                                    <li><i class="fa fa-user"></i> John Smith</li>
                                                    <li><i class="fa fa-envelope"></i> john@Colorlib.com
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <ul class="sc-widget">
                                                <li><i class="fa fa-clock-o"></i> 08:00 am - 10:00 AM</li>
                                                <li><i class="fa fa-map-marker"></i> 59 Breanne Canyon Suite, USA
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="st-content">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-lg-3">
                                            <div class="sc-pic">
                                                <img src="img/schedule/schedule-2.jpg" alt="">
                                            </div>
                                        </div>
                                        <div class="col-lg-5">
                                            <div class="sc-text">
                                                <h4>V7 Digital Photo Printing</h4>
                                                <ul>
                                                    <li><i class="fa fa-user"></i> John Smith</li>
                                                    <li><i class="fa fa-envelope"></i> john@Colorlib.com
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <ul class="sc-widget">
                                                <li><i class="fa fa-clock-o"></i> 08:00 am - 10:00 AM</li>
                                                <li><i class="fa fa-map-marker"></i> 59 Breanne Canyon Suite, USA
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="st-content">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-lg-3">
                                            <div class="sc-pic">
                                                <img src="img/schedule/schedule-3.jpg" alt="">
                                            </div>
                                        </div>
                                        <div class="col-lg-5">
                                            <div class="sc-text">
                                                <h4>Beyond The Naked Eye</h4>
                                                <ul>
                                                    <li><i class="fa fa-user"></i> John Smith</li>
                                                    <li><i class="fa fa-envelope"></i> john@Colorlib.com
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <ul class="sc-widget">
                                                <li><i class="fa fa-clock-o"></i> 08:00 am - 10:00 AM</li>
                                                <li><i class="fa fa-map-marker"></i> 59 Breanne Canyon Suite, USA
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="st-content">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-lg-3">
                                            <div class="sc-pic">
                                                <img src="img/schedule/schedule-4.jpg" alt="">
                                            </div>
                                        </div>
                                        <div class="col-lg-5">
                                            <div class="sc-text">
                                                <h4>Influencing The Influencer</h4>
                                                <ul>
                                                    <li><i class="fa fa-user"></i> John Smith</li>
                                                    <li><i class="fa fa-envelope"></i> john@Colorlib.com
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <ul class="sc-widget">
                                                <li><i class="fa fa-clock-o"></i> 08:00 am - 10:00 AM</li>
                                                <li><i class="fa fa-map-marker"></i> 59 Breanne Canyon Suite, USA
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="tabs-4" role="tabpanel">
                            <div class="st-content">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-lg-3">
                                            <div class="sc-pic">
                                                <img src="img/schedule/schedule-1.jpg" alt="">
                                            </div>
                                        </div>
                                        <div class="col-lg-5">
                                            <div class="sc-text">
                                                <h4>Dealing with Expert People</h4>
                                                <ul>
                                                    <li><i class="fa fa-user"></i> John Smith</li>
                                                    <li><i class="fa fa-envelope"></i> john@Colorlib.com
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <ul class="sc-widget">
                                                <li><i class="fa fa-clock-o"></i> 08:00 am - 10:00 AM</li>
                                                <li><i class="fa fa-map-marker"></i> 59 Breanne Canyon Suite, USA
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="st-content">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-lg-3">
                                            <div class="sc-pic">
                                                <img src="img/schedule/schedule-2.jpg" alt="">
                                            </div>
                                        </div>
                                        <div class="col-lg-5">
                                            <div class="sc-text">
                                                <h4>V7 Digital Photo Printing</h4>
                                                <ul>
                                                    <li><i class="fa fa-user"></i> John Smith</li>
                                                    <li><i class="fa fa-envelope"></i> john@Colorlib.com
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <ul class="sc-widget">
                                                <li><i class="fa fa-clock-o"></i> 08:00 am - 10:00 AM</li>
                                                <li><i class="fa fa-map-marker"></i> 59 Breanne Canyon Suite, USA
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="st-content">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-lg-3">
                                            <div class="sc-pic">
                                                <img src="img/schedule/schedule-3.jpg" alt="">
                                            </div>
                                        </div>
                                        <div class="col-lg-5">
                                            <div class="sc-text">
                                                <h4>Beyond The Naked Eye</h4>
                                                <ul>
                                                    <li><i class="fa fa-user"></i> John Smith</li>
                                                    <li><i class="fa fa-envelope"></i> john@Colorlib.com
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <ul class="sc-widget">
                                                <li><i class="fa fa-clock-o"></i> 08:00 am - 10:00 AM</li>
                                                <li><i class="fa fa-map-marker"></i> 59 Breanne Canyon Suite, USA
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="st-content">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-lg-3">
                                            <div class="sc-pic">
                                                <img src="img/schedule/schedule-4.jpg" alt="">
                                            </div>
                                        </div>
                                        <div class="col-lg-5">
                                            <div class="sc-text">
                                                <h4>Influencing The Influencer</h4>
                                                <ul>
                                                    <li><i class="fa fa-user"></i> John Smith</li>
                                                    <li><i class="fa fa-envelope"></i> john@Colorlib.com
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <ul class="sc-widget">
                                                <li><i class="fa fa-clock-o"></i> 08:00 am - 10:00 AM</li>
                                                <li><i class="fa fa-map-marker"></i> 59 Breanne Canyon Suite, USA
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Schedule Section End -->

<!-- Team Member Section Begin -->
<section class="team-member-section">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section-title">
                    <h2>이번주 TOP 10 메이트</h2>
                    <p>These are our communicators, you can see each person information</p>
                </div>
            </div>
        </div>
    </div>
    <%-- 메이트 리스트 중 최근 10명만 추출 --%>
    <c:forEach items="${mates}" var="mate">
            <div class="member-item set-bg" data-setbg="/uimg/${mate.img}">
                <div class="mi-social">
                    <div class="mi-social-inner bg-gradient">
                        <a href="/callchat"><i class="fa fa-comment"></i></a>
                        <a href="https://172.16.20.74" target='_blank'><i class="fa fa-video-camera"></i></a>
                    </div>
                </div>
                <a href="/mate/review/${mate.id}">
                <div class="mi-text">
                    <h5>${mate.name}</h5>
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

                            <c:forEach begin="1" end="${halfStars}">
                                <small class="far fa-star" style="color:#FAD00E"></small>
                            </c:forEach>

                        </div>
                        <small class="pt-1" style="color: darkgray">(리뷰 ${mate.sum}개)</small>
                    </div>
                </div>
                </a>
            </div>

    </c:forEach>

</section>
<!-- Team Member Section End -->



