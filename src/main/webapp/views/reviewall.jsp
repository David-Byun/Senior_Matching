<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="container-fluid">
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h4>리뷰</h4>
                        <div class="breadcrumb__links">
                            <a href="/">Home</a>
                            <span>리뷰</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->
    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Review List</h6>
            <form action="/reviewsearch"id="search_form" name="search_form" class="form-inline well" method="post">

                <div class="form-group">
                    <label class="control-label col-sm-2" for="itemId">Product:</label>
                    <div class="col-sm-10">
                        <input type="text" name="itemId" class="form-control" id="itemId" placeholder="Enter itemId"
                               value="${rs.itemId}"
                        >
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="rate">Rate: </label>
                    <div class="col-sm-10">
                        <input type="number" name="rate" class="form-control" id="rate" placeholder="Enter rate"
                               value="${rs.rate}">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-2">
                        <button id="search_btn" type="submit" class="btn btn-info">Search</button>
                        <%--                        폼과 폼 사이를 할 땐 submit--%>
                    </div>
                </div>
            </form>
        </div>

        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                    <tr>
                        <th>no.</th>
                        <th>Writer</th>
                        <th>Product</th>
                        <th>Title</th>
                        <th>Review</th>
                        <th>Rate</th>
                    </tr>
                    </thead>
                    <tfoot>
                    <tr>
                        <th>no.</th>
                        <th>Writer</th>
                        <th>Product</th>
                        <th>Title</th>
                        <th>Review</th>
                        <th>Rate</th>
                    </tr>
                    </tfoot>
                    <tbody>
                    <c:forEach var="obj" items="${reviewlist}">
                        <tr>
                            <td>${obj.id}</td>
                            <td>${obj.userId}</td>
                            <td>${obj.itemId}</td>
                            <td>${obj.title}</td>
                            <td>${obj.review}</td>
                            <td>${obj.rate}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<!-- /.container-fluid -->
