<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<script>

    let order_match = {
        init: function () {
            $('#match_list_btn').prop('disabled', true);
            $('#order_match_btn').click(function () {
                order_match.send();
            });
        },
        send: function () {

            let startDate = $('#startDate').val();
            let endDate = $('#endDate').val();
            let service = $('#service').val();
            let area = $('#area').val();
            let objectGender = $('#objectGender').val();
            let objectBirth = $('#objectBirth').val();

            let data = {
                startDate: startDate,
                endDate: endDate,
                service: service,
                area: area,
                objectGender: objectGender,
                objectBirth: objectBirth
            };

            $.ajax({
                type: "POST",
                url: "/ordermatchimpl",
                data: data,
                success: function (data) {
                    alert("데이터를 받았어요.");
                    console.log(data);
                    $('#match_list_btn').prop('disabled', false);
                },
                error: function (xhr, status, error) {
                    console.error(error);
                }
            });
        }
    }

    // let match_list = {
    //     init:function (){
    //         $('#match_list_btn').prop('disabled', true);
    //         $('#match_list_btn').click(function () {
    //             match_list.send();
    //         });
    //     },
    //     send: function () {
    //
    //         let startDate = $('#startDate').val();
    //         let endDate = $('#endDate').val();
    //
    //         let data = {
    //             startDate: startDate,
    //             endDate: endDate
    //         };
    //
    //         $.ajax({
    //             type: "post",
    //             url: "/matchlist",
    //             data: data,
    //             success: function(data) {
    //                 console.log("데이터가 도착했습니다.");
    //                 // $('#content').html(data);
    //             },
    //             error: function (xhr, status, error) {
    //                 console.error(error);
    //             }
    //         });
    //     }
    // }

    $(function(){
        // order_match.init();
        // match_list.init();
    });

</script>


<html id="html">
<!-- Speaker Section Begin -->
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
            <div class="row">
                <div class="col-lg-8 col-md-10">
                    <h6 class="coupon__code"><span class="icon_tag_alt"></span> Have no ID? <a href="#">Click
                        here</a> to join us</h6>
                    <h6 class="checkout__title">매칭 신청서</h6>
                    <form id="order_match_form" name="order_match_form" action="/ordermatchimpl" method="post">
<%--                        <input type="hidden" id="name" name="name" value="${loginmember}">--%>
                        <div class="row">
                            <div class="col-lg-10">
                                <div class="checkout__input" >
                                    <p>시작일자<span>*</span></p>
                                    <input type="date" id="startDate" name="startDate" placeholder="시작 일자를 선택하세요.">
                                </div>
                                <div class="checkout__input" >
                                    <p>종료일자<span>*</span></p>
                                    <input type="date" id="endDate" name="endDate" placeholder="종료 일자를 선택하세요.">
                                </div>
                                <div class="checkout__input" >
                                    <p>지역<span>*</span></p>
                                    <select name="area" id="area">
                                        <option value="">지역을 선택하세요.</option>
                                        <option value="강남구">강남구</option>
                                        <option value="관악구">관악구</option>
                                        <option value="광진구">광진구</option>
                                    </select>
                                </div>
                                <br>
                                <div class="checkout__input" >
                                    <br>
                                    <p>서비스<span>*</span></p>
                                    <select name="service" id="service">
                                        <option value="">서비스를 선택하세요.</option>
                                        <option value="요양">요양</option>
                                        <option value="간병">간병</option>
                                        <option value="장애">장애</option>
                                    </select>
                                </div>
                                <div class="checkout__input" >
                                    <br>
                                    <br>
                                    <p>어르신 성별<span>*</span></p>
                                    <select name="objectGender" id="objectGender">
                                        <option value="">성별을 선택하세요.</option>
                                        <option value="F">여성</option>
                                        <option value="M">남성</option>
                                    </select>
                                </div>
                                <div class="checkout__input" >
                                    <br>
                                    <br>
                                    <br>
                                    <p>어르신 생년월일<span>*</span></p>
                                    <input type="date" id="objectBirth" name="objectBirth" placeholder="생년월일을 입력하세요" value="1945-01-01">
                                </div>
                                <div class="checkout__input">
                                    <div class="alert alert-danger" id="alert" style="display: none">
                                        <strong>Wrong!</strong> Please check your password again!
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="checkout__input__checkbox">
                            <button type="submit" class="btn btn-primary" id="order_match_btn">매칭 신청</button>
<%--                            <button type="button" class="btn btn-primary" id="match_list_btn"><a href="/matchlist">매칭 확인</a></button>--%>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Checkout Section End -->



<%--매칭인 보여주기 리스트 Begin --%>
<%--<section class="checkout spad">--%>
<%--    <div class="container">--%>
<%--        <section class="speaker-section spad">--%>
<%--            <div class="container">--%>
<%--                <div class="row" id="content">--%>
<%--                    <div class="col-sm-6">--%>
<%--                        <c:forEach var="obj" items="${mlist}">--%>
<%--                            <div class="speaker-item">--%>
<%--                                <div class="row">--%>
<%--                                    <div class="col-lg-6">--%>
<%--                                        <div class="si-pic">--%>
<%--                                                &lt;%&ndash;                                    <img src="/img/${obj.img}" alt="">&ndash;%&gt;--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                    <div class="col-lg-6">--%>
<%--                                        <div class="si-text">--%>
<%--                                            <div class="si-title">--%>
<%--                                                <h4>NAME : ${obj.name}</h4>--%>
<%--                                                <h4>ID : ${obj.id}</h4>--%>
<%--                                            </div>--%>
<%--                                            <div class="si-social">--%>
<%--                                                <a href="#"><i class="fa-sharp fa-solid fa-comment"></i></a>--%>
<%--                                                <a href="#"><i class="fas fa-video"></i></a>--%>
<%--                                            </div>--%>
<%--                                            <div class="rating">--%>
<%--                                                <i class="fa fa-star-o"></i>--%>
<%--                                                <i class="fa fa-star-o"></i>--%>
<%--                                                <i class="fa fa-star-o"></i>--%>
<%--                                                <i class="fa fa-star-o"></i>--%>
<%--                                                <i class="fa fa-star-o"></i>--%>
<%--                                            </div>--%>
<%--                                            <p>Businesses often become known today through effective marketing. The marketing--%>
<%--                                                may be in the form of a regular news item or half column society news in the--%>
<%--                                                Sunday newspaper.</p>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </c:forEach>--%>

<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="load-more">--%>
<%--                    <a href="#" class="primary-btn">Load More</a>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </section>--%>
<%--        <!-- Helper Section End -->--%>
<%--    </div>--%>
<%--</section>--%>
<%--매칭인 보여주기 리스트 Ends --%>




</html>