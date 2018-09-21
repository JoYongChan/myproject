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
	<form id="employee_list_form" name="employee_list_form" method="get" action="employeeListForm">
		<div class="container" style="margin-top: 30px">
			<div class="row">
				<div class="col-md-4"></div>
				<div class="input-group mb-3 col-md-4 ">
					<div class="input-group-prepend">
						<span style="text-align: center; font-style: inherit; margin-bottom: 20px; font-size: 30px">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 직원 리스트 </span>
					</div>
				</div>
				<div class="col-md-4"></div>
			</div>
			<table id="employeedatatable" class="table table-striped table-bordered" style="width:100%;">
				<thead>
					<tr>
						<th scope="col" style="text-align: center;">사번</th>
						<th scope="col" style="text-align: center;">이름</th>
						<th scope="col" style="text-align: center;">나이</th>
						<th scope="col" style="text-align: center;">성별</th>
						<th scope="col" style="text-align: center;">우편번호</th>
						<th scope="col" style="text-align: center;">신주소</th>
						<th scope="col" style="text-align: center;">세부주소</th>
						<th scope="col" style="text-align: center;">전화번호</th>
						<th scope="col" style="text-align: center;">직급</th>
						<th scope="col" style="text-align: center;">지점</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="employees" items="${employees}" varStatus="status">
						<tr>
							<td style="text-align: center; vertical-align: middle;">
								<a href="employeeDetail?empcode=${employees.empcode}">${employees.empcode}</a> 
							</td>
							<td style="text-align: center; vertical-align: middle;">${employees.name}</td>
							<td style="text-align: center; vertical-align: middle;">${employees.age}</td>
							<td style="text-align: center; vertical-align: middle;">${employees.gender}</td>
							<td style="text-align: center; vertical-align: middle;">${employees.postno}</td>
							<td style="text-align: center; vertical-align: middle;">${employees.newaddr}</td>
							<td style="text-align: center; vertical-align: middle;">${employees.detailaddr}</td>
							<td style="text-align: center; vertical-align: middle;">${employees.phone}</td>
							<td style="text-align: center; vertical-align: middle;">${employees.memlevel}</td>
							<td style="text-align: center; vertical-align: middle;">${employees.storename}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div style="margin-bottom: 100px"></div>
		</div>
	</form>

</body>
</html>