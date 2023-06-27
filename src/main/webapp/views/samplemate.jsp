<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    function loadMateData(orderKind) {
        console.log("=====orderKind ====", orderKind);
        $.ajax({
            url: '/api/mateall',
            method: 'GET',
            data: { orderKind: orderKind },
            success: function(result) {
                console.log(result);
                for (let i = 0; i < result.length; i++) {
                    $('#mate_license' + i).html('<i class="fa fa-user"></i> ' + result[i].license);
                    $('#mate_email' + i).html('<i class="fa fa-envelope"></i> ' + result[i].email);
                    $('#mate_name' + i).text(result[i].name);
                    $('#mate_img' + i).attr('src', '/uimg/' + result[i].img);
                    $('#mate_link' + i).attr('href', '/mate/review/' + result[i].id);
                    $('#mate_period' + i).html('경력 : <i class="fa fa-clock-o"></i> ' + result[i].jobPeriod + '년');
                    $('#mate_area' + i).html('가능 지역 : <i class="fa fa-map-marker"></i> ' + result[i].area);
                }
            }
        });
    }
    let tab = {
        init: function () {
            $('#tabs1').on('click', function() {
                tab.changeTab('REVIEW_COUNT_DESC');
                $('#tabs1').css('background-color', '#1389FB');
                $('#tabs1').css('color', 'white');
                $('#tabs2, #tabs3, #tabs4').css('background-color', 'white');
                $('#tabs2, #tabs3, #tabs4').css('color', 'black');
            });

            $('#tabs2').on('click', function() {
                console.log("=====tab2=====");
                tab.changeTab('AREA_ASC');
                $('#tabs2').css('background-color', '#1389FB');
                $('#tabs2').css('color', 'white');
                $('#tabs1, #tabs3, #tabs4').css('background-color', 'white');
                $('#tabs1, #tabs3, #tabs4').css('color', 'black');
            });

            $('#tabs3').on('click', function() {
                console.log("=====tab3=====");
                tab.changeTab('JOB_ASC');
                $('#tabs3').css('background-color', '#1389FB');
                $('#tabs3').css('color', 'white');
                $('#tabs1, #tabs2, #tabs4').css('background-color', 'white');
                $('#tabs1, #tabs2, #tabs4').css('color', 'black');
            });

            $('#tabs4').on('click', function () {
                console.log("=====tab4=====");
                tab.changeTab('LICENSE_ASC');
                $('#tabs4').css('background-color', '#1389FB');
                $('#tabs4').css('color', 'white');
                $('#tabs1, #tabs2, #tabs3').css('background-color', 'white');
                $('#tabs1, #tabs2, #tabs3').css('color', 'black');
            });
        },
        changeTab: function (orderKind) {
            loadMateData(orderKind); // loadMateData 함수 호출
        },
        set: function () {
            $.ajax({
                url: '/api/mateall',
                method: 'get',
                data: {orderKind: 'REVIEW_COUNT_DESC'},
                success: function (result) {
                    for (let i = 0; i < result.length; i++) {
                        $('#mate_link' + i).attr('href', '/mate/review/' + result[i].id);
                        $('#mate_license' + i).html('<i class="fa fa-user"></i> ' + result[i].license);
                        $('#mate_email' + i).html('<i class="fa fa-envelope"></i> ' + result[i].email);
                        $('#mate_name' + i).text(result[i].name);
                        $('#mate_img' + i).attr('src', '/uimg/' + result[i].img);
                        $('#mate_period' + i).html('경력 : <i class="fa fa-clock-o"></i> ' + result[i].jobPeriod + '년');
                        $('#mate_area' + i).html('가능 지역 : <i class="fa fa-map-marker"></i> ' + result[i].area);
                        $('#tabs1').css('background-color', '#1389FB');
                        $('#tabs1').css('color', 'white');
                    }
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
                            <a class="nav-link active" data-toggle="tab" id="tabs1" role="button" >
                                <h5>평점별</h5>
                                <p>추천 메이트</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" id="tabs2" role="button">
                                <h5>지역별</h5>
                                <p>추천 메이트</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" id="tabs3" role="button">
                                <h5>경력별</h5>
                                <p>추천 메이트</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" id="tabs4" role="button">
                                <h5>성별</h5>
                                <p>추천 메이트</p>
                            </a>
                        </li>
                    </ul><!-- Tab panes -->
                    <div class="tab-content">
                        <div class="tab-pane active" id="tabs-1" role="tabpanel">
                            <a id="mate_link0">
                            <div class="st-content">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-lg-3">
                                            <div class="sc-pic">

                                                <img id="mate_img0" src="img/schedule/schedule-1.jpg" alt="">

                                            </div>
                                        </div>
                                        <div class="col-lg-5">
                                            <div class="sc-text">
                                                <h4 id="mate_name0"></h4>
                                                <ul>
                                                    <li id="mate_license0"><i class="fa fa-user"></i></li>
                                                    <li id="mate_email0"><i class="fa fa-envelope"></i>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <ul class="sc-widget">
                                                <li id="mate_period0"><i class="fa fa-clock-o"></i></li>
                                                <li id="mate_area0"><i class="fa fa-map-marker"></i>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            </a>
                            <a id="mate_link1">
                            <div class="st-content">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-lg-3">
                                            <div class="sc-pic">
                                                <img id="mate_img1" src="img/schedule/schedule-1.jpg" alt="">
                                            </div>
                                        </div>
                                        <div class="col-lg-5">
                                            <div class="sc-text">
                                                <h4 id="mate_name1"></h4>
                                                <ul>
                                                    <li id="mate_license1"><i class="fa fa-user"></i></li>
                                                    <li id="mate_email1"><i class="fa fa-envelope"></i>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <ul class="sc-widget">
                                                <li id="mate_period1"><i class="fa fa-clock-o"></i></li>
                                                <li id="mate_area1"><i class="fa fa-map-marker"></i>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            </a>
                            <a id="mate_link2">
                            <div class="st-content">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-lg-3">
                                            <div class="sc-pic">
                                                <img id="mate_img2" src="img/schedule/schedule-1.jpg" alt="">
                                            </div>
                                        </div>
                                        <div class="col-lg-5">
                                            <div class="sc-text">
                                                <h4 id="mate_name2"></h4>
                                                <ul>
                                                    <li id="mate_license2"><i class="fa fa-user"></i></li>
                                                    <li id="mate_email2"><i class="fa fa-envelope"></i>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <ul class="sc-widget">
                                                <li id="mate_period2"><i class="fa fa-clock-o"></i></li>
                                                <li id="mate_area2"><i class="fa fa-map-marker"></i>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            </a>
                            <a id="mate_link3">
                            <div class="st-content">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-lg-3">
                                            <div class="sc-pic">
                                                <img id="mate_img3" />
                                            </div>
                                        </div>
                                        <div class="col-lg-5">
                                            <div class="sc-text">
                                                <h4 id="mate_name3"></h4>
                                                <ul>
                                                    <li id="mate_license3"><i class="fa fa-user"></i></li>
                                                    <li id="mate_email3"><i class="fa fa-envelope"></i>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <ul class="sc-widget">
                                                <li id="mate_period3"><i class="fa fa-clock-o"></i></li>
                                                <li id="mate_area3"><i class="fa fa-map-marker"></i>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            </a>
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
                    <h2>이번주 TOP 5 메이트</h2>
                    <p>최고의 메이트가 당신과 함께해요!</p>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12" style="display: flex; justify-content: center; padding-bottom: 20px">
            <c:forEach items="${mates}" var="mate">
                <div class="member-item set-bg" data-setbg="/uimg/${mate.img}" style="width: 250px; height: 250px; background-position: center center;">
                    <div class="mi-social">
                        <div class="mi-social-inner bg-gradient">
                            <a href="/callchat"><i class="fa fa-comment" style="color: #08BD8F"></i></a>
                            <a href="https://172.16.20.74" target='_blank'><i class="fa fa-video-camera" style="color: #08BD8F"></i></a>
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
        </div>
    </div>
    <%-- 메이트 리스트 중 최근 10명만 추출 --%>


</section>
<!-- Team Member Section End -->



