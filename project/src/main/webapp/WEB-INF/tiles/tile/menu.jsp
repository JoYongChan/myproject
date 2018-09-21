<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
				class="fas fa-fw fa-folder"></i> <span>게시판</span>
		</a>
			<div class="dropdown-menu" aria-labelledby="pagesDropdown">
				<a class="dropdown-item" href="boardPageList">게시판</a>
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
					class="dropdown-item" href="productStockList">재고물품재고 관리</a>
			</div></li>
		<li class="nav-item dropdown"><a class="nav-link dropdown-toggle"
			href="#" id="pagesDropdown" role="button" data-toggle="dropdown"
			aria-haspopup="true" aria-expanded="false"> <i
				class="fas fa-fw fa-folder"></i> <span>거래처</span>
		</a>
			<div class="dropdown-menu" aria-labelledby="pagesDropdown">
				<a class="dropdown-item" href="venderList">거래처 관리</a> <a
					class="dropdown-item" href="venderproductList">거래처물품 관리</a> <a
					class="dropdown-item" href="venderProductBuyInsertForm">거래처물품 구매관리</a>
			</div></li>
		<li class="nav-item dropdown"><a class="nav-link dropdown-toggle"
			href="#" id="pagesDropdown" role="button" data-toggle="dropdown"
			aria-haspopup="true" aria-expanded="false"> <i
				class="fas fa-fw fa-folder"></i> <span>판매</span>
		</a>
			<div class="dropdown-menu" aria-labelledby="pagesDropdown">
				<a class="dropdown-item" href="saleproductList">판매물품 관리</a>
			</div></li>
			<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle"	href="#" id="pagesDropdown" 
					role="button" data-toggle="dropdown"aria-haspopup="true" aria-expanded="false"> 
					<i class="fas fa-fw fa-folder"></i> <span>직원관리</span>
					</a>
				<div class="dropdown-menu" aria-labelledby="pagesDropdown">
				<c:choose>
					<c:when test="${sessionstorecode ==null}">
						<label>&nbsp관리자계정 로그인 시 </label>
						<label>&nbsp확인 가능합니다.</label>
					</c:when>
					<c:otherwise>
						<a class="dropdown-item" href="employeeInsertForm">직원 등록</a> 
						<a class="dropdown-item" href="employeeListForm">직원 리스트</a>
						<a class="dropdown-item" href="employeeSalaryForm">직원 급여등록</a>
						<a class="dropdown-item" href="employeeSalaryListForm">직원 급여리스트</a>
						<a class="dropdown-item" href="employeeSalaryTaxForm">직원 급여 월별 계산</a>
						<a class="dropdown-item" href="employeeSalaryTaxListForm">직원 급여 월별 리스트</a>
						<a class="dropdown-item" href="employeeCommuteInsertForm">직원 근태등록</a>
						<a class="dropdown-item" href="employeeCommuteListForm">직원 근태기록</a>
					</c:otherwise>
				</c:choose>
				</div>
			</li>
			<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle"	href="#" id="pagesDropdown" 
					role="button" data-toggle="dropdown"aria-haspopup="true" aria-expanded="false"> 
					<i class="fas fa-fw fa-folder"></i> <span>매장관리</span>
					</a>
				<div class="dropdown-menu" aria-labelledby="pagesDropdown">
				<c:choose>
					<c:when test="${sessionstorecode ==null}">
						<label>&nbsp관리자계정 로그인 시 </label>
						<label>&nbsp확인 가능합니다.</label>
						<a class="dropdown-item" href="tableSelect">테이블관리</a>
					</c:when>
					<c:otherwise>
						<a class="dropdown-item" href="tableAccount">테이블계정 등록</a> 
						<a class="dropdown-item" href="tableListForm">테이블계정 리스트</a> 
						<a class="dropdown-item" href="storeListForm">매장 리스트</a> 
					</c:otherwise>
				</c:choose>
				</div>
			</li>
	</ul>
	</nav>
</body>
</html>