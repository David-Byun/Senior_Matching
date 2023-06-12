<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!-- Blog Details Hero Begin -->
<section class="blog-hero spad">
    <div class="container">
        <div class="row d-flex justify-content-center">
            <div class="col-lg-10 text-center">
                <div class="blog__hero__text">
                    <h2>Review Form</h2>
                    <div class="blog__details__comment">
                        <form action="/reviewimpl" method="post" name="review_form" id="review_form">
                            <div class="row">
                                <div class="col-lg-4 col-md-4">
                                    <input type="text" placeholder="Id(Number..)" id="Id" name="Id" value="${loginmember.id}" style="color: black">
                                </div>
                                <div class="col-lg-4 col-md-4">
                                    <input type="text" placeholder="mateId(Number..)" id="mateId" name="mateId" style="color: black">
                                </div>
                                <div class="col-lg-4 col-md-4">
                                    <input type="text" placeholder="memberId(Number..)" id="memberId" name="memberId" style="color: black">
                                </div>
                                <div class="col-lg-12 text-center">
                                    <textarea type="text" placeholder="content" id="content" name="content" style="color: black"></textarea>
                                </div>
                                <div class="col-lg-12 text-center">
                                    <textarea type="image" placeholder="img" id="img" name="img" style="color: black"></textarea>
                                </div>
                                </br>
                                <div class="col-lg-8 col-md-4">
                                    <input type="number" placeholder="Rate from 1 to 10" id="rate" name="rate" style="color: black">
                                </div>
                                <button type="submit" class="review_btn">Post Review</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Blog Details Hero End -->