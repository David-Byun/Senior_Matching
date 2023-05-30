<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>

    let roomId;

    $(function(){
        let $maxUserCnt = $("#maxUserCnt");
        let $msgType = $("#msgType");

        // 모달창 열릴 때 이벤트 처리 => roomId 가져오기
        $("#enterRoomModal").on("show.bs.modal", function (event) {
            roomId = $(event.relatedTarget).data('id');
            // console.log("roomId: " + roomId);

        });

        $("#confirmPwdModal").on("show.bs.modal", function (e) {
            roomId = $(e.relatedTarget).data('id');
            // console.log("roomId: " + roomId);

        });

        // 채팅방 설정 시 비밀번호 확인
        confirmPWD();

        // 문자 채팅 누를 시 disabled 풀림
        $msgType.change(function(){
            if($msgType.is(':checked')){
                $maxUserCnt.attr('disabled', false);
            }
        })
    })



    // 채팅방 설정 시 비밀번호 확인 - keyup 펑션 활용
    function confirmPWD(){
        $("#confirmPwd").on("keyup", function(){
            let $confirmPwd = $("#confirmPwd").val();
            const $configRoomBtn = $("#configRoomBtn");
            let $confirmLabel = $("#confirmLabel");

            $.ajax({
                type : "post",
                url : "/chat/confirmPwd/"+roomId,
                data : {
                    "roomPwd" : $confirmPwd
                },
                success : function(result){
                    // console.log("동작완료")

                    // result 의 결과에 따라서 아래 내용 실행
                    if(result){ // true 일때는
                        // $configRoomBtn 를 활성화 상태로 만들고 비밀번호 확인 완료를 출력
                        $configRoomBtn.attr("class", "btn btn-primary");
                        $configRoomBtn.attr("aria-disabled", false);

                        $confirmLabel.html("<span id='confirm'>비밀번호 확인 완료</span>");
                        $("#confirm").css({
                            "color" : "#0D6EFD",
                            "font-weight" : "bold",
                        });

                    }else{ // false 일때는
                        // $configRoomBtn 를 비활성화 상태로 만들고 비밀번호가 틀립니다 문구를 출력
                        $configRoomBtn.attr("class", "btn btn-primary disabled");
                        $configRoomBtn.attr("aria-disabled", true);

                        $confirmLabel.html("<span id='confirm'>비밀번호가 틀립니다</span>");
                        $("#confirm").css({
                            "color" : "#FA3E3E",
                            "font-weight" : "bold",
                        });

                    }
                }
            })
        })
    }

    // 채팅 인원 숫자만 정규식 체크
    function numberChk(){
        let check = /^[0-9]+$/;
        if (!check.test($("#maxUserCnt").val())) {
            alert("채팅 인원에는 숫자만 입력 가능합니다!!")
            return false;
        }
        return true;
    }

    // 채팅방 생성
    function createRoom() {

        let name = $('#roomName').val();
        let pwd = $('#roomPwd').val();
        let secret = $('#secret').is(':checked');
        let secretChk = $('#secretChk');
        let $rtcType = $('#rtcType');
        let $msgType = $('#msgType');

        if (name === "") {
            alert("방 이름은 필수입니다")
            return false;
        }
        if ($("#" + name).length > 0) {
            alert("이미 존재하는 방입니다")
            return false;
        }
        if (pwd === "") {
            alert("비밀번호는 필수입니다")
            return false;
        }

        if($rtcType.is(':checked')){
            if($("#maxUserCnt").val() <= 1){
                alert("채팅은 최소 2명 이상!!");
                return false;
            }else if ($("#maxUserCnt").val() > 4) {
                alert("4명 이상은 서버가 아파요ㅠ.ㅠ");
                return false;
            }
        }else if($msgType.is(':checked')){
            // 일반채팅 : 최소 방 인원 수는 2, 최대 100명
            if($("#maxUserCnt").val() <= 1){
                alert("채팅은 최소 2명 이상!!");
                return false;
            }else if ($("#maxUserCnt").val() > 100) {
                alert("100명 이상은 서버가 못 버텨요ㅠ.ㅠ");
                return false;
            }
        }

        // 채팅 타입 필수
        if ($('input[name=chatType]:checked').val() == null) {
            alert("채팅 타입은 필수입니다")
            return false;
        }

        if (secret) {
            secretChk.attr('value', true);
        } else {
            secretChk.attr('value', false);
        }

        if(!numberChk()){
            return false;
        }

        return true;
    }

    // 화상 채팅 시 1:1 임으로 2명 고정
    $rtcType.change(function() {
        if($rtcType.is(':checked')){
            let number = 2;

            $("#maxUserCnt").val(parseInt(2));
            // $("#maxUserCnt").attr('value', 2)
            $("#maxUserCnt").attr('disabled', true);
        }
    })

    // 문자 채팅 누를 시 disabled 풀림
    $msgType.change(function(){
        if($msgType.is(':checked')){
            $maxUserCnt.attr('disabled', false);
        }
    })

    // 채팅방 생성
    function createRoom() {

        let name = $("#roomName").val();
        let pwd = $("#roomPwd").val();
        let secret = $("#secret").is(':checked');
        let secretChk = $("#secretChk");

        // console.log("name : " + name);
        // console.log("pwd : " + pwd);

        if (name === "") {
            alert("방 이름은 필수입니다")
            return false;
        }
        if ($("#" + name).length > 0) {
            alert("이미 존재하는 방입니다")
            return false;
        }
        if (pwd === "") {
            alert("비밀번호는 필수입니다")
            return false;
        }

        // 최소 방 인원 수는 2, 최대 100명
        if($("#maxUserCnt").val() <= 1){
            alert("채팅은 최소 2명 이상!!");
            return false;
        }else if ($("#maxUserCnt").val() > 100) {
            alert("100명 이상은 서버가 못 버텨요ㅠ.ㅠ");
            return false;
        }

        // 채팅 타입 필수
        if ($('input[name=chatType]:checked').val() == null) {
            alert("채팅 타입은 필수입니다")
            return false;
        }

        if (secret) {
            secretChk.attr('value', true);
        } else {
            secretChk.attr('value', false);
        }

        if(!numberChk()){
            return false;
        }

        return true;
    }


    // 채팅방 입장 시 비밀번호 확인
    function enterRoom(){
        let $enterPwd = $("#enterPwd").val();

        $.ajax({
            type : "post",
            url : "/chat/confirmPwd/"+roomId,
            async : false,
            data : {
                "roomPwd" : $enterPwd
            },
            success : function(result){
                // console.log("동작완료")
                // console.log("확인 : "+chkRoomUserCnt(roomId))

                if(result){
                    if (chkRoomUserCnt(roomId)) {
                        location.href = "/chat/room?roomId="+roomId;
                    }
                }else{
                    alert("비밀번호가 틀립니다. \n 비밀번호를 확인해주세요")
                }
            }
        })
    }

    // 채팅방 삭제
    function delRoom(){
        location.href = "/chat/delRoom/"+roomId;
    }

    // 채팅방 입장 시 인원 수에 따라서 입장 여부 결정
    function chkRoomUserCnt(roomId){
        let chk;

        // 비동기 처리 설정 false 로 변경 => ajax 통신이 완료된 후 return 문 실행
        // 기본설정 async = true 인 경우에는 ajax 통신 후 결과가 나올 때까지 기다리지 않고 먼저 return 문이 실행되서
        // 제대로된 값 - 원하는 값 - 이 return 되지 않아서 문제가 발생한다.
        $.ajax({
            type : "GET",
            url : "/chat/chkUserCnt/"+roomId,
            async : false,
            success : function(result){

                // console.log("여기가 먼저")
                if (!result) {
                    alert("채팅방이 꽉 차서 입장 할 수 없습니다");
                }

                chk = result;
            }
        })
        return chk;
    }


</script>
<style>
    a {
        text-decoration: none;
    }

    #table {
        margin-top: 40px;
    }

    h2 {
        margin-top: 40px;
    }

    input#maxUserCnt {
        width: 160px;
    }

    span.input-group-text.input-password-hide {
        height: 40px;
    }

    span.input-group-text.input-password-show {
        height: 40px;
    }

</style>
<div>
    <form method="post" action="/chat/createroom" onsubmit="return createRoom()">
        <div class="modal-body">
            <div class="mb-3">
                <label for="roomName" class="col-form-label">방 이름</label>
                <input type="text" class="form-control" id="roomName" name="roomName">
            </div>
            <div class="mb-3">
                <label for="roomPwd" class="col-form-label">방 설정 번호(방 삭제시 필요합니다)</label>
                <div class="input-group">
                    <input type="password" name="roomPwd" id="roomPwd" class="form-control" data-toggle="password">
                    <div class="input-group-append">
                        <span class="input-group-text"><i class="fa fa-eye"></i></span>
                    </div>
                </div>
            </div>
            <div class="mb-3">
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="chatType" id="msgType" value="msgChat">
                    <label class="form-check-label" for="msgType">
                        일반 채팅(최대 100명)
                    </label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="chatType" id="rtcType" value="rtcChat">
                    <label class="form-check-label" for="rtcType">
                        화상 채팅(1:1 Only)
                    </label>
                </div>
            </div>
            <div class="mb-3">
                <label for="maxUserCnt" class="col-form-label">채팅방 인원 설정
                    <!--<input class="form-check-input" type="checkbox" id="maxChk">--></label>
                <input type="text" class="form-control" id="maxUserCnt" name="maxUserCnt">
            </div>
            <div class="form-check">
                <input class="form-check-input" type="checkbox" id="secret">
                <input type="hidden" name="secretChk" id="secretChk" value="">
                <label class="form-check-label" for="secret">
                    채팅방 잠금
                </label>
            </div>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            <input type="submit" class="btn btn-primary" value="방 생성하기">
        </div>
    </form>
</div>