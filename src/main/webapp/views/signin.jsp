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

<!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h4>Sign In</h4>
                        <div class="breadcrumb__links">
                            <a href="/">Home</a>
                            <span>Sign In</span>
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
                            <h6 class="checkout__title">Register Form</h6>
                            <form id="register_form" name="register_form" action="/signinimpl" method="post">
                            <div class="row">
                                <div class="col-lg-10">
                                    <div class="checkout__input" >
                                        <p>ID<span>*</span></p>
                                        <input type="text" id="memberId" name="memberId" placeholder="Enter Email Id">
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
                                    <div class="checkout__input">
                                            <div class="alert alert-danger" id="alert" style="display: none">
                                                <strong>Wrong!</strong> Please check your password again!
                                            </div>
                                    </div>
                                </div>
                            </div>
                                <div class="checkout__input__checkbox">
                                    <button type="submit" class="btn btn-primary" id="signin_btn">Sign In</button>
                                </div>
                            </form>
                        </div>
                    </div>
            </div>
        </div>
    </section>
    <!-- Checkout Section End -->