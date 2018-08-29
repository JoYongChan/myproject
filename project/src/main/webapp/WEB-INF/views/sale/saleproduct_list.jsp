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
	<form name="saleproduct_list" id="saleproduct_list" method="post">

		<div class="container" style="margin-top: 10px">
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-8 text-center">
					<h1 style="text-align: center">판매물품 관리</h1>
				</div>
				<div class="col-md-4"></div>
			</div>
			<table class="table table-bordered" style="text-align: center"
				id="dataTable">
				<thead class="thead-dark">
					<tr>
						<th scope="col">판매코드</th>
						<th scope="col">판매이름</th>
						<th scope="col">단위</th>
						<th scope="col">판매가</th>
						<th scope="col">메모</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="saleproduct" items="${saleproducts}" varStatus="status">
						<tr>
							<td style="text-align: center; vertical-align: middle;">
								${saleproduct.saleprocode}</td>
							<td style="text-align: center; vertical-align: middle;"><a
								href="saleproductUpdateForm?saleprocode=${saleproduct.saleprocode}">
									${saleproduct.saleproname}</a></td>
							<td style="text-align: center; vertical-align: middle;">
								${saleproduct.saleprocapacity}</td>
							<td style="text-align: center; vertical-align: middle;">
								${saleproduct.saleproprice}</td>
							<td style="text-align: center; vertical-align: middle;">
								${saleproduct.memo}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="row">
				<div>
					<button class="btn btn-primary" type="button"
						id="saleproduct_list_addBtn" onclick="location.href='saleproductInsertForm'">판매물품 추가</button>
				</div>
			</div>
		</div>
	</form>
</body>
</html>