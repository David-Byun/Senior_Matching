<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h4>Check Out</h4>
                        <div class="breadcrumb__links">
                            <a href="/">Home</a>
                            <a href="/shop">Shop</a>
                            <span>Check Out</span>
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
                <form action="/order/orderImpl" method="post">
                    <input type="hidden" value="${loginmember.id}" name="memberId">
                    <div class="row">
                        <div class="col-lg-8 col-md-6">
                            <h6 class="coupon__code"><span class="icon_tag_alt"></span> Have a coupon? <a href="#">Click
                            here</a> to enter your code</h6>
                            <h6 class="checkout__title">Billing Details</h6>
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Name<span>*</span></p>
                                        <input type="text" name="name">
                                    </div>
                                </div>
                            </div>
                            <div class="checkout__input">
                                <p>Address<span>*</span></p>
                                <input type="text" placeholder="Street Address" class="checkout__input__add" name="addr">
                            </div>
                            <div class="checkout__input">
                                <p>Postcode / ZIP<span>*</span></p>
                                <input type="text" name="zipcode">
                            </div>
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Phone<span>*</span></p>
                                        <input type="text" name="tel">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <div class="checkout__order">
                                <h4 class="order__title">Your order</h4>
                                <div class="checkout__order__products">상품 <span>가격</span></div>
                                <c:set var="total" value="0"/>
                                <c:set var="qnt" value="0"/>
                                <input type="hidden" name="itemName" value="상품"/>
                                <ul class="checkout__total__products">
                                    <c:forEach var="item" items="${items}">
                                        <c:set var="total" value="${total + (item.price * item.cnt)}"/>
                                        <c:set var="qnt" value="${qnt + item.cnt}"/>
                                        <li>${item.name}/${item.cnt}개 <span><fmt:formatNumber value="${item.price * item.cnt}" pattern="#,###,###원" /></span></li>
                                    </c:forEach>

                                </ul>

                                <ul class="checkout__total__all">
                                    <c:if test="${mycoupon == 1000}">
                                        <li>쿠폰 <span>-1,000원</span></li>
                                    </c:if>
                                    <li>Total <span><fmt:formatNumber value="${total - mycoupon}" pattern="#,###,###원"/></span></li>
                                </ul>
                                <input type="hidden" name="price" value="${total}">
                                <input type="hidden" name="cnt" value="${qnt}">
                                <button type="submit" class="site-btn">PLACE ORDER</button>

                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>
    <!-- Checkout Section End -->
