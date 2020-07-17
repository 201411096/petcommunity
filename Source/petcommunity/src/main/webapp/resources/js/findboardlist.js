var curPage;
var defaultOpts = {
	visiblePages : 10,
    onPageClick: function (event, page) {
        $('#page-content').text('Page ' + page);
        curPage=page;
        getDataInPaging();
    }
};

$(function(){
	getData();
//	$('#keywordInput').on('keyup', getData);
	$('#searchBtn').on('click', getData);
	$('#writeBtn').on('click', function(){
		location.href='findBoardWrite.do';
	})
});

function getDataInPaging(){
	$.ajax({
		type : 'post',
		async:true,
		url : '/petcommunity/findboardListWithPaging.do',
		contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
		data : {"searchWord" : $('#keywordInput').val(),
				"searchType" : $('#searchType').val(),
				"curPage" : curPage,
				},
		dataType : 'json',
		success : function(resultData){
			drawTable(resultData);
			console.log(resultData);
		},
		error:function(request,status,error){
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
		
	});
}

function getData(){
	$.ajax({
		type : 'post',
		async:true,
		url : '/petcommunity/findboardListWithPaging.do',
		contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
		data : {"searchWord" : $('#keywordInput').val(),
				"searchType" : $('#searchType').val(),
				"curPage" : curPage,
				},
		dataType : 'json',
		success : function(resultData){
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
	$('#findboardTbody').empty();
	var trPrefix = '<tr>';
	var trSuffix = '</tr>';
	var tdPrefix = '<td>';
	var tdSuffix = '</td>';
	for(var i=0; i<data.findBoardVOListSize; i++){
		var listContent = 
						trPrefix +
						tdPrefix + data.findBoardVOList[i].findboardId + tdSuffix +
						tdPrefix + data.findBoardVOList[i].findboardStatus + tdSuffix +
						tdPrefix + data.findBoardVOList[i].findboardTitle + tdSuffix +
						tdPrefix + data.findBoardVOList[i].findboardName + tdSuffix +
						tdPrefix + data.findBoardVOList[i].findboardReadcount + tdSuffix +
						tdPrefix + data.findBoardVOList[i].findboardUploadtime + tdSuffix +
						trSuffix;
		$('#findboardTbody').append(listContent);
	}
}