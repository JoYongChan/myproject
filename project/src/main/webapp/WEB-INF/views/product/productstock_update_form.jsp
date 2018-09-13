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
	<form id="productstock_update_form" name="productstock_update_form"
		method="post" action="productStockUpdate" data-parsley-validate="true">
		<h1 style="text-align: center">재고물품재고 등록</h1>
		<input type="hidden" id="productstock_update_form_hiddenstockid" name="stockid" value="${productstock.stockid}">
		<input type="hidden" id="productstock_update_form_hiddencurstock" value="${productstock.curstock}">
		<div class="container">
			<div class="row">
				<div class="col-md-2"></div>
				<div class="input-group mb-3 col-md-8">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> <i
							class="fas fa-envelope" style="font-size: 10"> 재고물품명</i>
						</span>
					</div>
					<input type="text" id="productstock_update_form_proname" class="form-control"
						value="${productstock.proname}---${productstock.capacity}" readonly="readonly"
						aria-describedby="basic-addon1">
				</div>
			</div>

			<div class="row">
				<div class="col-md-2"></div>
				<div class="input-group mb-3 col-md-8">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"><i
							class="fas fa-user" style="font-size: 10"> 날짜</i></span>
					</div>
					<input type="text" id="productstock_update_form_year" name="year" class="form-control"
						value="${productstock.year}" readonly="readonly"
						aria-describedby="basic-addon1"> <span>-</span>
					<input type="text" id="productstock_update_form_month" name="month" class="form-control"
						value="${productstock.month}" readonly="readonly"
						aria-describedby="basic-addon1"> <span>-</span>
					<input type="text" id="productstock_update_form_day" name="day" class="form-control"
						value="${productstock.day}" readonly="readonly"
						aria-describedby="basic-addon1">
				</div>
			</div>

			<div class="row">
				<div class="col-md-2"></div>
				<div class="input-group mb-3 col-md-8">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"><i
							class="fas fa-user" style="font-size: 10"> 전일재고</i></span>
					</div>
					<input type="text" id="productstock_update_form_preddstock"
						name="preddstock" class="form-control"
						readonly="readonly" value="${productstock.preddstock}">
				</div>
			</div>

			<div class="row">
				<div class="col-md-2"></div>
				<div class="input-group mb-3 col-md-8">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"><i
							class="fas fa-user" style="font-size: 10"> 재고 증가량</i></span>
					</div>
					<input type="text" id="productstock_update_form_incstock"
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
					<input type="text" id="productstock_update_form_decstock"
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
					<input type="text" id="productstock_update_form_curstock"
						name="curstock" class="form-control" value="${productstock.curstock}"
						onkeydown="onlyNumber(event)" onkeyup="removeChar(event)"
						style="ime-mode: disabled;" required="true" readonly="readonly">
				</div>
			</div>

			<div class="row">
				<div class="col-md-5"></div>
				<button type="submit" id="productstock_update_form_save"
					class="col-md-1 btn btn-primary"
					style="font-align: center; margin: 3px">저장</button>
				<button type="button" class="col-md-1 btn btn-primary"
					id="productstock_update_form_cancel"
					style="font-align: center; margin: 3px"
					onclick="location.href='productStockList'">취소</button>
				<div class="col-md-5"></div>
			</div>

			<div id="productstock_update_form_myModal" class="modal fade"
				role="dialog">
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

