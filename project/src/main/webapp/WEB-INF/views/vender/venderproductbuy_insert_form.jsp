<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>거래 등록</title>
</head>
<body>
	<h1 align="center">거래처 물품 매입</h1>
	<div class="container" style="margin-top: 30px">
		<div class="row">
			<div class="col-md-6">
				<form name="venderproductbuy_insert_form"
					id="venderproductbuy_insert_form" action="venderProductBuyInsert"
					method="post" data-parsley-validate="true">
					<input type="hidden" id="venderproductbuy_insert_form_hiddeninsertchk" name=""value="n">
					<input type="hidden" id="venderproductbuy_insert_form_hiddenbuyid" name="buyid" value="0">
					<input type="hidden" id="venderproductbuy_insert_form_hiddenpreqty" name="preqty" value="0">
					<div class="row">
						<div class="input-group">
							<div class="input-group-prepend">
								<span class="input-group-text" style="width: 150px"> <i
									class="fas fa-envelope" style="font-size: 10"> 거 래 처</i>
								</span>
							</div>
							<select id="venderproductbuy_insert_form_vendercode"
								name="vendercode" style="text-align: center; width: 70%">
								<option value="0000" selected>거래처 선택</option>
								<c:forEach var="vender" items="${venders}" varStatus="status">
									<option value="${vender.vendercode}"
										<c:if test="${vender.vendercode == venderproductbuy.vendercode}">selected</c:if>>${vender.vendername}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="row" style="margin-top: 8px">
						<div class="input-group">
							<div class="input-group-prepend">
								<span class="input-group-text" style="width: 150px"> <i
									class="fas fa-envelope" style="font-size: 10"> 상품이름</i>
								</span>
							</div>
							<select id="venderproductbuy_insert_form_venderproductcode"
								name="venderproductcode" style="text-align: center; width: 70%">
								<c:if test="${venderproducts != null}">
									<option value='0000'>거래처 판매물품 선택</option>
									<c:forEach var="venderproduct" items="${venderproducts}" varStatus="status">
										<option value="${venderproduct.venderproductcode}">${venderproduct.proname}---${venderproduct.capacity}</option>
									</c:forEach>
								</c:if>
							</select>
						</div>
					</div>
					<div class="row" style="margin-top: 8px">
						<div class="input-group">
							<div class="input-group-prepend">
								<span class="input-group-text" style="width: 150px"> <i
									class="fas fa-envelope" style="font-size: 10"> 매입번호</i>
								</span>
							</div>
							<input type="text" id="venderproductbuy_insert_form_year"
								name="year" value="${venderproductbuy.year}"
								class="form-control" readonly="readonly" /> <label>-</label> <input
								type="text" id="venderproductbuy_insert_form_month" name="month"
								value="${venderproductbuy.month}" class="form-control"
								readonly="readonly" /> <label>-</label> <input type="text"
								id="venderproductbuy_insert_form_day" name="day"
								value="${venderproductbuy.day}" class="form-control"
								readonly="readonly" /> <label>-</label> <input type="text"
								id="venderproductbuy_insert_form_no" name="no"
								value="<c:if test="${venderproductbuy.no != 0}">${venderproductbuy.no}</c:if>"
								class="form-control" readonly="readonly" /> <label>-</label> <input
								type="text" id="venderproductbuy_insert_form_hang" name="hang"
								value="<c:if test="${venderproductbuy.hang != 0}">${venderproductbuy.hang}</c:if>"
								class="form-control" readonly="readonly" />
						</div>
					</div>

					<div class="row" style="margin-top: 8px">
						<div class="input-group">
							<div class="input-group-prepend">
								<span class="input-group-text" style="width: 150px"> <i
									class="fas fa-envelope" style="font-size: 10"> 현재재고</i>
								</span>
							</div>
							<input type="text" class="form-control" name="stock"
								id="venderproductbuy_insert_form_stock" readonly="readonly" />
						</div>
					</div>
					<div class="row" style="margin-top: 8px">
						<div class="input-group">
							<div class="input-group-prepend">
								<span class="input-group-text" style="width: 150px"> <i
									class="fas fa-envelope" style="font-size: 10">
										단&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp가</i>
								</span>
							</div>
							<input type="text" id="venderproductbuy_insert_form_price"
								name="price" readonly="readonly" class="form-control" />
						</div>
					</div>
					<div class="row" style="margin-top: 8px">
						<div class="input-group">
							<div class="input-group-prepend">
								<span class="input-group-text" style="width: 150px"> <i
									class="fas fa-envelope" style="font-size: 10">
										수&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp량</i>
								</span>
							</div>
							<input type="text" id="venderproductbuy_insert_form_qty"
								name="qty" onkeydown="onlyNumber(event)"
								onkeyup="removeChar(event)" class="form-control"
								style="ime-mode: disabled" />
						</div>
					</div>
					<div class="row" style="margin-top: 8px">
						<div class="input-group">
							<div class="input-group-prepend">
								<span class="input-group-text" style="width: 150px"> <i
									class="fas fa-envelope" style="font-size: 10">
										금&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp액</i>
								</span>
							</div>
							<input type="text" id="venderproductbuy_insert_form_totalprice" name="totalprice"
								readonly="readonly" class="form-control" />
						</div>
					</div>
					<div class="row" style="margin-top: 8px">
						<div class="input-group">
							<div class="input-group-prepend">
								<span class="input-group-text" style="width: 150px"> <i
									class="fas fa-envelope" style="font-size: 10">
										비&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp고</i>
								</span>
							</div>
							<input type="text" id="venderproductbuy_insert_form_memo"
								name="memo" class="form-control" style="ime-mode: disabled" />
						</div>
					</div>
					<div class="row" style="margin-top: 8px" align="center">
						<div class="col-md-3"></div>
						<button type="button" class="btn btn-success"
							id="venderproductbuy_insert_form_save" style="margin: 5px">Save</button>
						<button type="reset" class="btn btn-warning"
							id="venderproductbuy_insert_form_reset" style="margin: 5px">Reset</button>
						<button type="button" class="btn btn-success"
							id="venderproductbuy_insert_form_update"
							style="margin: 5px; display: none;">Update</button>
						<button type="button" class="btn btn-danger"
							id="venderproductbuy_insert_form_cancel" style="margin: 5px">Cancel</button>
						<button type="button" class="btn btn-primary"
							id="venderproductbuy_insert_form_new" style="margin: 5px">new</button>
						<button type="button" class="btn btn-danger"
							id="venderproductbuy_insert_form_delete"
							style="margin: 5px; display: none;">Delete</button>
					</div>
				</form>
			</div>
			<div class="col-md-6">
				<form name="venderproductbuy_search_form"
					id="venderproductbuy_search_form" action="venderProductBuySearch"
					method="get" data-parsley-validate="true">
					<div class="row">
						<input type="text" class="form-control" style="width: 40%"
							value="${venderproductbuy.year}-${venderproductbuy.month}-${venderproductbuy.day}"
							readonly="readonly" />
					</div>
					<div class="row pre-scrollable"
						style="margin-top: 5px; height: 450px">
						<table class="table table-bordered" style="text-align: center">
							<thead class="thead-dark">
								<tr>
									<th scope="col">날짜</th>
									<th scope="col">No</th>
									<th scope="col">항번</th>
									<th scope="col">거래처</th>
									<th scope="col">품명</th>
									<th scope="col">단가</th>
									<th scope="col">수량</th>
									<th scope="col">금액</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="venderproductbuys" items="${venderproductbuys}"
									varStatus="status">
									<c:choose>
										<c:when
											test="${venderproductbuys.hang==0 && venderproductbuys.no !=0}">
											<tr>
												<td style="vertical-align: midayle"></td>
												<td style="vertical-align: midayle"></td>
												<td style="vertical-align: midayle"></td>
												<td
													style="vertical-align: midayle; background-color: #90a4ae; color: #fff">소
													계</td>
												<td
													style="vertical-align: midayle; background-color: #90a4ae; color: #fff">
												</td>
												<td
													style="vertical-align: midayle; background-color: #90a4ae; color: #fff">
												</td>
												<td
													style="vertical-align: midayle; background-color: #90a4ae; color: #fff">${venderproductbuys.qty}</td>
												<td
													style="vertical-align: midayle; background-color: #90a4ae; color: #fff">${venderproductbuys.totalprice}</td>
											<tr>
										</c:when>
										<c:when
											test="${venderproductbuys.hang==0 && venderproductbuys.no ==0}">
											<tr>
												<td style="vertical-align: midayle"></td>
												<td style="vertical-align: midayle"></td>
												<td style="vertical-align: midayle"></td>
												<td
													style="vertical-align: midayle; background-color: #3E4551; color: #fff">총
													계</td>
												<td
													style="vertical-align: midayle; background-color: #3E4551; color: #fff"></td>
												<td
													style="vertical-align: midayle; background-color: #3E4551; color: #fff"></td>
												<td
													style="vertical-align: midayle; background-color: #3E4551; color: #fff">${venderproductbuys.qty}</td>
												<td
													style="vertical-align: midayle; background-color: #3E4551; color: #fff">${venderproductbuys.totalprice}</td>
											<tr>
										</c:when>
										<c:otherwise>
											<tr>
												<td style="vertical-align: midayle">${venderproductbuys.year}-${venderproductbuys.month}-${venderproductbuys.day}</td>
												<td style="vertical-align: midayle">${venderproductbuys.no}</td>
												<td style="vertical-align: midayle">${venderproductbuys.hang}</td>
												<td style="vertical-align: midayle">${venderproductbuys.vendername}</td>
												<td style="vertical-align: midayle"><a href="#"
													onclick="selectedBuyid(${venderproductbuys.buyid});">${venderproductbuys.proname}-${venderproductbuys.capacity}</a></td>
												<td style="vertical-align: midayle">${venderproductbuys.price}</td>
												<td style="vertical-align: midayle">${venderproductbuys.qty}</td>
												<td style="vertical-align: midayle">${venderproductbuys.totalprice}</td>
											<tr>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="row" style="margin-top: 5px;">
						<div class="col-md-2"></div>
						<select id="venderproductbuy_insert_form_searchvendercode"
							style="width: 15%; text-align: center">
							<option value="0000">거래처선택</option>
							<c:forEach var="vender" items="${venders}" varStatus="status">
								<option value="${vender.vendercode}">${vender.vendername}</option>
							</c:forEach>
						</select> <select id="venderproductbuy_insert_form_searchvenderproductcode"
							name="searchvenderproductcode"
							style="width: 15%; text-align: center">
						</select> <select id="venderproductbuy_insert_form_searchyear"
							name="searchyear" style="width: 15%; text-align: center">
							<c:forEach begin="2000" end="2020" var="year">
								<option value="${year}">${year}</option>
							</c:forEach>
						</select> <select id="venderproductbuy_insert_form_searchmonth"
							name="searchmonth" style="width: 15%; text-align: center">
							<c:forEach begin="0" end="12" var="month">
								<option value="${month}"><c:choose>
										<c:when test="${month==0}">전체</c:when>
										<c:otherwise>${month}</c:otherwise>
									</c:choose></option>
							</c:forEach>
						</select> <select id="venderproductbuy_insert_form_searchday"
							name="searchday" style="width: 15%; text-align: center">
							<c:forEach begin="0" end="31" var="day">
								<option value="${day}"><c:choose>
										<c:when test="${day==0}">전체</c:when>
										<c:otherwise>${day}</c:otherwise>
									</c:choose></option>
							</c:forEach>
						</select>
						<button type="button" id="venderproductbuy_insert_from_searchbtn"
							class="btn btn-primary">검색</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- Modal -->
	<div id="venderproductbuy_insert_form_myModal" class="modal fade"
		role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close " data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body" id="modal-body">
					<p>
						<span id="modalmsgvender"></span>
					<p>
						<span id="modalmsgproduct"></span>
					<p>
						<span id="modalmsg"></span>
					</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-success modal_btn1"
						data-dismiss="modal">확인</button>
					<button type="button" class="btn btn-danger modal_btn2"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>


</body>
</html>