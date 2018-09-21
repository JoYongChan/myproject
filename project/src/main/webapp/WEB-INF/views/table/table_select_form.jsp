<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>


	
	
</head>

<body>
<form   data-parsley-validate="true" 
		id="member_insert_form" action="memberInsertC" method="post"	
		enctype="multipart/form-data" role="form"
		>

	
			
	
	
	<div class="container" align="center">
	
	
	<div class="row" style="height:300px"></div>
			
	
	
	<div class="row">
	  			<div class="col-md-4"  ></div>
	   			<div class="input-group mb-3 col-md-4"  >
	   			
	   				<div class="input-group-prepend"  >
		   				<span class="input-group-text">
			     			<i class="fas fa-address-book" style="font-size:20px;color: #0066b3">TABLE</i>
			     		</span> 
			     		
			      		<select name="" id="tableSelectNum" style="width: 100px" id="tableSelectNum">
							<option value=1 selected="selected">1</option>
							<c:forEach var="num" begin="2" end="12" varStatus="status">
								<option value="${status.current}">${num}</option>
							</c:forEach>
						</select>
						
						<button style="width:" type="button" id="tableSelectBtn" 
						class="btn btn-primary">주문</button>
	   				</div>
	   			</div>
	   		 	<div class="col-md-4" ></div>
		</div>
		
		<div class="row">
	  			<div class="col-md-4"  ></div>
	   			<div class="input-group mb-3 col-md-4"  >
	   			
	   				<div class="input-group-prepend"  >
		   				<span class="input-group-text">
			     			<i class="fas fa-address-book" style="font-size:20px;color: #0066b3">TABLE</i>
			     		</span> 
						<button style="width:" type="button" id="tableConfirm" 
						class="btn btn-primary">카운터</button>
	   				</div>
	   			</div>
	   		 	<div class="col-md-4" ></div>
		</div>
		
		<div style="height:15px"></div>
		
	

	
	
	
	
	
	
	
	
	
	</div>
	
	
</form>

</body>
</html>