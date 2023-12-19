<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Kiosk</title>
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet" />
    <!-- MDB -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.1.0/mdb.min.css" rel="stylesheet" />

    <!-- Bootstarp -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
        
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script type="text/javascript">
$(document).ready(function () {
    var urlParams = new URLSearchParams(window.location.search);
    var totalPrice = urlParams.get('totalPrice');

    totalPrice = parseFloat(totalPrice);

    if (!isNaN(totalPrice)) {
        var formattedTotalPrice = new Intl.NumberFormat('ko-KR', {
            style: 'decimal'
        }).format(totalPrice);

        $('#displayTotalPrice').text('총 결제 금액: ' + formattedTotalPrice +'원');
    } else {
        $('#displayTotalPrice').text('Invalid Total Price');
    }
});

function fn_buy() {
    var urlParams = new URLSearchParams(window.location.search);
    var totalPrice = urlParams.get('totalPrice');

    var IMP = window.IMP;
	IMP.init('imp83826188'); // portone 대신 자신의 "가맹점 식별코드"를 사용하시면 됩니다.
	// IMP.request_pay(param, callback) 결제창 호출
	IMP.request_pay({
	    pg : 'kakaopay',
	    pay_method : 'card',
	    merchant_uid: 'merchant_' + new Date().getTime(), // 상점에서 관리하는 주문 번호
	    name : '주문명:결제테스트',
	    amount : totalPrice,
	    buyer_email : 'seungjin051@gmail.com',
	    buyer_name : '임승진',
	    buyer_tel : '010-1234-5678',
	    buyer_addr : '서울특별시 강남구 삼성동',
	    buyer_postcode : '123-456',
	    m_redirect_url: "/paymentDone.do"
	}, function(rsp) {
		if (rsp.success) {
		    var paymentInfo = {
		        imp_uid: rsp.imp_uid,
		        name: rsp.name,
		        merchant_uid: rsp.merchant_uid,
		        paid_amount: rsp.paid_amount,
		        paid_at: new Date().toISOString() // Convert date to ISO string
		    };

		    console.log(paymentInfo);

		    var queryString = Object.keys(paymentInfo).map(function (key) {
		        return encodeURIComponent(key) + '=' + encodeURIComponent(paymentInfo[key]);
		    }).join('&');

		    // Append the query string to the "paymentSuccess" URL
		    location.href = "paymentSuccess?" + queryString;
		} else {
		    alert("결제 실패 : " + rsp.error_msg);
		}
	});
}
	
</script>
</head>
<style>
    body {
        margin: 0;
    }

    .d-flex-center {
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .table-container {
        max-height: 150px;
        overflow-y: auto;
    }
</style>
<body>
    <div class="row">
        <div class="col-md-3 bg-secondary-subtle" style="height: 100vh;"></div>
        <!-- 메인 키오스크 -->
        <div class="col-md-6">
            <!-- 네비게이션 바 -->
            <nav class="navbar navbar-light bg-body-tertiary">
                <div class="container">
                    <a class="navbar-brand" href="menu">
                        <i class="fas fa-angle-left"></i>
                    </a>
                </div>
            </nav>
            <br>
            <div class="p-2 text-start bg-body-tertiary mb-2" style="height: 95vh;">
                <h1 class="p-1 mb-3 fw-light">Payment</h1>
                <span class="p-3 mb-3 fw-light">결제 방식을 선택해주세요.</span>
         	   <div class=" d-flex-center">
	    			<div class="text-center" style="width: 500px; border: none;">
		                    <button onclick="fn_buy()">
		                        <div class="hover-zoom bg-white">
		                            <img class="w-50" src="<%= request.getContextPath() %>/resources/img/card.png" alt="">
		                            <div class="fw-medium" style="margin-top: -20px; font-size: 12px; padding-bottom: 25px;">
		                                PAY MENT CREDIT CARD
		                            </div>
		                        </div>
		                    </button>
	                </div>
            	</div>
				<h1 class="p-3 mb-3 text-center fw-light" id="displayTotalPrice"></h1>
			</div>
        </div>
        <div class="col-md-3 bg-secondary-subtle" style="height: 100vh;"></div>

</body>
<!-- MDB -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.1.0/mdb.umd.min.js"></script>
</html>
			