<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.kbstar.util.DateUtil" %>
<%@ page import="java.text.ParseException" %>

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
        width: 13%;
    }
    .table th:nth-child(4),
    .table td:nth-child(4) {
        width: 15%;
    }
    .table th:nth-child(5),
    .table td:nth-child(5) {
        width: 13%;
    }


</style>
<script>

     function acceptMatchOffer(id) {
        window.location.href = "/yestomatch/"+id;
    }

    $(function (){
        yes.init();
    })
    let yes = {
        init:function (){
            $('#yesBtn').click(function (){
                yes.send();
            });
        },
        send : function (){
            $('#answerForm').attr({
                'action':'/notification',
                'method':'post'
            });
            $('#answerForm').submit();
            alert("성공!");
        }
    }

</script>
<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-option">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb__text">
                    <h4>메이트 매칭 내역</h4><span>*메이트용</span>
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
            <div class="table-responsive">
                <table class="table table-hover table-striped">
                <thead>
                <tr>
                    <th scope="col">번호</th>
                    <th scope="col">일자</th>
                    <th scope="col">구분</th>
                    <th scope="col">지역</th>
                    <th scope="col">성별</th>
                    <th scope="col">연령</th>
                    <th scope="col">상태</th>
                </tr>
                </thead>
                <c:forEach var="obj" items="${mlist}">
                    <tbody>
                    <tr>
                        <th scope="row">${obj.id}</th>
                        <td>${obj.startDate} ~ ${obj.endDate}</td>
                        <td>${obj.service}</td>
                        <td>${obj.area}</td>
                        <td>${obj.objectGender}</td>
                        <td>${obj.objectBirth}</td>
                        <td>
                            <c:choose>
                                <c:when test="${obj.status == '매칭대기'}">
                                    <a href="#" data-toggle="modal" data-target="#myModal${obj.id}">${obj.status}</a>
                                </c:when>
                                <c:when test="${obj.status == '매칭완료'}">
                                    <a href="#" data-toggle="modal" data-target="#myMessageModal${obj.id}">${obj.status}</a>
                                </c:when>
                                <c:otherwise>
                                    ${obj.status}
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                    </tbody>
                    <!-- Modal Begins-->
                    <div id="myModal${obj.id}" class="modal fade" role="dialog">
                        <div class="modal-dialog">
                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4 class="modal-title">매칭 수락</h4>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                <div class="modal-body">
                                    <p> [확인요망] </p>
                                    <p> ${obj.startDate}에 시작하여 ${obj.endDate}에 종료되는 </p>
                                    <p> ${obj.id}번 매칭 건 </p>
                                    <p> 수락하시겠습니까 ?</p>
                                </div>
                                <div class="modal-footer">
                                    <button type="button"  onclick="acceptMatchOffer(${obj.id})" class="btn btn-primary">수락</button>
                                    <button type="button" class="btn btn-danger">거절</button>
                                    <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Modal Ends-->
                    <!-- Modal Begins-->
                    <div id="myMessageModal${obj.id}" class="modal fade" role="dialog">
                        <div class="modal-dialog">
                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4 class="modal-title">메세지 발송</h4>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                <div class="modal-body">
                                    <p> [확인요망] </p>
                                    <p> ${obj.id}번 매칭 건 </p>
                                    <p> 매칭완료 메세지를 발송하시겠습니까 ?</p>
                                </div>
                                <div class="modal-footer">
                                    <form id="answerForm">
                                        <input type="hidden" id="title" name="title" value="매칭완료되었습니다.">
                                        <input type="hidden" id="body" name="body" value="48시간 내에 결제를 부탁드립니다.">
                                        <button type="button" id="yesBtn" name="yesBtn" class="btn btn-primary">수락</button>
                                        <button type="button" class="btn btn-danger">거절</button>
                                        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                                    </form>

                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Modal Ends-->
                </c:forEach>
            </table>
            </div>
        </div>
    </div>
</section>
<!-- Checkout Section End -->

