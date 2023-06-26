<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Hero Section Begin -->
<style>
    .hero__slider {
        width: 1200px;
        height: 300px;
        display: flex;
        align-items: center;
        justify-content: flex-start;
        overflow: hidden;
    }

    .hero__items.custom-slide {
        width: 1200px;
        height: 300px;
        display: flex;
        align-items: center;
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
</style>
<script>
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

    $(function(){
        speak("안녕하세요 봄생봄사에 오신 것을 환영합니다. 간병인 매칭 및 건강식품 관련 샵이 있으니 많은 이용 부탁드립니다. 간병인 매칭 서비스를 원하신다면 매칭 메뉴를 클릭해주세요.");
    })
</script>
<script>
    let map03 = {
        map:null,
        init: function () {
            //다양한 초기화를 해주는 init
            //여기서는 버튼에 대한 초기 값을 설정해주는 역할
            //map이라는 변수가 선언된 이유는 전역적으로 사용하기 위함이므로 밖에서 선언

            this.display();
            // $('#s_btn').click(function () {
            //     map03.go(37.5857825,126.9828019,'s' );
            // });
            // $('#b_btn').click(function () {
            //     map03.go(35.1883491,129.2233197,'b');
            // });
            // $('#j_btn').click(function () {
            //     map03.go(33.2501708,126.5636786,'j');
            // });

        },
        display: function () {
            //**********************Map(지도)*********************
            var mapContainer = document.querySelector('#map03 > #map'); //지도를 표시할 div
            var mapOption = {
                center: new kakao.maps.LatLng(37.5456385, 127.0534575), // 지도의 중심좌표
                level: 5 // 지도의 확대 레벨
            };
            //map 생성
            map = new kakao.maps.Map(mapContainer, mapOption);

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
            var markerPosition  = new kakao.maps.LatLng(37.5456385, 127.0534575);
            var marker = new kakao.maps.Marker({
                position: markerPosition
            });
            marker.setMap(map);

        },
        go: function (lat,lng,loc) {
            // 지역을 클릭 시
            // 그 지역의 맛집만 나온다?

            var mapContainer = document.querySelector('#map03 > #map');
            var mapOption = {
                center: new kakao.maps.LatLng(lat,lng), // 지도의 중심좌표
                level: 5 // 지도의 확대 레벨
            };
            // map변수 최초 생성
            map = new kakao.maps.Map(mapContainer, mapOption);

            // map controller ( 지도 확대, 축소 )
            var mapTypeControl = new kakao.maps.MapTypeControl();
            map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
            var zoomControl = new kakao.maps.ZoomControl();
            map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

            //panTo라는 함수를 활용해서 지도가 이동
            // var moveLatLon = new kakao.maps.LatLng(lat, lng);
            // map.panTo(moveLatLon);

            //marker 표시하는 함수
            var markerPosition  = new kakao.maps.LatLng(lat, lng);
            var marker = new kakao.maps.Marker({
                position: markerPosition
            });
            marker.setMap(map);
            //지도에 loc를 넣고 s,b,j 별 데이터 줘 !
            map03.markers(loc); // loc 정보로 -> marker를 받고자 요청
        },

        markers:function (loc){
            // $.ajax({
            //     url:'/markers',
            //     data:{'loc': loc}, // 서버에 s,b,j를 날리는 중
            //     success: function (data) {
            //         map03.displaymarkers(data);
            //     },
            // });
        },
        displaymarkers:function (positions) {
            // 그 데이터를 지도에 뿌려라! 함수
            // var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
            // for (var i = 0; i < positions.length; i++) {
            //     var imageSize = new kakao.maps.Size(20, 30);
            //     var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
            //     var markerPosition = new kakao.maps.LatLng( positions[i].lat, positions[i].lng);
            //
            //     var marker = new kakao.maps.Marker({
            //         map: map,
            //         position : markerPosition,
            //         title : positions[i].title,
            //         image : markerImage
            //     });
            //     // infoWindow
            //     var iwContent = '<h2>'+positions[i].title+'</h2>';
            //     iwContent += '<img src="/img/'+positions[i].img+'" style="width:50px">';
            //
            //     var infowindow = new kakao.maps.InfoWindow({
            //         // position : positions[i].latlng,
            //         position : markerPosition,
            //         content : iwContent
            //     });
            //
            //     kakao.maps.event.addListener(marker, 'mouseover', mouseoverListener(marker, infowindow));
            //     kakao.maps.event.addListener(marker, 'mouseout', mouseoutListener(marker, infowindow));
            //     kakao.maps.event.addListener(marker, 'click', mouseclickListener(positions[i].id));
            //
            //
            //     function mouseoverListener(marker, infowindow) {
            //         return function(){
            //             infowindow.open(map, marker);
            //         };
            //     }
            //     function mouseoutListener(marker, infowindow) {
            //         return function(){
            //             infowindow.close();
            //         };
            //     }
            //     function mouseclickListener(target) {
            //         return function(){
            //             location.href = '/map/detail?id='+target;
            //         };
            //     }
            // } // end for
        }
    };
    $(function(){
        map03.init();
    });
</script>

<!-- Hero Section Begin -->
<section style="display:flex!important; align-items: center; justify-content: center;">
<section class="hero" style="align-items: center;">
    <div class="hero__slider owl-carousel">
        <div class="hero__items set-bg custom-slide" data-setbg="/img/senior/a.jpg">
        </div>
        <div class="hero__items set-bg custom-slide" data-setbg="/img/senior/b.jpg">
        </div>
    </div>
</section>
</section>
<!-- Hero Section End -->

<%--이달의메이트 Begins--%>
<section class="product spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <ul class="filter__controls">
                    <li class="active" data-filter="*">이달의 메이트</li>
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
                                    <div><h3> 김제니</h3></div>
                                </div>
                                <img src="/img/mate/a.jpg" style="border-radius: 20px; width:80px;">
                            </div>
                            <h5 class="card-title" style="margin-top: 20px;">경력6년, 강남구</h5>
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
                                    <div><h3> 김우기</h3></div>
                                </div>
                                <img src="/img/mate/b.jpg" style="border-radius: 20px; width:80px;">
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
                    <div id="map"></div>
                </div>
            </div>
        </div>
    </div>
</section>
<%--지도 Ends--%>

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

<!-- Categories Section Begin -->
<section class="categories spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="categories__text">
                    <h2>바이오페린 <br /> <span>비맥스 메타</span> <br /> 비타민C</h2>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="categories__hot__deal">
                    <img src="/img/product/m6.jpeg" alt="">
                    <div class="hot__deal__sticker">
                        <span>Sale Of</span>
                        <h5>30,000원</h5>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 offset-lg-1">
                <div class="categories__deal__countdown">
                    <span>오늘의 핫딜</span>
                    <h2>락토핏 생유산균 골드</h2>
                    <div class="categories__deal__countdown__timer" id="countdown">
                        <div class="cd-item">
                            <span>3</span>
                            <p>Days</p>
                        </div>
                        <div class="cd-item">
                            <span>1</span>
                            <p>Hours</p>
                        </div>
                        <div class="cd-item">
                            <span>50</span>
                            <p>Minutes</p>
                        </div>
                        <div class="cd-item">
                            <span>18</span>
                            <p>Seconds</p>
                        </div>
                    </div>
                    <a href="/shop" class="primary-btn">바로 구매하세요!</a>
                </div>
            </div>
        </div>
    </div>
</section>

