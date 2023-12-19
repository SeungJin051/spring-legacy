<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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
        
    <!-- 아임포트 REST API -->    
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript"	src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
	
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
        <div class="col-md-3 bg-secondary-subtle" style="height:100vh;"></div>
        <!-- 메인 키오스크 -->
        <div class="col-md-6">
            <!-- 네비게이션 바 -->
            <nav class="navbar navbar-light bg-body-tertiary">
                <div class="container">
                    <a class="navbar-brand" href="index">
                        <i class="fas fa-angle-left"></i>
                    </a>
                    <a class="navbar-brand" href="admin-login">
						<i class="far fa-circle-user"></i>
                    </a>
                </div>
            </nav>
            <br>
            <div class="bg-body-tertiary text-center text-lg-start">
             <!-- 장바구니 -->
				<c:if test="${not empty basketItems}">
				    <div class="container p-4 mb-3">
				        <div class="row">
				            <div class="col-md-8">
				                <div class="pb-3 table-container mb-3">
				                    <!-- 테이블 -->
				                    <table class="table">
				                        <thead>
				                            <tr>
				                                <th scope="col">상품 사진</th>
				                                <th scope="col">상품명</th>
				                                <th scope="col">가격</th>
												<th scope="col"></th>
				                            </tr>
				                        </thead>
				                        <tbody class="table-group-divider table-divider-color">
				                            <c:forEach var="item" items="${basketItems}">
				                                <tr>
				                                    <td><img src="<%= request.getContextPath() %>/resources/img/${item.image}" class="card-img-top" alt="Item" style="width: 40px;" /></td>
				                                    <td>${item.name}</td>
				                                    <td>
									                    <c:set var="cleanedPrice" value="${fn:replace(item.price, ',', '')}" />
														<fmt:formatNumber value="${cleanedPrice}" pattern="#,##0" />
				                            		</td>		
													<td><i class="fas fa-trash-can" onclick="location.href='deleteBasketMenu?id=${item.id}'"></i></td>
				                                </tr>
				                            </c:forEach>
				                        </tbody>
				                    </table>
				                </div>
				                <div class="row">
				                    <div class="col-md-6">
				                        <h5 id="totalPrice">총 금액 : 
				                            <c:set var="totalPrice" value="0" />
				                            <c:forEach var="item" items="${basketItems}">
				                                <!-- Remove commas from price before adding to totalPrice -->
				                                <c:set var="cleanedPrice" value="${fn:replace(item.price, ',', '')}" />
				                                <c:set var="totalPrice" value="${totalPrice + cleanedPrice}" />
				                            </c:forEach>
				                            <fmt:formatNumber value="${totalPrice}" pattern="#,##0" />
				                        </h5>
				                    </div>
				                </div>
				            </div>
				            <div class="col-md-4">
				                <!-- 결제 버튼 결제 성공시 관리자 페이지에서 확인하기  -->
				                <button type="button" class="btn btn-sm m-xl-3 w-75 rounded-9" data-mdb-ripple-init
				                        style="height: 120px;" onclick="redirectToPayment()">
				                    <h1>결제</h1>
				                </button>
				            </div>
				        </div>
				    </div>
				</c:if>
			<!-- 장바구니 -->

            </div>

            <div class="row row-cols-1 row-cols-md-3 g-4">
				<c:forEach var="menu" items="${menus}">
                <a data-mdb-ripple-init href="menu-order?id=${menu.id}" style="text-decoration: none;">
                    <div class="col">
                        <div class="card h-100 bg-image hover-shadow">
							<img src="<%= request.getContextPath() %>/resources/img/${menu.image}" class="card-img-top" alt="상품_이미지..." />
                            <div class="card-body">
                                <h5 class="card-title">${menu.name}</h5>
                                <p class="card-text">
									<c:set var="cleanedPrice" value="${fn:replace(item.price, ',', '')}" />
									<fmt:formatNumber value="${menu.price}" pattern="#,##0" />
                                </p>
                            </div>
                        </div>
                    </div>
                </a>
				</c:forEach>
            </div>
        </div>
        <div class="col-md-3 bg-secondary-subtle"></div>
    </div>
</body>
<!-- MDB -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.1.0/mdb.umd.min.js"></script>
<script>
    function redirectToPayment() {
        var totalPrice = document.getElementById('totalPrice').textContent.trim();

        var cleanedTotalPrice = totalPrice.replace(/[^0-9]/g, '');

        if (cleanedTotalPrice !== '') {
            var decodedTotalPrice = decodeURIComponent(cleanedTotalPrice);

            window.location.href = 'payment?totalPrice=' + encodeURIComponent(decodedTotalPrice);
        } else {
            alert('Invalid total price. Please check your input.');
        }
    }
</script>
</html>