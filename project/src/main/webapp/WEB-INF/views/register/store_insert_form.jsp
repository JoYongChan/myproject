<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form id="store_insert_form" name="store_insert_form" method="post" action="storeInsert" data-parsley-validate="true">
		<div class="container" style="margin-top: 30px">
			<div class="row">
				<div class="col-md-4"></div>
				<div class="input-group mb-3 col-md-4 ">
					<div class="input-group-prepend">
						<span style="text-align: center; font-style: inherit; margin-bottom: 20px; font-size: 30px">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp	관리자 계정 생성 </span>
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
					<input type="text" id="storecode" name="storecode" class="form-control" placeholder="매장코드" 
					 style="ime-mode: disabled" aria-describedby="basic-addon1" maxlength="4">
					<button type="button" id="store_confirm" class="btn btn-primary" style="color: #000000">중복확인</button>
				</div>
			</div>

			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 120px"> CeoCode </span>
					</div>
					<input type="text" id="ceocode" name="ceocode" class="form-control" placeholder="CEO코드" 
					 style="ime-mode: disabled" aria-describedby="basic-addon1" maxlength="6">
					<button type="button" id="ceo_confirm" class="btn btn-primary" style="color: #000000">중복확인</button>
				</div>
			</div>

			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 120px"> StorePass </span>
					</div>
					<input type="text" id="storepass" name="storepass" class="form-control" placeholder="storepassword"
						style="ime-mode: disabled" aria-describedby="basic-addon1" maxlength="20">
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 120px"> StoreName </span>
					</div>
					<input type="text" id="storename" name="storename" class="form-control" placeholder="매장명"
						style="ime-mode: disabled" aria-describedby="basic-addon1" maxlength="20">
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 120px"> 사업자번호 </span>
					</div>
					<input type="text" id="busno" name="busno" class="form-control" placeholder="사업자번호"
						style="ime-mode: disabled" aria-describedby="basic-addon1" maxlength="10">
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 120px"> 우편번호</span>
					</div>
					<input id="postno" name="postno" type="text" class="form-control" placeholder="PostNo" aria-label="Usernzipcode" aria-describedby="basic-addon1">
					<button onclick="ZipcodestoreFind()" type="button" class="btn btn-primary" style="color: #000000">찾기</button>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 120px"> 신 주소 </span>
					</div>
					<input id="newaddr" name="newaddr" type="text" class="form-control" placeholder="신 주소" aria-label="Usernzipcode" aria-describedby="basic-addon1">
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 120px"> 구 주소 </span>
					</div>
					<input id="oldaddr" name="oldaddr" type="text" class="form-control" placeholder="구 주소" aria-label="Usernzipcode" aria-describedby="basic-addon1">
				</div>
			</div>

			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 120px"> 상세 주소 </span>
					</div>
					<input id="detailaddr" name="detailaddr" type="text" class="form-control" placeholder="상세 주소" aria-label="Usernzipcode" aria-describedby="basic-addon1">
				</div>
			</div>

			<div class="row">
				<div class="col-md-3"></div>
				<div class="input-group mb-3 col-md-6 ">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 120px"> 매장전화번호 </span>
					</div>
					<input id="storephone" name="storephone" type="text" class="form-control" placeholder="매장 전화번호" aria-label="Usernzipcode" aria-describedby="basic-addon1">
				</div>
			</div>

			<div class="row" style="margin-bottom: 100px; margin-top: 20px">
				<div class="col-md-5"></div>
				<div class="col-md-4">
					<button id="store_save_btn" name="store_save_btn" type="submit"	class="btn btn-success save" style="color: #000000">저 장</button>
					<button id="cancel_btn" name="cancel_btn" type="button"	class="btn btn-danger save" style="margin-left: 10px; color: #000000">취 소</button>
				</div>
				<div class="col-md-3"></div>
			</div>

		</div>
	</form>
</body>
</html>