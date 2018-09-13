// 숫자만 입력
// onkeydown
function onlyNumber(event) {
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if ((keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105)
			|| keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39
			|| keyID == 9)
		return;
	else
		return false;
}
// onkeyup
function removeChar(event) {
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if (keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 || keyID == 9)
		return;
	else
		event.target.value = event.target.value.replace(/[^0-9]/g, "");
}

function ZipcodeFind() {
	new daum.Postcode({
		oncomplete : function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
			var extraRoadAddr = ''; // 도로명 조합형 주소 변수

			// 법정동명이 있을 경우 추가한다. (법정리는 제외)
			// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
			if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
				extraRoadAddr += data.bname;
			}
			// 건물명이 있고, 공동주택일 경우 추가한다.
			if (data.buildingName !== '' && data.apartment === 'Y') {
				extraRoadAddr += (extraRoadAddr !== '' ? ', '
						+ data.buildingName : data.buildingName);
			}
			// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
			if (extraRoadAddr !== '') {
				extraRoadAddr = ' (' + extraRoadAddr + ')';
			}
			// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
			if (fullRoadAddr !== '') {
				fullRoadAddr += extraRoadAddr;
			}

			// 우편번호와 주소 정보를 해당 필드에 넣는다. //vender
			document.getElementById('postno').value = data.zonecode; // 5자리
			// 새우편번호
			// 사용
			document.getElementById('newaddr').value = fullRoadAddr;
			document.getElementById('oldaddr').value = data.jibunAddress;
		}
	}).open();

}

function selectedBuyid(buyid) {
	$.ajax({
		type : "POST",
		data : "buyid=" + buyid,
		datatype : 'json',
		url : "venderproductbuyDetail",
		success : function(data) {
			$('#venderproductbuy_insert_form_hiddenbuyid').val(data.buyid);
			$('#venderproductbuy_insert_form_vendercode').empty();
			var option = $("<option value='" + data.vendercode + "'>" + data.vendername + "</option>")
			$('#venderproductbuy_insert_form_vendercode').append(option);
			$('#venderproductbuy_insert_form_venderproductcode').empty();
			option = $("<option value='" + data.venderproductcode
					+ "'>" 
					+ data.proname + "---"
					+ data.capacity + "</option>");
			$('#venderproductbuy_insert_form_venderproductcode').append(option);
			$('#venderproductbuy_insert_form_year').val(data.year);
			$('#venderproductbuy_insert_form_month').val(data.month);
			$('#venderproductbuy_insert_form_day').val(data.day);
			$('#venderproductbuy_insert_form_no').val(data.no);
			$('#venderproductbuy_insert_form_hang').val(data.hang);
			$('#venderproductbuy_insert_form_stock').val(data.stock);
			$('#venderproductbuy_insert_form_price').val(data.price);
			$('#venderproductbuy_insert_form_qty').val(data.qty);
			$('#venderproductbuy_insert_form_hiddenpreqty').val(data.qty);
			$('#venderproductbuy_insert_form_memo').val(data.memo);
			var now = new Date();
			var year= now.getFullYear();
			var month = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
			var day = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();
			if(year == data.year && month == data.month && day == data.day){
				$('#venderproductbuy_insert_form_update').show();
				$('#venderproductbuy_insert_form_delete').show();
			}
			else{
				alert("현재 날짜의 거래처 물품 구매만 수정 가능하며, 과거의 구매는 확인만 가능");
			}
			$('#venderproductbuy_insert_form_save').hide();
			$('#venderproductbuy_insert_form_reset').hide();
		},
		error : function(xr, status, error) {
			alert("ajax error");
		}
	});
}

$(document).ready(
		function() {
			$('#venderproduct_insert_form_save').on('click', function(){
				var confirm = $('#venderproduct_insert_form_confirm_yn').val();
				if(confirm == 'y'){
					$('#venderproduct_insert_form').submit();
				}
				else{
					$('#venderproduct_insert_form_myModal').modal('show');
					$('.modal-body').text("코드 중복검사를 실행해주세요.");
					$('.modal_btn1').hide();
				}
			});
			
			$('#venderproduct_insert_form_confirm').on('click', function(){
				var venderproductcode = $('#venderproduct_insert_form_venderproductcode').val();
				if(venderproductcode == ''){
					$('#venderproduct_insert_form_myModal').modal('show');
					$('.modal-body').text("코드를 입력해주세요.");
					$('.modal_btn1').hide();
					$('#venderproduct_insert_form_confirm_yn').val('n');
				}
				else{
					$.ajax({
						type : "POST",
						data : "venderproductcode=" + venderproductcode,
						datatype : 'json',
						url : "venderProductConfirm",
						success : function(data) {
							if(data == 0){
								$('#venderproduct_insert_form_myModal').modal('show');
								$('.modal-body').text("해당 코드 사용가능");
								$('.modal_btn1').text("사용");
								$('.modal_btn1').show();
								$('.modal_btn2').text("취소");
								$('.modal_btn2').on('click', function(){
									$('#venderproduct_insert_form_venderproductcode').val('');
								});
								$('#venderproduct_insert_form_confirm_yn').val('y');
							}
							else{
								$('#venderproduct_insert_form_myModal').modal('show');
								$('.modal-body').text("중복된 코드가 존재합니다.");
								$('.modal_btn1').hide();
								$('#venderproduct_insert_form_confirm_yn').val('n');
							}
						},
						error : function(xr, status, error) {
							alert("ajax error");
						}
					});
				}
			});
			
			$('#vender_insert_form_save').on('click', function(){
				var confirm = $('#vender_insert_form_confirm_yn').val();
				if(confirm == 'y'){
					$('#vender_insert_form').submit();
				}
				else{
					$('#vender_insert_form_myModal').modal('show');
					$('.modal-body').text("코드 중복검사를 실행해주세요.");
					$('.modal_btn1').hide();
				}
			});
			
			$('#vender_insert_form_confirm').on('click', function(){
				var vendercode = $('#vender_insert_form_vendercode').val();
				if(vendercode == ''){
					$('#vender_insert_form_myModal').modal('show');
					$('.modal-body').text("코드를 입력해주세요.");
					$('.modal_btn1').hide();
					$('#vender_insert_form_confirm_yn').val('n');
				}
				else{
					$.ajax({
						type : "POST",
						data : "vendercode=" + vendercode,
						datatype : 'json',
						url : "venderConfirm",
						success : function(data) {
							if(data == 0){
								$('#vender_insert_form_myModal').modal('show');
								$('.modal-body').text("해당 코드 사용가능");
								$('.modal_btn1').text("사용");
								$('.modal_btn1').show();
								$('.modal_btn2').text("취소");
								$('.modal_btn2').on('click', function(){
									$('#vender_insert_form_vendercode').val('');
								});
								$('#vender_insert_form_confirm_yn').val('y');
							}
							else{
								$('#vender_insert_form_myModal').modal('show');
								$('.modal-body').text("중복된 코드가 존재합니다.");
								$('.modal_btn1').hide();
								$('#vender_insert_form_confirm_yn').val('n');
							}
						},
						error : function(xr, status, error) {
							alert("ajax error");
						}
					});
				}
			});
			
			$('#saleproduct_update_form_delete').on('click', function(){
				var saleprocode = $('#saleproduct_update_form_saleprocode').val();
				$('#saleproduct_update_form_myModal').modal('show');
				$('.modal-body').text("관련된 항목이 전부 삭제됩니다. 삭제하시겠습니까?");
				$('.modal_btn1').text("삭제");
				$('.modal_btn1').on('click', function() {
					var url = "saleproductDelete?saleprocode=" + saleprocode;
					$(location).attr('href', url);
				});
			});
			
			$('#venderproduct_update_form_delete').on('click', function(){
				var venderproductcode = $('#venderproduct_update_form_venderproductcode').val();
				$('#venderproduct_update_form_myModal').modal('show');
				$('.modal-body').text("관련된 항목이 전부 삭제됩니다. 삭제하시겠습니까?");
				$('.modal_btn1').text("삭제");
				$('.modal_btn1').on('click', function() {
					var url = "venderproductDelete?venderproductcode=" + venderproductcode;
					$(location).attr('href', url);
				});
			});
			
			$('#venderproductbuy_insert_form_delete').on('click', function(){
				var buyid=$('#venderproductbuy_insert_form_hiddenbuyid').val();
				$('#venderproductbuy_insert_form_myModal').modal('show');
				$('.modal-body').text("관련된 항목이 전부 삭제됩니다. 삭제하시겠습니까?");
				$('.modal_btn1').text("삭제");
				$('.modal_btn1').on('click', function() {
					var url = "venderProductBuyDelete?buyid=" + buyid;
					$(location).attr('href', url);
				});
			});
			
			$('#venderproductbuy_insert_form_update').on('click', function(){
				$('#venderproductbuy_insert_form').attr('action', 'venderProductBuyUpdate');
				$('#venderproductbuy_insert_form').submit();
			});
			
			$('#product_update_form_delete').on('click', function(){
				var procode = $('#product_update_form_procode').val();
				$('#product_update_form_myModal').modal('show');
				$('.modal-body').text("관련된 항목이 전부 삭제됩니다. 삭제하시겠습니까?");
				$('.modal_btn1').text("삭제");
				$('.modal_btn1').on('click', function() {
					var url = "productDelete?procode=" + procode;
					$(location).attr('href', url);
				});
			});
			
			$('#vender_update_form_delete').on('click', function(){
				var vendercode = $('#vender_update_form_vendercode').val();
				$('#vender_update_form_myModal').modal('show');
				$('.modal-body').text("관련된 항목이 전부 삭제됩니다. 삭제하시겠습니까?");
				$('.modal_btn1').text("삭제");
				$('.modal_btn1').on('click', function() {
					var url = "venderDelete?vendercode=" + vendercode;
					$(location).attr('href', url);
				});
			});
			
			$('#close_form_close').on('click', function(){
				$('#close_form').submit();
			});
			$('#venderproductbuy_insert_from_searchbtn')
			.on(
					'click',
					function() {
						var searchvendcode = $(
								'#venderproductbuy_insert_form_searchvendercode')
								.children('option:selected')
								.val();
						var searchvenderprocode = $(
								'#venderproductbuy_insert_form_searchvenderproductcode')
								.children('option:selected')
								.val();
						var searchyyyy = $(
								'#venderproductbuy_insert_form_searchyear')
								.children('option:selected')
								.val();
						var searchmm = $(
								'#venderproductbuy_insert_form_searchmonth')
								.children('option:selected')
								.val();
						var searchdd = $(
								'#venderproductbuy_insert_form_searchday')
								.children('option:selected')
								.val();

						if (searchvendcode == '0000') {
							$('#modalmsgvender').text(
									'- 검색할 매입처를 선택하세요! -');
							$('.modal_btn1').text('close');
							$('.modal_btn2').hide();
							$('#venderproductbuy_insert_form_myModal')
									.modal('show');
							return;
						} else {
							$('#venderproductbuy_search_form').submit();
							alert('submit');
						}
					});
			$('#venderproductbuy_insert_form_searchvendercode').change(
					function() {
						var vendercode = $(this).val();
						$.ajax({
							type : "POST",
							data : "vendercode=" + vendercode,
							datatype : 'json',
							url : "selectVenderProduct",
							success : function(data) {
								$('#venderproductbuy_insert_form_searchvenderproductcode').empty();
								for(var arrNo = 0; arrNo < data.length; arrNo++){
									var option = $("<option value='" + data[arrNo].venderproductcode
											+ "'>" + data[arrNo].proname + "---"
											+ data[arrNo].capacity + "</option>");
									$('#venderproductbuy_insert_form_searchvenderproductcode').append(option);
								}
							},
							error : function(xr, status, error) {
								alert("ajax error");
							}
						});
					});
			$('#venderproductbuy_insert_form_save')
			.on(
					'click',
					function() {
						var selectedvendercode = $(
								'#venderproductbuy_insert_form_vendercode')
								.val();
						var selectedvenderproductcode = $(
								'#venderproductbuy_insert_form_venderproductcode')
								.val();
						var qty = $('#venderproductbuy_insert_form_qty')
								.val();
						if (selectedvendercode == '0000') {
							$('#modalmsgvender').text(
									"매입처를 선택하세요.");
						} else {
							$('#modalmsgvender').text("");
						}
						if (selectedvenderproductcode == '0000') {
							$('#modalmsgproduct').text(
									"상품을 선택하세요.");
						} else {
							$('#modalmsgproduct').text("");
						}
						if (qty == '0') {
							$('#modalmsg').text("수량을 입력하세요.");
						} else {
							$('#modalmsg').text("");
						}
						if (selectedvendercode == '0000'
								|| selectedvenderproductcode == '0000'
								|| qty == '0') {
							$('#venderproductbuy_insert_form_myModal')
									.modal('show');
						} else {
							$('#venderproductbuy_insert_form').attr('action', 'venderProductBuyInsert');
							$('#venderproductbuy_insert_form').submit();
						}

					});
			
			$('#venderproductbuy_insert_form_qty').on(
					'blur',
					function() {
						var amount = $('#venderproductbuy_insert_form_price').val()
								* $('#venderproductbuy_insert_form_qty').val();
						$('#venderproductbuy_insert_form_totalprice').attr("value",
								amount);
					});
			
			$('#venderproductbuy_insert_form_venderproductcode').change(
					function() {
						alert($('#venderproductbuy_insert_form_hiddeninsertchk').val());
						
							var venderproductcode = $(this).val();
							if(venderproductcode != "0000"){
								$.ajax({
									type : "POST",
									data : "venderproductcode=" + venderproductcode,
									datatype : 'json',
									url : "venderProductBuyNew",
									success : function(data) {
										$('#venderproductbuy_insert_form_year').attr(
												'value', data.year);
										$('#venderproductbuy_insert_form_month').attr(
												'value', data.month);
										$('#venderproductbuy_insert_form_day').attr(
												'value', data.day);
										$('#venderproductbuy_insert_form_no').attr(
												'value', data.no);
										$('#venderproductbuy_insert_form_hang').attr(
												'value', data.hang);
										$('#venderproductbuy_insert_form_stock').attr(
												'value', data.stock);
										$('#venderproductbuy_insert_form_price').attr(
												'value', data.price);
									},
									error : function(xr, status, error) {
										alert("ajax error");
									}
								});
							}
							else{
								$('#venderproductbuy_insert_form_year').attr(
										'value', "");
								$('#venderproductbuy_insert_form_month').attr(
										'value', "");
								$('#venderproductbuy_insert_form_day').attr(
										'value', "");
								$('#venderproductbuy_insert_form_no').attr(
										'value', "");
								$('#venderproductbuy_insert_form_hang').attr(
										'value', "");
								$('#venderproductbuy_insert_form_stock').attr(
										'value', "");
								$('#venderproductbuy_insert_form_price').attr(
										'value', "");
							}
					});
			
			$('#venderproductbuy_insert_form_vendercode').change(
					function() {
						var vendercode = $(this).val();
						if(vendercode != "0000"){
							$.ajax({
								type : "POST",
								data : "vendercode=" + vendercode,
								datatype : 'json',
								url : "selectVenderProduct",
								success : function(data) {
									$('#venderproductbuy_insert_form_venderproductcode').empty();
									var option = $("<option value='0000'>거래처 판매물품 선택</option>");
									$('#venderproductbuy_insert_form_venderproductcode').append(option);
									for(var arrNo = 0; arrNo < data.length; arrNo++){
										var option = $("<option value='" + data[arrNo].venderproductcode
												+ "'>" 
												+ data[arrNo].proname + "---"
												+ data[arrNo].capacity + "</option>");
										$('#venderproductbuy_insert_form_venderproductcode').append(option);
									}
								},
								error : function(xr, status, error) {
									alert("ajax error");
								}
							});
						}
						else{
							$('#venderproductbuy_insert_form_year').attr(
									'value', "");
							$('#venderproductbuy_insert_form_month').attr(
									'value', "");
							$('#venderproductbuy_insert_form_day').attr(
									'value', "");
							$('#venderproductbuy_insert_form_no').attr(
									'value', "");
							$('#venderproductbuy_insert_form_hang').attr(
									'value', "");
							$('#venderproductbuy_insert_form_stock').attr(
									'value', "");
							$('#venderproductbuy_insert_form_price').attr(
									'value', "");
						}
						$('#venderproductbuy_insert_form_hiddeninsertchk').attr("value", "y");
					});
			
			$('#productstock_update_form_decstock').on(
					'blur',
					function() {
						var stock = parseInt($('#productstock_update_form_hiddencurstock').val())
								+ parseInt($('#productstock_update_form_incstock').val())
								- parseInt($('#productstock_update_form_decstock').val());
						$('#productstock_update_form_curstock').attr("value", stock);
					});

			$('#productstock_update_form_incstock').on(
					'blur',
					function() {
						var stock = parseInt($('#productstock_update_form_hiddencurstock').val())
								+ parseInt($('#productstock_update_form_incstock').val())
								- parseInt($('#productstock_update_form_decstock').val());
						$('#productstock_update_form_curstock').attr("value", stock);
					});
			
			$('#table_confirm').on('click', function() {
				alert('중복체크');
			});

			$('#store_confirm').on('click', function() {
				alert('중복체크');
			});

			$('#ceo_confirm').on('click', function() {
				alert('중복체크');
			});

			$('#table_save_btn').on('click', function() {
				alert('테이블계정저장');
			});

			$('#store_save_btn').on('click', function() {
				alert('매장관리자계정저장');
			});

			$('#cancel_btn').on('click', function() {
				$(location).attr('href', "loginForm");
			});

			$('#logout1').on('click', function() {
			});
			// <!-- Bootstrap - DataTables -->
			$('#example').DataTable();
		});
