<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
            <table class="table table-hover table-striped">
                <thead>
                <tr>
                    <th scope="col">번호</th>
                    <th scope="col">시작일자</th>
                    <th scope="col">종료일자</th>
                    <th scope="col">서비스구분</th>
                    <th scope="col">지역</th>
                    <th scope="col">대상자 성별</th>
                    <th scope="col">대상자 연령</th>
                    <th scope="col">진행상황</th>
                    <th scope="col">가격</th>
                    <th scope="col">결제수단</th>
                    <th scope="col">결제일자</th>
                </tr>
                </thead>
                <c:forEach var="obj" items="${mlist}">
                    <tbody>
                    <tr>
                        <th scope="row">${obj.id}</th>
                        <td>${obj.startDate}</td>
                        <td>${obj.endDate}</td>
                        <td>${obj.service}</td>
                        <td>${obj.area}</td>
                        <td>${obj.objectGender}</td>
                        <td>${obj.objectBirth}</td>
                        <td>${obj.status}</td>
                        <td>${obj.price}</td>
                        <td>${obj.payment}</td>
                        <td>${obj.payDate}</td>
                    </tr>
                    </tbody>
                </c:forEach>
            </table>
        </div>
    </div>
</section>
<!-- Checkout Section End -->