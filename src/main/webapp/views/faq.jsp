<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>FAQ</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="/css/faq.css" type="text/css">
</head>
<body>
<section class="main-content">
    <div class="container">
        <h1 class="text-center text-uppercase mb-5">Frequently Asked Questions</h1>
        <br>
        <br>
        <div class="row flex-center">
            <div class="col-sm-10 offset-sm-2">
                <div class="accordion" id="accordionExample">
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingOne">
                            <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                <div class="circle-icon"> <i class="fa fa-question"></i> </div>
                                <span>결제 수단을 변경하고 싶은데, 어떻게 해야 되나요?</span> </button>
                        </h2>
                        <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                                <strong>이미 결제한 주문 건의 경우 결제 수단을 변경하기는 어렵습니다.</strong>
                                결제 수단을 변경하시고자 하는 경우에는 기존 결제한 주문 건을 취소하시고 다시 구매하는 방법이 있습니다.
                            </div>
                        </div>
                    </div>
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingTwo">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                <div class="circle-icon"> <i class="fa fa-question"></i> </div>
                                <span>적립금으로 결제를 할 수 있나요?</span> </button>
                        </h2>
                        <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                                <strong>누적된 적립금이 3,000포인트 이상일 시,</strong>
                                상품 구매시 사용할 수 있으며, 적립시점 이후 1년간 사용이 가능합니다.
                                단, 적립금을 사용하여 결제할 경우, 실 결제 금액에 포함되지 않습니다. </div>
                        </div>
                    </div>
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingThree">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                <div class="circle-icon"> <i class="fa fa-question"></i> </div>
                                <span>사이즈를 교환 하고 싶은데, 어떻게 해야 하나요?</span> </button>
                        </h2>
                        <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                                <strong>사이즈 교환은 제품 구매후 7일이내 신청 시 가능합니다.</strong>
                                다만, 착용/착화후에는 교환이 되지 않으므로 이 점 유의하시기 바랍니다.
                                단체구매 시 구매 담당자에게 문의 하시면 정확한 처리가 가능합니다. </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

</body>
</html>
