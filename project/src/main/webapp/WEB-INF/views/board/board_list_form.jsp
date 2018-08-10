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
	<form name="board_page_list" id="board_page_list_login" action="boardPageList"
		data-parsley-validate="true" enctype="multipart/form-data">
		<div class="container" style="margin-top: 70px">
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-8 text-center">
					<h1 style="text-align: center">게시판</h1>
				</div>
				<div class="col-md-4"></div>
			</div>
			<table class="table table-striped table-bordered" cellspacing="0"
				width="100%">
				<thead>
					<tr style="text-align: center">
						<th>글번호</th>
						<th>ID</th>
						<th>작성자</th>
						<th>제목</th>
						<th>첨부파일</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="boards" items="${boards}">
						<tr style="text-align: center">
							<td class="text-center">${boards.b_ref}</td>
							<td class="text-center">${boards.b_id}</td>
							<td class="text-center">${boards.b_name}</td>
							<td style="text-align: left"><a
								href="boardDetail?b_seq=${boards.b_seq }">
								<c:if test="${boards.b_step ge 1}">
								<i class="fas fa-reply"></i>
								</c:if>${boards.b_title}
								</a></td>

							<td class="text-center">
								<c:if  test="${(boards.b_attach != null) && (boards.b_attach != ' ')}">
									<a href="boardDownload?b_attach=${boards.b_attach}"><i class="fas fa-file"></i></a>
								</c:if></td>
							<td class="text-center">${boards.b_date}</td>
							<td class="text-center">${boards.b_hit}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="row" style="marhin-top:10px">
				<div class="col-md-1"></div>
				<div class="col-md-10" style="text-align:center">
						<c:forEach var="page" items="${pages}">
							<a href="boardPageListSelected?page=${page}">
							[${page}]&nbsp
							</a>
						</c:forEach>
						
				</div>
				<div class="col-md-1"></div>
			</div>
			<div class="row">
				<div class="col-md-8"></div>
				<input type="text" id="board_page_list_find" name="find"
					class="form-control col-md-1" placeholder="검색어" aria-label="find"
					aria-describedby="basic-addon1" value="${find}"/>
				<button type="submit" id="findbtn" class="btn btn-success" name="findbtn">검색</button>
				
				<c:if test="${sessionemail != null }">
					<button type="button" id="board_page_list_save" class="btn btn-primary "
						name="save" onclick="location.href = 'boardinsertForm'">글쓰기</button>
				</c:if>
				<button type="button" class="btn btn-danger"
					onclick="location.href = 'index'">취소</button>
			</div>
		</div>
	</form>
</body>
</html>