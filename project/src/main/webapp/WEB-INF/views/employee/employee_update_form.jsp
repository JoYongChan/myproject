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
	<form id="employee_update_form" name="employee_update_form" method="post" action="employeeUpdateForm"
	enctype="multipart/form-data">
		<input type="hidden" id="employeeconfirm_yn" value="n">
		<input type="hidden" name="hiredate" value="${employee.hiredate}">
		<div class="container" style="margin-top: 30px">
			<div class="row">
				<div class="col-md-4"></div>
				<div class="input-group mb-3 col-md-4 ">
					<div class="input-group-prepend">
						<span style="text-align: center; font-style: inherit; margin-bottom: 20px; font-size: 30px">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp	직원 수정 </span>
					</div>
				</div>
				<div class="col-md-4"></div>
			</div>
			
			<div class="row">
				<div class="col-md-5"></div>
				<div class="input-group mb-3 col-md-4 ">
					<a href="#">
						<img id="image" name="image" src="${employee.photo}" title="클릭 후 이미지 변경"
							alt="클릭 후 이미지 변경" class="rounded-circle" style="border: 1px solid;" width="140px" height="140px"> 
						<input type="hidden" name="beforephoto" value="${employee.photo}">
					</a>
				</div>
				<div class="col-md-3"></div>
			</div>

			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6 text-center">
					<div>
						<input type="file" id="photo" name="imgfile" style="visibility: hidden;">
					</div>
				</div>
				<div class="col-md-3"></div>
			</div> 

			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 120px"> 사원번호 </span>
					</div>
					<input type="text" id="empcode" name="empcode" class="form-control" placeholder="사원번호" value="${employee.empcode}"
					 style="ime-mode: disabled" aria-describedby="basic-addon1" maxlength="6" readonly="readonly">
				</div>
			</div>

			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 120px"> 이름 </span>
					</div>
					<input type="text" id="name" name="name" class="form-control" placeholder="이름" value="${employee.name}"
					 aria-describedby="basic-addon1" maxlength="20">
				</div>
			</div>

			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 120px"> 나이 </span>
					</div>
					<input type="text" id="age" name="age" class="form-control" placeholder="" value="${employee.age}"
					 style="ime-mode: disabled" aria-describedby="basic-addon1" maxlength="">
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 120px"> 성별 </span>
					</div>
					<select id="gender" name="gender" style="width: 250px">
						<option value="남자" <c:if test="${employee.gender =='남자'}">selected</c:if>>남자</option>
						<option value="여자" <c:if test="${employee.gender =='여자'}">selected</c:if> >여자</option>
					</select>
				</div>
			</div>
			
			<div class="row">
			<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 120px"> 생년월일 </span>
					</div>
					<!-- Date input, salary_insert_form.jsp -->
					<input class="form-control" id="date" name="birthday" placeholder="MM/DD/YYY" type="date" value="${employee.birthday}"/>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 120px"> 우편번호</span>
					</div>
					<input id="postno" name="postno" type="text" class="form-control" placeholder="PostNo" aria-label="Usernzipcode"
					aria-describedby="basic-addon1" value="${employee.postno}">
					<button onclick="ZipcodeFind()" type="button" class="btn btn-primary" style="color: #000000">찾기</button>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 120px"> 신 주소 </span>
					</div>
					<input id="newaddr" name="newaddr" type="text" class="form-control" placeholder="신 주소" value="${employee.newaddr}"
					 aria-label="Usernzipcode" aria-describedby="basic-addon1">
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 120px"> 구 주소 </span>
					</div>
					<input id="oldaddr" name="oldaddr" type="text" class="form-control" placeholder="구 주소" value="${employee.oldaddr}"
					 aria-label="Usernzipcode" aria-describedby="basic-addon1">
				</div>
			</div>

			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 120px"> 상세 주소 </span>
					</div>
					<input id="detailaddr" name="detailaddr" type="text" class="form-control" placeholder="상세 주소" value="${employee.detailaddr}"
					 aria-label="Usernzipcode" aria-describedby="basic-addon1">
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 120px"> 전화번호 </span>
					</div>
					<input id="phone" name="phone" type="text" class="form-control" placeholder="ex)01012345678" maxlength="11" value="${employee.phone}"
					 aria-label="Usernzipcode" aria-describedby="basic-addon1">
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 120px"> 직급 </span>
					</div>
					<select id="memlevel" name="memlevel" style="width: 250px">
						<option value="0" <c:if test="${employee.memlevel =='0'}">selected</c:if>>사장</option>
						<option value="1" <c:if test="${employee.memlevel =='1'}">selected</c:if> >매니저</option>
						<option value="2" <c:if test="${employee.memlevel =='2'}">selected</c:if> >직원</option>
					</select>
					
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 120px"> 지점 </span>
					</div>
					<select id="storename" name="storename" style="width: 250px">
						<c:forEach var="storemanagements" items="${storemanagements}">
								<option value="${storemanagements.storename}" <c:if test="${storemanagements.storename==employee.storename }">selected</c:if> >
								${storemanagements.storename}</option>
						</c:forEach> 
					</select>
				</div>
			</div>
			
			<div class="row" style="margin-bottom: 100px; margin-top: 20px">
				<div class="col-md-5"></div>
				<div class="col-md-4">
					<button id="employee_update_btn" name="employee_update_btn" type="submit"	class="btn btn-success save" style="color: #000000">수 정</button>
					<button id="employee_delete_btn" name="employee_delete_btn" type="button" class="btn btn-danger delete" style="color: #000000">삭 제</button>
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