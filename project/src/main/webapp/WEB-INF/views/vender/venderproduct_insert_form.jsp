<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 각 필드들의 id로 지정된 것들은 jQuery와 JavaScript에서 인식하는데에 사용 -->
	<!-- 컨트롤러에서는 name으로 매칭해서 사용 -->
	<form id="venderproduct_insert_form" name="venderproduct_insert_form"
		method="post" action="venderproductInsert"
		data-parsley-validate="true">
		<input type="hidden" id="venderproduct_insert_form_confirm_yn"
			value="n">
		<h1 style="text-align: center">거래처 등록</h1>

		<div class="container">
			<div class="row">
				<div class="col-md-2"></div>
				<div class="input-group mb-3 col-md-8">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> <i
							class="fas fa-envelope" style="font-size: 10"> 거래처상품 코드</i>
						</span>
					</div>
					<!-- ime-mode는 입력제어 disabled일 경우 영어와 숫자만 입력 -->
					<input type="text" id="venderproduct_insert_form_venderproductcode"
						name="venderproductcode" maxlength="4"
						onkeydown="onlyNumber(event)" onkeyup="removeChar(event)"
						style="ime-mode: disabled;" class="form-control col-md-3"
						placeholder="Code" aria-label="code"
						aria-describedby="basic-addon1" required="true"
						data-parsley-error-message="거래처상품코드를 입력하세요!"
						data-parsley-errors-container="div[id='venderproduct_insert_form_productcodeError']">
					<button type="button" id="venderproduct_insert_form_confirm"
						class="col-md-2 btn btn-primary"
						style="font-align: center; margin: 3px">중복확인</button>
				</div>
			</div>
			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6">
					<div id="venderproduct_insert_form_productcodeError"
						style="color: #f00"></div>
				</div>
			</div>

			<div class="row">
				<div class="col-md-2"></div>
				<div class="input-group mb-3 col-md-8">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"><i
							class="fas fa-user" style="font-size: 10"> 거래처이름</i></span>
					</div>
					<select id="venderproduct_insert_form_vendcode" name="vendercode"
						style="text-align: center">
						<c:forEach var="vender" items="${venders}"
							varStatus="status">
							<option value="${vender.vendercode}">${vender.vendername}</option>
						</c:forEach>
					</select>
				</div>
			</div>

			<div class="row">
				<div class="col-md-2"></div>
				<div class="input-group mb-3 col-md-8">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"><i
							class="fas fa-user" style="font-size: 10"> 재고물품 이름</i></span>
					</div>
					<select id="venderproduct_insert_form_procode" name="procode"
						style="text-align: center">
						<c:forEach var="product" items="${products}"
							varStatus="status">
							<option value="${product.procode}">${product.proname}----${product.capacity}</option>
						</c:forEach>
					</select>
				</div>
			</div>

			<div class="row">
				<div class="col-md-2"></div>
				<div class="input-group mb-3 col-md-8">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"><i
							class="fas fa-user" style="font-size: 10"> 물품 가격</i></span>
					</div>
					<input type="text" name="price" class="form-control"
						placeholder="물품 가격 입력" aria-label="price"
						aria-describedby="basic-addon1" required="true"
						data-parsley-error-message="가격을 입력하세요!"
						data-parsley-errors-container="div[id='venderproduct_insert_form_priceError']">
				</div>
			</div>
			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6">
					<div id="venderproduct_insert_form_priceError"
						style="color: #f00"></div>
				</div>
			</div>

			<div class="row">
				<div class="col-md-2"></div>
				<div class="input-group mb-3 col-md-8">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"><i
							class="fas fa-user" style="font-size: 10"> 메모</i></span>
					</div>
					<input type="text" name="memo" class="form-control"
						placeholder="메모 입력" aria-label="memo"
						aria-describedby="basic-addon1">
				</div>
			</div>

			<div class="row">
				<div class="col-md-5"></div>
				<!-- submit을 type으로 지정하지 않고 버튼에 클릭에 따른 동작을 위의 Script에서 지정해서
				submit 동작을 실행 -->
				<button type="submit" id="venderproduct_insert_form_save"
					class="col-md-1 btn btn-primary"
					style="font-align: center; margin: 3px">저장</button>
				<button type="button" class="col-md-1 btn btn-primary"
					id="venderproduct_insert_form_cancel"
					style="font-align: center; margin: 3px"
					onclick="location.href='venderList'">취소</button>
				<div class="col-md-5"></div>
			</div>

			<!-- Modal -->
			<div id="venderproduct_insert_form_myModal" class="modal fade"
				role="dialog">
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
