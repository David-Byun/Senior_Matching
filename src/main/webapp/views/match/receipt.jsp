<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<c:set var="requestObject" value="${requestScope.requestObject}"/>

<style>
  /*body{margin-top:20px;*/
  /*  color: #2e323c;*/
  /*  background: #f5f6fa;*/
  /*  position: relative;*/
  /*  height: 100%;*/
  /*}*/
  .invoice-container {
    padding: 1rem;
  }
  .invoice-container .invoice-header .invoice-logo {
    margin: 0.8rem 0 0 0;
    display: inline-block;
    font-size: 1.6rem;
    font-weight: 700;
    color: #2e323c;
  }
  .invoice-container .invoice-header .invoice-logo img {
    max-width: 130px;
  }
  .invoice-container .invoice-header address {
    font-size: 0.8rem;
    color: #9fa8b9;
    margin: 0;
  }
  .invoice-container .invoice-details {
    margin: 1rem 0 0 0;
    padding: 1rem;
    line-height: 180%;
    background: #f5f6fa;
  }
  .invoice-container .invoice-details .invoice-num {
    text-align: right;
    font-size: 0.8rem;
  }
  .invoice-container .invoice-body {
    padding: 1rem 0 0 0;
  }
  .invoice-container .invoice-footer {
    text-align: center;
    font-size: 0.7rem;
    margin: 5px 0 0 0;
  }

  .invoice-status {
    text-align: center;
    padding: 1rem;
    background: #ffffff;
    -webkit-border-radius: 4px;
    -moz-border-radius: 4px;
    border-radius: 4px;
    margin-bottom: 1rem;
  }
  .invoice-status h2.status {
    margin: 0 0 0.8rem 0;
  }
  .invoice-status h5.status-title {
    margin: 0 0 0.8rem 0;
    color: #9fa8b9;
  }
  .invoice-status p.status-type {
    margin: 0.5rem 0 0 0;
    padding: 0;
    line-height: 150%;
  }
  .invoice-status i {
    font-size: 1.5rem;
    margin: 0 0 1rem 0;
    display: inline-block;
    padding: 1rem;
    background: #f5f6fa;
    -webkit-border-radius: 50px;
    -moz-border-radius: 50px;
    border-radius: 50px;
  }
  .invoice-status .badge {
    text-transform: uppercase;
  }

  @media (max-width: 767px) {
    .invoice-container {
      padding: 1rem;
    }
  }


  .custom-table {
    border: 1px solid #e0e3ec;
  }
  .custom-table thead {
    background: #007ae1;
  }
  .custom-table thead th {
    border: 0;
    color: #ffffff;
  }
  .custom-table > tbody tr:hover {
    background: #fafafa;
  }
  .custom-table > tbody tr:nth-of-type(even) {
    background-color: #ffffff;
  }
  .custom-table > tbody td {
    border: 1px solid #e6e9f0;
  }


  .card {
    background: #ffffff;
    -webkit-border-radius: 5px;
    -moz-border-radius: 5px;
    border-radius: 5px;
    border: 0;
    margin-bottom: 1rem;
  }

  .text-success {
    color: #00bb42 !important;
  }

  .text-muted {
    color: #9fa8b9 !important;
  }

  .custom-actions-btns {
    margin: auto;
    display: flex;
    justify-content: flex-end;
  }

  .custom-actions-btns .btn {
    margin: .3rem 0 .3rem .3rem;
  }
</style>


<!-- Modal Begins-->
<div id="myReceipt${obj.id}" class="modal fade" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="container">
        <div class="row gutters">
          <div class="col-xl-12 col-lg-12 col-md-12 col-sm-3 col-12">
            <div class="card">
              <div class="card-body p-0">
                <div class="invoice-container">
                  <div class="invoice-header">
                    <!-- Row start -->
                    <div class="row gutters">
                      <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
                        <div class="custom-actions-btns mb-5">
                          <a href="#" class="btn btn-primary">
                            <i class="fa fa-envelope"></i> 메일 전송
                          </a>
                          <a href="/generate-pdf" class="btn btn-success" id="generatePdf" name="generatePdf">
                            <i class="fa fa-download"></i> PDF 다운
                          </a>
                        </div>
                      </div>
                    </div>
                    <!-- Row end -->
                    <!-- Row start -->
                    <div class="row gutters">
                      <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6">
                        <a href="index.html" class="invoice-logo">
                          봄생봄사
                        </a>
                      </div>
                      <div class="col-lg-6 col-md-6 col-sm-6">
                        <address class="text-right">
                          대한미국 서울특별시  <br>
                          성동구 아차산로 111 <br>
                          +82 982-314-0958
                        </address>
                      </div>
                    </div>
                    <!-- Row end -->
                    <!-- Row start -->
                    <div class="row gutters">
                      <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                        <div class="invoice-details">
                          <address>
                            결제자명 : 김제니
                            <br>
                            결제수단 : ${obj.payment}
                          </address>
                        </div>
                      </div>
                      <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                        <div class="invoice-details">
                          <div class="invoice-num">
                            <div> 매칭번호 : ${obj.id}</div>
                            <div><fmt:formatDate value="${obj.payDate}" pattern="yyyy-MM-dd HH:mm:ss"/></div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <!-- Row end -->
                  </div>
                  <div class="invoice-body">
                    <!-- Row start -->
                    <div class="row gutters">
                      <div class="col-lg-12 col-md-12 col-sm-12">
                        <div class="table-responsive">
                          <table class="table custom-table m-0">
                            <thead>
                            <tr>
                              <th>서비스명</th>
                              <th>일별 가격</th>
                              <th>일수</th>
                              <th>총 결제금액</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                              <td>
                                ${obj.service}
                                <p class="m-0 text-muted" style="font-size: small">
                                  ${obj.startDate} ~ <br>
                                  ${obj.endDate}
                                </p>
                              </td>
                              <td>30,000원</td>
                              <td>9</td>
                              <td>${obj.price}원</td>
                            </tr>
                            </tbody>
                          </table>
                        </div>
                      </div>
                    </div>
                    <!-- Row end -->
                  </div>
                  <div class="invoice-footer">
                    봄생 봄사를 이용해주셔서 감사드립니다.
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- Modal Ends-->