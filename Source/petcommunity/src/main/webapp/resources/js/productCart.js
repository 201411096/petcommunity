function getCartList(){

	$.ajax({
		type : 'post',
		async:true,
		url : '/petcommunity/productCartByAjax.do',
		contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
		dataType : 'json',
		success : function(resultData){
	
			cartTable(resultData);
		},
		error:function(request,status,error){
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}		
	});
}

function cartTable(data){

	$('#cartLists').empty();
	var trPrefix = '<tr>';
	var trSuffix = '</tr>';
	var tdPrefix = '<td>';
	var tdSuffix = '</td>';
	
	for(var i in data){
		var listContent = 
						trPrefix +
						tdPrefix + 
						'<a href=#><img src="resources/imgs/product_image/pawInHand/"'+ data[i].productName +' id="cartListImg"'+[i]+"/></a>"+ tdSuffix +
						tdPrefix + "<span id='productName'"+[i]+'>' + data[i].productName +'</span>&nbsp;(<span id="productPrice"'+[i]+'>'+ data[i].productPrice + '</span>원)' +tdSuffix +
						tdPrefix + "<span id='productTotalPrice'"+[i]+">"+data[i].productPrice+'</span>원' + tdSuffix +
						tdPrefix + 
							'<span>'+
								"<input type='number' id='productAmount" +[i] + ' class="form-control" min="0" value='+data[i].buycartlistCnt+'/> '
							+'</span>'+
						tdSuffix +
						tdPrefix + "<a href='#'><img src='resources/imgs/product_image/cartImg/cancelButton.png'></a>" + tdSuffix +
						trSuffix;
		$('#cartLists').append(listContent);
	}
}

$(function(){
	getCartList(); //화면이 뜨면 카트리스트를 받아옴 
	$('#productAmount1').change(function(){
		$('#productTotalPrice1').text($('#productAmount1').val()*$('#productPrice1').text());
	});
});

