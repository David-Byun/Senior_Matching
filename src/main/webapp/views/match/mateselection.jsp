<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Speaker Section Begin -->
<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-option">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb__text">
                    <h4>신규 매칭 요청</h4>
                    <div class="breadcrumb__links">
                        <a href="/">홈</a>
                        <a href="/match/ordermatch">간병인 매칭</a>
                        <span>간병인 매칭</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

<section class="speaker-section spad">
    <div class="container">
        <div class="row">
            <div class="col-sm-6">
                <c:forEach var="obj" items="${mlist}">
                    <div class="speaker-item">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="si-pic">
                                    <img src="/uimg/${obj.img}" alt="">
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="si-text">
                                    <div class="si-title">
                                        <h6> 이름 : ${obj.name}</h6>
                                        <h6> 경력 : ${obj.jobPeriod}년</h6>
                                        <h6> 자격증 : ${obj.license}</h6>

                                    </div>
                                    <div class="si-social">
                                        <a href="#"><i class="fa-sharp fa-solid fa-comment"></i></a>
                                        <a href="#"><i class="fas fa-video"></i></a>
                                        <form id="matchForm" action="/offer" method="POST">
<%--                                            <input type="hidden" name="memberId" value="${loginmember}">--%>
                                            <input type="hidden" name="mateId" value="${obj.id}">
                                            <input type="hidden" name="omId" value="${omId}">
                                            <a href="#" onclick="document.getElementById('matchForm').submit(); return false;"><i class="fas fa-arrow-circle-up"></i></a>
                                        </form>
                                    </div>
                                    <div class="rating">
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                    </div>
                                    <p> 신청하기 </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>

            </div>
        </div>
        <div class="load-more">
            <a href="#" class="primary-btn">Load More</a>
        </div>
    </div>
</section>
<!-- Helper Section End -->