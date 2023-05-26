<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Speaker Section Begin -->
<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-option">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb__text">
                    <h4>간병인 매칭</h4>
                    <div class="breadcrumb__links">
                        <a href="/">홈</a>
                        <a href="/ordermatch">간병인 매칭</a>
                        <span>간병인 매칭</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->



<!-- Checkout Section Begin -->
<section class="checkout spad">
    <div class="container">
        <div class="checkout__form">
            <div class="row">
                <div class="col-lg-8 col-md-10">
                    <h6 class="coupon__code"><span class="icon_tag_alt"></span> Have no ID? <a href="#">Click
                        here</a> to join us</h6>
                    <h6 class="checkout__title">매칭 신청서</h6>
                    <form id="order_match_form" name="order_match_form" action="/match/order" method="post">
                        <div class="row">
                            <div class="col-lg-10">
                                <div class="checkout__input" >
                                    <p>시작일자<span>*</span></p>
                                    <input type="date" id="startDate" name="startDate" placeholder="시작 일자를 선택하세요.">
                                </div>
                                <div class="checkout__input" >
                                    <p>종료일자<span>*</span></p>
                                    <input type="date" id="endDate" name="endDate" placeholder="종료 일자를 선택하세요.">
                                </div>
                                <div class="checkout__input" >
                                    <p>지역<span>*</span></p>
                                    <input type="text" id="area" name="area" placeholder="지역을 선택하세요.(강남구, 관악구, 성동구)">
                                </div>
                                <div class="checkout__input" >
                                    <p>서비스<span>*</span></p>
                                    <input type="password" id="service" name="service" placeholder="서비스를 선택하세요.(요양, 간병, 장애인)">
                                </div>
                                <div class="checkout__input" >
                                    <p>어르신 나이<span>*</span></p>
                                    <input type="number" id="objectGender" placeholder="성별을 선택하세요.(f, m)">
                                </div>
                                <div class="checkout__input" >
                                    <p>어르신 생년월일<span>*</span></p>
                                    <input type="date" id="objectBirth" placeholder="생년월일을 입력하세요">
                                </div>
                                <div class="checkout__input">
                                    <div class="alert alert-danger" id="alert" style="display: none">
                                        <strong>Wrong!</strong> Please check your password again!
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="checkout__input__checkbox">
                            <button type="submit" class="btn btn-primary" id="order_match_btn">매칭 신청</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Checkout Section End -->

