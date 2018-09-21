<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<style>
.pre-scrollable {
	max-height: 500px;
	overflow-y: scroll;
}
</style>


</head>

<body>

		<div class="row">
			<div class="col-md-6 text-center">
				<input type="text" id="confirmVenderCheck" value='n'
					style="visibility: hidden;"> <input type="text" id="seq"
					name="seq" value=0 style="visibility: hidden;">
			</div>
		</div>

		<!-- 거래처 -->

		<div class="row col-md-12">
			<div class="col-md-6 pre-scrollable ">

				<div class="row">

					<div class="input-group mb-3 col-md-11">
						<div class="input-group-prepend">
							<span class="input-group-text" style="width: 100%"> <i
								class="fas fa-address-book"
								style="font-size: 15px; color: #0066b3">번호</i>
							</span> <input name="yyyy" type="text" class="form-control" id="yyyy"
								style="width: 17%" value="${table.yyyy}"> <span
								class="input-group-text">-</span> <input name="mm" type="text"
								class="form-control" id="mm" style="width: 12%"
								value="${table.mm}"> <span class="input-group-text">-</span>
							<input name="dd" type="text" class="form-control" id="dd"
								style="width: 12%" value="${table.dd}"> <span
								class="input-group-text" style="">-</span> <input name="no"
								type="text" class="form-control" id="tableno" style="width: 12%"
								value="${table.tableno}"> <span class="input-group-text"
								style="">-</span> <input name="no" type="text" id="no"								
								class="form-control" id="hang" style="width: 12%" value="${table.no}">
						</div>
					</div>
					<div class="col-md-1"></div>
				</div>

				<div style="height: 15px"></div>

				<div class="row">

					<div class="input-group mb-3 col-md-11">
						<div class="input-group-prepend">
							<span class="input-group-text"> <i
								class="fas fa-address-book"
								style="font-size: 15px; color: #0066b3">메뉴 종류</i>
							</span><select name="category" id="category" style="width: 100%">
								<c:forEach var="c" items="${category}">
									<option value="${c}"> ${c} </option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="col-md-1"></div>
				</div>

				<div>
						<div style="height: 100%; align: center" class="input-group-prepend">
							<input name="" type="text" class="form-control" id="orderSelectInput"
								style="width: 20%" value="">
							<div style="width: 6%;">  </div>
							<input name="" type="text" class="form-control" id="orderPriceInput"
								style="width: 20%" value="">
							<div style="width: 6%;">  </div>
							<button style="height: 100%; width: 10%; text-align: center;" type="button"
							id="orderPlusBtn" href="tableSelect" class="btn btn-danger ">+</button>
							<button style="height: 33.3%; width: 10%;" type="button"
							id="orderNumBtn" href="" class="btn btn-link ">1</button>
							<button style="height: 100%; width: 10%;text-align: center;" type="button"
							id="orderSubBtn" href="tableSelect" class="btn btn-primary ">-</button>
							<div style="width: 6%;">  </div>
							<button style="height: 33.3%; width: 20%;" type="button"
							id="orderTableBtn" href="tableSelect" class="btn btn-info ">추가</button>
						</div>
					</div>
					
				<div style="height: 20px"></div>
			<div id="test">
			<c:forEach var="product" items="${products}">
				
				<div style="height: 125px; align: center" class="input-group-prepend">
					<div  style="width: 20%;">
						<button style="width: 100%;height:50%" type="button" id="orderSelectBtn" 
						class="btn btn-link orderSelectBtn" onclick="s()" ><br>${product.proname}<br>${product.price}</button>
					</div>
					<img class="rounded" src="resources/img/a.jpg" id="img"
						height=100%; width=auto; /> 
						<span class="input-group-text"
						style="width: 70%;"> ${product.memo} </span>
				</div>
				
				<div style="height: 20px"></div>
				
			</c:forEach>
				
			</div>
			
			</div>
			
			<div class="col-md-6 pre-scrollable " align="center">

				<div style="height: 15px"></div>

				<table id="mytable" class="table table-striped table-bordered"
					style="width: 100%">
					<thead>
						<tr>
							<th>품명</th>
							<th>단가</th>
							<th>수량</th>
							<th>금액</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="buys" items="${buys}">
							<tr>

							</tr>
						</c:forEach>
					</tbody>
				</table>

				<div class="input-group-prepend">
					<div style="width:15%"></div>
					<button type="button" style="width: 35%" id="tableResetBtn"
						class="btn btn-primary">reset</button>
					<div style="width:10%"></div>
					<button type="button" style="width: 35%" id="tableOrderBtn"
						class="btn btn-primary">완료</button>
					<div style="width:15%"></div>
				</div>

				<div style="height: 15px"></div>

				<%@ include file="../table/test4chat.jsp"%>
			</div>
		</div>
</body>
</html>