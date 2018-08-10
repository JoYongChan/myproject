<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body id="menu">
	<nav> <!-- Sidebar -->
	<ul class="sidebar navbar-nav">
		<li class="nav-item active"><a class="nav-link" href="home">
				<i class="fas fa-fw fa-tachometer-alt"></i> <span>Home</span>
		</a></li>
		<li class="nav-item dropdown"><a class="nav-link dropdown-toggle"
			href="#" id="pagesDropdown" role="button" data-toggle="dropdown"
			aria-haspopup="true" aria-expanded="false"> <i
				class="fas fa-fw fa-folder"></i> <span>페이지</span>
		</a>
			<div class="dropdown-menu" aria-labelledby="pagesDropdown">
				<h6 class="dropdown-header">Login Screens:</h6>
				<a class="dropdown-item" href="login.html">Login</a> <a
					class="dropdown-item" href="register.html">Register</a> <a
					class="dropdown-item" href="forgot-password.html">Forgot
					Password</a>
				<div class="dropdown-divider"></div>
				<h6 class="dropdown-header">Other Pages:</h6>
				<a class="dropdown-item" href="404.html">404 Page</a> <a
					class="dropdown-item" href="blank.html">Blank Page</a>
			</div></li>
		<li class="nav-item dropdown"><a class="nav-link dropdown-toggle"
			href="#" id="pagesDropdown" role="button" data-toggle="dropdown"
			aria-haspopup="true" aria-expanded="false"> <i
				class="fas fa-fw fa-folder"></i> <span>게시판</span>
		</a>
			<div class="dropdown-menu" aria-labelledby="pagesDropdown">
				<a class="dropdown-item" href="boardListForm">게시판</a>
			</div></li>
		<li class="nav-item dropdown"><a class="nav-link dropdown-toggle"
			href="#" id="pagesDropdown" role="button" data-toggle="dropdown"
			aria-haspopup="true" aria-expanded="false"> <i
				class="fas fa-fw fa-folder"></i> <span>고객관리</span>
		</a>
			<div class="dropdown-menu" aria-labelledby="pagesDropdown">
				<a class="dropdown-item" href="guestInsertForm">고객가입</a> <a
					class="dropdown-item" href="guestListForm">고객목록</a>
			</div></li>
		<li class="nav-item dropdown"><a class="nav-link dropdown-toggle"
			href="#" id="pagesDropdown" role="button" data-toggle="dropdown"
			aria-haspopup="true" aria-expanded="false"> <i
				class="fas fa-fw fa-folder"></i> <span>재고</span>
		</a>
			<div class="dropdown-menu" aria-labelledby="pagesDropdown">
				<a class="dropdown-item" href="productList">재고물품 관리</a> <a
					class="dropdown-item" href="productStockList">재고물품재고 관리</a> <a
					class="dropdown-item" href="productBuyList">재고물품 구매관리</a>
			</div></li>
		<li class="nav-item dropdown"><a class="nav-link dropdown-toggle"
			href="#" id="pagesDropdown" role="button" data-toggle="dropdown"
			aria-haspopup="true" aria-expanded="false"> <i
				class="fas fa-fw fa-folder"></i> <span>거래처</span>
		</a>
			<div class="dropdown-menu" aria-labelledby="pagesDropdown">
				<a class="dropdown-item" href="venderList">거래처 관리</a> <a
					class="dropdown-item" href="venderproductList">거래처물품 관리</a>
			</div></li>
		<li class="nav-item dropdown"><a class="nav-link dropdown-toggle"
			href="#" id="pagesDropdown" role="button" data-toggle="dropdown"
			aria-haspopup="true" aria-expanded="false"> <i
				class="fas fa-fw fa-folder"></i> <span>판매</span>
		</a>
			<div class="dropdown-menu" aria-labelledby="pagesDropdown">
				<a class="dropdown-item" href="saleproductList">판매물품 관리</a> <a
					class="dropdown-item" href="saleList">판매 관리</a> <a
					class="dropdown-item" href="salenoteList">매출 조회</a>
			</div></li>
			<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle"	href="#" id="pagesDropdown" 
					role="button" data-toggle="dropdown"aria-haspopup="true" aria-expanded="false"> 
					<i class="fas fa-fw fa-folder"></i> <span>직원관리</span>
					</a>
				<div class="dropdown-menu" aria-labelledby="pagesDropdown">
					<a class="dropdown-item" href="employeeInsertForm">직원 등록</a> 
					<a class="dropdown-item" href="#">직원 리스트</a>
				</div>
			</li>
	</ul>
	</nav>
</body>
</html>