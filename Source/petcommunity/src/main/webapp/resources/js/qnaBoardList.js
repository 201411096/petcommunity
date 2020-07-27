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
	console.log('ii');
	getData();
	
});
	



function getDataInpaging(){
	$.ajax({
		type : 'post',
		async : true,
		url : '/petcommunity/qnaList.do',
		contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
		data : {"searchWord" : $('#keywordInput').val(),
			"searchType" : $('#searchType').val(),
			"curPage" : curPage},
		dataType : 'json',
		success : function(resultData){
			console.log("getDataInpaging")
			window.scrollTo(0,0);
			drawQnaTable(resultData);
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
		url : '/petcommunity/qnaList.do',
		contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
		data : {"searchWord" : $('#keywordInput').val(),
				"searchType" : $('#searchType').val(),
				"curPage" : curPage,
				},
		dataType : 'json',
		success : function(resultData){
			drawQnaTable(resultData);
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

function drawQnaTable(data){
	$('#QnaBoardTbody').empty();
	var trPrefix = '<tr>';
	var trSuffix = '</tr>';
	var tdPrefix = '<td>';
	var tdSuffix = '</td>';
	for(var i=0; i<data.QnaBoardVOListSize; i++){
		var listContent =
			trPrefix +
				tdPrefix
				+data.QnaBoardVOList[i].questionboardId
				+tdSuffix+
				
				tdPrefix+
				'<a href="/petcommunity/qnaContent.do?questionboardId='+data.QnaBoardVOList[i].questionboardId +'">'
				+data.QnaBoardVOList[i].questionboardTitle
				+tdSuffix+
				
				tdPrefix+
				data.QnaBoardVOList[i].questionboardUploadtime
				+tdSuffix+
				
				tdPrefix+
				data.QnaBoardVOList[i].questionboardReadcount
				+tdSuffix+
				
				tdPrefix+
				data.QnaBoardVOList[i].memberId+
				tdSuffix+
			trSuffix;
		
		$('#QnaBoardTbody').append(listContent);
	}
}
