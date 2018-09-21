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
	<form id="balance_list" action="balanceList" method="get">

		<div class="container" style="margin-top: 70px">
			<div class="row"style="margin-top: 80px">
				<div class="col-md-2"></div>
				<div class="col-md-8 text-center">
					<h1 style="text-align: center">고객 목록</h1>
				</div>
				<div class="col-md-4"></div>
			</div>
			<table id="example" class="table table-striped table-bordered"
				cellspacing="0" style="text-align: center" width="100%">
				<thead>
					<tr style="text-align: center">
						<th>이름</th>
						<th>생년월일</th>
						<th>성별</th>
						<th>휴대폰 번호</th>
						<th>우편번호</th>
						<th>주소</th>
						<th>가입일</th>
						<th>포인트</th>
					</tr>
				</thead>
				<c:forEach var="guset" items="${gusets}" varStatus="status">
					<tr>
						<td style="text-align: ceter; vertical-align: middle:">${guset.name}</td>
						<td style="text-align: ceter; vertical-align: middle;">${guset.birthday}</td>
						<td style="text-align: ceter; vertical-align: middle:">${guset.gender}</td>
						<td style="text-align: ceter; vertical-align: middle:"><a
							href="gusetUpdateForm?phone=${guset.phone}&birthday=${guset.birthday}">${guset.phone}</a></td>
						<td style="text-align: ceter; vertical-align: middle:">${guset.postno}</td>
						<td style="text-align: ceter; vertical-align: middle:">${guset.addr1}${guset.addr2}${guset.addr3}</td>
						<td style="text-align: ceter; vertical-align: middle:">${guset.inputdate}</td>
						<td style="text-align: ceter; vertical-align: middle:">${guset.point}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</form>
</body>
</html>