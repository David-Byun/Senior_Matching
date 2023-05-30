 <%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
    <!--  senior pub  start -->
    <link rel="stylesheet" href="/senior/css/jquery-ui.css"/>
    <link rel="stylesheet" type="text/css" href="/senior/css/common.p.css">
    <link rel="stylesheet" href="/senior/css/slick.css">
    <link rel="shortcut icon" href="/senior/img/favicon/favicon_16-16.ico">
    <link rel="icon" sizes="32x32" href="/senior/img/favicon/favicon_32-32.ico">
    <script type="text/javascript" src="/senior/js/libs/jquery-1.12.4.min.js?20190610"></script>
    <script type="text/javascript" src="/senior/js/libs/jquery-ui.js"></script>
    <script type="text/javascript" src="/senior/js/libs/slick.min.js"></script>
    <script type="text/javascript" src="/senior/js/ui.global.js"></script>
    <script type="text/javascript" src="/senior/js/ui.common.js"></script>
    <!--  senior pub  end -->

    <script src="/com/js/clipboard.min.js?20190610"></script>
    <script src="/senior/js/kakao/kakao.min.js"></script>
    <script src="/com/js/jquery.easy-ticker.min.js"></script>

    <!--  기존것  -->
    <script src="/senior/js/libs/lodash-3.10.1.min.js?20190610"></script>
    <script src="/senior/js/libs/upleat-core-1.0.3.min.js?20190610"></script>
    <script src="/senior/js/libs/donutty-jquery.min.js?20190610"></script>
    <script src="/senior/js/libs/swiper.min.js?20190610"></script>
    <script src="/senior/js/modules/Accordion.js?20190610"></script>
    <script src="/senior/js/modules/TabMenu.js?20190610"></script>
    <script src="/senior/js/common.js?20190610"></script>

    <script src="/com/js/jquery.tmpl.min.js?20190610"></script>
    <script src="/com/js/base64Utils.js?20190610"></script>
    <script src="/com/js/jquery.form.js?20190610"></script>
    <script src="/com/js/interfaceConnect.js?20190610"></script>
    <script src="/com/js/schemeApp.js?20190610"></script>
    <script src="/com/js/common.js?20201009"></script>
    <script src="/com/js/statck-history-back.js?20190610"></script>

    <script src="/com/js/commonFund.js"></script>

    <script src="/com/js/jquery.easy-ticker.min.js"></script>
    <script src="/com/js/bluebird.min.js"></script>

    <script type="text/javascript">
        $(function() {

            // java 단 exception 발생 시 코드값 대로 메시지 alert 띄우도록!!
            setTimeout(function() {

                // 페이지 에러발생시 공통 처리
                if($.trim(sessionStorage.getItem("_errCd")) != "") { // 에러
                    if(sessionStorage.getItem("_errCd") == "404") {
                        comAlert(sessionStorage.getItem("_errCd")).then(function(bool) {
                            sessionStorage.removeItem("_errCd");
                        });
                    } else {
                        if(sessionStorage.getItem("_errCd") != "400") {
                            comAlert(sessionStorage.getItem("_errMsgCtnt")).then(function(bool) {
                                sessionStorage.removeItem("_errCd");
                            });
                        }
                    }
                } else if($.trim(sessionStorage.getItem("_isDuplicate")) == "Y") { // 중복로그인
                    comAlert("다른 기기에서 로그인 정보가<br/>확인되어 로그아웃 되었습니다.").then(function(bool) {
                        sessionStorage.removeItem("_isDuplicate");
                        location.href = "/";
                    });
                }

            }, 1);

            $(document).ajaxSend(function(event, xhr, options) {
                if(options.url.indexOf('COM000101.kb') > -1) return;

                ajaxindicatorstart('');
            });

            $(document).ajaxComplete (function(event,request, settings) {
                ajaxindicatorstop();

                // 2021-01-27 중복 로그인 체크
                if( settings.dataType == "json" ) {
                    if( request.responseJSON['_isDuplicate'] != null && request.responseJSON['_isDuplicate'] != undefined && request.responseJSON['_isDuplicate'] == "Y" ) {
                        // 로그아웃 처리를 하고 중복에러 화면으로 이동한다.
                        location.href = "/senior/COM000021.kb";
                    }
                }
            });

            // Ajax 에러 발생시 공통 처리
            $(document).ajaxError(function(event, jqXHR, ajaxSettings, thrownError) {

                $("#dimmed").remove();

                var json = jqXHR.responseText;
                console.log( "ERROR :", json );

                if($.trim(json) != "") {
                    var err = JSON.parse(json);
                    comAlert(err._errMsgCtnt + "\n<span>[" + err._errCd + "]</span>");
                }

            });

        });

        function logout() {
            //location.href = "/ctl/XAA72P21000.kb";
        }

        function ajaxindicatorstop()
        {
            $('#resultLoading .bg').height('100%');
//     $('#resultLoading').fadeOut(300);
            $('body').css('cursor', 'default');
        }

        function ajaxindicatorstart(text)
        {
            if($('body').find('#resultLoading').attr('id') != 'resultLoading'){
                $('body').append('<div id="resultLoading" style="display:none"><div><div>'+text+'</div></div><div class="bg"></div></div>');
            }

            $('#resultLoading').css({
                'width':'100%',
                'height':'100%',
                'position':'fixed',
                'z-index':'10000000',
                'top':'0',
                'left':'0',
                'right':'0',
                'bottom':'0',
                'margin':'auto'
            });

            $('#resultLoading .bg').css({
                'background':'#000000',
                'opacity':'0.7',
                'width':'100%',
                'height':'100%',
                'position':'absolute',
                'top':'0'
            });

            $('#resultLoading>div:first').css({
                'width': '250px',
                'height':'75px',
                'text-align': 'center',
                'position': 'fixed',
                'top':'0',
                'left':'0',
                'right':'0',
                'bottom':'0',
                'margin':'auto',
                'font-size':'16px',
                'z-index':'10',
                'color':'#ffffff'

            });

            $('#resultLoading .bg').height('100%');
//     $('#resultLoading').fadeIn(300);
            $('body').css('cursor', 'wait');
        }

        //쿠키설정
        function setCookie( name, value, expiredays )
        {
            var todayDate = new Date();
            todayDate.setDate( todayDate.getDate() + expiredays );
            document.cookie = name + '=' + escape( value ) + '; path=/; expires=' + todayDate.toGMTString() + ';'
        }

        //쿠키 불러오기
        function getCookie(name)
        {
            var obj = name + "=";
            var x = 0;
            while ( x <= document.cookie.length )
            {
                var y = (x+obj.length);
                if ( document.cookie.substring( x, y ) == obj )
                {
                    if ((endOfCookie=document.cookie.indexOf( ";", y )) == -1 )
                        endOfCookie = document.cookie.length;
                    return unescape( document.cookie.substring( y, endOfCookie ) );
                }
                x = document.cookie.indexOf( " ", x ) + 1;
                if ( x == 0 )
                    break;
            }
            return "";
        }

        //다시보지않기 쿠키 무한대로 설정
        function closePopUp(cookieNm){

            setCookie(cookieNm, 'Y', 365);
            window.close();
        }
    </script>

    <!-- Global site tag (gtag.js) - Google Analytics
    <script async src="https://www.googletagmanager.com/gtag/js?id=G-FKES0PHRVX"></script>-->

    <script async src="https://www.googletagmanager.com/gtag/js?id=G-LKX786T2EZ"></script>
    <script>
        window.dataLayer = window.dataLayer || [];
        function gtag(){dataLayer.push(arguments);}
        gtag('js', new Date());

        gtag('config', 'G-LKX786T2EZ');
    </script>

    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-176739152-1"></script>
    <script>
        window.dataLayer = window.dataLayer || [];
        function gtag(){dataLayer.push(arguments);}
        gtag('js', new Date());

        gtag('config', 'UA-176739152-1');
    </script>

    <!-- Google Tag Manager -->
    <script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
            new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
        j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
        'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
    })(window,document,'script','dataLayer','GTM-KDKLZD7');</script>
    <!-- End Google Tag Manager -->

    <script>
        // comAlert("필수 동의가 필요한 정보입니다.<br>미동의 시, 회원가입을 진행할 수 없습니다.").then(function(bool) {
        //     // 알럿 이후에 처리할 로직이 있다면 추가.
        // });
        function comAlert( _msg ) {
            return new Promise(function(resolve, reject) {
                var _screnId = "XAA75P55000";

                $('#cancelAlertBtn').hide();
                if( _msg == null || _msg == undefined ) _msg = "";
                $('.ui-modal-body > .msg').html( _msg );
                $plugins.uiModalOpen({ps: "center", id: "uiSystemModal"});
                if(_screnId == 'XAA75P01030' ){
                    $('#PC01_trigger01_btn01').off().on('click', function(e){
                        $plugins.uiModalClose({ id:'uiSystemModal'});
                        resolve(true);
                    });
                }else{
                    $('#confAlertBtn').off().on('click', function(e){
                        $plugins.uiModalClose({ id:'uiSystemModal'});
                        resolve(true);
                    });
                }

            });
        }

        // comConfAlert("골든카드에서 기기의 사진 파일에 엑세스하도록 허용하시겠습니까?").then(function(bool) {
        //     if( bool ) {
        //         // 확인일때 처리 로직 추가
        //     }
        // });
        function comConfAlert( _msg, _effectYn ) {
            return new Promise(function(resolve, reject) {
                $('#cancelAlertBtn').css('display','inline-block');
                if( _msg == null || _msg == undefined ) _msg = "";
                $('.ui-modal-body > .msg').html( _msg );
                $plugins.uiModalOpen({ps: "center", id: "uiSystemModal"});
                $('#cancelAlertBtn').off().on('click', function(e){
                    $plugins.uiModalClose({ id:'uiSystemModal'});
                    resolve(false);
                });
                $('#confAlertBtn').off().on('click', function(e){
                    if( _effectYn == null || _effectYn == undefined || _effectYn == true ) {
                        $plugins.uiModalClose({ id:'uiSystemModal'});
                    } else {
                        $plugins.uiModalNoEffectClose({ id:'uiSystemModal'});
                    }
                    resolve(true);
                });
            });
        }

        function comConfAlertButton( _msg, conf_txt, _effectYn ) {
            return new Promise(function(resolve, reject) {
                $('#cancelAlertBtn').css('display','inline-block');
                if( _msg == null || _msg == undefined ) _msg = "";
                $('.ui-modal-body > .msg').html( _msg );
                $plugins.uiModalOpen({ps: "center", id: "uiSystemModal"});
                $('#cancelAlertBtn').off().on('click', function(e){
                    $plugins.uiModalClose({ id:'uiSystemModal'});
                    resolve(false);
                });

                $('#conf_txt').text(conf_txt);
                $('#confAlertBtn').off().on('click', function(e){
                    if( _effectYn == null || _effectYn == undefined || _effectYn == true ) {
                        $plugins.uiModalClose({ id:'uiSystemModal'});
                    } else {
                        $plugins.uiModalNoEffectClose({ id:'uiSystemModal'});
                    }
                    resolve(true);
                });
            });
        }

        function memberJoinConfAlert( _msg, _effectYn,cancelid,confirmid ) {
            return new Promise(function(resolve, reject) {
                $('#cancelAlertBtn').css('display','inline-block');
                if( _msg == null || _msg == undefined ) _msg = "";


                $('.ui-modal-body > .msg').html( _msg );
                $plugins.uiModalOpen({ps: "center", id: "uiSystemModal"});
                $('#cancelAlertBtn').off().on('click', function(e){
                    $plugins.uiModalClose({ id:'uiSystemModal'});
                    resolve(false);
                });
                $('#PC01_trigger01_btn01').off().on('click', function(e){
                    if( _effectYn == null || _effectYn == undefined || _effectYn == true ) {
                        $plugins.uiModalClose({ id:'uiSystemModal'});
                    } else {
                        $plugins.uiModalNoEffectClose({ id:'uiSystemModal'});
                    }
                    resolve(true);
                });
            });
        }
    </script>



    <script type="text/javascript">

        $(function(){
            var data = {};
            data.screnId = "XAA75P55000";
            data.zoomMin = 80;
            data.zoomMax = 120;
            data.zoomCurr = 100;
            data.zoomScale = 5;

            if(!(data.screnId == "XAA75P02000" || data.screnId =="XAA75P01020" || data.screnId=="XAA75P01030")){
                sessionStorage.removeItem("ecrypCertncd");
                sessionStorage.removeItem("ecrypLnkd");
                sessionStorage.removeItem("ecrypLnkdN");
            }

            //GNB 메뉴 강조 처리
            var menuId = $('.all-dep a[href*='+data.screnId+']').data('menuId');
            $('.gnb .' + menuId).addClass('on');

            //.dep3 에 자식이 없으면 .in-sub 및 .dep3 없애기 / 자식이 있으면 href 없애기
            $('.all-dep .dep3').each(function(){
                $this = $(this);
                $siblings = $(this).siblings('a');

                if($this.children().length == 0){
                    $this.remove();
                    $siblings.removeClass('in-sub');
                }else{
                    $siblings.attr('href', '#');
                }
            });

            //상단 타이틀, 상세페이지 등 메뉴화면표시여부 에 따라 감추기
            $(".all-dep a:not(.dep1)").each(function(){
                var url = $(this).attr('href');
                var visibleYn = $(this).data('visibleYn');

                if(url.indexOf(data.screnId) > -1){
                    //상단 타이틀
                    setHeaderTitle($(this).parents('.lv2').find('a:first').text());
                }

                //상세페이지 등 메뉴화면표시여부 에 따라 감추기
                if(visibleYn == "0"){
                    $(this).parent().hide();
                }
            });

            //메뉴클 선택시 화면이동
            $('button.bt-sub').on('click', function(e){
                var url = $(this).data('url');
                location.href = url;
            });

            //마이페이지 이동
            $('#btnMyPage').on('click', function(e){
                e.preventDefault();

                location.href = "/senior/XAA75P08000.kb";
            });

            //로그인
            $('#btnLogin, #btnMenuLogin').on('click', function(e){
                e.preventDefault();

                if(!!!window.data){
                    window.data = {};
                }

                //탈퇴 후 바로 로그인 시 리다이렉트 탈퇴완료로 가지 않게 제외!
                if(("XAA75P55000" != "XAA75P08130") && ("XAA75P55000" != "XAA75M08130")){
                    window.data.redirectPageId = "XAA75P55000";
                }

                dynamicFormSubmit("/senior/XAA75P02000.kb", "POST", window.data);
            });

            //회원가입
            $('#btnJoin, #btnMenuJoin').on('click', function(e){
                e.preventDefault();

                if(!!!window.data)
                {
                    window.data = {};
                }

                window.data.redirectPageId = "XAA75P55000";
                dynamicFormSubmit("/senior/XAA75P01020.kb", "POST", window.data);
            });

            //로그아웃
            $('#btnLogout').off().on('click', function(e){
                e.preventDefault();

                if(!!!window.data){
                    window.data = {};
                }

                //로그아웃 후 현재 페이지로 이동
                window.data.referer = "/senior/XAA75P55000.kb";

                dynamicFormSubmit("/senior/logout.kb", "POST", window.data);
            });

            //전체 배율 설정
            $('.view-control > button').on('click', function(e){
                var $this = $(this);

                if($this.hasClass('btn-zoom-out')){
                    data.zoomCurr -= data.zoomScale;
                }
                else if($this.hasClass('btn-zoom-in')){
                    data.zoomCurr += data.zoomScale;
                }

                if(data.zoomCurr < data.zoomMin){
                    data.zoomCurr = data.zoomMin;
                }
                else if(data.zoomCurr > data.zoomMax){
                    data.zoomCurr = data.zoomMax;
                }

                $('#container').css('zoom', data.zoomCurr + "%");

            });

            //본문 배율 설정
            $('.control-font > button').on('click', function(e){
                var $this = $(this);

                if($this.hasClass('btn-minus')){
                    data.zoomCurr -= data.zoomScale;
                }
                else if($this.hasClass('btn-plus')){
                    data.zoomCurr += data.zoomScale;
                }

                if(data.zoomCurr < data.zoomMin){
                    data.zoomCurr = data.zoomMin;
                }
                else if(data.zoomCurr > data.zoomMax){
                    data.zoomCurr = data.zoomMax;
                }

                $('.view-content').css('zoom', data.zoomCurr + "%");

            });


            //로고 클릭
            $('.logo, #kbLogo1').on('click', function(e){
                e.preventDefault();
                location.href='/senior/index.kb';
            });

            //페이지 입장 전 로그인 필요
            $('.needLogin').on('click', function(e){
                var url = $(this).data('url');

                checkLogin(url);
            });

            $("#footer .ts26").on("click", function(e){//footer- 전가을 수정
                e.preventDefault();
                var data = {};
                data.cnsntDstcd = $(this).attr("data-cnsnt-dst-cd");

                $.ajax({
                    type:"POST",
                    dataType:"json",
                    url:"/senior/ajax/XAA75P08010P1.kb",  // 약관조회
                    async:false,
                    data: data,
                    success:function(result) {
                        if($.trim(result.stpulTitlName) != "") {
                            $('#modal_term01 h1:eq(0)').text(result.stpulTitlName);
                            $('#modal_term01 .terms-box').html(specialCharToText(result.stpulCtnt));
                            $('#modal_term01 .terms-box').scrollTop(0);

                            $plugins.uiModalOpen({ps: "center", id: "modal_term01"});
                        }else{
                            comAlert("약관 수보중에 있습니다.").then(function(bool) {
                                return false;
                            });

                        }
                    },
                    error : function(xhr, textStatus, errorThrown) {
                        comAlert("오류가 발생했습니다.");
                    }
                });
            });

// 	        // FAMILY SITE 토글
// 	        $('.shortcut .btn-site').on('click', function() {
// 	            $('.shortcut ul').slideToggle();
// 	        });




        });

        function setHeaderTitle(str)
        {
            //header-title 변경
            $('.header-title').text(str);
        }

        /*
        * url : 로그인 정보가 존재할시 리다이렉트할 url
        */
        function checkLogin(url)
        {
            var str = "로그인 후 이용하실 수 있습니다.<br/>이동 하시겠습니까?";

            if(!!url)
            {
                if(true)
                {
                    comConfAlert(str).then(function(b){
                        if(b){
                            if(!!!window.data){
                                window.data = {};
                            }

                            window.data.redirectPageId = "XAA75P55000";

                            dynamicFormSubmit("/senior/XAA75P02000.kb", "POST", window.data);
                        }else{
                            return false;
                        }
                    });
                }
                else
                {
                    location.href = url;
                }
            }
            else
            {
                if(true)
                {
                    comConfAlert(str).then(function(b){
                        if(b){
                            if(!!!window.data){
                                window.data = {};
                            }

                            window.data.redirectPageId = "XAA75P55000";

                            dynamicFormSubmit("/senior/XAA75P02000.kb", "POST", window.data);
                        }else{
                            //커뮤니티 상세 비로그인 접근 후 로그인 창 취소버튼 클릭 시 메인화면으로
                            window.data.redirectPageId = "XAA75P55000";
                            if(window.data.redirectPageId == "XAA72P07060"){
                                location.replace("/senior/XAA72P03000.kb");
                            }else{
                                return false;
                            }
                        }
                    });
                }
                else
                {
                    return true;
                }
            }

        }

        //화면상단컨텐츠조회
        var selectScreenTopContentsInfo = function(screnId){
            return new Promise(function(resolve, reject) {
                var data = {};

                data.screnId = screnId;

                $.ajax({
                    url : "/senior/ajax/XAA72P99010A7.kb"
                    ,type : "POST"
                    ,data : data
                    ,success : function(result){
                        if(Object.keys(result).length > 0){
                            resolve(result);
                        }else{
                            reject();
                        }
                    }
                    ,error : function(){
                        reject();
                    }
                });
            });
        };

    </script>

</head>
<body>
<!-- Google Tag Manager (noscript) -->
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-KDKLZD7"
                  height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<!-- End Google Tag Manager (noscript) -->


        <div class="content-health">
            <iframe src="https://www.kbxhealth.com?seniorParam1=Gjb9JY%2F7YIbiR5HeOcI%2BLw%3D%3D&seniorParam2=Gjb9JY%2F7YIbiR5HeOcI%2BLw%3D%3D&seniorParam3=Gjb9JY%2F7YIbiR5HeOcI%2BLw%3D%3D&seniorParam4=Gjb9JY%2F7YIbiR5HeOcI%2BLw%3D%3D&seniorParam5=naTwBpvW0hm9vnHafvxAzQ%3D%3D&seniorParam6=MftQDbdEYIsbnYiH0xFUiw%3D%3D&seniorParam7=mui6k%2BsPnRHytHIMM%2FO1dQ%3D%3D&seniorParam8=mui6k%2BsPnRHytHIMM%2FO1dQ%3D%3D" frameborder="0" id="contentIframe" name="contentIframe" width="100%" height="100%" marginwidth="0" marginheight="0" scrolling="no" allowFullScreen></iframe>
        </div>
        <script type="text/javascript">
            $(function(){
                $('.btn-tab').on('click', function(e){
                    location.href = $(this).data('url');
                });
            });
            window.onscroll = sendMessageIframe;
            function sendMessageIframe(){
                var iframe = document.getElementById('contentIframe').contentWindow;
                // 헬스케어에 window를 보낸다.
                var paramObj = {};
                paramObj['window.innerHeight'] = window.innerHeight;
                paramObj['window.outerHeight'] = window.outerHeight;
                paramObj['document.body.scrollHeight'] = document.body.scrollHeight;
                paramObj['document.documentElement.scrollHeight'] = document.documentElement.scrollHeight;
                paramObj['document.body.clientHeight'] = document.body.clientHeight;
                paramObj['document.documentElement.clientHeight'] = document.documentElement.clientHeight;
                paramObj['document.body.scrollTop'] = document.body.scrollTop;
                paramObj['document.documentElement.scrollTop'] = document.documentElement.scrollTop;
                var iframes = document.getElementById("contentIframe");
                paramObj['iframes.offsetHeight'] = iframes.offsetHeight;
                paramObj['iframes.offsetTop'] = iframes.offsetTop;
                iframe.postMessage({'seniorWindow' : paramObj}, '*');
            }
            window.addEventListener('message', function(e) {
                if( e.data.callType == "AUTOHEIGHT" ) {
                    var iframes = document.getElementById("contentIframe");
                    // 헬스케어 iframe 높이값이 디바이스 높이값보다 작다면 iframe 높이값을 늘린다.
                    if( window.outerHeight - iframes.offsetTop == e.data.childHeight ) {
                        document.getElementById("contentIframe").height = parseInt(e.data.childHeight) - 5;
                    } else {
                        document.getElementById("contentIframe").height = parseInt(e.data.childHeight) + 10;
                    }
                    // 헬스케어에 window 객체를 전달한다.
                    sendMessageIframe();
                } else if( e.data.callType == "BOOKMARK" ) {
                    // 헬스케어 찜하기를 한다.
                    let bookmark = e.data.bookmark;
                    let title = e.data.title;
                    let movieUrl = e.data.movieUrl;
                    let imageUrl = e.data.imageUrl;
                    let subTitle1 = e.data.subTitle1;
                    let subTitle2 = e.data.subTitle2;

                    $.ajax({
                        url : "/senior/ajax/XAA75M52000A9.kb"
                        ,type : "POST"
                        ,data : {'bookmark' : bookmark, 'title' : title, 'movieUrl' : movieUrl, 'imageUrl' : imageUrl, 'mfileDesc1' : subTitle1, 'mfileDesc2' : subTitle2}
                        ,dataType : "json"
                        ,success : function(data){

                        }
                        ,error : function(){
                            console.log("에러");
                        }
                        ,complete : function(){
                        }
                    });

                } else if( e.data.callType == "LOGINMOVE" ) {

                    // 로그인 화면 이동 요청
                    comMovePage( "/senior/XAA75P02000.kb", {} );

                } else if( e.data.callType == "BADGEMOVE" ) {

                    // 뱃지 안내 화면으로 이동
                    comMovePage( "/senior/XAA72P10061.kb", {} );

                } else if( e.data.callType == "CONTMOVE" ) {

                    // 마이페이지의 3자 제공 동의 화면 이동 요청
                    comMovePage( "/senior/XAA75P08010.kb", {} );

                }

            });

        </script>
</body>
</html>
<!-- modal UI -->

<section class="ui-modal" id="modal_term01">
    <div class="ui-modal-wrap">
        <div class="ui-modal-header">
            <h1></h1>
        </div>
        <div class="ui-modal-body">
            <div class="conts-box">
                <div class="terms-box">
                </div>
            </div>
        </div>

    </div>
</section>


<script type="text/javascript">
    var functions1 = {
        searchData : {}
        ,action : {
            rcmdnSrchwd : function() {  //추천검색어 조회

                $.ajax({
                    url : "/senior/ajax/XAA00000020A1.kb"
                    ,type : "POST"
                    ,dataType : "json"
                    ,success : function(data){
                        //console.log("추천검색어 결과 : "+JSON.stringify(data));
                        functions1.feature.setRcmdnSrchwd(data); //추천검색어 세팅
                    }
                    ,error : function(){
                        console.log("에러");
                    }
                })
            },
            srchwdTodayTop5 : function() {	//오늘의 인기검색어 TOP5 조회

                $.ajax({
                    url : "/senior/ajax/XAA00000020A2.kb"
                    ,type : "POST"
                    ,dataType : "json"
                    ,success : function(data){
                        functions1.feature.setSrchwdTodayTop5(data); //인기검색어 세팅
                    }
                    ,error : function(){
                        console.log("에러");
                    }
                })
            }
        },
        feature : {

            setRcmdnSrchwd : function(data){  //추천검색어 화면출력
                //console.log("추천검색어 결과 : "+JSON.stringify(data));

                var pbody_html = "";
                if(data.list.length > 0){

                    //PC html 생성
                    $.each(data.list, function(index) {

                        pbody_html += "<a href=\"#none\" onclick=\"javasciprt:fn_kywrSet('"+this.rcmdnSrchwdName+"')\";>#"+this.rcmdnSrchwdName+"</a>";  //추천검색어
                    });

                    $('div.keyword-list').html(pbody_html);   //추천키워드 존재시 PC 출력
                }

            }
            ,setSrchwdTodayTop5 : function(data){ //오늘의 인기검색어TOP5 화면출력
                //console.log("오늘의인기검색어 결과 : "+JSON.stringify(data));

                var pbody_html = "";
                if(data.list.length > 0){

                    //PC html 생성
                    $.each(data.list, function(index) {

                        pbody_html += "<li>";
                        pbody_html += "<i>"+(index+1)+"</i>";
                        pbody_html += "<a href=\"#none\" onclick=\"javasciprt:fn_kywrSet('"+this.kywrName+"')\";>"+this.kywrName+"</a>";  //인기검색어
                        pbody_html += "</li>";
                    });

                    $('#srchwdTodayTop5-list').html(pbody_html); //인기검색어 PC출력
                }
            },
            setter : function(){

                //검색버튼 클릭
                $("#searchBtn1").off().on('click', function(){

                    functions1.searchData.kywrName = $('#srcTxt').val().trim();  //검색어
                    console.log("통합검색키워드 : "+functions1.searchData.kywrName)

                    if(!functions1.searchData.kywrName){

                        comAlert("검색어를 입력하세요.!");
                        return;
                    }

                    //통합검색 결과화면으로 이동
                    dynamicFormSubmit("/senior/XAA00P00020.kb", "POST", {"hashTag" : functions1.searchData.kywrName});
                })

                $("#srcTxt").keyup(function(e){
                    //엔터(이동)
                    if(e.which == 13){
                        $("#searchBtn1").trigger("click");
                    }
                });

            }
        }
    }

    $(function(){

        functions1.feature.setter();

        //통함검색열기 클릭시
        $('#searchOpen').on('click', function(e){

            functions1.action.rcmdnSrchwd();  	 //추천검색어 조회
            functions1.action.srchwdTodayTop5();  //오늘의인기검색어 TOP5 조회
        });


        $('#logout').on('click', function(e){
            comConfAlert("로그아웃 하시겠습니까?" , false ).then(function(bool) {
                if( bool ) {

                    // 로그아웃
                    location.replace(''); // 로그아웃 후 메인으로 이동했을 경우 뒤로가기가 안되게
                    location.replace('/senior/XAA75P02000.kb');
                }
            });
        });

        var data = {};
        data.screnId = "XAA75P55000";
// 	   if(data.screnId == "XAA75P07041"){
// 		   if(getCookie("coach_pop") != "Y"){
// 			   $plugins.uiModalOpen({ps: "center", id: "modal_coach"});//코치마크 모달

// 				$('.coach-mark .slider-for').slick({//coach-mark클래스 추가
// 					slidesToShow: 1,
// 					slidesToScroll: 1,
// 					infinite: false,
// 					dots: false,
// 					arrows: true,
// 					focusOnSelect: true,
// 					adaptiveHeight:false,
// 				}).on('beforeChange', function(event, slick, currentSlide, nextSlide){
// 					$('.paging .idx').text(nextSlide+1);//현재 슬라이드 표시
// 				});
// 		   }
//        }

// 	   if(data.screnId == "XAA75P07030"){
// 			opengoldenCardPop2();
//        }

        $("#save_btn_cookie").off().on('click', function(e){
            e.preventDefault();
            if($("#save-cookie").is(":checked")){
                document.getElementById('save-cookie').checked = false;
            }else{
                document.getElementById('save-cookie').checked = true;
            }
        });

    });

    //추천검색어, 인기검색어 클릭시 입력창에 세팅
    function fn_kywrSet(kywrName){

        $('#srcTxt').val(kywrName);
        $("#searchBtn1").trigger("click");
    }

    //   	function closeGuidePop(){
    //   		if($("#uiChk").is(":checked")){
    //   			setCookie("coach_pop", 'Y', 1);
    //   		}
    //   		$plugins.uiModalClose({ id:'modal_coach'});
    //   	}

    //   	function closeCardPop(){
    //   		$plugins.uiModalClose({ id:'modal_center'});
    //   	}

    //   	function closegoldenCardPop2(){
    //   		if($("#save-cookie").is(":checked")){
    //   			setCookie("card_pop2", 'Y', 1);
    //   		}
    //   		$plugins.uiModalClose({ id:'goldenCardPop2'});
    //   	}

    //   	function opengoldenCardPop2(){
    //   		if(getCookie("card_pop2") != "Y"){
    // 			$plugins.uiModalOpen({ps: "center", id: "goldenCardPop2"});
    // 		}
    //   	}


</script>

