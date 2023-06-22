<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="/css/gpt.css" type="text/css">
<script>
    function showLoadingIndicator() {
        let loadingTemplate = '<div id="loading-indicator" class="line"><p style="margin-left:15px"><i class="fa fa-spinner fa-pulse"></i> Loading...</p></div>';
        document.querySelector('.chat-content').insertAdjacentHTML('beforeend', loadingTemplate);
    }

    function hideLoadingIndicator() {
        let loadingIndicator = document.querySelector('#loading-indicator');
        if (loadingIndicator) {
            loadingIndicator.remove();
        }
    }
    function callAPI() {
        let question = document.querySelector('#input').value;
        let template = '<div class="line"><span class="chat-box mine" style="color:#3d3d3d">'+question+'</span></div>';
        document.querySelector('.chat-content').insertAdjacentHTML('beforeend', template);
        showLoadingIndicator(); // Show loading indicator
        $('#input').val('');
        $.ajax({
            type:'POST',
            url: '/chat-gpt/question',
            data: question,
            cache:false,
            success : function (response) {
                let template = '<div class="line"><p style="margin-left:15px">GPT : <span class="chat-box">'+ response + '</span></p></div>';
                document.querySelector('.chat-content').insertAdjacentHTML('beforeend', template);
                hideLoadingIndicator(); // Hide loading indicator
            },
            fail: function(response) {
                console.log(response);
                hideLoadingIndicator(); // Hide loading indicator
            }
        })
    }
    $(function () {
        function handleUserInput() {
            callAPI();
        }
        $('#chatBtn').click(function () {
            let question = document.querySelector('#input').value;
            let template = '<div class="line"><span class="chat-box mine" style="color:#3d3d3d">'+question+'</span></div>';
            document.querySelector('.chat-content').insertAdjacentHTML('beforeend', template);
            $.ajax({
                type:'POST',
                url: '/chat-gpt/question',
                data: question,
                cache:false,
                success : function (response) {
                    let template = '<div class="line"><p style="margin-left:15px">GPT : <span class="chat-box">'+ response + '</span></p></div>';
                    document.querySelector('.chat-content').insertAdjacentHTML('beforeend', template);
                    $('#input').val('');
                },
                fail: function (response) {
                    console.log(response);
                }
            })
        })
        $('#input').keydown(function(event) {
            if (event.keyCode === 13) {
                handleUserInput();
                event.preventDefault();
            }
        });
    })
</script>
    <div id="chat-page">
        <div class="chat-container">
            <div class="chat-header">
                <h3>Chat GPT에게 물어보세요!</h3>
            </div>
            <div class="chat-content">
                <div class="line">
                    <p style="margin-left:15px">GPT :  <span class="chat-box">안녕하세요. 무엇이든 물어보세요!</span></p>
                </div>
            </div>
            <form>
                <div class="form-group">
                    <div class="input-group clearfix">
                        <input type="text" id="input" placeholder="질문을 해보세요"
                               autocomplete="off" class="form-control" />
                        <button type="button" id="chatBtn" class="btn btn-warning"><i class="fa-solid fa-circle-arrow-up" style="font-size: 20px"></i></button>
                    </div>
                </div>
            </form>
        </div>
    </div>
