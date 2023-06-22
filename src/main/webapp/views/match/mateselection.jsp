<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
    let addCart = {
        init : function () {
            $(document).on('click', '.add-cart', function(e) {
                console.log("확인");
                let itemId = $(e.currentTarget).data('item-id');
                let memberId = ${loginmember.id};
                console.log(memberId);
                $.ajax({
                    method:'POST',
                    url: '/cart/add',
                    data : {itemId:itemId, memberId: memberId}
                });
                swal("선택하신 상품이 장바구니에 추가되었습니다");
            })
        },
    }
    let addReserve = {
        init : function () {
            $(document).on('click', '.add-reserve', function(e) {

                let itemId = $(e.currentTarget).data('item-id');
                let memberId = ${loginmember.id};
                console.log("itemId : "+itemId);
                console.log("memberId : "+memberId);
                $.ajax({
                    method:'POST',
                    url: '/reserve/add',
                    data : {itemId:itemId, memberId: memberId}
                });
                swal("선택하신 상품이 찜리스트에 추가되었습니다");
            })
        },
    }
    $(function () {
        addCart.init();
        addReserve.init();
        rate.init();
    })
</script>
<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-option">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb__text">
                    <h4>신규 매칭 요청</h4>
                    <div class="breadcrumb__links">
                        <a href="/">홈</a>
                        <a href="/match/ordermatch">간병인 매칭</a>
                        <span>간병인 매칭</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

<!-- Shop Section Begin -->
<section class="shop spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="shop__sidebar">
                    <div class="shop__sidebar__search">
                        <form action="#">
                            <input type="text" placeholder="Search...">
                            <button type="submit"><span class="icon_search"></span></button>
                        </form>
                    </div>
                    <div class="shop__sidebar__accordion">
                        <div class="accordion" id="accordionExample">
                            <div class="card">
                                <div class="card-heading">
                                    <a data-toggle="collapse" data-target="#collapseOne">지역</a>
                                </div>
                                <div id="collapseOne" class="collapse show" data-parent="#accordionExample">
                                    <div class="card-body">
                                        <div class="shop__sidebar__categories">
                                            <ul class="nice-scroll">
                                                <li><a href="#">강남구</a></li>
                                                <li><a href="#">관악구</a></li>
                                                <li><a href="#">성동구</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-9">
                <div class="shop__product__option">
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-6">
                            <div class="shop__product__option__left">
                                <p>Showing 2 of ${fn:length(cpage.getList())} results</p>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6">
                            <div class="shop__product__option__right">
                                <p>경력에 따라 분류</p>
                                <select>
                                    <option value=""> 연도를 선택 </option>
                                    <option value="">1년~3년</option>
                                    <option value="">3년~5년</option>
                                    <option value="">5년~10년</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <c:forEach var="c" items="${mlist}">
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product__item">
                                <div class="product__item__pic set-bg" data-setbg="/uimg/${c.img}" style="cursor:pointer;" >
                                    <ul class="product__hover">
                                        <li><a href="/callchat"><i class="fa-sharp fa-solid fa-comment"></i></a></li>
                                        <li><a href="https://172.16.20.74"><i class="fas fa-video"></i></a></li>
                                    </ul>
                                </div>
                                <div class="product__item__text">
                                    <h6>${c.name}</h6>
                                    <form id="matchForm" action="/offer" method="POST">
                                            <%--                                            <input type="hidden" name="memberId" value="${loginmember}">--%>
                                        <input type="hidden" name="mateId" value="${c.id}">
                                        <input type="hidden" name="omId" value="${omId}">
                                        <a href="#" role="button" aria-pressed="true" style="color:red;" data-item-id="${c.id}" onclick="document.getElementById('matchForm').submit(); return false;"><i class="fas fa-arrow-circle-up"> 신청하기 </i></a>
                                    </form>

<%--                                    <c:forEach items="${rlist}" var="r">--%>
<%--                                        <c:if test="${r.itemId == c.id}">--%>
<%--                                        <div class="rating" id="rate" class="rate">--%>
<%--                                            <c:forEach begin="1" end="${r.rate}">--%>
<%--                                                <i class="fa fa-star"></i>--%>
<%--                                            </c:forEach>--%>
<%--                                            <c:forEach begin="${r.rate + 1}" end="5">--%>
<%--                                                <i class="fa fa-star-o"></i>--%>
<%--                                            </c:forEach>--%>
<%--                                        </div>--%>
<%--                                        </c:if>--%>
<%--                                    </c:forEach>--%>

                                    <h6> 경력 ${c.jobPeriod}년 | # ${c.license}</h6>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>




<%--                <div class="row">--%>
<%--                    <div class="col-lg-12">--%>
<%--                        <div class="product__pagination m-lg-5" >--%>
<%--                            <ul class="pagination">--%>
<%--                                <c:choose>--%>
<%--                                    <c:when test="${cpage.getPrePage() != 0}">--%>
<%--                                        <li class="mx-5">--%>
<%--                                            <a href="/shop?pageNo=${cpage.getPrePage()}">Previous</a>--%>
<%--                                        </li>--%>
<%--                                    </c:when>--%>
<%--                                    <c:otherwise>--%>
<%--                                        <li class="disabled mx-5">--%>
<%--                                            <a href="#">Previous</a>--%>
<%--                                        </li>--%>
<%--                                    </c:otherwise>--%>
<%--                                </c:choose>--%>

<%--                                <c:forEach begin="${cpage.getNavigateFirstPage() }" end="${cpage.getNavigateLastPage() }" var="page">--%>
<%--                                    <c:choose>--%>
<%--                                        <c:when test="${cpage.getPageNum() == page}">--%>
<%--                                            <li class="active mx-5">--%>
<%--                                                <a href="/shop?pageNo=${page}">${page }</a>--%>
<%--                                            </li>--%>
<%--                                        </c:when>--%>
<%--                                        <c:otherwise>--%>
<%--                                            <li class="mx-5">--%>
<%--                                                <a href="/shop?pageNo=${page}">${page }</a>--%>
<%--                                            </li>--%>
<%--                                        </c:otherwise>--%>
<%--                                    </c:choose>--%>

<%--                                </c:forEach>--%>
<%--                                <c:choose>--%>
<%--                                    <c:when test="${cpage.getNextPage() != 0}">--%>
<%--                                        <li>--%>
<%--                                            <a href="/shop?pageNo=${cpage.getNextPage()}">Next</a>--%>
<%--                                        </li>--%>
<%--                                    </c:when>--%>
<%--                                    <c:otherwise>--%>
<%--                                        <li class="disabled">--%>
<%--                                            <a href="#">Next</a>--%>
<%--                                        </li>--%>
<%--                                    </c:otherwise>--%>
<%--                                </c:choose>--%>
<%--                            </ul>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>



            </div>
        </div>
    </div>
</section>
<!-- Shop Section End -->

