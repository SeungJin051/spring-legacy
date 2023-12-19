<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
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
    <!-- Bootstrap JS and Popper.js -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

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
            <!-- Jumbotron -->
            <div class="p-2 text-start bg-body-tertiary" style="margin-top: 30px;">
                <div id="printContent">
                    <div id="successDiv" class="d-flex-center">
						<img src="<%= request.getContextPath() %>/resources/img/success-payment.gif" alt="success" class="text-center">
                    </div>
                    <br>
                    <div class="text-center fw-light">
                        ※ 결제 처리가 정상적으로 되었습니다.
                    </div>
                    <br>
                    <div class="container bg-white w-50 p-xxl-5 border-5">
                        <h4>${param.name}</h4>
						<fmt:formatNumber value="${param.paid_amount}" pattern="#,##0" var="formattedPaidAmount" />
						<h2>${formattedPaidAmount}원</h2>
                        <br>
                        <br>
                        <p class="text-end">카드결제</p>
                        <div style="border-bottom: 2px solid black;"></div>
                        <div class="d-flex justify-content-between pt-3">
                            <div class="text-start">결제 번호</div>
                            <div class="text-end">${param.imp_uid}</div>
                        </div>
                        <div class="d-flex justify-content-between pt-3">
                            <div class="text-start">주문 번호</div>
                            <div class="text-end">${param.merchant_uid}</div>
                        </div>
                        <br>
                        <div style="border: 2px dashed black;"></div>
                        <div class="d-flex justify-content-between pt-3">
                            <div class="text-start">상품명</div>
                            <div class="text-end">${param.name}</div>
                        </div>
                        <div class="d-flex justify-content-between pt-3">
                            <div class="text-start">결제 금액</div>
                            <div class="text-end">${param.paid_amount}원</div>
                        </div>
                        <div class="d-flex justify-content-between pt-3">
                            <div class="text-start">결제일</div>
                            <div class="text-end">${param.paid_at}</div>
                        </div>
                        <div class="d-flex-center pt-3">
							<img src="<%= request.getContextPath() %>/resources/img/barcode.png" alt="barcode" class="w-100">
                        </div>
                    </div>
                </div>
                <form action=" paymentDone" method="post" class="form">
                    <input name="impUid" value="${param.imp_uid}" readonly type="hidden" />
                    <input name="merchantUid" value="${param.merchant_uid}" readonly type="hidden" />
                    <input name="name" value="${param.name}" readonly type="hidden" />
                    <input name="paidAmount" value="${param.paid_amount}" readonly type="hidden" />
                    <input name="paidAt" value="${param.paid_at}" readonly type="hidden" />
                    <div class="d-flex-center pb-4">
                        <button type="submit" class="btn btn-primary w-25">완료</button>
                        <button type="button" class="btn btn-outline-primary w-25" onclick="onPrint()">영수증
                            출력하기</button>
                    </div>
                </form>
            </div>
        </div>

        <div class="col-md-3 bg-secondary-subtle" style="height: 100vh;"></div>

</body>
<!-- MDB -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.1.0/mdb.umd.min.js"></script>
<script>
    $(document).ready(function () {
        setTimeout(function () {
            $("#successDiv").fadeOut(1000, function () {
                $(this).remove();
            });
        }, 1200);
    });


    function onPrint() {
        const html = document.querySelector('html');
        const printContents = document.querySelector('#printContent').innerHTML;
        const printDiv = document.createElement("DIV");
        printDiv.className = "print-div";

        html.appendChild(printDiv);
        printDiv.innerHTML = printContents;
        document.body.style.display = 'none';
        window.print();
        document.body.style.display = 'block';
        printDiv.style.display = 'none';
    };
</script>


</html>