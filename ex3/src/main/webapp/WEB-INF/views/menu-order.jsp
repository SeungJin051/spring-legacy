<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            <div class="bg-body-tertiary text-center text-lg-start">
                <div>
					<form action="/kiosk/menu-order" method="post" enctype="multipart/form-data">
					    <input type="hidden" name="id" value="${menu.id}" />

					    <!-- 이미지 -->
					    <div data-mdb-input-init class="form-outline mb-4 d-flex-center">
					        <img src="<%= request.getContextPath() %>/resources/img/${menu.image}" name="img"
					            class="card-img-top w-50 h-50 mx-auto d-block m-3" alt="상품" />
					    </div>
					    <!-- Name input -->
					    <div data-mdb-input-init class="form-outline mb-4">
							<label for="form7Example1"><strong>상품명</strong></label>
					        <input type="text" id="form7Example1" name="name" class="form-control bg-body-secondary" readonly value="${menu.name}" />
					    </div>
					    <div data-mdb-input-init class="form-outline mb-4">
							<label for="form7Example2"><strong>가격</strong></label>
								<c:set var="cleanedPrice" value="${fn:replace(item.price, ',', '')}" />
							<input type="text" id="form7Example2" class="form-control bg-body-secondary" readonly value="<fmt:formatNumber value="${menu.price}" pattern="#,##0" />" />
					        <input type="hidden" name="price" readonly value="${menu.price}" />
					    </div>
					    <!-- 설명 -->
					    <div class="note note-info mb-3">
							<input type="hidden" name="info" value="${menu.info}" />
					        <strong>설명 : <br>
					            ${menu.info}
					        </strong>
					    </div>
						<input type="hidden" name="image" value="${menu.image}"/>
					    <div class="d-flex-center">
					        <button type="submit" class="btn w-75" style="background-color: #0077ED; color: white;"
					            >장바구니 추가
					        </button>
					    </div>
					</form>
                </div>
            </div>

        </div>
        <div class="col-md-3 bg-secondary-subtle" style="height: 100vh;"></div>
    </div>
</body>
<!-- MDB -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.1.0/mdb.umd.min.js"></script>
<script>
    document.getElementById('liveToastBtn').addEventListener('click', function () {
        var toast = new bootstrap.Toast(document.getElementById('liveToast'));
        toast.show();
        setTimeout(function () {
            toast.hide();
        }, 3000);
    });
</script>

</html>