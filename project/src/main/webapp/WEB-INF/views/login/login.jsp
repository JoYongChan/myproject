<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>SB Admin - Login</title>

<!-- Bootstrap core CSS-->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<!-- Custom styles for this template-->
<link href="css/sb-admin.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body class="bg-dark">
	<div class="container">
      <div class="card card-login mx-auto mt-5">
        <div class="card-header">Login</div>
        <div class="card-body">
          <form>
            <div class="form-group">
                <input type="text" id="inputEmail" class="form-control" placeholder="code" required="required" autofocus="autofocus">
            </div>
            <div class="form-group">
                <input type="password" id="inputPassword" class="form-control" placeholder="Password" required="required">
            </div>
            <div class="form-group">
            </div>
            <a class="btn btn-primary btn-block" href="home">매장관리자 Login</a>
            <a class="btn btn-primary btn-block" href="home">테이블계정 Login</a>
          </form>
          <div class="text-center">
            <a class="d-block small mt-3" href="storeAdmin">매장 관리자 계정 생성</a>
            <a class="d-block small" href="tableAccount">테이블 계정 생성</a>
          </div>
        </div>
      </div>
    </div>


	<!-- Bootstrap core JavaScript-->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>
</body>
</html>