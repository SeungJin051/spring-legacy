<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
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
</style>

<body>
    <div class="row">
        <div class="col-md-3 bg-secondary-subtle" style="height:100vh"></div>
        <!-- 메인 키오스크 -->
        <div class="col-md-6">
            <!-- Navbar -->
            <nav class="navbar navbar-expand-lg navbar-light bg-body-tertiary">
                <!-- Container wrapper -->
                <div class="container-fluid">
                    <!-- Toggle button -->
                    <button data-mdb-collapse-init class="navbar-toggler" type="button"
                        data-mdb-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                        aria-expanded="false" aria-label="Toggle navigation">
                        <i class="fas fa-bars"></i>
                    </button>

                    <!-- Collapsible wrapper -->
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <!-- Navbar brand -->
                        <a class="navbar-brand mt-2 mt-lg-0" href="menu.html">
                            <i class="fas fa-angle-left"></i>
                        </a>
                        <!-- Left links -->
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-item">
                                <a class="nav-link" href="admin-menu">상품 관리</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" href="admin-order">주문 내역</a>
                            </li>
                        </ul>
                        <!-- Left links -->
                    </div>
                </div>
                <!-- Container wrapper -->
            </nav>
            <!-- Navbar -->
            <h1 class="p-5 mb-3 text-center fw-light" id="displayTotalPrice"></h1>
            <table class="table align-middle mb-0 bg-white">
                <thead class="bg-light">
                    <tr>
                        <th>결제 번호</th>
                        <th>주문 번호</th>
                        <th>상품명</th>
                        <th>결제 금액</th>
                        <th>결제일</th>
                    </tr>
                </thead>
                <tbody>
					<c:forEach var="payment" items="${payments}">
	                    <tr>
							<td>
							    <p class="text-muted mb-0">${payment.impUid}</p>
							</td>
							<td>
						        <p class="text-muted mb-0">${payment.merchantUid}</p>
							</td>
							<td>
						        <p class="text-muted mb-0">${payment.name}</p>
							</td>
							<td>
						        <p class="text-muted mb-0">${payment.paidAmount}</p>
							</td>
							<td>
						        <p class="text-muted mb-0">${payment.paidAt}</p>
							</td>
							<td>
								<i class="fas fa-cancel text-danger" onclick="location.href='deleteAdminOrder?impUid=${payment.impUid}'"></i>
							</td> 
	                    </tr>
					</c:forEach>
                </tbody>
            </table>
        </div>
        <div class="col-md-3 bg-secondary-subtle" style="height:100vh"></div>
    </div>
</body>
<!-- MDB -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.1.0/mdb.umd.min.js"></script>
<script>
    var totalPaidAmount = 0;

    <c:forEach var="payment" items="${payments}">
        totalPaidAmount += ${payment.paidAmount};
    </c:forEach>
    
    var formattedTotal = totalPaidAmount.toLocaleString('ko-KR', {
        style: 'currency',
        currency: 'KRW'
    });

    document.getElementById("displayTotalPrice").innerText = "Total Paid Amount: " + formattedTotal;
</script>
</html>