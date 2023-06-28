<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Hero Section Begin -->
<style>
    .spad{
        padding-bottom: 50px;
    }
    .hero__slider {
        width: 970px;
        height: 280px;
        display: flex;
        align-items: center;
        justify-content: flex-start;
        overflow: hidden;
    }

    .hero__items.custom-slide {
        width: 970px;
        height: 280px;
        display: flex;
        align-items: center;
        border-radius: 10px;
    }

    .all_region > button , .center_match_btn{
        width: 100px;
        background-color: #eaf9f9;
        border : none;
        margin: 2px 2px 2px 2px ;
        color: #03c7ae;
    }

    .center_match_btn{
        width: 170px;
        background-color: #eaf9f9;
        border : none;
        margin: 2px 2px 2px 2px ;
        color: #03c7ae;
    }

    .all_region_section:nth-child(1){
        border:none;
    }
    .all_region_section:nth-child(2){
        border:none;
    }

    .all_icon {
        display: flex;
        justify-content:space-between;
        flex-wrap: wrap;
    }
    .all_icon > div {
        display: flex;
        align-items: center;
        flex-direction: column;
    }
    .all_icon > div > img {
        width : 70px;
    }
    .all_icon > div > h5 {
        margin-top : 8px;
    }

    .arrow_right::before {

    }
</style>

<script>
    //********speak 정의 ( 음성안내 서비스 )********//
    function speak(text, opt_prop) {
        if (typeof SpeechSynthesisUtterance === "undefined" || typeof window.speechSynthesis === "undefined") {
            alert("이 브라우저는 음성 합성을 지원하지 않습니다.")
            return
        }
        window.speechSynthesis.cancel() // 현재 읽고있다면 초기화

        const prop = opt_prop || {}

        const speechMsg = new SpeechSynthesisUtterance()
        speechMsg.rate = prop.rate || 0.9 // 속도: 0.1 ~ 10
        speechMsg.pitch = prop.pitch || 1.0 // 음높이: 0 ~ 2
        speechMsg.lang = prop.lang || "ko-KR"
        speechMsg.text = text

        // SpeechSynthesisUtterance에 저장된 내용을 바탕으로 음성합성 실행
        window.speechSynthesis.speak(speechMsg)
    }
    //****************************************//


    $(function(){

        speak("안녕하세요 봄생봄사에 오신 것을 환영합니다. 간병인 매칭 및 건강식품 관련 샵이 있으니 많은 이용 부탁드립니다. 간병인 매칭 서비스를 원하신다면 매칭 메뉴를 클릭해주세요.");

        $('#closeBtn').click(function () {
            $("#modalCenter").modal('hide');
        })


        //**********************Map(지도)*********************
        var mapContainer = document.querySelector('#map03 > #map'), // 지도를 표시할 div
            mapOption = {
                center: new kakao.maps.LatLng(37.5456285, 127.0501575), // 지도의 중심좌표
                level: 4 // 지도의 확대 레벨
            };
        //map 생성
        map = new kakao.maps.Map(mapContainer, mapOption);

        var id = '';
        //*********************Controller(컨트롤러)*********************
        // 지도종류컨트롤 : 일반지도 or 스카이뷰지도
        var mapTypeControl = new kakao.maps.MapTypeControl();
        // 아래는 지도 + 컨트롤 --> 지도위에 컨트롤 표시
        // kakao.maps.ControlPosition은 컨트롤이 표시될 위치 = topright
        map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
        // 줌컨트롤 : 확대 or 축소
        var zoomControl = new kakao.maps.ZoomControl();
        map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

        //*********************Marker(마커)*********************
        //map marker
        // 마커를 표시할 위치와 title 객체 배열입니다
        var positions = [
            {
                title: 2001,
                latlng: new kakao.maps.LatLng(37.5456285, 127.0501575),
            },
            {
                title: 2002,
                latlng: new kakao.maps.LatLng(37.5435185, 127.0485565),
            },
            {
                title: 2003,
                latlng: new kakao.maps.LatLng(37.5455415, 127.0526375),

            },
            {
                title: 2004,
                latlng: new kakao.maps.LatLng(37.5456155, 127.0484245),
            },

            {
                title: 2011,
                latlng: new kakao.maps.LatLng(37.5446155, 127.0434245),
            }
        ];

        // 마커 이미지 ( 노란색 마커표시 )
        var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
        for (var i = 0; i < positions.length; i++) {
            // 마커 이미지의 이미지 크기 입니다
            var imageSize = new kakao.maps.Size(24, 35);
            // 마커 이미지를 생성합니다
            var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
            // 마커에 mouseover 이벤트를 등록합니다
            // 마커를 지도에 표시합니다.
            addMarker(positions[i], markerImage);
        }

        // 마커를 생성하고 지도 위에 표시하고, 마커에 mouseover, mouseout, click 이벤트를 등록하는 함수입니다
        function addMarker(position, markerImage) {

            // 마커를 생성하고 이미지는 기본 마커 이미지를 사용합니다
            // 마커를 생성합니다
            var marker = new kakao.maps.Marker({
                map: map, // 마커를 표시할 지도
                position: positions[i].latlng, // 마커를 표시할 위치
                title: positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
                image: markerImage // 마커 이미지
            });
            // 마커에 click 이벤트를 등록합니다
            kakao.maps.event.addListener(marker, 'click', function () {
                $.ajax({
                    type: "POST",
                    url: "/api/profile",
                    data: {id: marker.Gb},
                    cache: false,
                    success: function (res) {
                        console.log(res);
                        $('#mateperiod').text("경력 : " + res.jobPeriod + " 년");
                        $('#mateemail').text(res.email);
                        $('#matelicensce').text("자격증 : " + res.license);
                        $('#matename').text(res.name);
                        $('#matearea').text("가능지역 : " + res.area);
                        $('#mateimg').attr("src", "/uimg/" + res.img);
                        $("#modalCenter").modal('show');
                    }
                })
            });
        }
    })
</script>


<!-- Hero Section Begin -->
<section style="display:flex!important; align-items: center; justify-content: center;">
<section class="hero" style="align-items: center;">
    <div class="hero__slider owl-carousel">
        <div class="hero__items set-bg custom-slide" data-setbg="/img/senior/banner_01.jpg">
        </div>
        <div class="hero__items set-bg custom-slide" data-setbg="/img/senior/banner_02.jpg">
        </div>
    </div>
</section>
</section>
<!-- Hero Section End -->

<%--아이콘모음 Begins--%>
<section class="product spad">
    <div class="container">
        <section style="display:flex!important; align-items: center; justify-content: center;" class="all_region_section">
            <div class="col-sm-12">
                <div class="card col-sm-12" style="border: none;">
                    <div class="card-body all_icon col-sm-12">
                        <div>
                            <img src="/img/center/healthcare.png"/>
                            <h5> 요양 </h5>
                        </div>
                        <div>
                            <img src="/img/center/communities.png"/>
                            <h5> 매칭 </h5>
                        </div>
                        <div>
                            <img src="/img/center/friends.png"/>
                            <h5> 간병 </h5>
                        </div>
                        <div>
                            <img src="/img/center/medicine.png"/>
                            <h5> 의약 </h5>
                        </div>
                        <div>
                            <img src="/img/center/shopping-cart.png"/>
                            <h5> 상품 </h5>
                        </div>
                        <div>
                            <img src="/img/center/customer-care.png"/>
                            <h5> 문의 </h5>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</section>
<%--아이콘모음 Ends--%>

<%--홍보멘트라인 Begins--%>
<section class="product spad"
         style="
         background-color: #64d6ab;
         width: 100%;
         display: flex!important;
         justify-content: center!important;
         align-items: center!important;
">

    <div style="
                color: white;
                font-size: x-large;
                text-align: center;
    "> 마음 맞는 간병인을 찾기 어려우신가요?
        <span style="
                     font: 40px solid white ;
    ">봄생봄사</span>
        가 찾아드립니다. 재방문율 99% ! </div>


</section>
<%--홍보멘트라인 Ends--%>

<%--이달의메이트 Begins--%>
<section class="product spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <ul class="filter__controls">
                    <li class="active" data-filter="*">봄생봄사와 함께하는 이달의 메이트</li>
                </ul>
            </div>
        </div>
        <section style="display:flex!important; align-items: center; justify-content: center; ">
            <div class="row">
                <div class="col-sm-6">
                    <div class="card">
                        <div class="card-body">
                            <div style="display: flex; align-content: flex-end; justify-content: space-between;">
                                <img src="/img/center/first_award.jpg" style="width: 100px;">
                                <div style="display: flex;align-items: center; justify-content: center; flex-direction: column;">
                                    <div><h3> 이진만</h3></div>
                                </div>
                                <img src="/img/mate/a.jpg" style="border-radius: 50%; width:100px;">
                            </div>
                            <h5 class="card-title" style="margin-top: 20px;">경력5년, 관악구</h5>
                            <p class="card-text">"제 아버님을 너무 성심성의껏 간병해주셨어요!" - 박*선 님</p>
                            <button href="#" class="btn btn-success center_match_btn">
                                <span>
                                    매칭신청하러가기
                                    <i class="fa fa-arrow-circle-up"></i>
                                </span>
                            </button>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="card">
                        <div class="card-body">
                            <div style="display: flex; align-content: flex-end; justify-content: space-between;">
                                <img src="/img/center/second_award.jpg" style="width: 90px;">
                                <div style="display: flex;align-items: center; justify-content: center; flex-direction: column;">
                                    <div><h3> 김제니</h3></div>
                                </div>
                                <img src="/img/mate/b.jpg" style="border-radius: 50%; width:100px;">
                            </div>
                            <h5 class="card-title" style="margin-top: 20px;">경력3년, 광진구</h5>
                            <p class="card-text">"제 어머님을 너무 성심성의껏 간병해주셨어요!" - 신*림 님</p>
                            <a href="#" class="btn btn-success center_match_btn">
                                <span>
                                    매칭신청하러가기
                                    <i class="fa fa-arrow-circle-up"></i>
                                </span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</section>
<%--이달의메이트 Ends--%>


<%--지도 Begins--%>
<section class="product spad">
    <div class="container">
        <section style="display:flex!important; align-items: center; justify-content: center;" class="all_region_section">
                <div class="col-sm-3">
                    <div class="card" style="border: none;">
                        <div class="card-body">
                            <h3 class="card-title" style="margin-top: 20px;"> 전국의 메이트 </h3>
                            <h7 class="card-text">믿을 수 있는 메이트를 봄생봄사 단 한 곳에서 찾으세요</h7>
                        </div>
                    </div>
                </div>
                <div class="col-sm-9">
                    <div class="card" style="border: none;">
                        <div class="card-body all_region">
                            <button class="btn btn-info rounded-pill">서울</button>
                            <button class="btn btn-info rounded-pill">부산</button>
                            <button class="btn btn-info rounded-pill">강원</button>
                            <button class="btn btn-info rounded-pill">제주</button>
                            <button class="btn btn-info rounded-pill">인천</button>
                            <button class="btn btn-info rounded-pill">경기</button>
                            <button class="btn btn-info rounded-pill">충북</button>
                            <button class="btn btn-info rounded-pill">충남</button>
                            <button class="btn btn-info rounded-pill">경북</button>
                            <button class="btn btn-info rounded-pill">대전</button>
                            <button class="btn btn-info rounded-pill">대구</button>
                        </div>
                    </div>
                </div>
        </section>
            <div class="col-lg-12 col-md-12">
                <div class="container" id="map03">
                    <div id="map" style="border: none;"></div>
                </div>
            </div>
        </div>
</section>

<div class="m-4">
    <div id="modalCenter" class="modal fade" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="d-flex align-items-center mb-4 pt-2" style="justify-content: center;">
                        <img src="https://cdn.pixabay.com/photo/2018/01/21/14/16/woman-3096664_1280.jpg" alt="mateIamge" id="mateimg">
                    </div>
                    <h4 id="matename">이름 : 이현지</h4>
                    <p id="mateemail">이메일 : hyunji@nate.com</p>
                    <h5 id="matelicensce">자격증 : 요양관리사 보유</h5>
                    <div class="d-flex align-items-center mb-4 pt-2">
                        <h5 id="mateperiod">경력 : 5년</h5>

                    </div>
                    <div class="d-flex align-items-center mb-4 pt-2">
                        <h5 id="matearea">가능지역 : 영등포구</h5>
                    </div>
                    <div class="d-flex pt-2">
                        <strong class="text-dark mr-2">SNS :</strong>
                        <div class="d-inline-flex">
                            <a class="text-dark px-2" href="">
                                <i class="fab fa-facebook-f"></i>
                            </a>
                            <a class="text-dark px-2" href="">
                                <i class="fab fa-twitter"></i>
                            </a>
                            <a class="text-dark px-2" href="">
                                <i class="fab fa-linkedin-in"></i>
                            </a>
                            <a class="text-dark px-2" href="">
                                <i class="fab fa-pinterest"></i>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="closeBtn">닫기</button>
                    <button type="button" class="btn" onclick="location.href='/mate/samplemate'" style="background-color: #64D6AB;color: whitesmoke">후기 보기</button>
                </div>
            </div>
        </div>
    </div>
</div>
<%--지도 Ends--%>


<%--홍보멘트라인 Begins--%>
<section class="product spad"
         style="
         background-color: #64d6ab;
         width: 100%;
         display: flex!important;
         justify-content: center!important;
         align-items: center!important;
">

    <div style="
                color: white;
                font-size: x-large;
                text-align: center;
    "> 간병인은  <span style="
                     font: 40px solid white ;
    ">봄생봄사</span>의 소울 메이트입니다. 메이트 추천1위 플랫폼 !
    </div>


</section>
<%--홍보멘트라인 Ends--%>


<!-- Product Section Begin -->
<section class="product spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <ul class="filter__controls">
                    <li class="active" data-filter="*">베스트셀러</li>
                    <li data-filter=".new-arrivals">신상품</li>
                    <li data-filter=".hot-sales">할인중인 상품</li>
                </ul>
            </div>
        </div>
        <div class="row product__filter">
            <div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix new-arrivals">
                <div class="product__item sale">
                    <div class="product__item__pic set-bg" data-setbg="/img/product/m1.jpeg">
                        <span class="label">Sale</span>
                        <ul class="product__hover">
                            <li><a href="#"><img src="/img/icon/heart.png" alt=""></a></li>
                            <li><a href="#"><img src="/img/icon/compare.png" alt=""> <span>Compare</span></a></li>
                            <li><a href="#"><img src="/img/icon/search.png" alt=""></a></li>
                        </ul>
                    </div>
                    <div class="product__item__text">
                        <h6>베이직 뉴트리언트 투퍼데이</h6>
                        <a href="#" class="add-cart">+ Add To Cart</a>
                        <div class="rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-o"></i>
                            <i class="fa fa-star-o"></i>
                        </div>
                        <h5>40,000원</h5>
                        <div class="product__color__select">
                            <label for="pc-16">
                                <input type="radio" id="pc-16">
                            </label>
                            <label class="active black" for="pc-17">
                                <input type="radio" id="pc-17">
                            </label>
                            <label class="grey" for="pc-18">
                                <input type="radio" id="pc-18">
                            </label>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix hot-sales">
                <div class="product__item sale">
                    <div class="product__item__pic set-bg" data-setbg="/img/product/m2.png">
                        <span class="label">Sale</span>
                        <ul class="product__hover">
                            <li><a href="#"><img src="/img/icon/heart.png" alt=""></a></li>
                            <li><a href="#"><img src="/img/icon/compare.png" alt=""> <span>Compare</span></a></li>
                            <li><a href="#"><img src="/img/icon/search.png" alt=""></a></li>
                        </ul>
                    </div>
                    <div class="product__item__text">
                        <h6>히이즈 류신 타블렛</h6>
                        <a href="#" class="add-cart">+ Add To Cart</a>
                        <div class="rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-o"></i>
                        </div>
                        <h5>70,000원</h5>
                        <div class="product__color__select">
                            <label for="pc-16">
                                <input type="radio" id="pc-16">
                            </label>
                            <label class="active black" for="pc-17">
                                <input type="radio" id="pc-17">
                            </label>
                            <label class="grey" for="pc-18">
                                <input type="radio" id="pc-18">
                            </label>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix new-arrivals">
                <div class="product__item sale">
                    <div class="product__item__pic set-bg" data-setbg="/img/product/item2.jpeg">
                        <span class="label">Sale</span>
                        <ul class="product__hover">
                            <li><a href="#"><img src="/img/icon/heart.png" alt=""></a></li>
                            <li><a href="#"><img src="/img/icon/compare.png" alt=""> <span>Compare</span></a></li>
                            <li><a href="#"><img src="/img/icon/search.png" alt=""></a></li>
                        </ul>
                    </div>
                    <div class="product__item__text">
                        <h6>테라 바이오틱스</h6>
                        <a href="#" class="add-cart">+ Add To Cart</a>
                        <div class="rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-o"></i>
                            <i class="fa fa-star-o"></i>
                            <i class="fa fa-star-o"></i>
                        </div>
                        <h5>45,000원</h5>
                        <div class="product__color__select">
                            <label for="pc-16">
                                <input type="radio" id="pc-16">
                            </label>
                            <label class="active black" for="pc-17">
                                <input type="radio" id="pc-17">
                            </label>
                            <label class="grey" for="pc-18">
                                <input type="radio" id="pc-18">
                            </label>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix hot-sales">
                <div class="product__item sale">
                    <div class="product__item__pic set-bg" data-setbg="/img/product/item5.png">
                        <span class="label">Sale</span>
                        <ul class="product__hover">
                            <li><a href="#"><img src="/img/icon/heart.png" alt=""></a></li>
                            <li><a href="#"><img src="/img/icon/compare.png" alt=""> <span>Compare</span></a></li>
                            <li><a href="#"><img src="/img/icon/search.png" alt=""></a></li>
                        </ul>
                    </div>
                    <div class="product__item__text">
                        <h6>포스트바이오틱스 BNR17</h6>
                        <a href="#" class="add-cart">+ Add To Cart</a>
                        <div class="rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-o"></i>
                        </div>
                        <h5>93,000원</h5>
                        <div class="product__color__select">
                            <label for="pc-16">
                                <input type="radio" id="pc-16">
                            </label>
                            <label class="active black" for="pc-17">
                                <input type="radio" id="pc-17">
                            </label>
                            <label class="grey" for="pc-18">
                                <input type="radio" id="pc-18">
                            </label>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix new-arrivals">
                <div class="product__item sale">
                    <div class="product__item__pic set-bg" data-setbg="/img/product/m6.jpeg">
                        <span class="label">Sale</span>
                        <ul class="product__hover">
                            <li><a href="#"><img src="/img/icon/heart.png" alt=""></a></li>
                            <li><a href="#"><img src="/img/icon/compare.png" alt=""> <span>Compare</span></a></li>
                            <li><a href="#"><img src="/img/icon/search.png" alt=""></a></li>
                        </ul>
                    </div>
                    <div class="product__item__text">
                        <h6>프로메가 알티지</h6>
                        <a href="#" class="add-cart">+ Add To Cart</a>
                        <div class="rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-o"></i>
                        </div>
                        <h5>82,000원</h5>
                        <div class="product__color__select">
                            <label for="pc-16">
                                <input type="radio" id="pc-16">
                            </label>
                            <label class="active black" for="pc-17">
                                <input type="radio" id="pc-17">
                            </label>
                            <label class="grey" for="pc-18">
                                <input type="radio" id="pc-18">
                            </label>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix hot-sales">
                <div class="product__item sale">
                    <div class="product__item__pic set-bg" data-setbg="/img/product/m7.jpeg">
                        <span class="label">Sale</span>
                        <ul class="product__hover">
                            <li><a href="#"><img src="/img/icon/heart.png" alt=""></a></li>
                            <li><a href="#"><img src="/img/icon/compare.png" alt=""> <span>Compare</span></a></li>
                            <li><a href="#"><img src="/img/icon/search.png" alt=""></a></li>
                        </ul>
                    </div>
                    <div class="product__item__text">
                        <h6>울트라 오메가3 피쉬오일</h6>
                        <a href="#" class="add-cart">+ Add To Cart</a>
                        <div class="rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                        </div>
                        <h5>40,000원</h5>
                        <div class="product__color__select">
                            <label for="pc-16">
                                <input type="radio" id="pc-16">
                            </label>
                            <label class="active black" for="pc-17">
                                <input type="radio" id="pc-17">
                            </label>
                            <label class="grey" for="pc-18">
                                <input type="radio" id="pc-18">
                            </label>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix new-arrivals">
                <div class="product__item sale">
                    <div class="product__item__pic set-bg" data-setbg="/img/product/m3.jpeg">
                        <span class="label">Sale</span>
                        <ul class="product__hover">
                            <li><a href="#"><img src="/img/icon/heart.png" alt=""></a></li>
                            <li><a href="#"><img src="/img/icon/compare.png" alt=""> <span>Compare</span></a></li>
                            <li><a href="#"><img src="/img/icon/search.png" alt=""></a></li>
                        </ul>
                    </div>
                    <div class="product__item__text">
                        <h6>겔링핏</h6>
                        <a href="#" class="add-cart">+ Add To Cart</a>
                        <div class="rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-o"></i>
                        </div>
                        <h5>45,000원</h5>
                        <div class="product__color__select">
                            <label for="pc-16">
                                <input type="radio" id="pc-16">
                            </label>
                            <label class="active black" for="pc-17">
                                <input type="radio" id="pc-17">
                            </label>
                            <label class="grey" for="pc-18">
                                <input type="radio" id="pc-18">
                            </label>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix hot-sales">
                <div class="product__item sale">
                    <div class="product__item__pic set-bg" data-setbg="/img/product/m4.jpeg">
                        <span class="label">Sale</span>
                        <ul class="product__hover">
                            <li><a href="#"><img src="/img/icon/heart.png" alt=""></a></li>
                            <li><a href="#"><img src="/img/icon/compare.png" alt=""> <span>Compare</span></a></li>
                            <li><a href="#"><img src="/img/icon/search.png" alt=""></a></li>
                        </ul>
                    </div>
                    <div class="product__item__text">
                        <h6>베이직 투퍼데이</h6>
                        <a href="#" class="add-cart">+ Add To Cart</a>
                        <div class="rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-o"></i>
                        </div>
                        <h5>50,000원</h5>
                        <div class="product__color__select">
                            <label for="pc-16">
                                <input type="radio" id="pc-16">
                            </label>
                            <label class="active black" for="pc-17">
                                <input type="radio" id="pc-17">
                            </label>
                            <label class="grey" for="pc-18">
                                <input type="radio" id="pc-18">
                            </label>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</section>
<!-- Product Section End -->

<%--<!-- Categories Section Begin -->--%>
<%--<section class="categories spad">--%>
<%--    <div class="container">--%>
<%--        <div class="row">--%>
<%--            <div class="col-lg-3">--%>
<%--                <div class="categories__text">--%>
<%--                    <h2>바이오페린 <br /> <span>비맥스 메타</span> <br /> 비타민C</h2>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="col-lg-4">--%>
<%--                <div class="categories__hot__deal">--%>
<%--                    <img src="/img/product/m6.jpeg" alt="">--%>
<%--                    <div class="hot__deal__sticker">--%>
<%--                        <span>Sale Of</span>--%>
<%--                        <h5>30,000원</h5>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="col-lg-4 offset-lg-1">--%>
<%--                <div class="categories__deal__countdown">--%>
<%--                    <span>오늘의 핫딜</span>--%>
<%--                    <h2>락토핏 생유산균 골드</h2>--%>
<%--                    <div class="categories__deal__countdown__timer" id="countdown">--%>
<%--                        <div class="cd-item">--%>
<%--                            <span>3</span>--%>
<%--                            <p>Days</p>--%>
<%--                        </div>--%>
<%--                        <div class="cd-item">--%>
<%--                            <span>1</span>--%>
<%--                            <p>Hours</p>--%>
<%--                        </div>--%>
<%--                        <div class="cd-item">--%>
<%--                            <span>50</span>--%>
<%--                            <p>Minutes</p>--%>
<%--                        </div>--%>
<%--                        <div class="cd-item">--%>
<%--                            <span>18</span>--%>
<%--                            <p>Seconds</p>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <a href="/shop" class="primary-btn">바로 구매하세요!</a>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</section>--%>

