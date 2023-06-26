<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Hero Section Begin -->

<link rel="stylesheet" href="/css/style.css" type="text/css">
<link rel="stylesheet" href="/css/indexstyle.css" type="text/css">
<script>
    function shuffleGrid() {
        const gridItems = Array.from(document.getElementsByClassName('animatedtrans');

        setTimeout(() => {
            gridItems.forEach(item => item.classList.remove('animatedtrans'));
            gridItems.sort(() => Math.random() - 0.5);
            gridItems.forEach(item => gridContainer.appendChild(item));
        }, 3000);
    }


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
        shuffleGrid();
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

        // 마커 이미지의 이미지 주소입니다
        var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

        for (var i = 0; i < positions.length; i ++) {

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
                title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
                image : markerImage // 마커 이미지
            });
            // 마커에 click 이벤트를 등록합니다
            kakao.maps.event.addListener(marker, 'click', function() {
                $.ajax({
                    type:"POST",
                    url:"/api/profile",
                    data:{id : marker.Gb},
                    cache:false,
                    success : function (res) {
                        console.log(res);
                        $('#mateperiod').text("경력 : " +res.jobPeriod + " 년");
                        $('#mateemail').text(res.email);
                        $('#matelicensce').text("자격증 : "+res.license);
                        $('#matename').text(res.name);
                        $('#matearea').text("가능지역 : "+res.area);
                        $('#mateimg').attr("src", "/uimg/"+res.img);
                        $("#modalCenter").modal('show');
                    }
                })
            });
        }

        speak("안녕하세요 봄생봄사에 오신 것을 환영합니다. 간병인 매칭 및 건강식품 관련 샵이 있으니 많은 이용 부탁드립니다. 간병인 매칭 서비스를 원하신다면 매칭 메뉴를 클릭해주세요.");
    })
</script>

<!-- Product Section Begin -->
<section class="product spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-8">
                <div class="trending__product">
                    <div class="row">
                        <div class="col-lg-8 col-md-8 col-sm-8">
                            <div class="section-title">
                                <h4 style="color: black">최근 등록 메이트</h4>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-4">
                            <div class="btn__all">
                                <a href="/mate/all" class="primary-btn">View All <span class="arrow_right"></span></a>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <c:forEach items="${allMates}" var="mate">
                            <a href="/mate/review/${mate.id}">
                                <div class="col-lg-4 col-md-6 col-sm-6 animatedtrans">
                                    <div class="product__item">
                                        <div class="product__item__pic set-bg" data-setbg="/uimg/${mate.img}" >
                                            <div class="ep">${mate.avgRate} / 5</div>
                                            <div class="comment"><i class="fa fa-comments"></i> 11</div>
                                            <div class="view"><i class="fa fa-eye"></i> 9141</div>
                                        </div>
                                        <div class="product__item__text">
                                            <ul>
                                                <li style="color:#26CB95; ">Movie</li>
                                            </ul>
                                            <h5 ><a href="#" style="color: black; text-align: right">${mate.name}</a></h5>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-8">
                <div class="product__sidebar">
                    <div class="product__sidebar__view">
                        <div class="section-title">
                            <h5 style="color: black">금주 이벤트 당첨자</h5>
                        </div>

                        <div class="filter__gallery">
                            <div class="product__sidebar__view__item set-bg mix day years"
                                 data-setbg="img/sidebar/tv-1.jpg">
                                <div class="ep">18 / ?</div>
                                <div class="view"><i class="fa fa-eye"></i> 9141</div>
                                <h5><a href="#">Boruto: Naruto next generations</a></h5>
                            </div>
                            <div class="product__sidebar__view__item set-bg mix month week"
                                 data-setbg="img/sidebar/tv-2.jpg">
                                <div class="ep">18 / ?</div>
                                <div class="view"><i class="fa fa-eye"></i> 9141</div>
                                <h5><a href="#">The Seven Deadly Sins: Wrath of the Gods</a></h5>
                            </div>
                            <div class="product__sidebar__view__item set-bg mix week years"
                                 data-setbg="img/sidebar/tv-3.jpg">
                                <div class="ep">18 / ?</div>
                                <div class="view"><i class="fa fa-eye"></i> 9141</div>
                                <h5><a href="#">Sword art online alicization war of underworld</a></h5>
                            </div>
                            <div class="product__sidebar__view__item set-bg mix years month"
                                 data-setbg="img/sidebar/tv-4.jpg">
                                <div class="ep">18 / ?</div>
                                <div class="view"><i class="fa fa-eye"></i> 9141</div>
                                <h5><a href="#">Fate/stay night: Heaven's Feel I. presage flower</a></h5>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Product Section End -->
<!-- Banner Section Begin -->
<section class="banner">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12">
                <div class="container" id="map03">
                    <div class="section-title">
                        <span>Search</span>
                        <h2>내 주변 메이트 찾기</h2>
                        <p>근처 메이트를 클릭해보세요!</p>
                    </div>
                    <div id="map"></div>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Banner Section End -->
<div class="m-4">
    <div id="modalCenter" class="modal fade" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="d-flex align-items-center mb-4 pt-2">
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
                    <button type="button" class="btn" onclick="location.href='/mate/all'" style="background-color: #64D6AB;color: whitesmoke">후기 보기</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Contact Section End -->

<!-- Product Section Begin -->
<section class="product">
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


