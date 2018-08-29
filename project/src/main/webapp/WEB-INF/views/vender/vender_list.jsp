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
	<form name="vender_list" id="vender_list" method="post">

		<div class="container" style="margin-top: 10px">
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-8 text-center">
					<h1 style="text-align: center">거래처관리</h1>
				</div>
				<div class="col-md-4"></div>
			</div>
			<table class="table table-bordered" style="text-align: center"
				id="dataTable">
				<thead class="thead-dark">
					<tr>
						<th scope="col">거래처코드</th>
						<th scope="col">거래처이름</th>
						<th scope="col">사업자번호</th>
						<th scope="col">대표이름</th>
						<th scope="col">거래처연락처</th>
						<th scope="col">우편번호</th>
						<th scope="col">도로명주소</th>
						<th scope="col">지번주소</th>
						<th scope="col">상세주소</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="vender" items="${venders}" varStatus="status">
						<tr>
							<td style="text-align: center; vertical-align: middle;">
								${vender.vendercode}</td>
							<td style="text-align: center; vertical-align: middle;"><a
								href="venderUpdateForm?vendercode=${vender.vendercode}"> ${vender.vendername}</a></td>
							<td style="text-align: center; vertical-align: middle;">
								${vender.busno}</td>
							<td style="text-align: center; vertical-align: middle;">
								${vender.ceoname}</td>
							<td style="text-align: center; vertical-align: middle;">
								${vender.phone}</td>
							<td style="text-align: center; vertical-align: middle;">
								${vender.zipcode}</td>
							<td style="text-align: center; vertical-align: middle;">
								${vender.newaddr}</td>
							<td style="text-align: center; vertical-align: middle;">
								${vender.oldaddr}</td>
							<td style="text-align: center; vertical-align: middle;">
								${vender.detailaddr}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="row">
				<div>
					<button class="btn btn-primary" type="button"
						id="vender_list_addBtn" onclick="location.href='venderInsertForm'">거래처 추가</button>
				</div>
			</div>
		</div>
	</form>
</body>
</html>