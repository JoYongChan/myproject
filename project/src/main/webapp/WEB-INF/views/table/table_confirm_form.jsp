<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<style>
.pre-scrollable {
	max-height: 1000px;
	overflow-y: scroll;
}
</style>

</head>

<body>
	<form data-parsley-validate="true" id="buy_insert_form"
		action="buyInsertC" method="post" enctype="multipart/form-data"
		role="form">


		<div class="row">
			<div class="col-md-6 text-center">
				<input type="text" id="confirmVenderCheck" value='n'
					style="visibility: hidden;"> <input type="text" id="seq"
					name="seq" value=0 style="visibility: hidden;">
			</div>
		</div>

		<!-- 거래처 -->

		<div class="row col-md-12">
			<div class="col-md-6 pre-scrollable ">

				<%@ include file="../table/test4chat.jsp"%>

				<div style="height: 15px"></div>

				<table id="table4confirm" class="table table-striped table-bordered"
					style="width: 100%">
					<thead>
						<tr>
							<th>#</th>
							<th>품명</th>
							<th>단가</th>
							<th>수량</th>
							<th>금액</th>
							<th>확인</th>
							<th>테이블</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="orders" items="${orders}">
							<tr>
									<td style="vertical-align: middle" name="seq">${orders.seq}</td>
									<td style="vertical-align: middle"name="proname">${orders.proname}</td>
									<td style="vertical-align: middle"name="price">${orders.price}</td>
									<td style="vertical-align: middle"name="qty">${orders.qty}</td>
									<td style="vertical-align: middle"name="sum">${orders.sum}</td>
									<td style="vertical-align: middle"name="orderchk">${orders.orderchk}</td>
									<td style="vertical-align: middle"name="tableno">${orders.tableno}</td>
							</tr>

						</c:forEach>
					</tbody>
				</table>

				<div style="height: 15px"></div>
				
				<div class="row"  >
					<div style="width:15%"></div>
					<button type="button" style="width:30%" id="orderInsert" class="btn btn-primary">주문넣기</button>
					<div style="width:10%"></div>
					<button type="button" style="width:30%" id="orderComplete" class="btn btn-primary">주문완료</button>
					<div style="width:15%"></div>
				</div>
				
			</div>

			<div class="col-md-6 pre-scrollable " align="center">

				<div style="height: 15px"></div>

				<table id="table4order" class="table table-striped table-bordered"
					style="width: 100%">
					<thead>
						<tr>
							<th>주문순서</th>
							<th>품명</th>
							<th>단가</th>
							<th>수량</th>
							<th>금액</th>
							<th>테이블</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="orders" items="${tables}">
							<tr>
									<td style="vertical-align: middle" name="seq">${orders.seq}</td>
									<td style="vertical-align: middle"name="proname">${orders.proname}</td>
									<td style="vertical-align: middle"name="price">${orders.price}</td>
									<td style="vertical-align: middle"name="qty">${orders.qty}</td>
									<td style="vertical-align: middle"name="sum">${orders.sum}</td>
									<td style="vertical-align: middle"name="orderchk">${orders.orderchk}</td>
									<td style="vertical-align: middle"name="tableno">${orders.tableno}</td>

							</tr>

						</c:forEach>
					</tbody>
				</table>

			</div>
		</div>
	</form>
</body>
</html>