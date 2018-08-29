<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	
</script>
<body>
	<form name="product_list" id="product_list" method="post">

		<div class="container" style="margin-top: 10px">
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-8 text-center">
					<h1 style="text-align: center">재고물품재고 관리</h1>
				</div>
				<div class="col-md-4"></div>
			</div>
			<table class="table table-bordered" style="text-align: center"
				id="dataTable">
				<thead class="thead-dark">
					<tr>
						<th scope="col">날짜</th>
						<th scope="col">재고이름</th>
						<th scope="col">단위</th>
						<th scope="col">전일재고</th>
						<th scope="col">증가량</th>
						<th scope="col">감소량</th>
						<th scope="col">현재재고</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="productstock" items="${productstocks}"
						varStatus="status">
						<tr>
							<td style="text-align: center; vertical-align: middle;"><a
								href="productStockUpdateForm?stockid=${productstock.stockid}">
									${productstock.date}</a></td>
							<td style="text-align: center; vertical-align: middle;">
								${productstock.proname}</td>
							<td style="text-align: center; vertical-align: middle;">
								${productstock.capacity}</td>
							<td style="text-align: center; vertical-align: middle;">
								${productstock.preddstock}</td>
							<td style="text-align: center; vertical-align: middle;">
								${productstock.incstock}</td>
							<td style="text-align: center; vertical-align: middle;">
								${productstock.decstock}</td>
							<td style="text-align: center; vertical-align: middle;">
								${productstock.curstock}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="row">
				<div>
					<button class="btn btn-primary" type="button"
						id="productstock_list_addBtn"
						onclick="location.href='productStockInsertForm'">재고물품 추가</button>
				</div>
			</div>
		</div>
	</form>
</body>
</html>