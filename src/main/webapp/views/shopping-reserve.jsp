<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
    // 1. 카트에서 X버튼을 클릭하면 카트에서 해당 품목을 삭제한다.
    let cntChange = {
        init : function () {
            $('.fa-angle-left').on('click', () => {
                $.ajax({
                    method : 'get',
                    url : '/cart/decrease',
                    success : function () {

                    }
                })
            })
            $('.fa-angle-right').on('click', (data) => {
                $.ajax({
                    method : 'get',
                    url : '/cart/increase',
                    success : function () {

                    }
                })
            })
        }
    }
    let deleteItem = {
        init : function () {
            $(document).on('click', '#delete_btn', function(e){
                let itemId = $(e.currentTarget).data('item-id');
                let memberId = ${loginmember.id};
                $.ajax({
                    method: 'post',
                    url: '/cart/delete',
                    data: {itemId: itemId, memberId: memberId}
                }).done(() => {
                    $('#cart' + itemId).remove();
                    $.ajax({
                        method : 'get',
                        url : '/cart/info',
                        data : {id : ${loginmember.id}}
                    }).done((result)=>{
                        $('#totalCnt').text(result.cnt);
                        $('#totalSub').text(addComma(result.price));
                        $('#totalSum').text(addComma(result.price));
                    })
                });
            })
        },
    }

    function addComma(num) {
        return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '원';
    }
    $(function () {
        deleteItem.init();
        cntChange.init();
    })

    // 2. QUANTITY 를 조정하면 onchange 하고 있다가 desc/increase api post 호출하고 post 에서 받아서 해당 데이터를 조정해준다.
</script>
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h4>Reserve List</h4>
                        <div class="breadcrumb__links">
                            <a href="/">Home</a>
                            <a href="/shop">Shop</a>
                            <span>Reserve List</span>
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
                        <c:set var="total" value="0"/>
                        <c:set var="qnt" value="0"/>
                        <table>
                            <thead>
                                <tr>
                                    <th>상품 아이디</th>
                                    <th>이미지</th>
                                    <th>상품명</th>
                                    <th>상품가격</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                    <c:forEach var="obj" items="${myReserve}">
                                    <tr id="cart${obj.id}">
                                        <td class="product__cart__item">
                                            <div class="product__cart__item__text">
                                                <h6>${obj.id}</h6>
                                            </div>
                                        </td>
                                        <td class="product__cart__item">
                                            <div class="product__cart__item__pic">
                                                <img src="/uimg/${obj.img}" alt="" style="width: 90px; height: 90px">
                                            </div>
                                        </td>
                                        <td class="product__cart__item">
                                            <div class="product__cart__item__text">
                                                <h6>${obj.name}</h6>
                                            </div>
                                        </td>
                                        <td class="product__cart__item">
                                            <div class="product__cart__item__text">
                                                <h5><fmt:formatNumber value="${obj.price}" pattern="#,###,###원" /></h5>
                                            </div>
                                        </td>
                                     <tr>
                                    </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
<%--                <div class="col-lg-4">--%>
<%--                        <div class="col-lg-10 col-md-10 col-sm-10">--%>
<%--                            <div class="continue__btn update__btn">--%>
<%--                                <a href="#"><i class="fa fa-spinner"></i> ALL to Cart</a>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                </div>--%>
            </div>
        </div>
    </section>
    <!-- Shopping Cart Section End -->
