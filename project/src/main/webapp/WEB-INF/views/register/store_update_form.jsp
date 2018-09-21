<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form id="store_update_form" name="store_update_form" method="post" action="storeUpdateForm" data-parsley-validate="true">
		<input type="hidden" id="confirm_yn" value="n">
		<div class="container" style="margin-top: 30px">
			<div class="row">
				<div class="col-md-4"></div>
				<div class="input-group mb-3 col-md-4 ">
					<div class="input-group-prepend">
						<span style="text-align: center; font-style: inherit; margin-bottom: 20px; font-size: 30px">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp	관리자 계정 관리 </span>
					</div>
				</div>
				<div class="col-md-4"></div>
			</div>

			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 120px"> StoreCode </span>
					</div>
					<input type="text" id="storecode" name="storecode" class="form-control" placeholder="매장코드" value="${storemanagement.storecode}"
					 style="ime-mode: disabled" aria-describedby="basic-addon1" maxlength="4" readonly="readonly">
				</div>
			</div>

			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 120px"> CeoCode </span>
					</div>
					<input type="text" id="ceocode" name="ceocode" class="form-control" placeholder="CEO코드" value="${storemanagement.ceocode}"
					 style="ime-mode: disabled" aria-describedby="basic-addon1" maxlength="6" readonly="readonly">
				</div>
			</div>

			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 120px"> StorePass </span>
					</div>
					<input type="password" id="storepass" name="storepass" class="form-control" placeholder="storepassword" value="${storemanagement.storepass}"
						 aria-describedby="basic-addon1" maxlength="20">
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 120px"> StoreName </span>
					</div>
					<input type="text" id="storename" name="storename" class="form-control" placeholder="매장명" value="${storemanagement.storename}"
						 aria-describedby="basic-addon1" maxlength="20">
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 120px"> 사업자번호 </span>
					</div>
					<input type="text" id="busno" name="busno" class="form-control" placeholder="사업자번호" value="${storemanagement.busno}"
						style="ime-mode: disabled" aria-describedby="basic-addon1" maxlength="10">
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 120px"> 우편번호</span>
					</div>
					<input id="postno" name="postno" type="text" class="form-control" placeholder="PostNo" value="${storemanagement.postno}"
					 aria-label="Usernzipcode" aria-describedby="basic-addon1">
					<button onclick="ZipcodeFind()" type="button" class="btn btn-primary" style="color: #000000">찾기</button>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 120px"> 신 주소 </span>
					</div>
					<input id="newaddr" name="newaddr" type="text" class="form-control" placeholder="신 주소" value="${storemanagement.newaddr}"
					 aria-label="Usernzipcode" aria-describedby="basic-addon1">
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 120px"> 구 주소 </span>
					</div>
					<input id="oldaddr" name="oldaddr" type="text" class="form-control" placeholder="구 주소" value="${storemanagement.oldaddr}"
					 aria-label="Usernzipcode" aria-describedby="basic-addon1">
				</div>
			</div>

			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 120px"> 상세 주소 </span>
					</div>
					<input id="detailaddr" name="detailaddr" type="text" class="form-control" placeholder="상세 주소" value="${storemanagement.detailaddr}"
					 aria-label="Usernzipcode" aria-describedby="basic-addon1">
				</div>
			</div>

			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 120px"> 매장전화번호 </span>
					</div>
					<input id="storephone" name="storephone" type="text" class="form-control" placeholder="매장 전화번호" value="${storemanagement.storephone}"
					 aria-label="Usernzipcode" aria-describedby="basic-addon1" maxlength="11">
				</div>
			</div>

			<div class="row" style="margin-bottom: 100px; margin-top: 20px">
				<div class="col-md-5"></div>
				<div class="col-md-4">
					<button id="store_update_btn" name="store_update_btn" type="submit"	class="btn btn-success save" style="margin-right: 10px;color: #000000">수 정</button>
					<button id="store_delete_btn" name="store_delete_btn" type="button" class="btn btn-danger delete" style="margin-right: 10px; color: #000000">삭 제</button>
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