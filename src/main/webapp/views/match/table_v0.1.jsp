<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.kbstar.util.DateUtil" %>
<%@ page import="java.text.ParseException" %>


<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/style.css">
</head>


<body>
<section class="ftco-section">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6 text-center mb-5">
                <h2 class="heading-section">메이트 매칭 내역</h2>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <div class="table-wrap">

                    <table class="table table-responsive-xl">
                        <thead>
                        <tr>
                            <th scope="col">번호</th>
                            <th scope="col">일자</th>
                            <th scope="col">구분</th>
                            <th scope="col">지역</th>
                            <th scope="col">성별</th>
                            <th scope="col">연령</th>
                            <th scope="col">상태</th>
                        </tr>
                        </thead>
                        <c:forEach var="obj" items="${mlist}">
                            <tbody>
                            <tr class="alert" role="alert">
                                <th scope="row">${obj.id}</th>
                                <td>${obj.startDate} ~ ${obj.endDate}</td>
                                <td>${obj.service}</td>
                                <td>${obj.area}</td>
                                <td>${obj.objectGender}</td>
                                <td>${obj.objectBirth}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${obj.status == '매칭대기'}">
                                            <a href="#" data-toggle="modal" data-target="#myModal${obj.id}">${obj.status}</a>
                                        </c:when>
                                        <c:when test="${obj.status == '매칭완료'}">
                                            <a href="#" data-toggle="modal" data-target="#myMessageModal${obj.id}">${obj.status}</a>
                                        </c:when>
                                        <c:otherwise>
                                            ${obj.status}
                                        </c:otherwise>
                                    </c:choose>
                                </td>
<%--                                <td class="d-flex align-items-center">--%>
<%--                                    <div class="img" style="background-image: url(#);"></div>--%>
<%--                                    <div class="pl-3 email">--%>
<%--                                        <span>markotto@email.com</span>--%>
<%--                                        <span>Added: 01/03/2020</span>--%>
<%--                                    </div>--%>
<%--                                </td>--%>
<%--                                <td>Markotto89</td>--%>
<%--                                <td class="status"><span class="active">Active</span></td>--%>
<%--                                <td>--%>
<%--                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">--%>
<%--                                        <span aria-hidden="true"><i class="fa fa-close"></i></span>--%>
<%--                                    </button>--%>
<%--                                </td>--%>
                            </tr>
                            </tbody>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>
    </div>
</section>

    <script src="js/1_bootstrap.min.js"></script>
    <script src="js/1_jquery.min.js"></script>
    <script src="js/1_main.js"></script>
    <script src="js/1_popper.js"></script>

</body>