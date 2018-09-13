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
	<form id="productstock_insert_form" name="productstock_insert_form"
		method="post" action="productStockInsert" data-parsley-validate="true">
		<input type="hidden" id="productstock_insert_form_confirm_yn"
			value="n">
		<h1 style="text-align: center">재고물품재고 등록</h1>

		<div class="container">
			<div class="row">
				<div class="col-md-2"></div>
				<div class="input-group mb-3 col-md-8">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> <i
							class="fas fa-envelope" style="font-size: 10"> 재고물품명</i>
						</span>
					</div>
					<select id="productstock_insert_form_procode" name="procode"
						style="text-align: center">
						<c:forEach var="product" items="${products}" varStatus="status">
							<option value="${product.procode}">${product.proname}---${product.capacity}</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6">
					<div id="productstock_insert_form_codeError" style="color: #f00"></div>
				</div>
			</div>

			<div class="row">
				<div class="col-md-2"></div>
				<div class="input-group mb-3 col-md-8">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"><i
							class="fas fa-user" style="font-size: 10"> 날짜</i></span>
					</div>
					<input type="text" id="productstock_insert_form_year" name="year" class="form-control"
						value="${productstock.year}" readonly="readonly" maxlength="4"
						aria-describedby="basic-addon1" required="true"> <span>-</span>
					<input type="text" id="productstock_insert_form_month" name="month" class="form-control"
						value="${productstock.month}" readonly="readonly" maxlength="2"
						aria-describedby="basic-addon1" required="true"> <span>-</span>
					<input type="text" id="productstock_insert_form_day" name="day" class="form-control"
						value="${productstock.day}" readonly="readonly" maxlength="2"
						aria-describedby="basic-addon1" required="true">
				</div>
			</div>

			<div class="row">
				<div class="col-md-2"></div>
				<div class="input-group mb-3 col-md-8">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"><i
							class="fas fa-user" style="font-size: 10"> 전일재고</i></span>
					</div>
					<input type="text" id="productstock_insert_form_preddstock"
						name="preddstock" class="form-control" required="true"
						readonly="readonly" value="0">
				</div>
			</div>

			<div class="row">
				<div class="col-md-2"></div>
				<div class="input-group mb-3 col-md-8">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"><i
							class="fas fa-user" style="font-size: 10"> 재고 증가량</i></span>
					</div>
					<input type="text" id="productstock_insert_form_incstock"
						name="incstock" class="form-control" value="0"
						onkeydown="onlyNumber(event)" onkeyup="removeChar(event)"
						style="ime-mode: disabled;" required="true">
				</div>
			</div>

			<div class="row">
				<div class="col-md-2"></div>
				<div class="input-group mb-3 col-md-8">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"><i
							class="fas fa-user" style="font-size: 10"> 재고 감소량</i></span>
					</div>
					<input type="text" id="productstock_insert_form_decstock"
						name="decstock" class="form-control" value="0"
						onkeydown="onlyNumber(event)" onkeyup="removeChar(event)"
						style="ime-mode: disabled;" required="true">
				</div>
			</div>

			<div class="row">
				<div class="col-md-2"></div>
				<div class="input-group mb-3 col-md-8">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"><i
							class="fas fa-user" style="font-size: 10"> 현재 재고량</i></span>
					</div>
					<input type="text" id="productstock_insert_form_curstock"
						name="curstock" class="form-control" value="0"
						onkeydown="onlyNumber(event)" onkeyup="removeChar(event)"
						style="ime-mode: disabled;" required="true" readonly="readonly">
				</div>
			</div>

			<div class="row">
				<div class="col-md-5"></div>
				<!-- submit을 type으로 지정하지 않고 버튼에 클릭에 따른 동작을 위의 Script에서 지정해서
				submit 동작을 실행 -->
				<button type="button" id="productstock_insert_form_save"
					class="col-md-1 btn btn-primary"
					style="font-align: center; margin: 3px">저장</button>
				<button type="button" class="col-md-1 btn btn-primary"
					id="productstock_insert_form_cancel"
					style="font-align: center; margin: 3px"
					onclick="location.href='productStockList'">취소</button>
				<div class="col-md-5"></div>
			</div>

			<!-- Modal -->
			<div id="productstock_insert_form_myModal" class="modal fade"
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

