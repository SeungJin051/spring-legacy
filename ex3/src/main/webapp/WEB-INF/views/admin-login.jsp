<!-- webapp/WEB-INF/views/login.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
        <div class="col-md-6 bg-secondary-subtle">
            <div class="container p-xxl-5 h-100">
                <div class="row d-flex align-items-center justify-content-center h-100">
                    <div class="bg-white w-75 p-xxl-5">
                        <div class=" note note-danger mb-5">
                            <h3 class="d-flex-center">관리자 로그인</h3>
                        </div>
                        <!-- 속성 넣기 -->
								<form action="/kiosk/admin-login" method="get">
							        <label for="id">ID:</label>
							        <input type="text" id="id" name="id" required class="form-control form-control-lg bg-body-secondary">
							        <br>
							        <label for="password">Password:</label>
							        <input type="password" id="password" name="password" required class="form-control form-control-lg bg-body-secondary">
							        <br>
							        <input type="submit" value="Login" class="btn w-100">
							        
							         <button type="button" class="btn w-100" onclick="location.href='menu'">
							         	<i class="fas fa-xmark"></i>
							         </button>
							    </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3 bg-secondary-subtle" style="height:100vh"></div>
    </div>
</body>
<!-- MDB -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.1.0/mdb.umd.min.js"></script>

</html>