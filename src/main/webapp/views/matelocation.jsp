
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=877b72a4084b62dd3183b611e21359eb"></script>

    <script>
        $(function(){
            //**********************Map(지도)*********************
            var mapContainer = document.querySelector('#map03 > #map'), // 지도를 표시할 div
                mapOption = {
                    center: new kakao.maps.LatLng(37.5456385, 127.0534575), // 지도의 중심좌표
                    level: 5 // 지도의 확대 레벨
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
                    title: '이혜린 메이트',
                    latlng: new kakao.maps.LatLng(37.5456285, 127.0501575),
                    id : 2001
                },
                {
                    title: '양호우 메이트',
                    latlng: new kakao.maps.LatLng(37.5455185, 127.0485565),
                    id : 2002
                },
                {
                    title: '김철민 메이트',
                    latlng: new kakao.maps.LatLng(37.5455415, 127.0526375),
                    id : 2003
                },
                {
                    title: '고이빈 메이트',
                    latlng: new kakao.maps.LatLng(37.5456155, 127.0484245),
                    id : 2004
                }
            ];

            // 마커 이미지의 이미지 주소입니다
            var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

            for (var i = 0; i < positions.length; i ++) {

                // 마커 이미지의 이미지 크기 입니다
                var imageSize = new kakao.maps.Size(24, 35);

                // 마커 이미지를 생성합니다
                var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

                // 마커를 생성합니다
                var marker = new kakao.maps.Marker({
                    map: map, // 마커를 표시할 지도
                    position: positions[i].latlng, // 마커를 표시할 위치
                    title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
                    id : positions[i].id,
                    image : markerImage // 마커 이미지
                });

            }
        });
    </script>
    <!-- Contact Section Begin -->
    <section class="contact spad">
        <div class="container">

            <div class="row">
                <div class="col-lg-12 col-md-12">
                    <div class="container" id="map03">
                        <div class="section-title">
                            <span>Search</span>
                            <h2>내 주변 메이트 찾기</h2>
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

            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="contact__text">
                        <div class="section-title">
                            <span>Information</span>
                            <h2>연락처</h2>
                            <p>당신의 편안한 인생을 위해 24시간 언제든지 연락주세요.</p>
                        </div>
                        <ul>
                            <li>
                                <h4>대한민국</h4>
                                <p>서울 성동구 아차산로 111 <br/>+82 982-314-0958</p>
                            </li>

                        </ul>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="contact__form">
                        <form action="/sendEmail" method="post">
                            <div class="row">
                                <div class="col-lg-6">
                                    <input type="text" placeholder="제목 또는 닉네임" name="name" style="color: black">
                                </div>
                                <div class="col-lg-6">
                                    <input type="text" placeholder="이메일" value="고객센터" disabled style="color: black">
                                </div>
                                <div class="col-lg-12">
                                    <textarea placeholder="Message" name="msg" style="color: black"></textarea>
                                    <button type="submit" class="site-btn">메시지 보내기</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Contact Section End -->

