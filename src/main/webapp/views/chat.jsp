<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/socket.io/2.2.0/socket.io.js"></script>
<script src="/js/client.js?v=1"></script>
<script src="/css/styleChat.css"></script>

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-option">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb__text">
                    <h4>영상상담</h4>
                    <div class="breadcrumb__links">
                        <a href="/">Home</a>
                        <span>영상상담</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->


<div id="roomDiv" class="d-none d-flex flex-column align-items-center mt-3 mb-10">
    <div
            id="remoteVideoContainer"
            style="
          width: 600px;
          height: 450px;
          display: flex;
          align-items: center;
          justify-content: center;
          background-color: #363636;
        "
    >
        <video
                id="remoteVideo"
                autoplay
                style="width: 100%; height: 100%; object-fit: contain"
        ></video>
    </div>

    <div class="d-flex mt-3">
        <button id="toggleVideo" class="btn-circle enabled-style">
            <i id="videoIcon" class="bi bi-camera-video-fill"></i>
        </button>
        <button id="toggleAudio" class="btn-circle enabled-style">
            <i id="audioIcon" class="bi bi-mic-fill"></i>
        </button>
    </div>

    <video
            muted
            id="localVideo"
            autoplay
            style="
          width: 200px;
          height: 200px;
          position: absolute;
          bottom: 20px;
          right: 20px;
        "
    ></video>
</div>

<div id="roomConfig" class="d-flex justify-content-center mb-3">
    <div class="input-group input-group-lg" style="max-width: 400px">
        <input
                id="roomName"
                type="text"
                class="form-control form-control-lg"
                placeholder="Enter room"
        />
        <button id="btnConnect" class="btn btn-primary btn-lg" type="button">
            Connect
        </button>
    </div>
</div>