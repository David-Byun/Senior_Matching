<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
    .button-container {
        display: flex;
    }
</style>
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
                    <h4>Shop</h4>
                    <div class="breadcrumb__links">
                        <a href="/">홈</a>
                        <span>샵</span>
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
                                    <a data-toggle="collapse" data-target="#collapseOne">Categories</a>
                                </div>
                                <div id="collapseOne" class="collapse show" data-parent="#accordionExample">
                                    <div class="card-body">
                                        <div class="shop__sidebar__categories">
                                            <ul class="nice-scroll">
                                                <li><a href="#">Men (20)</a></li>
                                                <li><a href="#">Women (20)</a></li>
                                                <li><a href="#">Bags (20)</a></li>
                                                <li><a href="#">Clothing (20)</a></li>
                                                <li><a href="#">Shoes (20)</a></li>
                                                <li><a href="#">Accessories (20)</a></li>
                                                <li><a href="#">Kids (20)</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-heading">
                                    <a data-toggle="collapse" data-target="#collapseTwo">Branding</a>
                                </div>
                                <div id="collapseTwo" class="collapse show" data-parent="#accordionExample">
                                    <div class="card-body">
                                        <div class="shop__sidebar__brand">
                                            <ul>
                                                <li><a href="#">Louis Vuitton</a></li>
                                                <li><a href="#">Chanel</a></li>
                                                <li><a href="#">Hermes</a></li>
                                                <li><a href="#">Gucci</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-heading">
                                    <a data-toggle="collapse" data-target="#collapseThree">Filter Price</a>
                                </div>
                                <div id="collapseThree" class="collapse show" data-parent="#accordionExample">
                                    <div class="card-body">
                                        <div class="shop__sidebar__price">
                                            <ul>
                                                <li><a href="#">$0.00 - $50.00</a></li>
                                                <li><a href="#">$50.00 - $100.00</a></li>
                                                <li><a href="#">$100.00 - $150.00</a></li>
                                                <li><a href="#">$150.00 - $200.00</a></li>
                                                <li><a href="#">$200.00 - $250.00</a></li>
                                                <li><a href="#">250.00+</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-heading">
                                    <a data-toggle="collapse" data-target="#collapseFour">Size</a>
                                </div>
                                <div id="collapseFour" class="collapse show" data-parent="#accordionExample">
                                    <div class="card-body">
                                        <div class="shop__sidebar__size">
                                            <label for="xs">xs
                                                <input type="radio" id="xs">
                                            </label>
                                            <label for="sm">s
                                                <input type="radio" id="sm">
                                            </label>
                                            <label for="md">m
                                                <input type="radio" id="md">
                                            </label>
                                            <label for="xl">xl
                                                <input type="radio" id="xl">
                                            </label>
                                            <label for="2xl">2xl
                                                <input type="radio" id="2xl">
                                            </label>
                                            <label for="xxl">xxl
                                                <input type="radio" id="xxl">
                                            </label>
                                            <label for="3xl">3xl
                                                <input type="radio" id="3xl">
                                            </label>
                                            <label for="4xl">4xl
                                                <input type="radio" id="4xl">
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-heading">
                                    <a data-toggle="collapse" data-target="#collapseFive">Colors</a>
                                </div>
                                <div id="collapseFive" class="collapse show" data-parent="#accordionExample">
                                    <div class="card-body">
                                        <div class="shop__sidebar__color">
                                            <label class="c-1" for="sp-1">
                                                <input type="radio" id="sp-1">
                                            </label>
                                            <label class="c-2" for="sp-2">
                                                <input type="radio" id="sp-2">
                                            </label>
                                            <label class="c-3" for="sp-3">
                                                <input type="radio" id="sp-3">
                                            </label>
                                            <label class="c-4" for="sp-4">
                                                <input type="radio" id="sp-4">
                                            </label>
                                            <label class="c-5" for="sp-5">
                                                <input type="radio" id="sp-5">
                                            </label>
                                            <label class="c-6" for="sp-6">
                                                <input type="radio" id="sp-6">
                                            </label>
                                            <label class="c-7" for="sp-7">
                                                <input type="radio" id="sp-7">
                                            </label>
                                            <label class="c-8" for="sp-8">
                                                <input type="radio" id="sp-8">
                                            </label>
                                            <label class="c-9" for="sp-9">
                                                <input type="radio" id="sp-9">
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-heading">
                                    <a data-toggle="collapse" data-target="#collapseSix">Tags</a>
                                </div>
                                <div id="collapseSix" class="collapse show" data-parent="#accordionExample">
                                    <div class="card-body">
                                        <div class="shop__sidebar__tags">
                                            <a href="#">Product</a>
                                            <a href="#">Bags</a>
                                            <a href="#">Shoes</a>
                                            <a href="#">Fashio</a>
                                            <a href="#">Clothing</a>
                                            <a href="#">Hats</a>
                                            <a href="#">Accessories</a>
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
                                <p>Sort by Price:</p>
                                <select>
                                    <option value="">Low To High</option>
                                    <option value="">$0 - $55</option>
                                    <option value="">$55 - $100</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <c:forEach items="${cpage.getList()}" var="c">
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product__item">

                                <div class="product__item__pic set-bg" data-setbg="/uimg/${c.img}" style="cursor:pointer;" >
                                    <ul class="product__hover">
                                        <li><a href="#"><img id="add-reserve" class="add-reserve" role="button" aria-pressed="true" data-item-id="${c.id}" src="/img/icon/heart.png" alt=""><span>Reserve</span></a></li>
                                        <li><a href="#"><img src="/img/icon/compare.png" alt=""> <span>Compare</span></a>
                                        </li>
                                        <li OnClick="location.href ='shop/${c.id}/detail'" ><a href="#"><img src="/img/icon/search.png" alt=""><span>Detail</span></a></li>
                                    </ul>
                                </div>


                                <div class="product__item__text">
                                    <h6>${c.name}</h6>
                                        <a id="add-cart" class="add-cart btn" role="button" aria-pressed="true" style="color:red;" data-item-id="${c.id}">+ Add To Cart</a>

                                    <c:forEach items="${rlist}" var="r">
                                        <c:if test="${r.itemId == c.id}">
                                        <div class="rating" id="rate" class="rate">
                                            <c:forEach begin="1" end="${r.rate}">
                                                <i class="fa fa-star"></i>
                                            </c:forEach>
                                            <c:forEach begin="${r.rate + 1}" end="5">
                                                <i class="fa fa-star-o"></i>
                                            </c:forEach>
                                        </div>
                                        </c:if>
                                    </c:forEach>

                                    <h5><fmt:formatNumber value="${c.price}" type="number" pattern="$#,###,###" /> </h5>
                                    <div class="product__color__select">
                                        <label for="pc-4">
                                            <input type="radio" id="pc-4">
                                        </label>
                                        <label class="active black" for="pc-5">
                                            <input type="radio" id="pc-5">
                                        </label>
                                        <label class="grey" for="pc-6">
                                            <input type="radio" id="pc-6">
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>

                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="product__pagination m-lg-5" >
                            <ul class="pagination">
                                <c:choose>
                                    <c:when test="${cpage.getPrePage() != 0}">
                                        <li class="mx-5">
                                            <a href="/shop?pageNo=${cpage.getPrePage()}">Previous</a>
                                        </li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="disabled mx-5">
                                            <a href="#">Previous</a>
                                        </li>
                                    </c:otherwise>
                                </c:choose>

                                <c:forEach begin="${cpage.getNavigateFirstPage() }" end="${cpage.getNavigateLastPage() }" var="page">
                                    <c:choose>
                                        <c:when test="${cpage.getPageNum() == page}">
                                            <li class="active mx-5">
                                                <a href="/shop?pageNo=${page}">${page }</a>
                                            </li>
                                        </c:when>
                                        <c:otherwise>
                                            <li class="mx-5">
                                                <a href="/shop?pageNo=${page}">${page }</a>
                                            </li>
                                        </c:otherwise>
                                    </c:choose>

                                </c:forEach>
                                <c:choose>
                                    <c:when test="${cpage.getNextPage() != 0}">
                                        <li>
                                            <a href="/shop?pageNo=${cpage.getNextPage()}">Next</a>
                                        </li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="disabled">
                                            <a href="#">Next</a>
                                        </li>
                                    </c:otherwise>
                                </c:choose>

                            </ul>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Shop Section End -->
