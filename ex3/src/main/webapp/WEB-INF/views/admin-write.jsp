<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.1.0/mdb.min.css" rel="stylesheet" />å
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
                        <a class="navbar-brand mt-2 mt-lg-0" href="admin-menu">
                            <i class="fas fa-angle-left"></i>
                        </a>
                    </div>
                </div>
                <!-- Container wrapper -->
            </nav>
            <!-- Navbar -->
            <div class="mt-lg-3">
				<form action="${pageContext.request.contextPath}/kiosk/admin-upload" method="post" enctype="multipart/form-data">
                    <!-- 이미지 input -->
                    <div data-mdb-input-init class="form-outline mb-4">
						<input type="file" name="image" accept="image/*"  required class="form-control" />						
                    </div>

                    <!-- 상품명 input -->
                    <div data-mdb-input-init class="form-outline mb-4">
    					<input type="text" id="name" name="name" required class="form-control" />
                        <label class="form-label" for="name">상품명</label>
                    </div>

                    <!-- 가격 input -->
                    <div data-mdb-input-init class="form-outline mb-4">
                        <input type="text" id="price" name="price" required class="form-control" />
                        <label class="form-label" for="price">가격</label>
                    </div>

                    <!-- 상품 설명 input -->
                    <div data-mdb-input-init class="form-outline mb-4">
						<textarea id="description" name="info" required class="form-control"></textarea>
                        <label class="form-label" for="form6Example7">상품 설명</label>
                    </div>
            </div>
            <!-- Submit button -->
            <input type="submit" value="추가하기"  class="btn btn-success btn-block mb-4 text-white"/>
            </form>
        </div>
        <div class="col-md-3 bg-secondary-subtle" style="height:100vh"></div>
    </div>
</body>
<!-- MDB -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.1.0/mdb.umd.min.js"></script>

</html>