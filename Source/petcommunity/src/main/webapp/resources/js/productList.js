var tagCategory;
var curPage;
var defaultOpts = {
	visiblePages : 10,
    onPageClick: function (event, page) {
    	$('#page-content').text('Page');
    	curPage=page;
        getDataInPaging(tagCategory);
    }
};

$(function(){
	searchAutoComplete();
	tagCategory="all";
	getData(tagCategory);
	$('.tagCategory').on('click', function(){
		tagCategory = $(this).attr( 'value' );
		getData(tagCategory);
	});
	$('#searchBtn').on('click', function(){
		tagCategory = $('#searchSomething').val();
		getData(tagCategory);
	});
	$("#searchSomething").keyup(function (key) {
        if (key.keyCode == 13) { // 엔터키면
        	tagCategory = $('#searchSomething').val();
    		getData(tagCategory);
        }
    });
});

function searchAutoComplete(){
	$('#searchSomething').autocomplete({
		source : function( request, response ) {
            $.ajax({
                   type: 'get',
                   url: "/petcommunity/productAutoCompleteSearch.do",
                   dataType: "json",
                   data:{
                	   	"searchSomething" : $('#searchSomething').val(),
                   },
                   success: function(data) {
                	   console.log('autocomplete success');
                       //서버에서 json 데이터 response 후 목록에 추가
                       response(
                           $.map(data, function(item) {    //json[i] 번째 에 있는게 item 임.
                               return {
                                   label: item,    			//UI 에서 보여지는 글자, 실제 검색어랑 비교 대상
                                   value: item,    		   //사용자 값
                               }
                           })
                       );
                   },
                   error: function(data){
                	   console.log('autocomplete error');
                   }
              });
           },
           select : function(event, ui){
        	   
           },
           appendTo :'#searchInput-container',
           minLength: 1,		 // 최소 글자수
           autoFocus: true,		 //첫번째 항목 자동 포커스 기본값 false
           delay : 500,
           close : function(event){ 
           }
	});
}

function getDataInPaging(tagCategory){
	$.ajax({
		type : 'post',
		async:true,
		url : '/petcommunity/productSelect.do',
		contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
		data : {"tagCategory" : tagCategory,
				"curPage" : curPage
				},
		dataType : 'json',
		success : function(resultData){
			window.scrollTo(0, 0);
			drawProductTable(resultData);
		},
		error:function(request,status,error){
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
				
	});
}

function getData(tagCategory){
	$.ajax({
		type : 'post',
		async:true,
		url : '/petcommunity/productSelect.do',
		contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
		data : {"tagCategory" : tagCategory,
				"curPage" : curPage
			},
		dataType : 'json',
		success : function(resultData){
			drawProductTable(resultData);
			var totalPages = resultData.pagination.pageCnt;
            var currentPage = 1;
            $('#pagination-demo').twbsPagination('destroy');
            $('#pagination-demo').twbsPagination($.extend({}, defaultOpts, {
                startPage: currentPage,
                totalPages: totalPages
            }));
		},
		error:function(request,status,error){
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}		
	});
}

function drawProductTable(data){
	$('#productTable').empty();
	var divPrefix1 = '<div class="col-lg-4 col-sm-6 artists-col">';
	var a1 = '<a href="/petcommunity/productView.do?productId=';
	var a2 = '">';
	var divPrefix2 = '<div class="artists-item">';
	var img1 = '<img src="./resources/imgs/product_image/internal/product_image/';
	var img2 = '.jpg" alt="">';
	var h41 = '<h4>';
	var h42 = '</h4>';
	var span1 = '<span>'; 
	var span2 = '</span>';
	var p1 = '<p>';
	var p2 = '</p>';
	var divSuffix = '</div>';
	var aSuffix = '</a>';
	
	for(var i=0; i<data.productListSize; i++){
		var listContent = 
			divPrefix1 + 
			a1 + data.productList[i].productId + a2 +
			divPrefix2 +
			img1 + data.productList[i].productName + img2 +
			h41 + data.productList[i].productName + h42 +
			span1 + data.productList[i].productPrice + span2 +
			p1 + data.productList[i].productFeature + p2 +
			divSuffix +
			aSuffix +
			divSuffix;
		$('#productTable').append(listContent);
	}
}
