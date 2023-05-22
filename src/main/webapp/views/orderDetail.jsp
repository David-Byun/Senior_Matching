<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
    let kakaoPay = {
        init : function () {
            $('#kakaoBtn').on('click', function () {
                alert("클릭");
                let total = ${total};
                let qnt = ${qnt};
                $.ajax({
                    method:'post',
                    url:'/kakaoPay',
                    data : {total : total, qnt : qnt}
                })
            })
        },
    }
    $(function () {
        kakaoPay.init();
    })
</script>
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h4>주문내역</h4>
                        <div class="breadcrumb__links">
                            <a href="/">Home</a>
                            <a href="/shop">Shop</a>
                            <span>주문내역</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Shopping Cart Section Begin -->
    <section class="shopping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="shopping__cart__table">
                        <table>
                            <thead>
                                <tr>
                                    <th>고객명</th>
                                    <th>우편번호</th>
                                    <th>고객주소</th>
                                    <th>전화번호</th>
                                    <th>주문 총 금액</th>
                                    <th>주문 총 개수</th>
                                    <th>주문날짜</th>
                                    <th>결제</th>
                                </tr>
                            </thead>
                            <c:forEach var="order" items="${orders}">
                            <tbody>
                                    <tr>
                                        <td class="cart__close">${loginmember.name}</td>
                                        <td class="cart__close">${order.zipcode}</td>
                                        <td class="cart__close">${order.addr}</td>
                                        <td class="cart__close">${order.tel}</td>
                                        <c:choose>
                                            <c:when test="${mycoupon == 1000}">
                                                <td class="cart__close"><fmt:formatNumber value="${order.price - mycoupon}" pattern="#,###,###원" /></td>
                                            </c:when>
                                            <c:otherwise>
                                                <td class="cart__close"><fmt:formatNumber value="${order.price}" pattern="#,###,###원" /></td>
                                            </c:otherwise>
                                        </c:choose>
                                        <td class="cart__close"><fmt:formatNumber value="${order.cnt}" pattern="#,###,###개" /></td>
                                        <td class="cart__close"><fmt:formatDate value="${order.rdate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                        <td>
                                            <form method="post" action="/kakaoPay?price=${order.price}&cnt=${order.cnt}">
                                            <button type="submit" class="btn btn-warning" id="kakaoBtn"><i class="fa-solid fa-comment" style="color: black"></i></button>
                                            </form>
                                        </td>
                                    </tr>
                            </tbody>
                            </c:forEach>
                        </table>
                    </div>
                </div>

            </div>
        </div>
    </section>
    <!-- Shopping Cart Section End -->
