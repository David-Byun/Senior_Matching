<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>

    // let login_form = {
    //     init:function (){
    //         $('#login_btn').click(function (){
    //             login_form.send();
    //         });
    //     },
    //     send:function (){
    //         $('#login_form').attr({
    //             'action':'/loginimpl', //form의 정보를 server의 application에 전달하세요
    //             'method':'get'
    //         });
    //         $('#login_form').submit();
    //     }
    // };
    //
    // $(function (){
    //     login_form.init(); // form정보를 서버에 전송
    // });

</script>

<!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h4>시니어 로그인</h4>
                        <div class="breadcrumb__links">
                            <a href="/">Home</a>
                            <span>시니어 로그인</span>
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
                            <h6 class="coupon__code"><span class="icon_tag_alt"></span> Have no ID? <a href="/signin">Click
                            here</a> to join us</h6>
                            <h6 class="checkout__title">시니어 로그인</h6>
                            <form id="login_form" name="login_form" action="/loginimpl" method="post">
                            <div class="row">
                                <div class="col-lg-10">
                                    <div class="checkout__input" >
                                        <p>아이디<span>*</span></p>
                                        <input type="text" id="memberId" name="email">
                                    </div>
                                    <div class="checkout__input" >
                                        <p>비밀번호<span>*</span></p>
                                        <input type="password" id="password" name="password">
                                    </div>
                                </div>
                            </div>
                                <div class="checkout__input__checkbox">
                                    <button type="submit" class="btn btn-primary" id="login_btn">로그인</button>
                                    <!-- 카카오 로그인 -->
                                    <a href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=83870487fd008580bcea50427296f384&redirect_uri=http://localhost:8083/member/kakao" role="button" class="btn btn-warning">
                                        카카오 로그인
                                    </a>
                                </div>

                            </form>
                        </div>
                    </div>
            </div>



        </div>
    </section>
    <!-- Checkout Section End -->