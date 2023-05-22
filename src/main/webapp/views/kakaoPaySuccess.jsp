<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<section class="breadcrumb-option">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb__text">
                    <h4>결제내역</h4>
                    <div class="breadcrumb__links">
                        <a href="/">Home</a>
                        <a href="/shop">Shop</a>
                        <span>카카오페이 결제내역</span>
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
                                <th>주문번호</th>
                                <th>상품명</th>
                                <th>상품수량</th>
                                <th>결제금액</th>
                                <th>결제방법</th>
                                <th>결제수단</th>
                            </tr>
                        </thead>
                            <tbody>
                                <tr>
                                    <td class="cart__close">${info.partner_order_id}</td>
                                    <td class="cart__close">${info.item_name}</td>
                                    <td class="cart__close">${info.quantity}</td>
                                    <td class="cart__close">${info.amount.total}</td>
                                    <td class="cart__close">${info.payment_method_type}</td>
                                    <td class="cart__close">카카오 결제</td>
                                </tr>
                            </tbody>
                    </table>
                </div>
            </div>

        </div>
    </div>
</section>
<!-- Shopping Cart Section End -->


