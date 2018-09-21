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
<body>
<div class="container" style="margin-top: 30px">
	<form name="login" id="board_detail_login" method="post" action="boardUpdate"
		data-parsley-validate="true" enctype="multipart/form-data">
		
			<h1 style="text-align: center">게시글</h1>
			<input type="hidden" id="boardb_seq" name="b_seq"	value="${board.b_seq}">
			<input type="hidden" id="boardb_ref" name="b_ref"	value="${board.b_ref}">
			<div class="row">
				<div class="col-md-1"></div>
				<div class="input-group mb-2 col-md-10">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 100px"><i
							style="font-size: 30">제목</i></span>
					</div>
					<c:choose>
						<c:when test="${sessionemail == board.b_email }">
							<input type="text" id="board_detail_b_title" name="b_title"
								class="form-control" placeholder="title"
								value="${board.b_title}" aria-label="title"
								aria-describedby="basic-addon1" />
						</c:when>
						<c:otherwise>
							<input type="text" id="board_detail_b_title" name="b_title"
								readonly="readonly" class="form-control" placeholder="title"
								value="${board.b_title}" aria-label="title"
								aria-describedby="basic-addon1" />
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<div class="row">
				<div class="col-md-1"></div>
				<div class="input-group mb-2 col-md-10">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 100px"><i
							style="font-size: 30">E-mail</i></span>
					</div>
					<input type="email" class="form-control" id="board_detail_b_email"
						name="b_email" readonly="readonly" style="ime-mode: disabled"
						value="${board.b_email}"
						aria-describedby="basic-addon1" required="true" />
						<div class="input-group-prepend">
						<span class="input-group-text" style="width: 100px"><i
							style="font-size: 30">이름</i></span>
					</div>
					<input type="text" id="board_detail_b_name" name="b_name"
						value="${board.b_name }" class="form-control" placeholder="name"
						readonly="readonly" aria-label="name"
						aria-describedby="basic-addon1" />
				</div>
			</div>
			<div class="row">
				<div class="col-md-1"></div>
				<div class="input-group mb-2 col-md-10">
					<div class="input-group-prepend">
						<span class="input-group-text" style="width: 100px"><i
							style="font-size: 30">첨부파일</i></span>
					</div>
					<input type="file" id="board_detail_b_attach" name="file"
						class="btn btn-default btn-sm" placeholder="name" aria-label="name"
						aria-describedby="basic-addon1" value="${board.b_attach}" /> <input
						type="text" name="b_beforeattach" class="form-control"
						placeholder="b_beforeattach" aria-label="name"
						aria-describedby="basic-addon1" value="${board.b_attach}" />
<%-- 					<c:if test="${sessionemail != null }"> --%>
<!-- 					<input type="file" id="board_detail_b_attach" name="file" -->
<!-- 						class="form-control" placeholder="name" aria-label="name" -->
<%-- 						aria-describedby="basic-addon1" value="${board.b_attach}" /> <input --%>
<!-- 						type="text" name="b_beforeattach" class="form-control" -->
<!-- 						placeholder="b_beforeattach" aria-label="name" -->
<%-- 						aria-describedby="basic-addon1" value="${board.b_attach}" /> --%>
<%-- 					</c:if> --%>
				</div>
			</div>
			<div class="row">
				<div class="col-md-1"></div>
				<div class="input-group mb-2 col-md-10">
					<c:choose>
						<c:when test="${sessionemail == board.b_email }">
							<textarea rows="5" autocomplete="off" style="text-align: left"
								id="board_detail_b_content" name="b_content">
							${board.b_content }</textarea>
							 <script>CKEDITOR.replace("board_detail_b_content");
							</script> 
							
						</c:when>
						<c:otherwise>
							<textarea rows="5" autocomplete="off" style="text-align: left"
								id="board_detail_b_content" name="b_content" readonly="readonly">
							${board.b_content }</textarea>
							 <script>CKEDITOR.replace("board_detail_b_content");
							</script> 
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<div class="row" style="text-align: center">
				<div class="col-md-7"></div>
				<div class="col-md-1">
					<button type="button" id="board_detail_save" class="btn btn-primary btn-sm"
						name="save" onclick="location.href = 'boardPageList'">글목록</button>
				</div>
					<button type="submit" id="board_detail_boardupdate" name="boardupdate"
						class="btn btn-warning btn-sm">글수정</button>
					<div class="col-md-1">
					<button type="button" id="board_detail_boarddeletebtn" name="boarddeletebtn"
						class="btn btn-danger btn-sm">글삭제</button>
					</div>
						<button type="button" id="board_detail_boardreply" name="boardreply"
						class="btn btn-info btn-sm" onclick="location.href = 'boardReplyForm?b_title=${board.b_title}&b_seq=${board.b_seq }'">답글달기</button>
<%-- 				<c:if --%>
<%-- 					test="${sessionemail == 'admin@a.com' || sessionemail == board.b_email }"> --%>
<!-- 					<button type="submit" id="board_detail_boardupdate" name="boardupdate" -->
<!-- 						class="btn btn-warning">글수정</button> -->
<!-- 					<button type="button" id="board_detail_boarddeletebtn" name="boarddeletebtn" -->
<!-- 						class="btn btn-danger">글삭제</button> -->
<%-- 				</c:if> --%>
<%-- 				<c:if test="${sessionemail != null }"> --%>
<%-- 					<c:choose> --%>
<%-- 						<c:when test="${board.b_step ==0 }"> --%>
<!-- 						<button type="button" id="board_detail_boardreply" name="boardreply" -->
<%-- 						class="btn btn-info" onclick="location.href = 'boardReplyForm?b_title=${board.b_title}&b_seq=${board.b_seq }'">댓글</button> --%>
<%-- 						</c:when> --%>
<%-- 						<c:otherwise> --%>
<!-- 						<button type="button" id="board_detail_boardreply" name="boardreply" -->
<%-- 						class="btn btn-info" onclick="location.href = 'boardReplyForm?b_title=${board.b_title}&b_seq=${board.b_ref }'">댓글</button> --%>
<%-- 						</c:otherwise> --%>
<%-- 					</c:choose> --%>
<%-- 				</c:if> --%>

			
			</div>
			<%@ include file="../board/comment.jsp" %>
</form>

</div>
	     
			<!-- Modal -->
			<div id="detailModal" class="modal fade" role="dialog">
				<div class="modal-dialog modal-sm" style="text-align: center">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header ">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>
						<div class="detailmodal-body" >
							 
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-success modaldetail_btn1"
								data-dismiss="modal">사용</button>
							<button type="button" class="btn btn-danger modaldetail_btn2"
								data-dismiss="modal">취소</button>
						</div>
					</div>
				</div>
			</div>
				<!-- commentupdateModal -->
			<div id="commentupdateModal" class="modal fade" role="dialog">
				<div class="modal-dialog modal-sm" style="text-align: center">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header ">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>
						<div class="commentupdatemodal-body" >
							 
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-success commentupdatemodal_btn1"
								data-dismiss="modal">수정</button>
							<button type="button" class="btn btn-danger commentupdatemodal_btn2"
								data-dismiss="modal">취소</button>
						</div>
					</div>
				</div>
			</div>
					<!-- commentdeleteModal -->
			<div id="commentdeleteModal" class="modal fade" role="dialog">
				<div class="modal-dialog modal-sm" style="text-align: center">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header ">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>
						<div class="commentdeletemodal-body" >
							 
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-success commentdeletemodal_btn1"
								data-dismiss="modal">삭제</button>
							<button type="button" class="btn btn-danger commentdeletemodal_btn2"
								data-dismiss="modal">취소</button>
						</div>
					</div>
				</div>
			</div>
	
</body>
</html>