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
	<form id="employee_salarytax_list_form" name="employee_salarytax_list_form" method="get" action="employeeSalaryTaxListForm">
		<div class="container" style="margin-top: 100px">
			<div class="row">
				<div class="col-md-4"></div>
				<div class="input-group mb-3 col-md-4 ">
					<div class="input-group-prepend">
						<span style="text-align: center; font-style: inherit; margin-bottom: 20px; font-size: 30px">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
							급여 리스트 </span>
					</div>
				</div>
				<div class="col-md-4"></div>
			</div>

			<table id="employeesalaryrollListdatatable" class="table table-striped table-bordered" style="width: 100%;">
				<thead>
					<tr>
						<th scope="col" style="text-align: center;">처리년도</th>
						<th scope="col" style="text-align: center;">처리 월</th>
						<th scope="col" style="text-align: center;">사원번호</th>
						<th scope="col" style="text-align: center;">이름</th>
						<th scope="col" style="text-align: center;">월 급</th>
						<th scope="col" style="text-align: center;">연 봉</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="salaryrollList" items="${salaryrollList}" varStatus="status">
						<tr>
							<td style="text-align: center; vertical-align: middle;">${salaryrollList.yyyy}</td>
							<td style="text-align: center; vertical-align: middle;">${salaryrollList.mm}</td>
							<td style="text-align: center; vertical-align: middle;">${salaryrollList.empcode}</td>
							<td style="text-align: center; vertical-align: middle;">${salaryrollList.name}</td>
							<td style="text-align: center; vertical-align: middle;">${salaryrollList.totalpay}</td>
							<td style="text-align: center; vertical-align: middle;">${salaryrollList.pay12}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<div class="row" style="margin-top: 10px">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<input type="text" id="yyyy" name="yyyy" placeholder="yyyy" style="margin-right: 10px;width: 100px" value="${yyyy}">
						<select id="mm" name="mm"  style="width: 100px;margin-right: 10px">
							<option value="01">01</option>	<option value="02">02</option>
							<option value="03">03</option>	<option value="04">04</option>
							<option value="05">05</option>	<option value="06">06</option>
							<option value="07">07</option>	<option value="08">08</option>
							<option value="09">09</option>	<option value="10">10</option>
							<option value="11">11</option>	<option value="12">12</option>
						</select>
						<button id="salary_search_btn" name="search_btn" type="submit" class="btn btn-success save" style="margin-right: 10px; color: #000000">검 색</button>
						<button id="reset_btn" name="reset_btn" type="reset" class="btn btn-danger" style="margin-right: 10px; color: #000000">리셋</button>
					</div>
				</div>
				<div class="col-md-3"></div>
			</div>

		</div>
	</form>
</body>
</html>