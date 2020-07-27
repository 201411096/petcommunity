//
//function getCartList(){
//	$.ajax({
//		type : 'post',
//		async:true,
//		url : '/petcommunity/productCartByAjax.do',
//		contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
//		dataType : 'json',
//		success : function(resultData){	
//			buyTable(resultData);
//		},
//		error:function(request,status,error){
//			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
//		}		
//	});
//}
//
//function buyTable(data){
//	
//	var amountOfCartList=data.length;
//	//검색된 목록의 개수가 0이라면 메시지 띄어주기
//	if(amountOfCartList==0){
//		
//		$('.totalTable').empty();
//		$('.totalTable').html('결제할 상품이 없습니다!');
//	//그렇지 않으면 목록 보여주기
//	}else{
//		$('#cartLists').empty();
//		$('#forEmptyList').empty();
//		var finalPrice=0;
//		$('#listBeforePaying').empty();
//		var trPrefix = '<tr>';
//		var trSuffix = '</tr>';
//		var tdPrefix = '<td>';
//		var tdSuffix = '</td>';
//		
//		for(var i in data){
//			//구매리스트 목록 생성		
//			var listContent = 
//							'<tr class=buyListHeight>' +
//							tdPrefix + 
//							"<img src='resources/imgs/product_image/pawInHand/".concat(data[i].productName) +".jpg' id=cartListImg+"+[i]+" />"+ tdSuffix +
//							'<input type=hidden name="productId" value='+data[i].productId +' >'+
//							tdPrefix + "<span id=productName"+[i]+'>' + data[i].productName.substr(0,30) +'</span>' +tdSuffix +
//							tdPrefix + '<span id=productPrice'+[i]+'>'+ data[i].productPrice + '</span>원' + tdSuffix +
//							tdPrefix + '<span name="buyCnt">'+data[i].buycartlistCnt+'</span>' + tdSuffix +
//							tdPrefix + "<span name="productTotalPrice" id=productTotalPrice"+[i]+">"+data[i].productPrice*data[i].buycartlistCnt+'</span>원' + tdSuffix +						
//							trSuffix;
//			$('#listBeforePaying').append(listContent);
//			//주문 리스트 목록 생성
//			var finalList=
//				'<li><a href=#>' + data[i].productName.substr(0,15) + 
//				'<span class=middle>x' + data[i].buycartlistCnt + '</span> <span name="totalPrice" class="last">'
//				+data[i].productPrice*data[i].buycartlistCnt +'</span></a></li>';
//			$('#forEmptyList').append(finalList);
//			//총 합계 금액 구하기
//			finalPrice += parseInt(data[i].productPrice)*parseInt(data[i].buycartlistCnt);	
//			
//		}	
//		$('#finalPrice').empty();
//		$('#finalPrice').text(finalPrice);
//		$('#finalPriceBeforePaying').text(finalPrice);
//		
//	}
//}	
//
//$(function(){
//	getCartList(); //화면이 뜨면 카트리스트를 받아옴 
//});
//
//$('.main_btn').on('click',function(){
//	 $('#buyfrm').submit();
//});
