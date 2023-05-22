<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<style>

    #alltext {
        width: 900px;
        height: 300px;
        overflow: auto;
        border: 10px solid darkslateblue;
        font-family: 맑은 고딕,
        'malgun gothic',
        'Apple SD Gothic Neo', 'Microsoft NeoGothic',
        'Droid sans', sans-serif;
        margin-top: 30px;
        margin-bottom: 30px;


    }

</style>

<script>
    let chatbot = {
        id:null,
        stompClient:null,
        init:function(){
            this.id = $('#adm_id').text();
            $("#connect").click(function() {
                chatbot.connect();
            });
            $("#disconnect").click(function() {
                chatbot.disconnect();
            });
            $("#sendall").click(function() {
                chatbot.sendAll();
            });
        },
        connect:function(){
            var sid = this.id;
            var socket = new SockJS('${serviceserver}/chbot');
            this.stompClient = Stomp.over(socket);

            this.stompClient.connect({}, function(frame) {
                chatbot.setConnected(true);
                console.log('Connected: ' + frame);

                this.subscribe('/chsend/'+sid, function(msg) { /*/send/+sid(ex:id05) 로 오는 메세지는 내가 받겠다!!!!*/
                    $("#all").prepend(
                        "<h4>" + "Chat bot" +":"+
                        JSON.parse(msg.body).content1+ "</h4>");
                });
            });
        },
        disconnect:function(){
            if (this.stompClient !== null) {
                this.stompClient.disconnect();
            }
            chatbot.setConnected(false);
            console.log("연결이 해제되었습니다.");
        },
        setConnected:function(connected){
            if (connected) {
                $("#status").text("연결되었습니다.");
            } else {
                $("#status").text("연결이 해제되었습니다.");
            }
        },
        sendMe:function(){
            var msg = JSON.stringify({
                'sendid' : this.id,
                'content1' : $('#alltext').val()
            });
            this.stompClient.send("/chatbotall", {}, msg);
            $('#all').prepend(
                '<h4>'+this.id+':'+$('#alltext').val()+'</h4>'
            );
            $('#alltext').val('');
        }
    };
    $(function(){
        chatbot.init();
    })

</script>
<!-- Begin Page Content -->
<div class="col-sm-8 text-left">
    <br><h4>안녕하십니까 고객님, 행복한 쇼핑 되십시오.</h4><br>
    <h1 id="adm_id">${logincust.id}</h1>
    <h4 id="status">연결상태</h4>
    <button type="button" class="btn btn-primary" id="connect">챗봇 연결하기</button>
    <button type="button" class="btn btn-primary" id="disconnect">챗봇 해제하기</button>
    <br><br>
    <h3>챗봇에게 궁금한 것을 물어보세요!</h3>
    <input type="text" id="alltext"><button type="button" class="btn btn-primary" id="sendall">Send</button>
    <br>
    <div id="all"></div>
    <br>

    <!-- /.container-fluid -->
</div>