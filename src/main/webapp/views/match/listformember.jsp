<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
    @media (max-width: 768px) {
        table {
            font-size: 12px;
        }
    }

    @media (max-width: 576px) {
        table {
            font-size: 8px;
        }
    }

    .table th:nth-child(1),
    .table td:nth-child(1) {
        width: 11%;
    }

    .table th:nth-child(2),
    .table td:nth-child(2) {
        width: 22%;
    }
    .table th:nth-child(3),
    .table td:nth-child(3) {
        width: 11%;
    }
    .table th:nth-child(4),
    .table td:nth-child(4) {
        width: 15%;
    }
    .table th:nth-child(5),
    .table td:nth-child(5) {
        width: 13%;
    }
    .table th:nth-child(6),
    .table td:nth-child(6) {
        width: 13%;
    }
    /*body{margin-top:20px;*/
    /*  color: #2e323c;*/
    /*  background: #f5f6fa;*/
    /*  position: relative;*/
    /*  height: 100%;*/
    /*}*/
    .invoice-container {
        padding: 1rem;
    }
    .invoice-container .invoice-header .invoice-logo {
        margin: 0.8rem 0 0 0;
        display: inline-block;
        font-size: 1.6rem;
        font-weight: 700;
        color: #2e323c;
    }
    .invoice-container .invoice-header .invoice-logo img {
        max-width: 130px;
    }
    .invoice-container .invoice-header address {
        font-size: 0.8rem;
        color: #9fa8b9;
        margin: 0;
    }
    .invoice-container .invoice-details {
        margin: 1rem 0 0 0;
        padding: 1rem;
        line-height: 180%;
        background: #f5f6fa;
    }
    .invoice-container .invoice-details .invoice-num {
        text-align: right;
        font-size: 0.8rem;
    }
    .invoice-container .invoice-body {
        padding: 1rem 0 0 0;
    }
    .invoice-container .invoice-footer {
        text-align: center;
        font-size: 0.7rem;
        margin: 5px 0 0 0;
    }

    .invoice-status {
        text-align: center;
        padding: 1rem;
        background: #ffffff;
        -webkit-border-radius: 4px;
        -moz-border-radius: 4px;
        border-radius: 4px;
        margin-bottom: 1rem;
    }
    .invoice-status h2.status {
        margin: 0 0 0.8rem 0;
    }
    .invoice-status h5.status-title {
        margin: 0 0 0.8rem 0;
        color: #9fa8b9;
    }
    .invoice-status p.status-type {
        margin: 0.5rem 0 0 0;
        padding: 0;
        line-height: 150%;
    }
    .invoice-status i {
        font-size: 1.5rem;
        margin: 0 0 1rem 0;
        display: inline-block;
        padding: 1rem;
        background: #f5f6fa;
        -webkit-border-radius: 50px;
        -moz-border-radius: 50px;
        border-radius: 50px;
    }
    .invoice-status .badge {
        text-transform: uppercase;
    }

    @media (max-width: 767px) {
        .invoice-container {
            padding: 1rem;
        }
    }


    .custom-table {
        border: 1px solid #e0e3ec;
    }
    .custom-table thead {
        background: #007ae1;
    }
    .custom-table thead th {
        border: 0;
        color: #ffffff;
    }
    .custom-table > tbody tr:hover {
        background: #fafafa;
    }
    .custom-table > tbody tr:nth-of-type(even) {
        background-color: #ffffff;
    }
    .custom-table > tbody td {
        border: 1px solid #e6e9f0;
    }


    .card {
        background: #ffffff;
        -webkit-border-radius: 5px;
        -moz-border-radius: 5px;
        border-radius: 5px;
        border: 0;
        margin-bottom: 1rem;
    }

    .text-success {
        color: #00bb42 !important;
    }

    .text-muted {
        color: #9fa8b9 !important;
    }

    .custom-actions-btns {
        margin: auto;
        display: flex;
        justify-content: flex-end;
    }

    .custom-actions-btns .btn {
        margin: .3rem 0 .3rem .3rem;
    }
    .table td{
        vertical-align: middle;
        padding: 10px;
        border-bottom: 4px solid white;
    }
    .table th{
        vertical-align: middle;
        border-bottom: 4px solid white;
    }
    .table  tr th{
        vertical-align: middle;
        border-bottom: 8px solid white;
    }
    .table {
        background-color: #F1F1F1;
    }

    button{
        border-radius: 10px;
        box-shadow: 0 0 0 0 !important;
    } .custom-table {
          border: 1px solid #e0e3ec;
      }
    .custom-table thead {
        background: #007ae1;
    }
    .custom-table thead th {
        border: 0;
        color: #ffffff;
    }
    .custom-table > tbody tr:hover {
        background: #fafafa;
    }
    .custom-table > tbody tr:nth-of-type(even) {
        background-color: #ffffff;
    }
    .custom-table > tbody td {
        border: 1px solid #e6e9f0;
    }


    .card {
        background: #ffffff;
        -webkit-border-radius: 5px;
        -moz-border-radius: 5px;
        border-radius: 5px;
        border: 0;
        margin-bottom: 1rem;
    }

    .text-success {
        color: #00bb42 !important;
    }

    .text-muted {
        color: #9fa8b9 !important;
    }

    .custom-actions-btns {
        margin: auto;
        display: flex;
        justify-content: flex-end;
    }

    .custom-actions-btns .btn {
        margin: .3rem 0 .3rem .3rem;
    }
    .table td{
        vertical-align: middle;
        padding: 10px;
        border-bottom: 4px solid white;
    }
    .table th{
        vertical-align: middle;
        border-bottom: 4px solid white;
    }
    .table  tr th{
        vertical-align: middle;
        border-bottom: 8px solid white;
    }
    .table {
        background-color: #F1F1F1;
    }

    button{
        border-radius: 10px;
        box-shadow: 0 0 0 0 !important;
    }

    .product__item__text .rating i {
        color: #f7941d;
    }

    .product__item__text .rating i:nth-last-child(1) {
        color: #b7b7b7;
    }

    .product__item__text .rating i {
        color: #f7941d;
    }

    .product__item__text .rating i:nth-last-child(1) {
        color: #b7b7b7;
    }
</style>
<script>

    function showPopup() {
        window.open("popup.jsp");
    }
    function payMatchOffer(price) {
         window.location.href = "/kakaoPayImpl?price="+price;
     }

     let receipt = {
         init:function (){
             $(document).on('click', 'a.btn-success', this.send);
         },
         send:function (e){
             e.preventDefault();
             // Extract the ID from the element ID
             let id = $(this).attr('id').replace('generatePdf', '');
             let dataToSend = {
                 id: id,
             };
             // want to send data by ajax
             $.ajax({
                 url: '/generatepdf',
                 type: 'POST',
                 data: dataToSend,
                 success: function(response) {
                     alert("PDF가 다운완료되었습니다.");
                     $('#myReceipt'+id).modal('hide');
                 },
                 error: function(xhr, status, error) {
                 }
             });
         }
     }

     $(function (){
         receipt.init();
     })
</script>
<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-option">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb__text">
                    <h4>회원 매칭 내역</h4><span>*회원용</span>
                    <div class="breadcrumb__links">
                        <a href="/">홈</a>
                        <a href="#">매칭</a>
                        <span>매칭 내역</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
    <!-- Breadcrumb Section End -->
<!-- Checkout Section Begin -->
<section class="checkout spad" style="padding-top: 20px;">
    <div class="container">
        <div class="alert alert-info" style="text-align: center;">
            <strong>🍯매칭 꿀팁!</strong> 48시간 내로 결제되지 않으면 취소돼요!🐝
        </div>
        <div class="checkout__form" >
            <table class="table table-hover table-striped" style="text-align: center; background-color: floralwhite" >
                <thead style="background-color: floralwhite">
                <tr style="background-color: floralwhite">
                    <th scope="col">번호</th>
                    <th scope="col">일자</th>
                    <th scope="col">구분</th>
                    <th scope="col">지역</th>
                    <th scope="col">메이트</th>
                    <th scope="col">상태</th>
                </tr>
                </thead>
                <c:forEach var="obj" items="${mlist}">
                    <tbody style="background-color: floralwhite">
                    <tr style="background-color: floralwhite">
                        <td>${obj.id}</td>
                        <td>${obj.startDate} ~ ${obj.endDate}</td>
                        <td>${obj.service}</td>
                        <td>${obj.area}</td>
                        <td style="align-items: center;text-align: center;">
                            <div style="align-items: center;text-align: center;">
                            <img src="/img/mate/${obj.mateImg}" style="border-radius: 50%; width:50px;">
                            <div class="product__item__text" style="align-items:center;text-align: center;padding-top: 0;">
                                <span style="background-color: yellow; border-radius: 10px;">${obj.mateName}</span>
                                <span>
                                        <div class="rating" id="rate" class="rate">
                                            <c:forEach begin="1" end="${obj.mateRate}">
                                                <i class="fa fa-star"></i>
                                            </c:forEach>
                                            <c:forEach begin="${obj.mateRate + 1}" end="5">
                                                <i class="fa fa-star-o"></i>
                                            </c:forEach>
                                        </div>
                                </span>
                            </div>
                            </div>

                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${obj.status == '매칭완료'}">
<%--                                    <button href="#" class="btn-danger" data-toggle="modal" data-target="#myModal${obj.id}">${obj.status}</button>--%>
                                    <button href="#" class="btn-danger" data-toggle="modal" data-target="#myModal${obj.id}">결제대기</button>

                                </c:when>
                                <c:when test="${obj.status == '결제완료'}">
                                    <button href="#" class="btn-success" data-toggle="modal" data-target="#myReceipt${obj.id}">${obj.status}</button>
<%--                                    <button onclick="showPopup()" class="btn-success">${obj.status}</button>--%>
                                </c:when>
                                <c:when test="${obj.status == '매칭대기'}">
                                    <button href="#" class="btn-default">${obj.status}</button>
                                    <%--                                    <button onclick="showPopup()" class="btn-success">${obj.status}</button>--%>
                                </c:when>
                                <c:otherwise>
                                    ${obj.status}
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                    </tbody>
                </c:forEach>
            </table>
        </div>
    </div>

    <c:forEach var="obj" items="${mlist}">
        <!-- Modal Begins-->
        <div id="myModal${obj.id}" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">결제창</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <p> [확인요망] </p>
                        <p> ${obj.startDate}에 시작하여 ${obj.endDate}에 종료되는 </p>
                        <p> ${obj.id}번 매칭 건 ( 1일 기준 3만원 ) </p>
                        <p> 총액 =
                            <fmt:parseDate value="${obj.endDate}" pattern="yyyy-MM-dd" var="endDate"/>
                            <fmt:parseDate value="${obj.startDate}" pattern="yyyy-MM-dd" var="startDate"/>
                            <c:set var="daysDifference" value="${((endDate.time - startDate.time) / (1000 * 60 * 60 * 24))}" />
                            <c:set var="totalAmount" value="${daysDifference * 30000}" />
                            <fmt:formatNumber value="${totalAmount}" type="number" />

                        </p>
                        <p> 결제하시겠습니까 ?</p>
                    </div>
                    <form method="post" action="/kakaoPayImpl">
                    <div class="modal-footer">
                        <input type="number" value="${totalAmount}" name="price" id="matePay" style="display: none" />
                        <input type="number" value="${obj.id}" name="id" id="mateid" style="display: none" />
                        <button type="submit" class="btn btn-primary">결제</button>
                        <button type="button" class="btn btn-danger" onclick="closePopup()">거절</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                    </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Modal Ends-->


<%--        <!-- Modal Begins-->--%>
        <div id="myReceipt${obj.id}" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <!-- Modal content-->
                    <div class="container">
                        <div class="row gutters">
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                <div class="card">
                                    <div class="card-body p-0">
                                        <div class="invoice-container">
                                            <div class="invoice-header">
                                                <!-- Row start -->
                                                <div class="row gutters">
                                                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
                                                        <div class="custom-actions-btns mb-5">
                                                            <a href="#" class="btn btn-primary">
                                                                <i class="fa fa-envelope"></i> 메일 전송
                                                            </a>
                                                            <a href="#" class="btn btn-success" id="generatePdf${obj.id}" name="generatePdf">
                                                                <i class="fa fa-download"></i> PDF 다운
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- Row end -->
                                                <!-- Row start -->
                                                <div class="row gutters">
                                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6">
                                                        <a href="index.html" class="invoice-logo">
                                                            봄생봄사
                                                        </a>
                                                    </div>
                                                    <div class="col-lg-6 col-md-6 col-sm-6">
                                                        <address class="text-right">
                                                            대한미국 서울특별시  <br>
                                                            성동구 아차산로 111 <br>
                                                            +82 982-314-0958
                                                        </address>
                                                    </div>
                                                </div>
                                                <!-- Row end -->
                                                <!-- Row start -->
                                                <div class="row gutters">
                                                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                                        <div class="invoice-details">
                                                            <address>
                                                                결제자명 : 김제니
                                                                <br>
                                                                결제수단 : ${obj.payment}
                                                            </address>
                                                        </div>
                                                    </div>
                                                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                                        <div class="invoice-details">
                                                            <div class="invoice-num">
                                                                <div> 매칭번호 : ${obj.id}</div>
                                                                <div><fmt:formatDate value="${obj.payDate}" pattern="yyyy-MM-dd HH:mm:ss"/></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- Row end -->
                                            </div>
                                            <div class="invoice-body">
                                                <!-- Row start -->
                                                <div class="row gutters">
                                                    <div class="col-lg-12 col-md-12 col-sm-12">
                                                        <div class="table-responsive">
                                                            <table class="table custom-table m-0">
                                                                <thead>
                                                                <tr>
                                                                    <th>서비스명</th>
                                                                    <th>일별 가격</th>
                                                                    <th>일수</th>
                                                                    <th>총 결제금액</th>
                                                                </tr>
                                                                </thead>
                                                                <tbody>
                                                                <tr>
                                                                    <td>
                                                                            ${obj.service}
                                                                        <p class="m-0 text-muted" style="font-size: small">
                                                                                ${obj.startDate} ~ <br>
                                                                                ${obj.endDate}
                                                                        </p>
                                                                    </td>
                                                                    <td>30,000원</td>
                                                                    <td>9</td>
                                                                    <td><fmt:formatNumber value="${obj.price}" pattern="#,###,###원" /></td>
                                                                </tr>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- Row end -->
                                            </div>
                                            <div class="invoice-footer">
                                                봄생 봄사를 이용해주셔서 감사드립니다.
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                        <%--</c:forEach>--%>
                </div>
            </div>
        </div>
        <!-- Modal Ends-->
    </c:forEach>
</section>
<!-- Checkout Section End -->