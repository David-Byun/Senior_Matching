<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
    #all {
        width: 800px;
        height: 200px;
        overflow: auto;
        border: 2px solid red;
    }

    #me {
        width: 800px;
        height: 200px;
        overflow: auto;
        border: 2px solid blue;
    }

    #to {
        width: 800px;
        height: 200px;
        overflow: auto;
        border: 2px solid green;
    }

</style>

<script>
    let websocket = {
        id:null,
        stompClient:null,
        init:function(){
            this.id = $('#adm_id').text();
            $("#connect").click(function() {
                websocket.connect();
            });
            $("#disconnect").click(function() {
                websocket.disconnect();
            });
            $("#sendall").click(function() {
                websocket.sendAll();
            });
            $("#sendme").click(function() {
                websocket.sendMe();
            });
            $("#sendto").click(function() {
                websocket.sendTo();
            });
        },
        connect:function(){
            var sid = this.id;
            var socket = new SockJS('http://127.0.0.1:8088/ws');
            this.stompClient = Stomp.over(socket);

            this.stompClient.connect({}, function(frame) {
                websocket.setConnected(true);
                console.log('Connected: ' + frame);
                this.subscribe('/send', function(msg) {
                    $("#all").prepend(
                        "<h4>" + JSON.parse(msg.body).sendid +":"+
                        JSON.parse(msg.body).content1
                        + "</h4>");
                });
                this.subscribe('/send/'+sid, function(msg) {
                    $("#me").prepend(
                        "<h4>" + JSON.parse(msg.body).sendid +":"+
                        JSON.parse(msg.body).content1+ "</h4>");
                });
                this.subscribe('/send/to/'+sid, function(msg) {
                    $("#to").prepend(
                        "<h4>" + JSON.parse(msg.body).sendid +":"+
                        JSON.parse(msg.body).content1
                        + "</h4>");
                });
            });
        },
        disconnect:function(){
            if (this.stompClient !== null) {
                this.stompClient.disconnect();
            }
            websocket.setConnected(false);
            console.log("Disconnected");
        },
        setConnected:function(connected){
            if (connected) {
                $("#status").text("Connected");
            } else {
                $("#status").text("Disconnected");
            }
        },
        sendAll:function(){
            var msg = JSON.stringify({
                'sendid' : this.id,
                'content1' : $("#alltext").val()
            });
            this.stompClient.send("/receiveall", {}, msg);
        },
        sendTo:function(){
            var msg = JSON.stringify({
                'sendid' : this.id,
                'receiveid' : $('#target').val(),
                'content1' : $('#totext').val()
            });
            this.stompClient.send('/receiveto', {}, msg);
        },
        sendMe:function(){
            var msg = JSON.stringify({
                'sendid' : this.id,
                'content1' : $('#metext').val()
            });
            this.stompClient.send("/receiveme", {}, msg);
        }
    };
    $(function(){
        websocket.init();
    })

</script>
<!-- Begin Page Content -->
<div id="page-wrapper">

    <div class="container-fluid">

        <!-- Page Heading -->
        <%--  <h1 class="h1 mb-2 text-gray-800">Chatbot</h1>--%>

        <!-- DataTales Example -->
        <div class="card shadow mb-4">
            <%--    <div class="card-header py-3">--%>
            <%--      <h6 class="m-0 font-weight-bold text-primary">안녕하십니까 고객님, 무엇이든 편하게 질문하여 주십시오.</h6>--%>
            <%--    </div>--%>
            <div class="card-body">
                <div id="container"></div>
                <div class="col-sm-5">
                    <p></p>
                    <h1 id="adm_id">${loginadm.id}</h1>
                    <p></p>
                    <h1 id="status">Chatbot</h1><p></p>
                    <button id="connect">연결하기</button>
                    <button id="disconnect">나가기</button>
                    <p></p>
                    <h3>챗봇에게 문의하기</h3>
                    <input type="text" id="alltext"><button id="sendall">보내기</button>
                    <div id="all"></div>

                    <p></p><h3>관리자에게 문의하기</h3>
                    <input type="text" id="metext"><button id="sendme">문의하기</button>
                    <div id="me"></div>

                    <p></p><h3>마음의 소리</h3>
                    <input type="text" id="target">
                    <input type="text" id="totext"><button id="sendto">문의하기</button>
                    <div id="to"></div>

                </div>
            </div>
        </div>
        <!-- /.container-fluid -->
    </div>
</div>