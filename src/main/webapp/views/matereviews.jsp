<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="/css/review.css" type="text/css">
<link rel="stylesheet" href="/css/form.css" type="text/css">
<%--    리뷰 달기 부분--%>
<c:if test="${loginmember != null}">
    <div class="container">
        <form action="/reviewimpl" method="post" name="review_form" id="review_form">

            <input type="number" placeholder="userId(Number..)" id="userId" name="userId" value="${loginmember.id}" style="display: none">
            <input type="text" placeholder="itemId(Number..)" id="itemId" name="itemId" style="display: none" value="${item.id}">
            <div class="row">
                <div class="col-md-9">
                    <div class="form-group">
                        <input type="text" class="form-control" name="title" autocomplete="off" id="Name" placeholder="리뷰 제목">
                    </div>
                </div>
                <div class="col-md-3">
                    <select class="form-select" multiple aria-label="multiple select example" name="rate">
                        <option selected>별점</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                    </select>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="form-group">
                        <textarea class="form-control textarea" rows="3" name="review" id="Message" placeholder="리뷰 입력"></textarea>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <button type="submit" class="btn main-btn pull-right review_btn">리뷰달기</button>
                </div>
            </div>
        </form>
    </div>

</c:if>
<%--    리뷰 END--%>

