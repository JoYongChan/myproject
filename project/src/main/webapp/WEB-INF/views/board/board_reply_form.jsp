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
<body onload="boardreply_form.b_content.focus()">
	<form name="boardreply_form" id="boardreply_form" method="post"
		action="boardReplyInsert" data-parsley-validate="true"
		enctype="multipart/form-data">
		
		<input type="hidden" name="b_ref"  value="${board.b_seq}"/>
		<div class="container" style="margin-top: 30px">
			<h1 style="text-align: center">답글</h1>
		</div>
		
		<div class="container" style="margin-top: 30px">
			<div class="row">
				<div class="col-md-1"></div>
				<div class="input-group mb-2 col-md-10">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 100px"><i
							style="font-size: 30">제목</i></span>
					</div>
					<input type="text" id="board_page_list_b_title" name="b_title"
						class="form-control" placeholder="title"  value="${board.b_title }"
						aria-label="title" aria-describedby="basic-addon1"/>
				</div>
			</div>
			<div class="row">
				<div class="col-md-1"></div>
				<div class="input-group mb-2 col-md-10">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 100px"><i style="font-size: 30">E-mail</i></span>
					</div>
					<input type="email" class="form-control" id="board_page_list_b_email" name="b_email" 
						style="ime-mode: disabled" placeholder="id" aria-label="Id" value="${board.b_email }"
						aria-describedby="basic-addon1" required="true" 
						 />
						 <div class="input-group-prepend">
						<span class="input-group-text" style="width: 100px"><i
							style="font-size: 30">이름</i></span>
						</div>
						<input type="text" id="board_page_list_b_name" name="b_name"  value="${board.b_name }"
							class="form-control" placeholder="name" 
							aria-label="name" aria-describedby="basic-addon1"	/>
				</div>
			</div>
			<div class="row">
				<div class="col-md-1"></div>
				<div class="input-group mb-2 col-md-10">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 100px"><i style="font-size: 30">첨부파일</i></span>
					</div>
					<input type="file" id="board_page_list_b_attach" name="file"
						class="btn btn-default btn-sm" placeholder="name"
						aria-label="name" aria-describedby="basic-addon1"	 />
				</div>
			</div>
			<div class="row">
				<div class="col-md-1"></div>
				<div class="input-group mb-2 col-md-10">
					<textarea rows="5" autocomplete="off" style="text-align:left" id="board_page_list_b_content" name="b_content"></textarea>
					<script type="text/javascript">
								CKEDITOR.replace( 'b_content' );
					</script> 
				</div>
			</div>
			<div class="container" style="margin-bottom: 100px">
				<div class="row">
					<div class="col-md-5"></div>
					<div class="col-md-1">
						<button type="submit" id="board_page_list_save"
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