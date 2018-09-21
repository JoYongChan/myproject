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
<!-- Bootstrap core CSS-->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<!-- Custom styles for this template-->
<link href="css/sb-admin.css" rel="stylesheet">
<style>
body{ 
    margin: 0;
    padding: 0;
    height: 100%;
}
.bgimg {
    border: 0;
    padding: 0; 
    background-image: url('resources/img/restaurant5.jpg');
    min-height: 100%;
    background-position: center;
    background-size: cover;
}
</style>
<title>Insert title here</title>
</head>
<body class="bgimg">
<form  id="table_login_form" name="table_login_form" method="post" action="tableLogin" data-parsley-validate="true">
	<div class="container">
      <div class="card card-login mx-auto mt-5">
        <div class="card-header">Table Account Login Fail</div>
        <div class="card-body">
          <form>
            <div class="form-group">
                <input type="text" id="tablecode" name="tablecode" class="form-control" placeholder="code" required="required" autofocus="autofocus">
            </div>
            <div class="form-group">
                <input type="password" id="tablepass" name="tablepass" class="form-control" placeholder="Password" required="required">
            </div>
            <div class="form-group">
            </div>
              <button  id="table_login_btn" name="table_login_btn"  type="submit" class="btn btn-primary save" style="width: 350px"> Table Account Login </button>
          </form>
        </div>
      </div>
    </div>


	<!-- Bootstrap core JavaScript-->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>
	</form>
</body>
</html>