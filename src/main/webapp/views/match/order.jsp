<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<style>
    .fc-day-sun a {
        color: red;
    }

    .fc-day-sat a {
        color: blue;
    }
    .btn-group .btn input[type="radio"] {
        position: absolute;
        clip: rect(0, 0, 0, 0);
        pointer-events: none;
    }
</style>

<script>

    var calFunc ={

        calcDate: function(arg,calendar){
            var rObj = new Object();
            var start  = null;
            var end    = null;
            var allDay = arg.allDay;
            var startDisp =null;
            var endDisp = null;
            var id = null;
            var xcontent = null;
            var title = null;
            //============================== date get / set ======================================

            if(arg.id!=""&& arg.id!=null && arg.id!=undefined) id=arg.id;
            if(arg.title!=""&& arg.title!=null && arg.title!=undefined) title=arg.title;
            if(arg.extendedProps!=undefined){
                if(arg._def.extendedProps.xcontent!=""&& arg._def.extendedProps.xcontent!=null && arg._def.extendedProps.xcontent!=undefined){
                    xcontent=arg._def.extendedProps.xcontent;
                }
            }

            if(allDay){//하루종일이면
                var start  = arg.start.toISOString().slice(0,10); //returnCdate(calendar,arg.start);
                var end=null;
                if(arg.end!=""&& arg.end!=null && arg.end!=undefined){
                    end    = arg.end.toISOString().slice(0,10);  //실제 데이터는 날짜를 하루 빼지 않는다
                }
                if(start==end) end=null;  //같은날이면 end날짜 없음

                startDisp = start;
                if(end!=null) endDisp = calFunc.dateRel(arg.end.toISOString().slice(0,10)); //알릴때만 날짜 하루 빼기
            }else{//시간이 같이 들어오면
                start = arg.start.toISOString();
                if(arg.end!=""&& arg.end!=null && arg.end!=undefined){
                    end   = arg.end.toISOString();
                }
                startDisp = calFunc.returnCdate(calendar,arg.start);
                if(end!=null) endDisp = calFunc.returnCdate(calendar,arg.end);
            }
            rObj.start=start;
            rObj.end=end;
            rObj.startDisp=startDisp;
            rObj.endDisp=endDisp;
            rObj.id=id;
            rObj.xcontent=xcontent;
            rObj.title=title;
            //============================== date get / set ======================================
            return rObj;
        },
        dateRel:function(date){
            var selectDate = date.split("-");
            var changeDate = new Date();
            changeDate.setFullYear(selectDate[0], selectDate[1]-1, selectDate[2]-1);

            var y = changeDate.getFullYear();
            var m = changeDate.getMonth() + 1;
            var d = changeDate.getDate();

            if(m < 10) {
                m = "0" + m;
            }

            if(d < 10) {
                d = "0" + d;
            }
            var resultDate = y + "-" + m + "-" + d;
            return resultDate;
        },
        returnCdate:function(cal,time){
            return cal.formatDate(time,{month: 'long',year: 'numeric',day: 'numeric', hour:'numeric',minute:'numeric', timeZone: 'Asia/Seoul',locale: 'ko'});
        }



    };

    $(function(){
        $('#next_btn').hide();
        var calendar = new FullCalendar.Calendar($('#calendar')[0], {

            locale:'ko',
            timeZone: 'Asia/Seoul',
            height: '400px', // calendar 높이 설정
            //expandColumns: true,
            expandRows: true, // 화면에 맞게 높이 재설정
            // 해더에 표시할 툴바
            headerToolbar: {
                left: 'prev,next',
                center: 'title',
                right: 'today'
            },
            businessHours: true,
            // initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
            //initialDate: '2022-11-01', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
            //navLinks: true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
            editable: true, // 수정 가능
            selectable: true, // 달력 일자 드래그 설정가능
            nowIndicator: true, // 현재 시간 마크
            // dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)

            select: function(arg) {
                var xObj = calFunc.calcDate(arg,calendar);
                const date = new Date();
                const year = date.getFullYear();
                const month = ('0' + (date.getMonth() + 1)).slice(-2);
                const day = ('0' + date.getDate()).slice(-2);
                const dateStr = year + '-' + month + '-' + day;

                if(new Date(xObj.startDisp) < new Date(dateStr)){
                    alert('Fail');
                    return;
                }

                $('#sdate').text(xObj.startDisp);
                $('#edate').text(xObj.endDisp);


                $('#startDate').val(xObj.startDisp);
                $('#endDate').val(xObj.endDisp);



            },
            events: '/getcal2'
        });

        calendar.render();

        $('#next_btn').click(function(){
            var c  = confirm('에약하시겠습니까');
            if(c == true){
                var sday = $('#sdate').text();
                var eday = $('#edate').text();
                location.href='/reservation?id=${logincust.id}&sday='+sday+'&eday='+eday;
            }
        });
    });





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



    $(function(){

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
                    <h4>매칭 신청</h4>
                    <div class="breadcrumb__links">
                        <a href="/">홈</a>
                        <a href="#">매칭</a>
                        <span>매칭 신청</span>
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
                    <h4 class="checkout__title">매칭 신청서</h4>
                    <form id="order_match_form" name="order_match_form" action="/orderimpl" method="post">
<%--                        <input type="hidden" id="name" name="name" value="${loginmember}">--%>
                        <input type="hidden" id="startDate" name="startDate" value="" />
                        <input type="hidden" id="endDate" name="endDate" value="" />
                        <div class="row">
                            <div class="col-lg-12">
<%--                                <div class="col-sm-8  text-left ">--%>
                                <div class="checkout__input" >
                                <p>시작일자<span>*</span> : <span id="sdate"></span></p>
                                <p>종료일자<span>*</span> : <span id="edate"></span></p>
                                <%--    <button id="next_btn"><a href="#" class="btn btn-sm btn-primary ml-lg-4">선택</a></button>--%>
                                <div class="ext-left ">
                                    <div class="container">
                                        <div class="row content">
                                            <div class="col-sm-12  text-left ">
                                                <div id='calendar-container'>
                                                    <div class="well"> <div id='calendar'></div></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                                <div class="checkout__input" >
                                    <p>지역<span>*</span></p>
                                    <div class="btn-group btn-group-justified" data-toggle="buttons">
                                        <label class="btn btn-success">
                                            <input type="radio" name="area" value="강남구"> 강남구
                                        </label>
                                        <label class="btn btn-success">
                                            <input type="radio" name="area" value="관악구"> 관악구
                                        </label>
                                        <label class="btn btn-success">
                                            <input type="radio" name="area" value="광진구"> 광진구
                                        </label>
                                    </div>
                                </div>
                                <div class="checkout__input" >
                                    <p>서비스<span>*</span></p>
                                    <div class="btn-group btn-group-justified" data-toggle="buttons">
                                        <label class="btn btn-success">
                                            <input type="radio" name="service" value="요양"> 요양
                                        </label>
                                        <label class="btn btn-success">
                                            <input type="radio" name="service" value="간병"> 간병
                                        </label>
                                        <label class="btn btn-success">
                                            <input type="radio" name="service" value="장애"> 장애
                                        </label>
                                    </div>
                                </div>
                                <div class="checkout__input" >
                                    <p>어르신 성별<span>*</span></p>
                                    <div class="btn-group btn-group-justified" data-toggle="buttons">
                                        <label class="btn btn-success">
                                            <input type="radio" name="objectGender" value="F"> 여성
                                        </label>
                                        <label class="btn btn-success">
                                            <input type="radio" name="objectGender" value="M"> 남성
                                        </label>
                                    </div>
                                </div>
                                <div class="checkout__input" >
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

</html>