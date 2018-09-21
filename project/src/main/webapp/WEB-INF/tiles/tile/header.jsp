<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body id="page-top">
	<nav class="navbar navbar-expand navbar-dark bg-dark static-top">

      <a class="navbar-brand mr-1" href="home">Restaurant Solution</a>

      <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
        <i class="fas fa-bars"></i>
      </button>

      <!-- Navbar Search -->
      <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
      </form>

	<c:choose>
		<c:when
			test="${sessionstorecode eq null && sessiontablecode eq null }">
			<ul class="navbar-nav ml-auto ml-md-0">
				<li class="nav-item dropdown no-arrow"><a
					class="nav-link dropdown-toggle" href="loginForm" id="userDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false">Login</a>
					<div class="dropdown-menu dropdown-menu-right"
						aria-labelledby="userDropdown">
						<a class="dropdown-item" href="loginForm">관리자 로그인</a> <a
							class="dropdown-item" href="TableloginForm">테이블계정 로그인</a>
					</div></li>
			</ul>
		</c:when>
		<c:otherwise>
			<!-- Navbar -->
			<ul class="navbar-nav ml-auto ml-md-0">
				<li class="nav-item dropdown no-arrow"><a
					class="nav-link dropdown-toggle" href="#" id="userDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false" style="color: white;"> <i
						class="fas fa-user-circle fa-fw"></i> ${sessionstorename}
						${sessiontablecode}
				</a>
					<div class="dropdown-menu dropdown-menu-right"
						aria-labelledby="userDropdown">
						<a class="dropdown-item" href="boardListForm">게시판</a>
						<div class="dropdown-divider"></div>
						<c:choose>
							<c:when test="${sessionstorecode == storemanagement.storecode}">
								<a class="dropdown-item" href="logout" data-toggle="modal"
									data-target="#logoutModal">로그아웃</a>
							</c:when>
							<c:when test="${sessiontablecode == tableaccount.tablecode}">
								<a class="dropdown-item" href="tablelogout" data-toggle="modal"
									data-target="#logoutModal">로그아웃</a>
							</c:when>
						</c:choose>
					</div></li>
			</ul>
		</c:otherwise>
	</c:choose>

	</nav>
</body>
</html>