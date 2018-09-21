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
	<form id="employee_salary_list_form" name="employee_salary_list_form" method="get" action="employeeSalaryListForm">
		<div class="container" style="margin-top: 30px">
			<div class="row">
				<div class="col-md-4"></div>
				<div class="input-group mb-3 col-md-4 ">
					<div class="input-group-prepend">
						<span style="text-align: center; font-style: inherit; margin-bottom: 20px; font-size: 30px">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 직원 급여리스트 </span>
					</div>
				</div>
				<div class="col-md-4"></div>
			</div>
			<table id="employeesalarydatatable" class="table table-striped table-bordered" style="width:100%;">
				<thead>
					<tr>
						<th scope="col" style="text-align: center;">사번</th>
						<th scope="col" style="text-align: center;">이름</th>
						<th scope="col" style="text-align: center;">성별</th>
						<th scope="col" style="text-align: center;">배우자</th>
						<th scope="col" style="text-align: center;">자녀</th>
						<th scope="col" style="text-align: center;">부모</th>
						<th scope="col" style="text-align: center;">장애인</th>
						<th scope="col" style="text-align: center;">부녀가장</th>
						<th scope="col" style="text-align: center;">기본급</th>
						<th scope="col" style="text-align: center;">급여</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="salarys" items="${salarys}" varStatus="status">
						<tr>
							<td style="text-align: center; vertical-align: middle;">
								<a href="salaryDetail?empcode=${salarys.empcode}">${salarys.empcode}</a> 
							</td>
							<td style="text-align: center; vertical-align: middle;">${salarys.name}</td>
							<td style="text-align: center; vertical-align: middle;">${salarys.gender}</td>
							<td style="text-align: center; vertical-align: middle;">${salarys.partner}</td>
							<td style="text-align: center; vertical-align: middle;">${salarys.dependent20}</td>
							<td style="text-align: center; vertical-align: middle;">${salarys.dependent60}</td>
							<td style="text-align: center; vertical-align: middle;">${salarys.disabled}</td>
							<td style="text-align: center; vertical-align: middle;">${salarys.womanpower}</td>
							<td style="text-align: center; vertical-align: middle;">${salarys.pay}</td>
							<td style="text-align: center; vertical-align: middle;">${salarys.extra}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div style="margin-bottom: 100px"></div>
		</div>
	</form>

</body>
</html>