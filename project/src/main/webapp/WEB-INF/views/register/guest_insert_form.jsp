<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	
</script>
<body >
	<form name="guest_insert_form" id="guest_insert_form" method="post"
		action="guestInsert" data-parsley-validate="true" 
		enctype="multipart/form-data">
		<h1 style="text-align: center">회원가입</h1>
		<div class="container" style="margin-top: 20px">
		<!-- name -->
			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6">
					<div class="input-group-prepend">
						<span class="input-group-text"style="width: 135px;background-color:#BDBDBD"><i
							class="fas fa-user" style="font-size: 30">이름</i></span>
					</div>
					<input type="text" name="name" class="form-control"
						placeholder="name" aria-label="Username"
						aria-describedby="basic-addon1">
				</div>
			</div>
			<!-- password -->
			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 135px;background-color:#BDBDBD"><i
							class="fas fa-unlock-alt" style="font-size: 30">비밀번호</i></span>
					</div>
					<input type="password" id="password" name="password"
						class="form-control" placeholder="password.."
						aria-label="password" aria-describedby="basic-addon1"
						required="true" data-parsley-error-message="비밀번호를 입력하세요!"
						data-parsley-errors-container="div[id='passwordError']" />
				</div>
			</div>
			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6">
					<div id="passwordError" style="color: #f00"></div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 135px;background-color:#BDBDBD"><i
							class="fas fa-unlock-alt" style="font-size: 30">비밀번호 확인</i></span>
					</div>
					<input data-parsley-equalto="#password" required="true"
						data-parsley-error-message="password가 맞지 않습니다!" type="password"
						name="repassword" class="form-control" placeholder="password.."
						aria-label="password" aria-describedby="basic-addon1"
						required="true"
						data-parsley-errors-container="div[id='repasswordError']" />
				</div>
			</div>
			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6">
					<div id="repasswordError" style="color: #f00"></div>
				</div>
			</div>
				<div class="row">
					<div class="col-md-3"></div>
					<div class="input-group mb-3 col-md-6">
						<div class="input-group-prepend">
							<span class="input-group-text"style="width: 135px;background-color:#BDBDBD"><i
								class="fas fa-user" style="font-size: 30">성별</i></span>
						</div>
						<div class="btn-group" data-toggle="buttons">
							<label class="btn btn-default">
								<input type="radio" name="gender" value="남성"  autocomplete="off"checked> 남성
							</label>
							<label class="btn btn-default"> 
							<input type="radio"name="gender" value="여성" autocomplete="off"> 여성
							</label>
						</div>
					</div>
				</div>
				<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6">
					<div class="input-group-prepend">
						<span class="input-group-text"style="width: 135px;background-color:#BDBDBD"><i
							class="fas fa-user" style="font-size: 30">생년월일</i></span>
					</div>
					<select name="yyyy" id="finalyyyy">
						<c:forEach var="i" begin="1970" end="2018" step="1">
								<option value="${i}"
								 	<c:if test="${i == curyyyy}">selected</c:if> >${i}</option>
						</c:forEach>
					</select> <select name="mm" id="finalmm">
						<c:forEach var="i" begin="1" end="12" step="1">
								<option value="${i}" 
								 	<c:if test="${i == curmm}">selected</c:if> >${i}</option>
						</c:forEach>
					</select> <select name="dd" id="finaldd">
						<c:forEach var="i" begin="0" end="31" step="1">
								<option value="${i}" 
								 	<c:if test="${i == curdd}">selected</c:if> >${i}</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<!-- phone -->
			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 135px;background-color:#BDBDBD">
						<i class="fas fa-mobile-alt"style="font-size: 30">전화번호</i></span>
					</div>
					<select class="form-control" name="phone1">
						<option value="010" selected>010</option>
						<option value="011">011</option>
						<option value="012">012</option>
					</select> 
					<input name="phone2" type="text" class="form-control"
						maxlength="4" placeholder="phone" aria-label="Phone2"
						data-parsley-type="number" required="true"
						data-parsley-error-message="숫자만 입력하세요!"
						aria-describedby="basic-addon1" onkeyup="phone2_lengthchk(this)"
						data-parsley-errors-container="div[id='phoneError']" /> <label>-</label>
					<input name="phone3" type="text" maxlength="4" required="true"
						data-parsley-error-message="숫자만 입력하세요!" class="form-control"
						placeholder="phone" aria-label="phone3" data-parsley-type="number"
						aria-describedby="basic-addon1"
						data-parsley-errors-container="div[id='phoneError']" />
				</div>
			</div>
			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6">
					<div id="phoneError" style="color: #f00"></div>
				</div>
			</div>
			<!-- postno -->
			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 135px;background-color:#BDBDBD"><i
							class="far fa-address-book" style="font-size: 30">우편번호</i></span>
					</div>
					<input id=postno name="postno" type="text" class="form-control"
						placeholder="우편번호" aria-label="Postno"
						aria-describedby="basic-addon1">
					<button type="button" class="btn btn-primary"
						onclick="findAddr()" value="우편번호 찾기">찾기</button>
				</div>
			</div>
			<span id="guide" style="color: #999"></span>
			<!-- addres -->
			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 135px;background-color:#BDBDBD"> <i
							class="fas fa-home" style="font-size: 30">신주소</i></span>
					</div>
					<input id="addr1" name="addr1" type="text" class="form-control"
						placeholder="주소" aria-label="addr1"
						aria-describedby="basic-addon1">
				</div>
			</div>
			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 135px;background-color:#BDBDBD"><i
							class="fas fa-home" style="font-size: 30">구주소</i></span>
					</div>
					<input id="addr2" name="addr2" type="text" class="form-control"
						placeholder="주소" aria-label="addr2"
						aria-describedby="basic-addon1">
				</div>

			</div>
			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 135px;background-color:#BDBDBD"><i
							class="fas fa-home" style="font-size: 30">상세주소</i></span>
					</div>
					<input id="addr3" name="addr3" type="text" class="form-control"
						placeholder="주소" aria-label="addr2"
						aria-describedby="basic-addon1">
				</div>

			</div>
			<!-- save cancel -->
			<div class="row">
				<div class="col-md-5"></div>
				<div class="col-md-1">
					<button type="button" id="member_insert_form_save" class="btn btn-success save save">저장</button>
				</div>
				<div class="col-md-1">
					<button type="button" class="btn btn-danger"
						onclick="location.href = 'loginForm'">취소</button>
				</div>
				<div class="col-md-3"></div>
			</div>

			<!-- Modal -->
			<div id="member_insert_form_myModal" class="modal fade" role="dialog">
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>
						<div class="modal-body">
							<p>Some text in the modal.</p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-success modal_btn1"
								data-dismiss="modal">사용</button>
							<button type="button" class="btn btn-danger modal_btn2"
								data-dismiss="modal">취소</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>