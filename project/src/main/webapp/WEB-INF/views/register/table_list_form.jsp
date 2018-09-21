<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form id="store_list_form" name="store_list_form" method="get" action="storeListForm">
		<div class="container" style="margin-top: 100px">
			<div class="row">
				<div class="col-md-4"></div>
				<div class="input-group mb-3 col-md-4 ">
					<div class="input-group-prepend">
						<span style="text-align: center; font-style: inherit; margin-bottom: 20px; font-size: 30px">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 매장 리스트 </span>
					</div>
				</div>
				<div class="col-md-4"></div>
			</div>
			<table id="tabledatatable" class="table table-striped table-bordered" style="width:100%;">
				<thead>
					<tr>
						<th scope="col" style="text-align: center;">테이블 번호</th>
						<th scope="col" style="text-align: center;">매장 번호</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="tableaccounts" items="${tableaccounts}" varStatus="status">
						<tr>
							<td style="text-align: center; vertical-align: middle;">
								<a href="tableDetail?tablecode=${tableaccounts.tablecode}">${tableaccounts.tablecode}</a>
							</td>
							<td style="text-align: center; vertical-align: middle;">${tableaccounts.storecode}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
		</div>
	</form>

</body>
</html>