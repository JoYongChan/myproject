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
	<input type="hidden" id="tableconfirm_yn" value="n">
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
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 120px"> Table Code </span>
					</div>
					<input type="text" id="tablecode" name="tablecode" class="form-control" placeholder="table code" 
					 style="ime-mode: disabled" aria-describedby="basic-addon1" maxlength="10">
					<button type="button" id="table_confirm" class="btn btn-primary" style="color: #000000">중복확인</button>
				</div>
			</div>

			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 120px"> Table Pass </span>
					</div>
					<input type="password" id="tablepass" name="tablepass" class="form-control" placeholder="table password"
						style="ime-mode: disabled" aria-describedby="basic-addon1" maxlength="20">
				</div>
			</div>

			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 120px"> store code </span>
					</div>
					<input type="text" id="storecode" name="storecode" class="form-control" placeholder=""
						style="ime-mode: disabled" aria-describedby="basic-addon1" maxlength="4" value="${sessionstorecode}" readonly="readonly">
				</div>
			</div>

			<div class="row" style="margin-bottom: 100px; margin-top: 20px">
				<div class="col-md-5"></div>
				<div class="col-md-4">
					<button id="table_save_btn" name="table_save_btn" type="button"	class="btn btn-success " style="color: #000000">저 장</button>
					<button id="cancel_btn" name="cancel_btn" type="button"	class="btn btn-danger" style="margin-left: 10px; color: #000000">취 소</button>
				</div>
				<div class="col-md-3"></div>
			</div>
			
			<!-- Modal -->
			<div class="modal fade" id="confirmModal" role="dialog">
				<div class="modal-dialog modal-sm">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>
						<div class="modal-body" id="confirm-modal-body">
						</div>
						<div class="modal-footer">
						<button type="button" id="confirm_modal_btn1" class="btn btn-success modal_btn1" data-dismiss="modal">사용</button>
							<button type="button" id="confirm_modal_btn2" class="btn btn-danger modal_btn2"	data-dismiss="modal">취소</button>
						</div>
					</div>
				</div>
			</div>

		</div>
	</form>
</body>
</html>
