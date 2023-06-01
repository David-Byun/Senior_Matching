<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    function readImage(input) {
        // 인풋 태그에 파일이 있는 경우
        if(input.files && input.files[0]) {

            // FileReader 인스턴스 생성
            const reader = new FileReader()
            // 이미지가 로드가 된 경우
            reader.onload = e => {
                const previewImage = document.getElementById("preview")
                previewImage.src = e.target.result
            }
            // reader가 이미지 읽도록 하기
            reader.readAsDataURL(input.files[0])
        }
    }
    let mateUpdate = {
        init : function () {
            $('#update_btn').click(function () {
                mateUpdate.send();
            });
            $('#delete_btn').click(function () {
                let c = confirm("삭제하시겠습니까?");
                if (c == true) {
                    location.href="/mate/deleteimpl?id=" + ${loginmate.id};
                }
            })
        },
        send : function () {
            $('#update_form').attr({
                method:'post',
                action:'/mate/updateImpl',
                enctype: 'multipart/form-data'
            });
            $('#update_form').submit();
        }
    };
    $(function () {
        mateUpdate.init();
        $('#imgname').on("change", e => {
            readImage(e.target)
        })
    });
</script>
<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-option">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb__text">
                    <h4>회원정보 수정</h4>
                    <div class="breadcrumb__links">
                        <a href="/">홈</a>
                        <a href="/match">메이트</a>
                        <span>회원정보 수정</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

<section class="h-100 gradient-custom-2">
    <div class="container py-5 h-80">
        <div class="row d-flex justify-content-center align-items-center h-80">
            <div class="col col-lg-9 col-xl-7">
                <form id="update_form">
                    <input name="email" type="text" value="${loginmate.email}" style="display: none">
                <div class="card">
                    <div class="rounded-top text-white d-flex flex-row" style="background-image: url('https://t1.daumcdn.net/cfile/tistory/99FD393359893C8217'); height:200px;">
                        <div class="ms-4 mt-5 d-flex flex-column" style="width: 150px;">
                            <c:choose>
                                <c:when test="${loginmate.img == null || loginmate.img == ''}">
                                    <input class="d-none mt-5 ml-5" type="file" name="imgName" style="display: none" id="imgname">
                                    <a href="javascript:void(0);" onclick="$('#imgname').trigger('click')">
                                        <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-profiles/avatar-1.webp"
                                             alt="Generic placeholder image" class="img-fluid img-thumbnail mb-3"
                                             style="width: 150px; z-index: 1; height:150px" id="preview">
                                    </a>
                                </c:when>
                                <c:otherwise>
                                    <input class="d-none mt-5 ml-5" type="file" name="imgName" style="display: none" id="imgname">
                                    <a href="javascript:void(0);" onclick="$('#imgname').trigger('click')">
                                        <img src="/uimg/${loginmate.img}" id="preview"
                                             alt="Generic placeholder image" class="img-fluid img-thumbnail mb-3"
                                             style="width: 150px; z-index: 1">
                                    </a>
                                </c:otherwise>
                            </c:choose>
                            <button type="button" class="btn btn-outline-success" data-mdb-ripple-color="dark" id="update_btn"
                                    style="z-index: 1;">
                                회원정보 수정
                            </button>
                            <button type="button" class="btn btn-outline-secondary" data-mdb-ripple-color="dark" id="delete_btn"
                                    style="z-index: 1;">
                                회원탈퇴
                            </button>
                        </div>
                        <div style="margin-top: 130px;">
                            <h6 class="mb-3 ml-3" style="color: black">
                                이메일 : ${loginmate.email}
                            </h6>
                            <h6 class="mb-3 ml-3" style="color: black">
                                성명 : ${loginmate.name}
                            </h6>
                        </div>
                    </div>
                    <div class="p-4 text-black" style="background-color: #f8f9fa;">
                        <div class="d-flex justify-content-end text-center py-1">
                            <div class="px-3">
                                <p class="mb-1 h5">3</p>
                                <p class="small text-muted mb-0">메이트</p>
                            </div>
                            <div>
                                <p class="mb-1 h5">4</p>
                                <p class="small text-muted mb-0">평점</p>
                            </div>
                        </div>
                    </div>
                    <div class="card-body p-4 text-black">
                        <div class="mb-5">
                            <div class="mb-3">
                                <label for="region" class="form-label">가능 지역</label>
                                <input type="text" id="region" name="area" class="form-control" placeholder="가능 지역을 입력해주세요" value="${loginmate.area}">
                            </div>
                            <div class="mb-3">
                                <label for="period" class="form-label">경력</label>
                                <input type="number" id="period" name="jobPeriod" class="form-control" placeholder="경력 년수를 적어주세요" value="${loginmate.jobPeriod}">
                            </div>
                            <div class="mb-3">
                                <label for="cer" class="form-label">자격증</label>
                                <input type="text" name="license" id="cer" class="form-control" placeholder="자격증을 입력해주세요" value="${loginmate.license}">
                            </div>
                        </div>
                    </div>
                </div>
                </form>
            </div>
        </div>
    </div>
</section>

