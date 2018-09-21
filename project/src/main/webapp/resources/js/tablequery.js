





$(document).ready(function() {
	
	
	$('#tableSelectBtn').on('click',function(){
		
		window.location = "tableOrder?num="+$('#tableSelectNum').val();
		
		});
	
	$('#tableConfirm').on('click',function(){
		
		window.location = "tableConfirm";
		
		});
	
	$('#tableChatBtn').on('click',function(){
		
		window.location = "tableChat?num="+$('#tableSelectNum').val();
		
		});

});







$('#orderTableBtn').click(function() {
	
    var dd=$('#no').val();
    
 
			if($('#orderSelectInput').val()!=""){
			
				$('#mytable > tbody:last').append(
						 '<tr>'
						 +'<td name="proname">'+ $('#orderSelectInput').val()+' </td>'
						 +'<td name="price">' +$('#orderPriceInput').val() + '</td>'
						 +'<td name="qty">'+$('#orderNumBtn').html()+' </td>'
						 +'<td name="sum">' + Number($('#orderNumBtn').html())*Number($('#orderPriceInput').val()) + '</td>'
						 +'<td width="2"> <button type="button" id="abasdfsd" class="btn btn-link choimg">X</button></td>'
						 +'</tr>'
						 );
				
			}
			 
			 
  });


$('#tableOrderBtn').click(function() {
	
	var tableno=$('#tableno').val();
	
	var no=$('#no').val();
	
    var data = jQuery.param($('td').map(function() {
	    return {
	        name: $(this).attr('name'),
	        value: $(this).text().trim()
	    };
	}));
    
    alert(no+" "+tableno );
    
    $.ajax({
    	type:'POST',
		data : data+"&tableno="+tableno+" &no="+no,
		datatype: "Table",
		url : 'tableTe',
		success : function(d){
		},
		  error:function(request,status,error){
			  alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		      }
	});
    
    
  });
  
  $('#tableResetBtn').click(function() {
	  $( '#mytable > tbody').empty();
	  
	  //	$('#mytable > tbody:last > tr:last').remove();
	  
  });
     
  $(document).on('click', '.orderSelectBtn', function(e) {

	  $(document).ready(function () {
	  
		  $('.orderSelectBtn').click(function() {
	  
			  var str= $( this ).html();
			  var arr=str.split('<br>');
	  
			  $('#orderSelectInput').attr('value',arr[1]);
			  $('#orderPriceInput').attr('value',arr[2]);
			  $('#orderNumBtn').html(1);  
	  
		  });
  
	  });
  });
  
  $('#orderPlusBtn').click(function() {
	  
	  $('#orderNumBtn').html(Number( $('#orderNumBtn').html()) +1);
	  
  });

 $('#orderSubBtn').click(function() {
	  if(Number( $('#orderNumBtn').html()) >=1 ){
		  $('#orderNumBtn').html(Number( $('#orderNumBtn').html()) -1);  
	  }
	  
  });

 $(document).on('click', '.choimg', function(e) {

	  $(this).parent().parent().remove();

	});
 
 $('#category').on('change', function() {

		var category = $(this).children('option:selected').text();

		
		$.ajax({
	    	type:'POST',
			data : "category=" + category,
			datatype: "ArrayList<Product>",
			url : 'tableT',
			success : function(d){
				$('#test').empty();
				  
				d.forEach(function(item){
					$('#test').append(
						'<div style="height: 125px; align: center" class="input-group-prepend">'
							+'<div  style="width: 20%;">'
								+'<button style="width: 100%;height:50%" type="button" id="orderSelectBtn"' 
								+'class="btn btn-link orderSelectBtn" onclick="s()" ><br>'+item.proname+'<br>'+item.price+'</button>'
							+'</div>'
							+'<img class="rounded" src="resources/img/a.jpg" id="img"'
								+'height=100%; width=30%; /> <span class="input-group-text"'
								+'style="width: 70%;">'+item.memo+'</span>'
						+'</div>'
						+'<div style="height: 20px"></div>'
					  );
				  });
			},
			  error:function(request,status,error){
				  alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

			      }
		});
		
 });
 


 $('#tableConfirmNum').on('change', function() {

		var tableno = $(this).children('option:selected').text();
		
		$.ajax({
	    	type:'POST',
			data : "tableno=" + tableno,
			datatype: "ArrayList<Table>",
			url : 'tableC',
			success : function(d){
				$('#table4confirm > tbody').empty();
				d.forEach(function(item){
					
					 $('#table4confirm > tbody:last').append(
							 '<tr>'
							 +'<td name="seq">'+item.seq +' </td>'
							 +'<td name="proname">'+item.proname +' </td>'
							 +'<td name="price">' + item.price+ '</td>'
							 +'<td name="qty">'+ item.qty+' </td>'
							 +'<td name="sum">' + item.sum + '</td>'
							 +'<td >' + item.orderchk + '</td>'
							 +'<td name="tableno">' + item.tableno + '</td>'
							 +'</tr>'
							 );
					
				  });
			},
			  error:function(request,status,error){
				  alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

			      }
		});
		
 });
 

 $('#orderInsert').click(function() {
 	
     var data = jQuery.param($('td').map(function() {
 	    return {
 	        name: $(this).attr('name'),
 	        value: $(this).text().trim()
 	    };
 	}));
     
     $.ajax({
     	type:'POST',
 		data : data,
 		datatype: "ArrayList<Table>",
 		url : 'tableIn',
 		success : function(d){
 			
 			$('#table4order > tbody').empty();
			  
			d.forEach(function(item){
				 $('#table4order > tbody:last').append(
						 '<tr>'
						 +'<td name="seq">'+item.ordernum +' </td>'
						 +'<td name="proname">'+item.proname +' </td>'
						 +'<td name="price">' + item.price+ '</td>'
						 +'<td name="qty">'+ item.qty+' </td>'
						 +'<td name="sum">' + item.sum + '</td>'
						 +'<td name="tableno">' + item.tableno + '</td>'
						 +'</tr>'
						 );
				
			  });
 			
 		},
 		  error:function(request,status,error){
 			  alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
 		      }
 	});
     
     
     
   });
 
 $('#orderComplete').click(function() {
	 	
     var data = jQuery.param($('td').map(function() {
 	    return {
 	        name: $(this).attr('name'),
 	        value: $(this).text().trim()
 	    };
 	}));
     
     $.ajax({
     	type:'POST',
 		data : data,
 		datatype: "ArrayList<Table>",
 		url : 'tableCo',
 		success : function(d){
 			$('#table4confirm > tbody').empty();
 			$('#table4order > tbody').empty();
			  
			d.forEach(function(item){
				 $('#table4order > tbody:last').append(
						 '<tr>'
						 +'<td name="seq">'+item.ordernum +' </td>'
						 +'<td name="proname">'+item.proname +' </td>'
						 +'<td name="price">' + item.price+ '</td>'
						 +'<td name="qty">'+ item.qty+' </td>'
						 +'<td name="sum">' + item.sum + '</td>'
						 +'<td name="tableno">' + item.tableno + '</td>'
						 +'</tr>'
						 );
				
			  });
 			
 		},
 		  error:function(request,status,error){
 			  alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
 		      }
 	});
     
     
     
   });
 