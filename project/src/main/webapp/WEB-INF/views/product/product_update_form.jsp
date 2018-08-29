<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form id="product_update_form" name="product_update_form" method="post"
		action="productUpdate" data-parsley-validate="true">
		<h1 style="text-align: center">재고물품 수정</h1>

		<div class="container">
			<div class="row">
				<div class="col-md-2"></div>
				<div class="input-group mb-3 col-md-8">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> <i
							class="fas fa-envelope" style="font-size: 10"> 재고물품 코드</i>
						</span>
					</div>
					<input type="text" id="product_update_form_procode" name="procode"
						class="form-control col-md-3" value="${product.procode}"
						aria-describedby="basic-addon1" readonly="readonly">
				</div>
			</div>

			<div class="row">
				<div class="col-md-2"></div>
				<div class="input-group mb-3 col-md-8">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"><i
							class="fas fa-user" style="font-size: 10"> 재고물품이름</i></span>
					</div>
					<input type="text" name="proname" class="form-control" value="${product.proname}"
						placeholder="이름 입력" aria-label="Name" maxlength="20"
						aria-describedby="basic-addon1" required="true"
						data-parsley-error-message="이름을 입력하세요!"
						data-parsley-errors-container="div[id='product_update_form_nameError']">
				</div>
			</div>
			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6">
					<div id="product_update_form_nameError" style="color: #f00"></div>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-2"></div>
				<div class="input-group mb-3 col-md-8">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"><i
							class="fas fa-user" style="font-size: 10"> 단위</i></span>
					</div>
					<input type="text" name="capacity" class="form-control" value="${product.capacity}"
						placeholder="단위 입력" aria-label="capacity" maxlength="20"
						aria-describedby="basic-addon1" required="true"
						data-parsley-error-message="단위를 입력하세요!"
						data-parsley-errors-container="div[id='product_update_form_capacityError']">
				</div>
			</div>
			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6">
					<div id="product_update_form_capacityError" style="color: #f00"></div>
				</div>
			</div>

			<div class="row">
				<div class="col-md-5"></div>
				<button type="submit" id="product_update_form_save"
					class="col-md-1 btn btn-primary"
					style="font-align: center; margin: 3px">저장</button>
				<button type="button" id="product_update_form_delete"
					class="col-md-1 btn btn-danger"
					style="font-align: center; margin: 3px">삭제</button>
				<button type="button" class="col-md-1 btn btn-warning"
					id="product_update_form_cancel"
					style="font-align: center; margin: 3px"
					onclick="location.href='productList'">취소</button>
				<div class="col-md-5"></div>
			</div>

			<div id="product_update_form_myModal" class="modal fade" role="dialog">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close " data-dismiss="modal">&times;</button>
						</div>
						<div class="modal-body" id="modal-body">
							<p>Some text in the modal.</p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-success modal_btn1"
								data-dismiss="modal">입력</button>
							<button type="button" class="btn btn-danger modal_btn2"
								data-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>

