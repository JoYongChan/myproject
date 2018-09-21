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
<body>
	<form name="login" id="board_insert_login" method="post" action="boardInsert" 
		enctype="multipart/form-data" role="form">
		<div class="container"  style="margin-top: 30px">
			<div class="row">
				<div class="col-md-1"></div>
				<div class="input-group mb-2 col-md-10">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 100px"><i
							style="font-size: 30">제목</i></span>
					</div>
					<input type="text" id="board_insert_b_title" name="b_title"
						class="form-control" placeholder="title"
						aria-label="title" aria-describedby="basic-addon1"/>
				</div>
			</div>
			<div class="row">
				<div class="col-md-1"></div>
				<div class="input-group mb-2 col-md-10">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 100px"><i style="font-size: 30">E-mail</i></span>
					</div>
					<input type="email" class="form-control" id="board_insert_b_email" name="b_email" 
						 />
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 100px"><i
							style="font-size: 30">이름</i></span>
					</div>
					<input type="text" id="board_insert_b_name" name="b_name" 
						class="form-control" placeholder="name"  
						aria-label="name" aria-describedby="basic-addon1"/>
				</div>
			</div>
		
			<div class="row">
				<div class="col-md-1"></div>
				<div class="input-group mb-2 col-md-10">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 100px"><i style="font-size: 30">첨부파일</i></span>
					</div>
					<input type="file" id="board_insert_b_attach" name="file"
						class="btn btn-default btn-sm" placeholder="name"
						 />
				</div>
			</div>
			<div class="row">
				<div class="col-md-1"></div>
				<div class="input-group mb-2 col-md-10">
					<textarea  autocomplete="off" style="text-align:left" id="board_insert_b_content" name="b_content"></textarea>
					 <script>CKEDITOR.replace("board_insert_b_content");
					</script> 
				</div>
			</div>
			<div class="container" style="margin-top: 10px">
				<div class="row">
					<div class="col-md-5"></div>
					<div class="col-md-1">
						<button type="submit" id="board_insert_save"
							class="btn btn-primary " name="save">저장</button>
					</div>
					<div class="col-md-1">
					<button type="button" class="btn btn-warning">초기화</button>
				</div>
					<div class="col-md-1">
					<button type="button" class="btn  btn-danger"
					onclick="location.href = 'boardPageList'">취소</button>
				</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>