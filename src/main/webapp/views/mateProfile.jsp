<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<section class="h-100 gradient-custom-2">
    <div class="container py-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col col-lg-9 col-xl-7">
                <form>
                <div class="card">
                    <div class="rounded-top text-white d-flex flex-row" style="background-image: url('https://t1.daumcdn.net/cfile/tistory/99FD393359893C8217'); height:200px;">
                        <div class="ms-4 mt-5 d-flex flex-column" style="width: 150px;">
                            <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-profiles/avatar-1.webp"
                                 alt="Generic placeholder image" class="img-fluid img-thumbnail mt-4 mb-2"
                                 style="width: 150px; z-index: 1">

                            <button type="button" class="btn btn-outline-dark" data-mdb-ripple-color="dark"
                                    style="z-index: 1;">
                                회원정보 수정
                            </button>
                            <button type="button" class="btn btn-outline-dark" data-mdb-ripple-color="dark"
                                    style="z-index: 1;">
                                회원탈퇴
                            </button>

                        </div>
                        <div style="margin-top: 130px;">
                            <div class="mb-3 ml-3" style="color: black">
                                이메일 : ${loginmate.email}
                            </div>
                            <div class="mb-3 ml-3" style="color: black">
                                이름 : ${loginmate.name}
                            </div>
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
                                <label for="exampleFormControlInput1" class="form-label">가능 지역</label>
                                <input type="email" class="form-control" id="exampleFormControlInput1" placeholder="name@example.com" value="${loginmate.area}">
                            </div>
                            <div class="mb-3">
                                <label for="exampleFormControlInput1" class="form-label">경력</label>
                                <input type="email" class="form-control" id="exampleFormControlInput1" placeholder="name@example.com" value="${loginmate.jobPeriod}">
                            </div>
                            <div class="mb-3">
                                <label for="exampleFormControlInput1" class="form-label">자격증</label>
                                <input type="email" class="form-control" id="exampleFormControlInput1" placeholder="name@example.com" value="${loginmate.license}">
                            </div>
                        </div>
                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <p class="lead fw-normal mb-0">Recent photos</p>
                            <p class="mb-0"><a href="#!" class="text-muted">Show all</a></p>
                        </div>
                        <div class="row g-2">
                            <div class="col mb-2">
                                <img src="https://mdbcdn.b-cdn.net/img/Photos/Lightbox/Original/img%20(112).webp"
                                     alt="image 1" class="w-100 rounded-3">
                            </div>
                            <div class="col mb-2">
                                <img src="https://mdbcdn.b-cdn.net/img/Photos/Lightbox/Original/img%20(107).webp"
                                     alt="image 1" class="w-100 rounded-3">
                            </div>
                        </div>
                    </div>
                </div>
                </form>
            </div>
        </div>
    </div>
</section>

