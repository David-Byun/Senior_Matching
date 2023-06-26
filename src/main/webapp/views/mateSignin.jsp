<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
    let check_pwd = {
        init:function (){
            $('#signin_btn').addClass('disabled');

            $('#valid_password').on('input',function (){
                let password = $('#password').val();
                let valid_password = $('#valid_password').val();

                if( valid_password.length >= 5 ) {
                    if ( password !== valid_password ) {
                        $('#alert').show();
                    }else {
                        $('#alert').hide();
                    }
                }
            });
        }
    }
    $(function (){
        check_pwd.init();
    })
</script>

<script>
    let item_add = {
        maxSize: 5242880,  // 5M
        init:function(){
            $('#register_btn').click(function(){
                var formData = new FormData();

                var inputFile = $("input[name='img']");
                // console.log(inputFile);
                var files = inputFile[0].files;
                for(var i=0; i<files.length;i++){
                    // 함수 호출(checkExtension)
                    if(!item_add.checkExtension(files[i].name, files[i].size)){
                        return;
                    }
                }
                item_add.send();

            });
        },
        checkExtension:function(fileName, fileSize){
            var reg = new RegExp("(.*?)\.(exe|zip|alz)$"); // 이러한 확장자는 업로드 못시키게

            // 파일크기 제한
            // 실제파일의 크기 > 최대 크기
            if(fileSize >= this.maxSize){
                alert("파일 사이즈 초과");
                return false;
            }

            // 확장자 제한
            // 실제파일명의 확장자와 정규식 비교
            // 정규식이면
            if(reg.test(fileName)){
                alert("해당 종류의 파일은 업로드 할 수 없습니다.");
                return false;
            }
            return true;

        },
        send:function(){
            $('#register_form').attr({
                method:'post',
                action:'/mate/signinimpl',
                enctype: 'multipart/form-data'
            });
            $('#register_form').submit();
        }
    };

    $(function(){
        item_add.init();
    });
</script>

<style>
    .checkout__input p {
        margin-bottom: 10px;
        display: block;
    }
    .checkout__input label {
        display: block;
        margin-bottom: 5px;
    }
    .checkout__input .custom-file-label {
        background-color: #e9ecef;
        padding: 8px 12px;
        border-radius: 4px;
        cursor: pointer;
        display: inline-block;
    }
    .checkout__input .custom-file-label::after {
        content: "찾기";
        background-color: #6c757d;
        color: #ffffff;
        padding: 6px 12px;
        border-radius: 4px;
        cursor: pointer;
        display: inline-block;
    }
    .form-select {
        display: block;
        width: 100%;
        height: 38px;
        padding: 6px 12px;
        font-size: 14px;
        line-height: 1.42857143;
        color: #555555;
        background-color: #ffffff;
        background-image: none;
        border: 1px solid #cccccc;
        border-radius: 4px;
        box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
        transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s;
    }
</style>


<!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h4>메이트 가입</h4>
                        <div class="breadcrumb__links">
                            <a href="/">Home</a>
                            <span>메이트 가입</span>
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
                            <h6 class="checkout__title">메이트 가입</h6>
                            <form id="register_form" name="register_form" action="/mate/signinimpl" method="post">
                            <div class="row">
                                <div class="col-lg-10">
                                    <div class="checkout__input" >
                                        <p>아이디<span>*</span></p>
                                        <input type="text" id="email" name="email" placeholder="이메일을 입력하세요.">
                                    </div>
                                    <div class="checkout__input" >
                                        <p>이름<span>*</span></p>
                                        <input type="text" id="name" name="name" placeholder="이름을 입력하세요.">
                                    </div>
                                    <div class="checkout__input" >
                                        <p>비밀번호<span>*</span></p>
                                        <input type="password" id="password" name="password" placeholder="비밀번호를 입력하세요.(5글자 이상)">
                                    </div>
                                    <div class="checkout__input" >
                                        <p>비밀번호 확인<span>*</span></p>
                                        <input type="password" id="valid_password" placeholder="비밀번호를 다시 한번 입력하세요.">
                                    </div>
                                    <div class="checkout__input">
                                        <p>지역<span>*</span></p>
                                        <select class="form-select form-select-lg mb-3" aria-label=".form-select-lg example" name="area">
                                            <option selected>가능 지역을 선택해주세요</option>
                                            <option value="강남구">강남구</option>
                                            <option value="관악구">관악구</option>
                                            <option value="광진구">광진구</option>
                                        </select>
                                    </div>
                                    <div class="checkout__input">
                                        <p>경력<span>*</span></p>
                                        <select class="form-select form-select-lg mb-3" aria-label="Default select example" name="jobPeriod">
                                            <option selected>경력을 선택해주세요</option>
                                            <option value="0">0년</option>
                                            <option value="1">1년</option>
                                            <option value="2">2년</option>
                                            <option value="3">3년</option>
                                            <option value="4">4년</option>
                                            <option value="5">5년 이상</option>
                                        </select>
                                    </div>
                                    <div class="checkout__input" >
                                        <p>자격증<span>*</span></p>
                                        <select class="form-select mb-3" aria-label="Default select example" name="license">
                                            <option selected>보유 자격증을 선택해주세요</option>
                                            <option value="간호사">간호사</option>
                                            <option value="의사">의사</option>
                                            <option value="요양보호사">요양보호사</option>
                                            <option value="장애인활동지원사">장애인활동지원사</option>
                                            <option value="물리치료사">물리치료사</option>
                                            <option value="사회복지사">사회복지사</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-10 checkout__input">
                                    <p>이미지<span>*</span></p>
                                </div>
                                <div class="col-lg-10">
                                    <div class="checkout__input" >
                                        <input type="file" id="imgName" name="imgName" class="custom-file-input" placeholder="이미지를 첨부하세요.">
                                        <label for="imgName" class="custom-file-label">파일 선택</label>
                                    </div>
                                </div>
                                    <div class="checkout__input">
                                            <div class="alert alert-danger" id="alert" style="display: none">
                                                <strong>Wrong!</strong> 아이디 혹은 비밀번호를 다시 확인해주세요!
                                            </div>
                                    </div>
                            </div>
                                <div class="checkout__input__checkbox" style="margin-top: 20px">
                                    <button type="submit" class="btn btn-success" id="signin_btn" style="color: whitesmoke">가입하기</button>
                                </div>
                            </form>
                        </div>
                    </div>
            </div>
        </div>
    </section>
    <!-- Checkout Section End -->