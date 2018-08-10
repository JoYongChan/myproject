<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 각 필드들의 id로 지정된 것들은 jQuery와 JavaScript에서 인식하는데에 사용 -->
	<!-- 컨트롤러에서는 name으로 매칭해서 사용 -->
	<form id="product_insert_form" name="product_insert_form" method="post"
		action="productInsert" data-parsley-validate="true">
		<input type="hidden" id="product_insert_form_confirm_yn" value="n">
		<h1 style="text-align: center">재고물품 등록</h1>

		<div class="container">
			<div class="row">
				<div class="col-md-2"></div>
				<div class="input-group mb-3 col-md-8">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> <i
							class="fas fa-envelope" style="font-size: 10"> 재고물품 코드</i>
						</span>
					</div>
					<!-- ime-mode는 입력제어 disabled일 경우 영어와 숫자만 입력 -->
					<input type="text" id="product_insert_form_procode" name="procode"
						maxlength="4" onkeydown="onlyNumber(event)"
						onkeyup="removeChar(event)" style="ime-mode: disabled;"
						class="form-control col-md-3" placeholder="Code" aria-label="code"
						aria-describedby="basic-addon1" required="true"
						data-parsley-error-message="code를 입력하세요!"
						data-parsley-errors-container="div[id='product_insert_form_codeError']">
					<button type="button" id="product_insert_form_confirm"
						class="col-md-2 btn btn-primary"
						style="font-align: center; margin: 3px">중복확인</button>
				</div>
			</div>
			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6">
					<div id="product_insert_form_codeError" style="color: #f00"></div>
				</div>
			</div>

			<div class="row">
				<div class="col-md-2"></div>
				<div class="input-group mb-3 col-md-8">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"><i
							class="fas fa-user" style="font-size: 10"> 재고물품이름</i></span>
					</div>
					<input type="text" name="proname" class="form-control"
						placeholder="이름 입력" aria-label="Name" maxlength="20"
						aria-describedby="basic-addon1" required="true"
						data-parsley-error-message="이름을 입력하세요!"
						data-parsley-errors-container="div[id='product_insert_form_nameError']">
				</div>
			</div>
			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6">
					<div id="product_insert_form_nameError" style="color: #f00"></div>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-2"></div>
				<div class="input-group mb-3 col-md-8">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"><i
							class="fas fa-user" style="font-size: 10"> 단위</i></span>
					</div>
					<input type="text" name="capacity" class="form-control"
						placeholder="단위 입력" aria-label="capacity" maxlength="20"
						aria-describedby="basic-addon1" required="true"
						data-parsley-error-message="단위를 입력하세요!"
						data-parsley-errors-container="div[id='product_insert_form_capacityError']">
				</div>
			</div>
			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6">
					<div id="product_insert_form_capacityError" style="color: #f00"></div>
				</div>
			</div>

			<div class="row">
				<div class="col-md-5"></div>
				<!-- submit을 type으로 지정하지 않고 버튼에 클릭에 따른 동작을 위의 Script에서 지정해서
				submit 동작을 실행 -->
				<button type="submit" id="product_insert_form_save"
					class="col-md-1 btn btn-primary"
					style="font-align: center; margin: 3px">저장</button>
				<button type="button" class="col-md-1 btn btn-primary"
					id="product_insert_form_cancel"
					style="font-align: center; margin: 3px"
					onclick="location.href='productList'">취소</button>
				<div class="col-md-5"></div>
			</div>

			<!-- Modal -->
			<div id="product_insert_form_myModal" class="modal fade" role="dialog">
				<div class="modal-dialog">

					<!-- Modal content-->
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

