<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link href="/css/bootstrap-icons.css" rel="stylesheet">
<link href="/css/templatemo-festava-live.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/socket.io/2.2.0/socket.io.js"></script>
<script src="/js/client.js?v=1"></script>
<script src="/css/styleChat.css"></script>
<style>
    .coupon {
        border-radius: 12px;
        box-shadow: 5px 8px 10px #d6d5d533;
        border: 1px solid lightgrey;
    }

    .code:hover {
        background: green;
        color: #fff;
        cursor: pointer
    }

</style>
<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-option">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb__text">
                    <h4>나의 쿠폰</h4>
                    <div class="breadcrumb__links">
                        <a href="/">Home</a>
                        <span>나의 쿠폰</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

<div class="container">
    <div class="d-flex justify-content-center row pt-5 ">
        <div class="col-md-6" >
            <c:forEach items="${couponList}" var="coupon">
                <div class="coupon p-3 bg-white" style="margin-top: 15px">
                    <div class="row no-gutters">
                        <div class="col-md-4 border-right">
                            <div class="d-flex flex-column align-items-center">
                                <img
                                    src="https://i.imgur.com/XwBlVpS.png"><span class="d-block">할인쿠폰</span><span
                                    class="text-black-50">메이트용</span></div>
                        </div>
                        <div class="col-md-8">
                            <div>
                                <div class="d-flex flex-row justify-content-end off"><h1>
                                    <fmt:formatNumber value="${coupon.amount}" type="number" pattern="#,###,###원" /></h1><span>OFF</span></div>
                                <div class="d-flex flex-row justify-content-between off px-3 p-2">
                                    <h5>메시지</h5><span>${coupon.admComment}</span>
                                </div>
                                <div class="d-flex flex-row justify-content-between off px-3 p-2">
                                    <span>Promo code:</span><span
                                        class="border border-success px-3 rounded code">${coupon.num}</span></div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>

        </div>
    </div>
    <div class="col-12 mt-auto mb-5 text-center pt-5">
        <a class="btn custom-btn smoothscroll" href="/match" id="captureButton" style="background-color: #178BFB">사용하러 가기</a>
    </div>

</div>