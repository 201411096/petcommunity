var curPage;
var defaultOpts={
		visiblePages : 10,
		onPageClick : function(event,page){
			$('#page-content').text('page'+page);
			curPage=page;
			getDataInpaging();
		}
};

$(function(){
	getData();
	autoCompleteFunc();
	$('#searchBtn').on('click', getData);
	$('#writeBtn').on('click', function(){
		location.href='write.do';
	})
});

function autoCompleteFunc(){
	$('#keywordInput').autocomplete({
		source : function(request, response){
			$.ajax({
				type : 'get',
				url : "/petcommunity/qnaBoardListPaging.do",
				 dataType: "json",
                 data:{
              	   	"searchWord" : $('#keywordInput').val(),
     					"searchType" : $('#searchType').val()
                 },
                 success: function(data) {
              	   console.log('autocomplete success');
              	 response(
                         $.map(data, function(item) {    
                             return {
                                 label: item,    			
                                 value: item,    		  
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
		appendTo :'#search-container',
		minLength: 1,	
		autoFocus: true,		
		delay : 500,
	});
}

function getDataInpaging(){
	$.ajax({
		type : 'post',
		async : true,
		url : '/petcommunity/qnaBoardListPaging.do',
		contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
		data : {"curPage" : curPage},
		dataType : 'json',
		success : function(resultDta){
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

function drawQnaTable(data){
	
	$('#QnaBoardTbody').empty();
	var trPrefix = '<tr>';
	var trSuffix = '</tr>';
	var tdPrefix = '<td>';
	var tdSuffix = '</td>';
	for(var i=0; i<data.QnaBoardVOListSize; i++){
		var listContent =
			trPrefix +
				tdPrefix+data.QnaBoardVOList[i].QuestionboardId+tdSuffix+
				tdPrefix+'<a href="/petcommunity/qnaContent.do?questionboardId='+data.QnaBoardVOList[i].QuestionboardId +'>'+data.QnaBoardVOList[i].questionboardTitle+tdSuffix+
				tdPrefix+data.QnaBoardVOList[i].questionboardUploadtime+tdSuffix+
				tdPrefix+data.QnaBoardVOList[i].questionboardReadcount+tdSuffix+
				tdPrefix+data.QnaBoardVOList[i].memberId+tdSuffix+
			trSuffix;
				
		$('QnaBoardTbody').append(listContent);
	}
}
