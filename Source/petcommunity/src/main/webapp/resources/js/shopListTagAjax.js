$(function(){
	$('.tagCategory').on('click', function(){
		//getShopData($(this).text())
		getShopData($(this).attr( 'value' ));
	});
});

function getShopData(tagCategory){
	console.log(tagCategory)
	$.ajax({
		type : 'post',
		async:true,
		url : '/petcommunity/shopCategory.do',
		contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
		data : {"tagCategory" : tagCategory
				},
		dataType : 'json',
		success : function(resultData){
			alert("됨")
			drawShopTable(resultData);
		},
		error:function(request,status,error){
			alert("안됨")
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});	
}
function drawShopTable(data){
	$('#shopTable').empty();
	var divPrefix1 = '<div class="col-lg-4 col-sm-6 artists-col">';
	var a1 = '<a href="';
	var a2 = '" target="_blank">';
	var divPrefix2 = '<div class="artists-item">';
	var img1 = '<img src="./resources/imgs/product_image/pawInHand/';
	var img2 = '.jpg" alt="">';
	var h41 = '<h4>';
	var h42 = '</h4>';
	var span1 = '<span>'; 
	var span2 = '</span>';
	var p1 = '<p>';
	var p2 = '</p>';
	var divSuffix = '</div>';
	var aSuffix = '</a>';
	for(var i=0; i<data.shopListSize; i++){
		var listContent = 
			divPrefix1 + 
			a1 + data.shopList[i].shopLink + a2 +
			divPrefix2 +
			img1 + data.shopList[i].shopProductname + img2 +
			h41 + data.shopList[i].shopProductname + h42 +
			span1 + data.shopList[i].shopProductprice + span2 +
			p1 + data.shopList[i].shopName + p2 +
			divSuffix +
			aSuffix +
			divSuffix;
		$('#shopTable').append(listContent);
	}
}