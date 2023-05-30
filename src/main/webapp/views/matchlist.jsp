<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
</script>
<!-- Speaker Section Begin -->
<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-option">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb__text">
                    <h4>간병인 매칭</h4>
                    <div class="breadcrumb__links">
                        <a href="/">홈</a>
                        <a href="/ordermatch">간병인 매칭</a>
                        <span>간병인 매칭</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

<%--<body>--%>
<%--<h1>Match List</h1>--%>
<%--<table>--%>
<%--    <thead>--%>
<%--    <tr>--%>
<%--        <th>Name</th>--%>
<%--        <th>Age</th>--%>
<%--        <!-- Add more table headers as needed -->--%>
<%--    </tr>--%>
<%--    </thead>--%>
<%--    <tbody>--%>
<%--    <c:forEach var="mate" items="${mlist}">--%>
<%--        <tr>--%>
<%--            <td>${mate.id}</td>--%>
<%--            <td>${mate.name}</td>--%>
<%--            <td>${mate.jobPeriod}</td>--%>
<%--            <td>${mate.license}</td>--%>
<%--            <td>${mate.img}</td>--%>
<%--            <!-- Add more table cells as needed -->--%>
<%--        </tr>--%>
<%--    </c:forEach>--%>
<%--    </tbody>--%>
<%--</table>--%>
<%--</body>--%>
<%--</html>--%>

<section class="speaker-section spad">
    <div class="container">
        <div class="row">
            <div class="col-sm-6">
                <c:forEach var="obj" items="${mlist}">
                    <div class="speaker-item">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="si-pic">
                                    <img src="/uimg/${obj.img}" alt="">
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="si-text">
                                    <div class="si-title">
                                        <h4>NAME : ${obj.name}</h4>
                                        <h4>ID : ${obj.id}</h4>
                                        <h4>경력 : ${obj.jobPeriod}</h4>
                                        <h4>자격증 : ${ojb.license}</h4>
                                    </div>
                                    <div class="si-social">
                                        <a href="#"><i class="fa-sharp fa-solid fa-comment"></i></a>
                                        <a href="#"><i class="fas fa-video"></i></a>
                                    </div>
                                    <div class="rating">
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                    </div>
                                    <p>Businesses often become known today through effective marketing. The marketing
                                        may be in the form of a regular news item or half column society news in the
                                        Sunday newspaper.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>

            </div>
        </div>
        <div class="load-more">
            <a href="#" class="primary-btn">Load More</a>
        </div>
    </div>
</section>
<!-- Helper Section End -->