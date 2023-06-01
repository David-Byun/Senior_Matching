<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h4>회원정보</h4>
                        <div class="breadcrumb__links">
                            <a href="/">홈</a>
                            <span>회원정보</span>
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
                            <h6 class="coupon__code"><span class="icon_tag_alt"></span><a href="#">Click
                            here</a></h6>
                            <h6 class="checkout__title">비밀번호 변경</h6>
                            <form id="memberdetail_form" name="memberdetail_form" action="/memberdetailUpdate" method="post">
                            <div class="row">
                                <div class="col-lg-10">
                                    <div class="checkout__input" >
                                        <p>ID<span>*</span></p>
                                        <input type="text" id="email" name="email" value="${loginmember.email}" readonly>
                                    </div>
                                    <div class="checkout__input" >
                                        <p>Name<span>*</span></p>
                                        <input type="text" id="name" name="name" value="${loginmember.name}" readonly>
                                    </div>
                                    <div class="checkout__input" >
                                        <p>New Password<span>*</span></p>
                                        <input type="password" id="password" name="password" />
                                    </div>
                                </div>
                            </div>
                                <div class="checkout__input__checkbox">
                                    <button type="submit" class="btn btn-success" id="memberdetail_btn">Update Info</button>
                                </div>
                            </form>
                        </div>
                    </div>
            </div>
        </div>
    </section>
    <!-- Checkout Section End -->