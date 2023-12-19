<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</head>
<style>
    body {
        margin: 0;
        overflow: hidden;
        height: 100vh;
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
            <div class="d-flex-center">
                <img src="<%= request.getContextPath() %>/resources/img/index.jpeg" alt="index.jpeg" width="100%" height="300px" style="margin-top: 10px">
            </div>
            <div class="d-flex-center mt-5">
                <div class="note note-success mb-3">
                    <span class="fs-3 display-6">원하시는 옵션을 선택해주세요.</span>
                </div>
            </div>
            <div class="d-flex-center">
                <!-- LINK -->
                <button type="button" class="btn btn-primary m-xl-3 w-50 rounded-9" data-mdb-ripple-init
                    style="height: 120px;" onclick="location.href='menu'">
                    <h1>현장 구매</h1>
                </button>
            </div>
            <div class=" d-flex-center">
                <!-- LINK -->
                <button type="button" class="btn btn-secondary m-xl-3 w-50 rounded-9" data-mdb-ripple-init
                    style="height: 120px;" onclick="location.href='menu.html'">
                    <h1>배송</h1>
                </button>
            </div>
        </div>
        <div class="col-md-3 bg-secondary-subtle" style="height:100vh"></div>
    </div>
</body>

</html>