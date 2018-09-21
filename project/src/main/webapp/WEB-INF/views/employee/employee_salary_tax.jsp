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
	<form id="employee_salarytax_form" name="employee_salarytax_form" method="post" action="employeeSalaryTax" data-parsley-validate="true">
		<div class="container" style="margin-top: 100px">
			
			<div class="row">
				<div class="col-md-4"></div>
				<div class="input-group mb-3 col-md-4 ">
					<div class="input-group-prepend">
						<span style="text-align: center; font-style: inherit; margin-bottom: 20px; font-size: 30px">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 급여 계산 </span>
					</div>
				</div>
				<div class="col-md-4"></div>
			</div>
			
			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 100px"> 처리년도</span>
					</div>
					<input id="yyyy" name="yyyy" type="text" class="form-control" placeholder="yyyy" aria-label="Username" aria-describedby="basic-addon1" value="${yyyy}"	>
				</div>
				<div class="col-md-3"></div>
			</div>
			
			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-9 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 100px"> 처리 월 </span>
					</div>
					<select id="mm" name="mm"  style="width: 440px">
						<c:forEach begin="1" end="12" var="x">
							<option value="${x}">${x}</option>
						</c:forEach>
					</select>
				</div>
			</div>
			
			<div class="row" style="margin-bottom: 100px; margin-top: 20px">
				<div class="col-md-2"></div>
				<div class="col-md-8" style="text-align: center;">
					<button id="salarytax_insert_btn" name="salarytax_insert_btn" type="button" class="btn btn-success" style="margin-right: 10px; color: #000000">급여생성</button>
					<button  id="cancel_btn" name="cancel_btn"  type="button" class="btn btn-danger" style="color: #000000">취 소</button>
				</div>
				<div class="col-md-2"></div>
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