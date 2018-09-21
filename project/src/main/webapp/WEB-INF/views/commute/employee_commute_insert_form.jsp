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
	<form id="employee_commute_insert_form" name="employee_commute_insert_form" method="post" action="employeeCommuteInsert" data-parsley-validate="true"
	enctype="multipart/form-data">
		<input type="hidden" id="employeeconfirm_yn" value="n">
		<div class="container" style="margin-top: 30px">
			<div class="row">
				<div class="col-md-4"></div>
				<div class="input-group mb-3 col-md-4 ">
					<div class="input-group-prepend">
						<span style="text-align: center; font-style: inherit; margin-bottom: 20px; font-size: 30px">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp	직원 근태 등록 </span>
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
					<select id="selectcommute" name="empcode" style="width: 420px">
						<c:forEach var="commuteemployee" items="${commuteemployee}">
							<option value="${commuteemployee.empcode}" >${commuteemployee.empcode} &nbsp-&nbsp ${commuteemployee.name}</option>
						</c:forEach> 
					</select>
				</div>
			</div> 

			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 120px"> 출근기록 </span>
					</div>
					<select id=attendancetype name="attendancetype" style="width: 420px">
						<option value="0">정시출근</option>
						<option value="1">지각</option>
						<option value="2">조퇴</option>
						<option value="3">결근</option>
					</select>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 120px"> 퇴근기록 </span>
					</div>
					<select id=leaveworktype name="leaveworktype" style="width: 420px">
						<option value="0">정시퇴근</option>
						<option value="1">야근</option>
					</select>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 120px"> 기타기록 </span>
					</div>
					<select id=statetype name="statetype" style="width: 420px">
						<option value="0">해당사항없음</option>
						<option value="1">외근</option>
						<option value="2">출장</option>
						<option value="3">휴가</option>
					</select>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 120px"> 특이사항기록 </span>
					</div>
					<input type="text" id="memo" name="memo" class="form-control" placeholder="ex)입원,경조사 등" 
					 aria-describedby="basic-addon1">
				</div>
			</div>
			
			<div class="row" style="margin-bottom: 100px; margin-top: 20px">
				<div class="col-md-5"></div>
				<div class="col-md-4">
					<button id="employee_commute_save_btn" name="employee_commute_save_btn" type="submit"	class="btn btn-success save" style="color: #000000">등 록</button>
					<button id="cancel_btn" name="cancel_btn" type="button"	class="btn btn-danger save" style="margin-left: 10px; color: #000000">취 소</button>
				</div>
				<div class="col-md-3"></div>
			</div>
			
				<!-- Modal -->
			<div class="modal fade" id="confirmModal" role="dialog">
				<div class="modal-dialog modal-sm">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>
						<div class="modal-body" id="confirm-modal-body">
						</div>
						<div class="modal-footer">
						<button type="button" id="confirm_modal_btn1" class="btn btn-success modal_btn1" data-dismiss="modal">사용</button>
							<button type="button" id="confirm_modal_btn2" class="btn btn-danger modal_btn2"	data-dismiss="modal">취소</button>
						</div>
					</div>
				</div>
			</div>
			
		</div>
	</form>
</body>
</html>