<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;

                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
    let check_pwd = {
        init:function (){
            $('#valid_password').on('input',function (){
                let password = $('#password').val();
                let valid_password = $('#valid_password').val();
                if( valid_password.length >= 5 ) {
                    if ( password !== valid_password ) {
                        $('#alertpassword').show();
                        $('#valid_password').focus();
                    }else {
                        $('#alertpassword').hide();
                        $('#birth').focus();

                    }
                }

            });
        }
    }
    let sms_check = {
        init:function (){
            $('#phoneNumber').on('input',function (){
                let phoneNumber = $('#phoneNumber').val();
                if( phoneNumber.length >= 8 ) {
                    $('#signin_btn').attr('disabled', false);
                    $('#phoneChk').attr('disabled', false);
                }
            });
        }
    }
    $(function (){

        $('#signin_btn').attr('disabled', true);
        $('#phoneChk').attr('disabled', true);
        $('#phoneChk2').attr('disabled', true);
        check_pwd.init();
        sms_check.init();
        let code2 = "1";
        $('#phoneChk').click(function () {
            var phone = $('#phoneNumber').val();
            if (phone.length <= 8) {
                Swal.fire('휴대폰 번호를 다시 확인해주세요');
                return;
            }
            $.ajax({
                type: "POST", // post 형식으로 발송
                url: "/sendSMS", // controller 위치
                data: {phoneNumber: phone}, // 전송할 ㅔ이터값
                cache: false,
                success: function (data) {
                    if (data == "error") { //실패시
                        Swal.fire("휴대폰 번호를 확인 후 인증번호를 다시 발급해주세요")
                    } else {            //성공시
                        Swal.fire("인증번호 발송이 완료되었습니다. 휴대폰에서 인증번호를 확인해주세요.")
                        code2 = data;
                        $('#phoneChk2').attr('disabled', false);
                        // 해당 코드를 변수에 담아둠
                    }
                }

            });
        });

        //휴대폰 인증번호 대조
        $('#phoneChk2').click(function(){
            if($('#phone2').val() == code2){ // 위에서 저장한값을 비교함
                Swal.fire('인증성공')
            }else{
                Swal.fire('인증실패 : 휴대폰 인증을 다시 시도해주세요')
                $('#phone2').val('');
            }
        });
        $('#addressBtn').click(sample6_execDaumPostcode);
    })
</script>

<!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h4>시니어 가입</h4>
                        <div class="breadcrumb__links">
                            <a href="/">Home</a>
                            <span>시니어 가입</span>
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
                            <h6 class="checkout__title">시니어 가입</h6>
                            <form id="register_form" name="register_form" action="/signinimpl" method="post">
                            <div class="row">
                                <div class="col-lg-10">
                                    <div class="checkout__input" >
                                        <p>ID<span>*</span></p>
                                        <input type="text" id="email" name="email" placeholder="Enter Email Id">
                                    </div>
                                    <div class="checkout__input" >
                                        <p>Name<span>*</span></p>
                                        <input type="text" id="name" name="name" placeholder="Enter Name">
                                    </div>
                                    <div class="checkout__input" >
                                        <p>Password<span>*</span></p>
                                        <input type="password" id="password" name="password" placeholder="Enter password ( over 5 letters )">
                                    </div>
                                    <div class="checkout__input" >
                                        <p>Password Check<span>*</span></p>
                                        <input type="password" id="valid_password" placeholder="Enter password ( checking... )">
                                    </div>
                                    <div class="checkout__input" >
                                        <p>생년월일<span>*</span></p>
                                        <input type="text" id="birth" name="birth" placeholder="생년월일">
                                    </div>
                                    <div class="checkout__input" >
                                        <p>전화번호<span>*</span></p>
                                        <input type="text" id="phoneNumber" name="tel" placeholder="전화번호">
                                        <button type="button" class="btn btn-primary" id="phoneChk">인증 문자 요청</button>
                                    </div>
                                    <div class="checkout__input" >
                                        <p>인증번호<span>*</span></p>
                                        <input type="text" id="phone2" name="tel" placeholder="인증번호">
                                        <button type="button" class="btn btn-primary" id="phoneChk2">인증하기</button>
                                    </div>
                                    <div class="checkout__input" >
                                        <p>주소<span>*</span></p>
                                        <input type="text" id="sample6_postcode" placeholder="우편번호" name="postcode">
                                        <input type="button" value="우편번호 찾기" id="addressBtn" style="color: whitesmoke; background-color:#F27DBB "><br>
                                        <input type="text" id="sample6_address" placeholder="주소" name="address"><br>
                                        <input type="text" id="sample6_detailAddress" placeholder="상세주소" name="detailAddress">
                                        <input type="text" id="sample6_extraAddress" placeholder="참고항목" name="extraAddress">
                                    </div>
                                    <div class="checkout__input">
                                            <div class="alert alert-danger" id="alertpassword" style="display: none">
                                                <strong>Wrong!</strong> 비밀번호를 다시 확인해주세요!
                                            </div>
                                    </div>
                                    <div class="checkout__input">
                                        <div class="alert alert-danger" id="alertsms" style="display: none">
                                            <strong>Wrong!</strong> 인증번호를 다시 확인해주세요
                                        </div>
                                    </div>
                                </div>
                            </div>
                                <div class="checkout__input__checkbox">
                                    <button type="submit" class="btn btn-danger" id="signin_btn">가입</button>
                                    <a href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=83870487fd008580bcea50427296f384&redirect_uri=http://localhost:8083/member/kakao" role="button" class="btn btn-warning">
                                        카카오 회원가입
                                    </a>
                                </div>

                            </form>
                        </div>
                    </div>
            </div>
        </div>
    </section>
    <!-- Checkout Section End -->