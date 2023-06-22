<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="/css/bootstrap-icons.css" rel="stylesheet">
<link href="/css/templatemo-festava-live.css" rel="stylesheet">
<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/jquery.sticky.js"></script>
<script src="/js/click-scroll.js"></script>
<script src="/js/custom.js"></script>
<script>
    $(function () {
        // 비디오 요소 및 버튼 가져오기
        var video = document.getElementById("videoElement");
        var captureButton = document.getElementById("captureButton");

        // 비디오 스트림 시작
        navigator.mediaDevices.getUserMedia({ video: true })
            .then(function(stream) {
                video.srcObject = stream;
            })
            .catch(function(error) {
                console.log("카메라 접근에 실패했습니다: ", error);
            });

        // 사진 찍기 및 다운로드 함수
        function capturePhotoAndDownload() {
            // 캔버스 요소 생성 및 크기 설정
            var canvas = document.createElement("canvas");
            canvas.width = video.videoWidth;
            canvas.height = video.videoHeight;

            // 캔버스에 비디오 프레임 그리기
            var context = canvas.getContext("2d");
            context.drawImage(video, 0, 0, canvas.width, canvas.height);

            // 이미지 데이터 URL 생성
            var photoDataUrl = canvas.toDataURL("image/png");

            // 다운로드 링크 생성하여 클릭
            var downloadLink = document.createElement("a");
            downloadLink.download = "photo.png";
            downloadLink.href = photoDataUrl;
            downloadLink.click();

            $.ajax({
                    url:'/api/test',
                    method : 'post',
                    data : {
                        img: "photo.png",
                    },
                    success : function (data) {
                        console.log(data)
                        const jsonObject = JSON.parse(data);
                        const gender = jsonObject.faces[0].gender.value;
                        const age = jsonObject.faces[0].age.value;
                        const emotion = jsonObject.faces[0].emotion.value;
                        const accuracy = (jsonObject.faces[0].emotion.confidence+ jsonObject.faces[0].age.confidence + jsonObject.faces[0].gender.confidence) / 3 * 100
                        $('#videoTitle').text("분석 결과");
                        $('#videoHeader').text('성별 : ' + gender);
                        $('#videoAge').text('나이 : ' + age);
                        $('#aiAccuracy').text(accuracy.toFixed(1) + '%');
                        $('#videoEmotion').text('현재 감정 상태 : ' + emotion);
                        $('#section_2').css('display', 'block');
                        $('#section_3').css('display', 'block');
                        $('html, body').animate({
                            scrollTop: $('#section_2').offset().top
                        }, 500);
                    }
                }
            )
        }
        captureButton.addEventListener("click", capturePhotoAndDownload);
    })
    // 사진 찍기 및 다운로드 버튼 클릭 시 함수 호출
</script>
<main>
    <section class="hero-section" id="section_1">
        <div class="section-overlay"></div>

        <div class="container d-flex justify-content-center align-items-center">
            <div class="row">

                <div class="col-12 mt-auto mb-5 text-center">
                    <small>AI 얼굴 인식</small>

                    <h1 class="text-white mb-5">나의 건강 나이 알아보기!</h1>

                    <a class="btn custom-btn smoothscroll" href="#section_2" id="captureButton">Let's begin</a>
                </div>

                <div class="col-lg-12 col-12 mt-auto d-flex flex-column flex-lg-row text-center">
                    <div class="date-wrap">
                        <h5 class="text-white">
                            😀 얼굴 인식 정확률은 약 90~95% 이므로 참고 부탁드립니다.
                        </h5>
                    </div>

                </div>
            </div>
        </div>

        <div class="video-wrap">
            <video id="videoElement" class="custom-video" poster="" autoplay>

            </video>
        </div>
    </section>
    <section class="about-section section-padding" id="section_2" style="display: none; background-color: #FDFDFD">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-12">
                    <div class="pricing-thumb">
                        <div class="d-flex">
                            <div>
                                <h2 class="text-black mb-4" id="videoTitle"></h2>
                                <h6 class="text-black-50 mb-2" id="videoHeader"></h6>
                                <h6 class="text-black-50 mb-2" id="videoAge"></h6>
                                <h6 class="text-black-50 mb-2" id="videoEmotion"></h6>
                            </div>

                            <p class="pricing-tag ms-auto">정확도 <span id="aiAccuracy"></span></p>
                        </div>

                        <a class="link-fx-1 color-contrast-higher mt-4" href="/match">
                            <span>매칭하기</span>
                            <svg class="icon" viewBox="0 0 32 32" aria-hidden="true">
                                <g fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round">
                                    <circle cx="16" cy="16" r="15.5"></circle>
                                    <line x1="10" y1="18" x2="16" y2="12"></line>
                                    <line x1="16" y1="12" x2="22" y2="18"></line>
                                </g>
                            </svg>
                        </a>
                    </div>
                </div>
                <div class="col-lg-6 col-12">
                    <div class="pricing-thumb">
                        <div class="d-flex">
                            <div>
                                <h6 class="text-black mb-4">아래 추천 상품으로 건강을 찾아보세요!</h6>
                                <p>오늘 하루만 할인 쿠폰을 드려요!</p>
                            </div>

                            <p class="pricing-tag ms-auto">할인쿠폰 <span>50%</span></p>
                        </div>

                        <a class="link-fx-1 color-contrast-higher mt-4" href="/shop">
                            <span>쇼핑하기</span>
                            <svg class="icon" viewBox="0 0 32 32" aria-hidden="true">
                                <g fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round">
                                    <circle cx="16" cy="16" r="15.5"></circle>
                                    <line x1="10" y1="18" x2="16" y2="12"></line>
                                    <line x1="16" y1="12" x2="22" y2="18"></line>
                                </g>
                            </svg>
                        </a>
                    </div>
                </div>
                <div class="ms-4">
                    <h3></h3>
                    <p class="mb-0"></p>
                </div>
            </div>
        </div>
    </section>

    <section class="schedule-section section-padding" id="section_3" style="display: none; background-color: #FDFDFD">
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
                                <h6>70,000원</h6>
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
                                <h6>45,000원</h6>
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
                                <h6>93,000원</h6>
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
                                <h6>82,000원</h6>
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
                                <h6>40,000원</h6>
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
                                <h6>45,000원</h6>
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
                                <h6>50,000원</h6>
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
    </section>




</main>




