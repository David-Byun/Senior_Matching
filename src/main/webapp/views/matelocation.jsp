<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=877b72a4084b62dd3183b611e21359eb"></script>

    <script>
        $(function(){

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

