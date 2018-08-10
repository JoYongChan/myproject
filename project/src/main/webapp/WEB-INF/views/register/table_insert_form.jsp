<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form id="table_insert_form" name="table_insert_form" method="post" action="tableInsert" data-parsley-validate="true">
		<div class="container" style="margin-top: 30px">
			<div class="row">
				<div class="col-md-4"></div>
				<div class="input-group mb-3 col-md-4 ">
					<div class="input-group-prepend">
						<span style="text-align: center; font-style: inherit; margin-bottom: 20px; font-size: 30px">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp	테이블 계정 생성 </span>
					</div>
				</div>
				<div class="col-md-4"></div>
			</div>

			<div class="row">
				<div class="col-md-2"></div>
				<div class="input-group mb-3 col-md-8 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 120px"> Table Code </span>
					</div>
					<input type="text" id="tablecode" name="tablecode" class="form-control" placeholder="table code" 
					 style="ime-mode: disabled" aria-describedby="basic-addon1" maxlength="3">
					<button type="button" id="table_confirm" class="btn btn-primary" style="color: #000000">중복확인</button>
				</div>
			</div>

			<div class="row">
				<div class="col-md-2"></div>
				<div class="input-group mb-3 col-md-8 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 120px"> Table Pass </span>
					</div>
					<input type="text" id="tablepass" name="tablepass" class="form-control" placeholder="table password"
						style="ime-mode: disabled" aria-describedby="basic-addon1" maxlength="20">
				</div>
			</div>

			<div class="row" style="margin-bottom: 100px; margin-top: 20px">
				<div class="col-md-5"></div>
				<div class="col-md-4">
					<button id="table_save_btn" name="table_save_btn" type="submit"	class="btn btn-success save" style="color: #000000">저 장</button>
					<button id="cancel_btn" name="cancel_btn" type="button"	class="btn btn-danger save" style="margin-left: 10px; color: #000000">취 소</button>
				</div>
				<div class="col-md-3"></div>
			</div>

		</div>
	</form>
</body>
</html>
