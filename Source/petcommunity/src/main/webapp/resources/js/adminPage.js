var curPage;
var defaultOpts={
		visiblePages : 10,
		onPageClick : function(event,page){
			$('#page-content').text('page'+page);
			curPage=page;
			getDataInpaging();
		}
};

getData();
$('#searchBtn').on('click', function(){
	getData();
	
});

$('#startdate').attr('value', (new Date().toISOString().substring(0, 10)));
//var date = new Date();
//document.getElementById('startdate').valueAsDate = date;

function getDataInpaging(){
	$.ajax({
		type : 'post',
		async : true,
		url : '/petcommunity/adminListPage.do',
		contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
		data : {"startDate" : $('#startDate').val(),
			"endDate" : $('#endDate').val(),
			"curPage" : curPage},
		dataType : 'json',
		success : function(resultData){
			console.log("getDataInpaging")
			window.scrollTo(0,0);
			drawTable(resultData);
		},
		error : function(request, status, error){
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}

function getData(){
	$.ajax({
		type : 'post',
		async:true,
		url : '/petcommunity/adminListPage.do',
		contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
		data : {"startDate" : $('#startDate').val(),
			"endDate" : $('#endDate').val(),
			"curPage" : curPage},
		dataType : 'json',
		success : function(resultData){
			console.log("getData")
			drawTable(resultData);
            var totalPages = resultData.pagination.pageCnt;
            var currentPage = $('#pagination-demo').twbsPagination('getCurrentPage');
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

function drawTable(data){
	$('#SalesHistoryTbody').empty();
	var trPrefix = '<tr>';
	var trSuffix = '</tr>';
	var tdPrefix = '<td>';
	var tdSuffix = '</td>';
	for(var i=0; i<data.salesListSize; i++){
		var listContent =
			trPrefix +
				tdPrefix
				+data.salesList[i].buylistDate
				+tdSuffix+
				
				tdPrefix+
				'<a href="/petcommunity/productView.do?productId='+data.salesList[i].productId +'">'
				+data.salesList[i].productName
				+tdSuffix+
				
				tdPrefix+
				data.salesList[i].buyCnt
				+tdSuffix+
				
				tdPrefix+
				data.salesList[i].buyTotalprice
				+tdSuffix+
				
			trSuffix;
		$('#SalesHistoryTbody').append(listContent);
	}
}
$(document).ready(function() {
	

$('ul.tabs li').click(function(){
		var tab_id = $(this).attr('data-tab');

		$('ul.tabs li').removeClass('current');
		$('.tab-content').removeClass('current');

		$(this).addClass('current');
		$("#"+tab_id).addClass('current');
	});

});


	
