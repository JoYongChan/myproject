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
	<form id="employee_commute_list_form" name="employee_commute_list_form" method="get" action="employeeCommuteListForm">
		<div class="container" style="margin-top: 30px">
			<div class="row">
				<div class="col-md-4"></div>
				<div class="input-group mb-3 col-md-4 ">
					<div class="input-group-prepend">
						<span style="text-align: center; font-style: inherit; margin-bottom: 20px; font-size: 30px">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 직원 근태 리스트 </span>
					</div>
				</div>
				<div class="col-md-4"></div>
			</div>
			<table id="employeecommutedatatable" class="table table-striped table-bordered" style="width:100%;">
				<thead>
					<tr>
						<th scope="col" style="text-align: center;">사번</th>
						<th scope="col" style="text-align: center;">날짜</th>
						<th scope="col" style="text-align: center;">출근시간</th>
						<th scope="col" style="text-align: center;">퇴근시간</th>
						<th scope="col" style="text-align: center;">출근기록</th>
						<th scope="col" style="text-align: center;">퇴근기록</th>
						<th scope="col" style="text-align: center;">기타기록</th>
						<th scope="col" style="text-align: center;">메모</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="commutes" items="${commutes}" varStatus="status">
						<tr>
							<td style="text-align: center; vertical-align: middle;">
								<a href="employeeCommuteDetail?empcode=${commutes.empcode}&commutedate=${commutes.commutedate}">${commutes.empcode}</a> 
							</td>
							<td style="text-align: center; vertical-align: middle;">${commutes.commutedate}</td>
							<td style="text-align: center; vertical-align: middle;">${commutes.attendancetime}</td>
							<td style="text-align: center; vertical-align: middle;">${commutes.leaveworktime}</td>
							<td style="text-align: center; vertical-align: middle;">${commutes.attendancetype}</td>
							<td style="text-align: center; vertical-align: middle;">${commutes.leaveworktype}</td>
							<td style="text-align: center; vertical-align: middle;">${commutes.statetype}</td>
							<td style="text-align: center; vertical-align: middle;">${commutes.memo}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div style="margin-bottom: 100px"></div>
		</div>
	</form>
	
</body>
</html>