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
	<form id="employee_salary_form" name="employee_salary_form" method="post" action="employeeSalary" data-parsley-validate="true">
	<input type="hidden" id="confirm_yn" value="n">
		<div class="container" style="margin-top: 30px">
			<div class="row">
				<div class="col-md-4"></div>
				<div class="input-group mb-3 col-md-4 ">
					<div class="input-group-prepend">
						<span style="text-align: center; font-style: inherit; margin-bottom: 20px; font-size: 30px">&nbsp&nbsp&nbsp&nbsp&nbsp 직원 급여 </span>
					</div>
				</div>
				<div class="col-md-4"></div>
			</div>
			
			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 120px"> 사원번호 </span>
					</div>
					<select id="selectemployee" name="empcode" style="width: 410px">
						<c:forEach var="employee" items="${employee}">
							<option value="${employee.empcode}" >${employee.empcode}</option>
						</c:forEach> 
					</select>
				</div>
				<div class="col-md-3"></div>
			</div>
			
			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 120px"> 이 름</span>
					</div>
					<input id="name" name="name" type="text" class="form-control" placeholder="Name" aria-label="Username" aria-describedby="basic-addon1">
				</div>
				<div class="col-md-3"></div>
			</div>
			
			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 120px"> 성 별</span>
					</div>
					<input id="gender" name="gender" type="text" class="form-control" placeholder="Gender" aria-label="Username" aria-describedby="basic-addon1">
				</div>
				<div class="col-md-3"></div>
			</div>
			
			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 120px"> 나 이</span>
					</div>
					<input id="age" name="age" type="text" class="form-control" placeholder="age" aria-label="Username" aria-describedby="basic-addon1">
				</div>
				<div class="col-md-3"></div>
			</div>
			
			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 120px"> 입사일</span>
					</div>
					<input id="hiredate" name="hiredate" type="text" class="form-control" placeholder="yyyy.mm.dd" aria-label="Username" aria-describedby="basic-addon1">
				</div>
				<div class="col-md-3"></div>
			</div>
			
			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 120px"> 직급</span>
					</div>
					<input id="memlevel" name="memlevel" type="text" class="form-control" placeholder="" aria-label="Username" aria-describedby="basic-addon1">
				</div>
				<div class="col-md-3"></div>
			</div>
			
			<div class="row">
				<div class="col-md-12" style="text-align: center">
					<label style="background-color: gray; color: black;width: 550px">소득 내역</label>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 120px"> 기본급 </span>
					</div>
					<input id="pay" name="pay" type="text" class="form-control" placeholder="" value="0" aria-label="Username" aria-describedby="basic-addon1"	>
					
						<span class="input-group-text" style="width: 120px"> 급여 </span>
						<input id="extra" name="extra" type="text" class="form-control" placeholder="" value="0" aria-label="Username" aria-describedby="basic-addon1"	>
				</div>
			</div>
			
			
			<div class="row">
				<div class="col-md-12" style="text-align: center">
					<label style="background-color: gray; color: black;width: 550px">부양 가족 공제</label>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-9 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 100px"> 배우자 </span>
					</div>
					<select id="partner" name="partner"  style="width: 130px">
						<option value="0">0</option>
						<option value="1">1</option>
					</select>
					<div class="input-group-prepend" style="margin-left: 50px">
						<span class="input-group-text" style="width: 100px"> 자녀20 </span>
					</div>
					<select id="dependent20" name="dependent20"  style="width: 130px">
						<option value="0">0</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
					</select>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-9 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 100px"> 부양자60 </span>
					</div>
					<select id="dependent60" name="dependent60"  style="width: 130px">
						<option value="0">0</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
					</select>
					<div class="input-group-prepend" style="margin-left: 50px">
						<span class="input-group-text" style="width: 100px"> 장애인 </span>
					</div>
					<select id="disabled" name="disabled"  style="width: 130px"> 
						<option value="0">0</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
					</select>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-9 " >
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 100px"> 부녀가장 </span>
					</div>
					<select id="womanpower" name="womanpower"  style="width: 130px">
						<option value="0">0</option>
						<option value="1">1</option>
					</select>
					<div class="input-group-prepend" style="margin-left: 50px">
						<span class="input-group-text" style="width: 100px"> 급여계산 </span>
					</div>
					<select id="yn" name="yn"  style="width: 130px">
						<option value="y">yes</option>
						<option value="n">no</option>
					</select>
				</div>
			</div>
			
			<div class="row" style="margin-bottom: 100px; margin-top: 20px">
				<div class="col-md-5"></div>
				<div class="col-md-4">
					<button id="employee_salary_save_btn" name="employee_salary_save_btn" type="button" class="btn btn-success save"
					 style="margin-right: 10px; color: #000000">저 장</button>
					<button  id="cancel_btn" name="cancel_btn"  type="reset" class="btn btn-danger" style="margin-left: 10px; color: #000000">취 소</button>
				</div>
				<div class="col-md-3"></div>
			</div>
			
		</div>
</form>
</body>
</html>