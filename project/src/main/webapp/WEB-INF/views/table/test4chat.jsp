<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="icon" type="image/png" href="resources/images/svnicon.png" />
<!-- favicon fix -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- jQuery, bootstrap CDN -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.js"></script>
<!-- msie 문제 해결 -->
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<!-- Zebra-Dialog CDN -->
<script src="resources/js/dialog/zebra_dialog.src.js"></script>
<link rel="stylesheet" href="resources/css/dialog/zebra_dialog.css"
	type="text/css" />
<!-- SocketJS CDN -->
<script src="https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>

<title>Chatting page</title>

<style>
.pre-scrollable {
	max-height: 500px;
	overflow-y: scroll;
}
</style>

</head>
<body>
	<div>
		<div>
			
			<div class="row">
	   			<div class="input-group mb-3 col-md-4"  >
	   			
	   				<div class="input-group-prepend"  >
		   				<span class="input-group-text">
			     			<i class="fas fa-address-book" style="font-size:20px;color: #0066b3">TABLE</i>
			     		</span> 
			     		
			     		<c:set var="id" value="${userid}" />
			     		<c:choose>
			     		<c:when test="${fn:contains(id , 'counter' )}">
							<select name="" id="tableConfirmNum" style="width: 50px" id="tableSelectNum">
							<option value=1 selected="selected">1</option>
							<c:forEach var="num" begin="2" end="12" varStatus="status">
								<option value="${status.current}">${num}</option>
							</c:forEach>
							</select>
							<button style="width:" type="button" id="confirmBtn" 
							class="btn btn-primary">확인</button>
							<button style="width:" type="button" id="sendBtn" 
							class="btn btn-primary">전송</button>
						</c:when>
						
						<c:when test="${fn:contains( id ,'table')}">
							<select name="" id="tableConfirmNum" style="width: 50px" id="tableSelectNum">
							<option value=${usernum} selected="selected">${usernum}</option>
							</select>
							<button style="width:" type="button" id="sendBtn" 
							class="btn btn-primary">전송</button>
						</c:when>
			     		
			     		</c:choose>
			      		
	   				</div>
	   			</div>
	   		 	<div class="col-md-4" ></div>
		</div>
		</div>
		<br>
		<div class="well" id="chatdata">
			<!-- User Session Info Hidden -->
			<input type="hidden" value='${userid}' id="sessionuserid">
		</div>
	</div>
</body>

<script type="text/javascript">
//websocket을 지정한 URL로 연결
var sock= new SockJS("<c:url value="/echo"/>");
//websocket 서버에서 메시지를 보내면 자동으로 실행된다.
sock.onmessage = onMessage;
//websocket 과 연결을 끊고 싶을때 실행하는 메소드
sock.onclose = onClose;

$(function(){
	$("#sendBtn").click(function(){
        sendMessage();
        var currentuser_session = "id"+$('#sessionuserid').val();
        
       
    	
    	
    });
});
        
function sendMessage(){      
	//websocket으로 메시지를 보내겠다.
  	sock.send($("#message").val());
}
            
//evt 파라미터는 websocket이 보내준 데이터다.
function onMessage(evt){  //변수 안에 function자체를 넣음.
	
	var data = evt.data;
	var sessionid = null;
	var message = null;
	
	var confirmNum=$('#tableConfirmNum').val();
	
	//문자열을 splite//
	var strArray = data.split('|');
	
	for(var i=0; i<strArray.length; i++){
		console.log('str['+i+']: ' + strArray[i]);
	}
	
	//current session id//
	var currentuser_session = "id"+$('#sessionuserid').val();
	
	sessionid = strArray[0]; //현재 메세지를 보낸 사람의 세션 등록//
	message = strArray[1]; //현재 메세지를 저장//
	
	//나와 상대방이 보낸 메세지를 구분하여 영역을 나눈다.//
	
	 if(currentuser_session.indexOf("table")==2){
		 var printHTML = "<div class='well'>";
			printHTML += "<div class='alert alert-info'>";
			printHTML += "<strong> -> "+"테이블"+confirmNum+"번주문요청"+"</strong>";
			printHTML += "</div>";
			printHTML += "</div>";
			
			$("#chatdata").append(printHTML);
     }
	
	 if(currentuser_session.indexOf("counter")==2){
    	 var printHTML = "<div class='well'>";
 		printHTML += "<div class='alert alert-info'>";
 		printHTML += "<strong> -> "+"테이블"+confirmNum+"번 주문확인"+"</strong>";
 		printHTML += "</div>";
 		printHTML += "</div>";
 		
 		$("#chatdata").append(printHTML);
     }
	
	console.log('chatting data: ' + data);
	
  	/* sock.close(); */
}
    
function onClose(evt){
	$("#data").append("연결 끊김");
}    

</script>
</html>