<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>ChatGPT Tutorial</title>
    <style>
        .h2-title {
            margin-top: 30px;
        }

        .div-chats {
            height: 500px;
        }

        .chat-content {
            height: 500px;
            overflow-y: scroll;
        }

        .line {
            margin-top: 10px;
            display: flex;
        }

        .chat-box {
            background: #eee;
            padding: 5px;
            max-width: 50%;
        }

        .mine {
            margin-left: auto;
        }
    </style>
</head>
<body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    $(function () {
        $('#chatBtn').click(function () {
            let question = document.querySelector('#input').value;
            let template = '<div class="line"><span class="chat-box mine">'+question+'</span></div>';
            document.querySelector('.chat-content').insertAdjacentHTML('beforeend', template);


            $.ajax({
                type:'POST',
                url: '/chat-gpt/question',
                data: question,
                cache:false,
                success : function (response) {

                    let template = `<div class="line">
      <span class="chat-box">${response.data.choices[0].text}</span>
    </div>`;
                    document.querySelector('.chat-content').insertAdjacentHTML('beforeend', template);
                },
                fail: function (response) {
                    console.log(response);
                }
            })
        })
    })
</script>
<div class="text-center">
    <h2 class="h2-title">ChatGPT Tutorial</h2>

    <div class="chat-content">
        <div class="line">
            <span class="chat-box">안녕하세요. 무엇이든 물어보세요!</span>
        </div>
    </div>

    <div>
        <div class="mt-3">
            <label for="input">질문</label>
            <input type="text" id="input">
            <button type="button" id="chatBtn">전송</button>
        </div>
    </div>

</div>
</body>
</html>