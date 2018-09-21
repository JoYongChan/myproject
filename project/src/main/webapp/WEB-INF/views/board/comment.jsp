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
<div class="container">
    <form id="commentForm" name="commentForm" method="post" action="commentInsert">
        <div class="row" >
        <div class="col-md-1"></div>
				<div class="input-group mb-2 col-md-10">
           <span><strong>Comments</strong></span> <span id="cCnt"></span>
            <div>
                <table class="table">                    
                    <tr>
                        <td>
                            <textarea style="width: 900px" rows="3" cols="30" id="content" name="content" placeholder="댓글을 입력하세요"></textarea>
                            <div class="row" style="margin-top: 10px">
                            <div class="col-md-11"></div>
                                <a href='#' onClick="fn_comment('${board.b_seq }')" class="btn pull-right btn-success">등록</a>
                            </div>
                        </td>
                    </tr>
                </table>
             </div>   
            </div>
        </div>
        <input type="hidden" id="b_code" name="b_code" value="${board.b_seq }" />        
    </form>
</div>
<div class="container">
    <form id="commentListForm" name="commentListForm" method="post">
    
    	<div class="row" >
   		 <div class="col-md-1"></div>
   		 
        	<div id="commentList" style="margin-bottom: 100px">
        	
       	 	</div>
    	</div>
    </form>
</div>
</body>
</html>