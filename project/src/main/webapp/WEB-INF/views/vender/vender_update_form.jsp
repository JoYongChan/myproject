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
	<form id="vender_update_form" name="vender_update_form" method="post"
		action="venderUpdate" data-parsley-validate="true">
		<h1 style="text-align: center">거래처 수정</h1>

		<div class="container">
			<div class="row">
				<div class="col-md-2"></div>
				<div class="input-group mb-3 col-md-8">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"> <i
							class="fas fa-envelope" style="font-size: 10"> 거래처 코드</i>
						</span>
					</div>
					<input type="text" id="vender_update_form_vendercode" name="vendercode"
						class="form-control col-md-3" aria-describedby="basic-addon"
						value="${vender.vendercode}" readonly="">
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-2"></div>
				<div class="input-group mb-3 col-md-8">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"><i
							class="fas fa-user" style="font-size: 10"> 거래처이름</i></span>
					</div>
					<input type="text" name="vendername" class="form-control"
						value="${vender.vendername}"
						placeholder="이름 입력" aria-label="Name" maxlength="20"
						aria-describedby="basic-addon1" required="true"
						data-parsley-error-message="이름을 입력하세요!"
						data-parsley-errors-container="div[id='vender_update_form_nameError']">
				</div>
			</div>
			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6">
					<div id="vender_update_form_nameError" style="color: #f00"></div>
				</div>
			</div>

			<div class="row">
				<div class="col-md-2"></div>
				<div class="input-group mb-3 col-md-8">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"><i
							class="fas fa-phone" style="font-size: 10"> 사업자번호</i></span>
					</div>
					<input type="text" class="form-control" name="busno1" value="${vender.busno1}"
						placeholder="첫번째 세자리" aria-label="busno1"
						aria-describedby="basic-addon1" maxlength="3" style="width: 20%"
						required="true" onkeydown="onlyNumber(event)"
						onkeyup="removeChar(event)"
						data-parsley-error-message="사업자번호 첫번째자리 숫자들을 입력하세요!"
						data-parsley-errors-container="div[id='vender_update_form_busnoError']"
						data-parsley-type="number"><input type="text" value="${vender.busno2}"
						class="form-control" name="busno2" placeholder="가운데 두자리"
						aria-label="busno2" aria-describedby="basic-addon1" maxlength="2"
						style="width: 20%" required="true" onkeydown="onlyNumber(event)"
						onkeyup="removeChar(event)"
						data-parsley-error-message="사업자번호 가운데 숫자들을 입력하세요!"
						data-parsley-errors-container="div[id='vender_update_form_busnoError']"
						data-parsley-type="number"> <input type="text" value="${vender.busno3}"
						class="form-control" name="busno3" placeholder="마지막 다섯자리"
						aria-label="busno3" aria-describedby="basic-addon1" maxlength="5"
						style="width: 20%" required="true" onkeydown="onlyNumber(event)"
						onkeyup="removeChar(event)"
						data-parsley-error-message="사업자번호 마지막 숫자들을 입력하세요!"
						data-parsley-errors-container="div[id='vender_update_form_busnoError']"
						data-parsley-type="number">
				</div>
			</div>
			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6">
					<div id="vender_update_form_busnoError" style="color: #f00"></div>
				</div>
			</div>

			<div class="row">
				<div class="col-md-2"></div>
				<div class="input-group mb-3 col-md-8">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"><i
							class="fas fa-user" style="font-size: 10"> 대표이름</i></span>
					</div>
					<input type="text" name="ceoname" class="form-control" value="${vender.ceoname}"
						placeholder="거래처 대표 이름 입력" aria-label="ceoname"
						aria-describedby="basic-addon1" required="true"
						data-parsley-error-message="이름을 입력하세요!"
						data-parsley-errors-container="div[id='vender_update_form_ceonameError']">
				</div>
			</div>
			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6">
					<div id="vender_update_form_ceonameError" style="color: #f00"></div>
				</div>
			</div>

			<div class="row">
				<div class="col-md-2"></div>
				<div class="input-group mb-3 col-md-8">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"><i
							class="fas fa-phone" style="font-size: 10"> 사업장연락처</i></span>
					</div>
					<select name="phone1" style="width: 15%; text-align: center">
						<option value="02" <c:if test="${vender.phone1 =='02'}">selected</c:if>>02</option>
						<option value="051" <c:if test="${vender.phone1 =='051'}">selected</c:if>>051</option>
						<option value="053" <c:if test="${vender.phone1 =='053'}">selected</c:if>>053</option>
						<option value="032" <c:if test="${vender.phone1 =='032'}">selected</c:if>>032</option>
						<option value="062" <c:if test="${vender.phone1 =='062'}">selected</c:if>>062</option>
						<option value="042" <c:if test="${vender.phone1 =='042'}">selected</c:if>>042</option>
						<option value="052" <c:if test="${vender.phone1 =='052'}">selected</c:if>>052</option>
						<option value="044" <c:if test="${vender.phone1 =='044'}">selected</c:if>>044</option>
						<option value="031" <c:if test="${vender.phone1 =='031'}">selected</c:if>>031</option>
						<option value="033" <c:if test="${vender.phone1 =='033'}">selected</c:if>>033</option>
						<option value="043" <c:if test="${vender.phone1 =='043'}">selected</c:if>>043</option>
						<option value="041" <c:if test="${vender.phone1 =='041'}">selected</c:if>>041</option>
						<option value="063" <c:if test="${vender.phone1 =='063'}">selected</c:if>>063</option>
						<option value="061" <c:if test="${vender.phone1 =='061'}">selected</c:if>>061</option>
						<option value="054" <c:if test="${vender.phone1 =='054'}">selected</c:if>>054</option>
						<option value="055" <c:if test="${vender.phone1 =='055'}">selected</c:if>>055</option>
						<option value="064" <c:if test="${vender.phone1 =='064'}">selected</c:if>>064</option>
						<option value="010" <c:if test="${vender.phone1 =='010'}">selected</c:if>>010</option>
						<option value="011" <c:if test="${vender.phone1 =='011'}">selected</c:if>>011</option>
						<option value="016" <c:if test="${vender.phone1 =='016'}">selected</c:if>>016</option>
					</select> <input type="text" class="form-control" name="phone2" value="${vender.phone2}"
						onkeydown="onlyNumber(event)" onkeyup="removeChar(event)"
						placeholder="전화번호 가운데자리" aria-label="officeno2"
						aria-describedby="basic-addon1" maxlength="4" style="width: 20%"
						required="true" data-parsley-error-message="전화번호 가운데 숫자들을 입력하세요!"
						data-parsley-errors-container="div[id='vender_update_form_phonenoError']"
						data-parsley-type="number"> <input type="text" value="${vender.phone3}"
						class="form-control" name="phone3" placeholder="전화번호 마지막자리"
						onkeydown="onlyNumber(event)" onkeyup="removeChar(event)"
						aria-label="officeno3" aria-describedby="basic-addon1"
						maxlength="4" style="width: 20%" required="true"
						data-parsley-error-message="전화번호 마지막 숫자들을 입력하세요!"
						data-parsley-errors-container="div[id='vender_update_form_phonenoError']"
						data-parsley-type="number">
				</div>
			</div>
			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6">
					<div id="vender_update_form_phonenoError" style="color: #f00"></div>
				</div>
			</div>

			<div class="row">
				<div class="col-md-2"></div>
				<div class="input-group mb-3 col-md-8">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"><i
							class="fas fa-home" style="font-size: 10"> 우편번호</i></span>
					</div>
					<input type="text" class="form-control" value="${vender.zipcode}"
						id="postno" name="zipcode" placeholder="우편번호"
						aria-label="zipcode" aria-describedby="basic-addon1" maxlength="5"
						required="true" data-parsley-error-message="우편번호를 입력하세요!"
						data-parsley-errors-container="div[id='vender_update_form_zipcodeError']">
					<button type="button" class="col-md-3 btn btn-primary"
						style="font-align: center; margin: 3px"
						onclick="ZipcodeFind()">주소검색</button>
				</div>
			</div>

			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6">
					<div id="vender_update_form_zipcodeError" style="color: #f00"></div>
				</div>
			</div>

			<div class="row">
				<div class="col-md-2"></div>
				<div class="input-group mb-3 col-md-8">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"><i
							class="fas fa-home" style="font-size: 10"> 도로명주소</i></span>
					</div>
					<input type="text" class="form-control" value="${vender.newaddr}"
						id="newaddr" name="newaddr" placeholder="도로명주소"
						aria-label="newaddr" aria-describedby="basic-addon1"
						required="true" data-parsley-error-message="도로명주소를 입력하세요!"
						data-parsley-errors-container="div[id='vender_update_form_newaddrError']">
				</div>
			</div>

			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6">
					<div id="vender_update_form_newaddrError" style="color: #f00"></div>
				</div>
			</div>

			<div class="row">
				<div class="col-md-2"></div>
				<div class="input-group mb-3 col-md-8">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"><i
							class="fas fa-home" style="font-size: 10"> 지번주소</i></span>
					</div>
					<input type="text" class="form-control" value="${vender.oldaddr}"
						id="oldaddr" name="oldaddr" placeholder="지번주소"
						aria-label="oldaddr" aria-describedby="basic-addon1"
						required="true" data-parsley-error-message="지번주소를 입력하세요!"
						data-parsley-errors-container="div[id='vender_update_form_oldaddrError']">
				</div>
			</div>

			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6">
					<div id="vender_update_form_oldaddrError" style="color: #f00"></div>
				</div>
			</div>

			<div class="row">
				<div class="col-md-2"></div>
				<div class="input-group mb-3 col-md-8">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 150px"><i
							class="fas fa-home" style="font-size: 10"> 상세주소</i></span>
					</div>
					<input type="text" class="form-control" value="${vender.detailaddr}"
						id="vender_update_form_detailaddr" name="detailaddr"
						placeholder="상세주소" aria-label="detailaddr"
						aria-describedby="basic-addon1" required="true"
						data-parsley-error-message="지번주소를 입력하세요!"
						data-parsley-errors-container="div[id='vender_update_form_detailaddrError']">
				</div>
			</div>

			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6">
					<div id="vender_update_form_detailaddrError" style="color: #f00"></div>
				</div>
			</div>

			<div class="row" align="center">
				<div class="col-md-4"></div>
				<button type="submit" id="vender_update_form_save"
					class="col-md-1 btn btn-primary"
					style="font-align: center; margin: 3px">수정</button>
				<button type="button" id="vender_update_form_delete"
					class="col-md-1 btn btn-danger"
					style="font-align: center; margin: 3px">삭제</button>
				<button type="button" class="col-md-1 btn btn-warning"
					id="vender_update_form_cancel"
					style="font-align: center; margin: 3px"
					onclick="location.href='venderList'">취소</button>
			</div>

			<!-- Modal -->
			<div id="vender_update_form_myModal" class="modal fade" role="dialog">
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close " data-dismiss="modal">&times;</button>
						</div>
						<div class="modal-body" id="modal-body">
							<p>Some text in the modal.</p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-success modal_btn1"
								data-dismiss="modal">입력</button>
							<button type="button" class="btn btn-danger modal_btn2"
								data-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>

