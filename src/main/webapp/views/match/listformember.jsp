<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script>
    function payMatchOffer(id) {
        window.location.href = "/payformatch/"+id;
    }
</script>
<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-option">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb__text">
                    <h4>매칭 내역</h4><span>*회원용</span>
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
                        <td>
                            <c:choose>
                                <c:when test="${obj.status == '매칭완료'}">
                                    <a href="#" data-toggle="modal" data-target="#myModal${obj.id}">${obj.status}</a>
                                </c:when>
                                <c:otherwise>
                                    ${obj.status}
                                </c:otherwise>
                            </c:choose>
                        </td>                        <td>${obj.price}</td>
                        <td>${obj.payment}</td>
                        <td>${obj.payDate}</td>
                    </tr>
                    </tbody>
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
                                <div class="modal-footer">
                                    <button type="button" onclick="payMatchOffer(${obj.id})" id="yes" name="yes" class="btn btn-primary">결제</button>
                                    <button type="button" class="btn btn-danger">거절</button>
                                    <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Modal Ends-->
                </c:forEach>
            </table>
        </div>
    </div>
</section>
<!-- Checkout Section End -->