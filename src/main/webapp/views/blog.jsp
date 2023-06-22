<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:eval var="imgdir" expression="@environment.getProperty('imgdir')" />

<script>
    $(function () {
        // 비디오 요소 및 버튼 가져오기
        var video = document.getElementById("videoElement");
        var captureButton = document.getElementById("captureButton");

        // 비디오 스트림 시작
        navigator.mediaDevices.getUserMedia({ video: true })
            .then(function(stream) {
                video.srcObject = stream;
            })
            .catch(function(error) {
                console.log("카메라 접근에 실패했습니다: ", error);
            });

        // 사진 찍기 및 다운로드 함수
        function capturePhotoAndDownload() {
            // 캔버스 요소 생성 및 크기 설정
            var canvas = document.createElement("canvas");
            canvas.width = video.videoWidth;
            canvas.height = video.videoHeight;

            // 캔버스에 비디오 프레임 그리기
            var context = canvas.getContext("2d");
            context.drawImage(video, 0, 0, canvas.width, canvas.height);

            // 이미지 데이터 URL 생성
            var photoDataUrl = canvas.toDataURL("image/png");

            // 다운로드 링크 생성하여 클릭
            var downloadLink = document.createElement("a");
            downloadLink.download = "photo.png";
            downloadLink.href = photoDataUrl;
            downloadLink.click();

            $.ajax({
                    url:'/api/test',
                    method : 'post',
                    data : {
                        img: "photo.png",
                    },
                    success : function (data) {
                        const jsonObject = JSON.parse(data);
                        const gender = jsonObject.faces[0].gender.value;
                        const age = jsonObject.faces[0].age.value;
                        const emotion = jsonObject.faces[0].emotion.value;
                        Swal.fire(
                            '나이 : ' + age,
                            '성별 : ' + gender,
                            '감정 : ' + emotion
                        )
                    }
                }
            )
        }
        captureButton.addEventListener("click", capturePhotoAndDownload);
    })
    // 사진 찍기 및 다운로드 버튼 클릭 시 함수 호출
</script>
<h1>카메라로 사진 찍고 다운로드</h1>
<video id="videoElement" width="400" height="300" autoplay></video>
<button id="captureButton">사진 찍기 및 다운로드</button>

