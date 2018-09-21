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
	<form id="employee_commute_update_form" name="employee_commute_update_form" method="post" action="employeeCommuteUpdate" data-parsley-validate="true"
	enctype="multipart/form-data">
	<input type="hidden" id="commutedate" name="commutedate" value="${commute1.commutedate}">
	<input type="hidden" name="attendancetime" value="${commute1.attendancetime}">
		<div class="container" style="margin-top: 30px">
			<div class="row">
				<div class="col-md-4"></div>
				<div class="input-group mb-3 col-md-4 ">
					<div class="input-group-prepend">
						<span style="text-align: center; font-style: inherit; margin-bottom: 20px; font-size: 30px">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp	직원 근태 기록 </span>
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
					<input type="text" id="empcode" name="empcode" class="form-control" placeholder="" value="${commute1.empcode}" readonly="readonly" 
					 aria-describedby="basic-addon1">
				</div>
			</div> 

			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 120px"> 출근기록 </span>
					</div>
					<select id=attendancetype name="attendancetype" style="width: 420px">
						<option value="0" <c:if test="${commute1.attendancetype =='0'}">selected</c:if> >정시출근</option>
						<option value="1" <c:if test="${commute1.attendancetype =='1'}">selected</c:if> >지각</option>
						<option value="2" <c:if test="${commute1.attendancetype =='2'}">selected</c:if> >조퇴</option>
						<option value="3" <c:if test="${commute1.attendancetype =='3'}">selected</c:if> >결근</option>
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
						<option value="0" <c:if test="${commute1.leaveworktype =='0'}">selected</c:if> >정시퇴근</option>
						<option value="1" <c:if test="${commute1.leaveworktype =='1'}">selected</c:if> >야근</option>
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
						<option value="0" <c:if test="${commute1.statetype =='0'}">selected</c:if> >해당사항없음</option>
						<option value="1" <c:if test="${commute1.statetype =='1'}">selected</c:if> >외근</option>
						<option value="2" <c:if test="${commute1.statetype =='2'}">selected</c:if> >출장</option>
						<option value="3" <c:if test="${commute1.statetype =='3'}">selected</c:if> >휴가</option>
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
					 aria-describedby="basic-addon1" value="${commute1.memo}">
				</div>
			</div>
			
			<div class="row" style="margin-bottom: 100px; margin-top: 20px">
				<div class="col-md-5"></div>
				<div class="col-md-4">
					<button id="employee_commute_save_btn" name="employee_commute_save_btn" type="submit"	class="btn btn-success save" style="color: #000000">수 정</button>
					<button id="employee_commute_delete_btn" name="employee_commute_delete_btn" type="button" class="btn btn-danger delete" style="color: #000000">삭 제</button>
					<button id="cancel_btn" name="cancel_btn" type="button"	class="btn btn-danger save" style="color: #000000">취 소</button>
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