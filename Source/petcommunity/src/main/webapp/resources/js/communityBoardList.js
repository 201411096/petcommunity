var listBysearchWithPaging = {
    visiblePages : 5,
    onPageClick: function (event, page) {
    	$('#page-content').text('Page ' + page);
    	    curPage=page;
    	    listBysearch2();         
    	}
    };
    var listByCateRegionWithPaging = {
    	visiblePages : 5,
    	onPageClick: function (event, page) {
    		$('#page-content').text('Page ' + page);
    		curPage=page;
    		listByCateRegion();		
    	}
    };
    var recommend = {
    		visiblePages : 5,
    		onPageClick: function (event, page) {
    			$('#page-content').text('Page ' + page);
    			curPage=page;
    			selectCateRecommend2();		
    		}
    };
    var readCount= {
    		visiblePages : 5,
    		onPageClick: function (event, page) {
    			$('#page-content').text('Page ' + page);
    			curPage=page;
    			selectCatereadCount2();		
    		}
    };

var cities=["서울","인천","대전","광주","대구","울산","부산","세종","경기","강원","충북","충남","전북","전남","경북","경남","제주"];
var seoul = ["종로구","중구","용산구","성동구","광진구","동대문구","중랑구","성북구","강북구","도봉구","노원구","은평구","서대문구","마포구"
    	,"양천구","강서구","구로구","금천구","영등포구","동작구","관악구","서초구","강남구","송파구","강동구"];
var incheon = ["중구","동구","미추홀구","연수구","남동구","부평구","계양구","서구","강화군","옹진군"];
var dajeon = ["동구","중구","서구","유성구","대덕구"];
var gwangju = ["동구","서구","남구","북구","광산구"];
var daegu = ["중구","동구","서구","남구","북구","수성구","달서구","달성군"];
var ulsan = ["중구","남구","동구","북구","울주군"];
var busan = ["중구","서구","동구","영도구","부산진구","동래구","남구","북구","강서구","해운대구","사하구","금정구","연제구","수영구","사상구","기장군"];
var sejong = []
var kyunggido = ["수원시","고양시","용인시","성남시","화성시","부천시","남양주시","안산시","안양시","평택시","광명시","하남시","의정부시","파주시","시흥시"];
var ganwondo = ["춘천시","원주시","강릉시","동해시","태백시","속초시","삼척시"];
var chungbuk = ["청주시","충주시","제천시"];
var chungnam = ["천안시","공주시","보령시","아산시","서산시","논산시","계룡시","당진시"];
var jeonbuk = ["전주시","익산시","군산시","정읍시","남원시","김제시"];
var jeonnam = ["목포시","여수시","순천시","나주시","광양시"];
var kyungbuk = ["포항시","경주시","김천시","안동시","구미시","영주시","영천시","상주시","문경시","경산시"];
var kyungnam = ["창원시","김해시","양산시","진주시","거제시","통영시","사천시","밀양시"];
var jeju = ["제주시","서귀포시"];

var curPage;

    

$(function(){
	
	//cityName에 따라 province 동적생성되는 함수 		
    selectProvince=function(){
    	var selectItem = $("#cityName").val();
        	
        var changeItem;
     
        switch (selectItem) {
        case "서울" :
        	changeItem = seoul;
            break;
        case "인천" :
        	changeItem = incheon;
            break;
        case "대전" :
        	changeItem = dajeon;
            break;
        case "대구" :
        	changeItem = daegu;
            break;
        case "광주" :
        	changeItem = gwangju;
            break;
        case "울산" :
        	changeItem = ulsan;
            break;
        case "부산" :
        	changeItem = busan;
            break;
        case "세종" :
        	changeItem = sejong;
            break;
        case "충북" :
        	changeItem = chungbuk;
            break;
        case "경기" :
        	changeItem = kyunggido;
            break;
        case "강원" :
        	changeItem = ganwondo;
            break;
        case "충남" :
        	changeItem = chungnam;
            break;
        case "전북" :
        	changeItem = jeonbuk;
            break;
        case "전남" :
        	changeItem = jeonnam;
            break;
        case "경북" :
        	changeItem = kyungbuk;
            break;
        case "경남" :
        	changeItem = kyungnam;
            break;
        case "제주" :
        	changeItem = jeju;
            break;
      }
                
        $('#province').empty();
     
        for(var cityName in changeItem){//배열에서 하나씩 빼서 count에 담는다 . 
        	var option = $("<option>"+changeItem[cityName]+"</option>");
            $('#province').append(option);
        }
    }
    
   
    
    
    //글쓰기 버튼 눌렀을때 페이지 이동
    $('#writeBtn').click(function(){
    	//로그인 상태 체크 
    	$.ajax({
    		url: "/petcommunity/checkSession.do",
    		type: "POST",
    		success : function(data){
    			if(data=="logout"){
    				alert("로그인 후 사용해주세요");
    			}else{
    				window.location.href='/petcommunity/communityBoardWrite.do';
    			}
    		},
    		error : function(){
    			alert("에러");
    		}
    	});
    });
    

    
    
    
   

    $('#hiddenBox').hide();
    $('#showBy').change(function(){
    	
    	
    	var selectCate = $("#showBy").val();   	
    	if(selectCate=="지역별"){   		
    		$('#hiddenBox').show();
    		$('#cityName').empty();
    		 for(var count in cities){
    			 var option = $("<option>"+cities[count]+"</option>");
    			 $('#cityName').append(option);
    	     }
    		 $('#province').empty();
    		 for(var count in seoul){
      	       var option = $("<option>"+seoul[count]+"</option>");
      	       $('#province').append(option);
      	    }
    		getListByCategory();
    		
    	
    	}else if(selectCate=="추천순"){
    		$('#hiddenBox').hide(); 
    		getListByrecommend();
    		
    		
    	}else if(selectCate=="조회순"){
    		$('#hiddenBox').hide();
    		
    		$.ajax({
    			type : 'post',
    			async:true,
    			url : '/petcommunity/getBoardListByCategory.do?category=조회순',
    			contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
    		
    			dataType : 'json',
    			success : function(resultData){
    				if(resultData==null){
    					var msg="검색결과가 없습니다.";
    					$('#communityList').html(msg);
    				}else{
    					searchTable(resultData);
    					$('#NormalPaging').empty();
    					 var totalPages = resultData.pagination.pageCnt;
    			         var currentPage = $('#pagination-demo').twbsPagination('getCurrentPage');
    			            $('#pagination-demo').twbsPagination('destroy');
    			            $('#pagination-demo').twbsPagination($.extend({}, readCount, {
    			                startPage: currentPage,
    			                totalPages: totalPages
    			            }));	
    					
    				}
    						
    			},
    			error:function(request,status,error){
    				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    			}
    			
    		});
    	}else if(selectCate=="전체보기"){
    		window.location.href='/petcommunity/communityBoardList.do';
    	}
    });
    
    //검색버튼 클릭
    $('#searchBtn').on('click',
    		listBysearch
    	);
    
    
   
    
    $('#cityName').change(
        selectProvince
     )
    
    //도시선택시 province셀렉트 옵션생성
    //ajax로 리스트 전환
    $('#cityName').change(
    	function(){
    		getListByCategory();
    	}
    );
    
    $('#province').change(
    	function(){
    		getListByCategory();
    	}
    );
    
    $.urlParam = function(name){
        var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
        if (results==null){
           return 1;
        }
        else{
           return results[1]||0;
        }
    }


    
    
   $('#prevPage').click(function(){
    	var pageNo=Number($.urlParam('pageNo'));
    	if(pageNo==1){
    		alert('첫번째 페이지입니다');
    	}else{
    		window.location.href='/petcommunity/communityBoardList.do?pageNo='+Number(pageNo-5);
    	}    	
    });
    $('#nextPage').click(function(){
    	var pageNo=Number($.urlParam('pageNo'));
    	window.location.href='/petcommunity/communityBoardList.do?pageNo='+Number(pageNo+5);
    });
    

    		
    		
    
    
});

//
function listBysearch(){
	$.ajax({
		type : 'post',
		async:true,
		url : '/petcommunity/getBoardListBySearch.do',
		contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
		data:{"searchWord" : $('#keywordInput').val(),
			"searchType" : $('#type').val(),
			"curPage" : curPage
			},
		dataType : 'json',
		success : function(resultData){		
				searchTable(resultData);
				$('#NormalPaging').empty();
				 var totalPages = resultData.pagination.pageCnt;
		         var currentPage = $('#pagination-demo').twbsPagination('getCurrentPage');
		            $('#pagination-demo').twbsPagination('destroy');
		            $('#pagination-demo').twbsPagination($.extend({}, listBysearchWithPaging, {
		                startPage: currentPage,
		                totalPages: totalPages
		            }));
		},
		error:function(request,status,error){
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
		
	});
}

function selectCateRecommend2(){
	$.ajax({
		type : 'post',
		async:true,
		url : '/petcommunity/getBoardListByCategory.do?category=추천순',
		contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
		data:{"searchWord" : $('#keywordInput').val(),
			"searchType" : $('#type').val(),
			"curPage" : curPage
		},
		dataType : 'json',
		success : function(resultData){		
			searchTable(resultData);
			
		},
		error:function(request,status,error){
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
		
	});
}
function selectCatereadCount2(){
	$.ajax({
		type : 'post',
		async:true,
		url : '/petcommunity/getBoardListByCategory.do?category=조회순',
		contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
		data:{"searchWord" : $('#keywordInput').val(),
			"searchType" : $('#type').val(),
			"curPage" : curPage
		},
		dataType : 'json',
		success : function(resultData){		
			searchTable(resultData);
			
		},
		error:function(request,status,error){
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
		
	});
}
function listByCateRegion(){
	$.ajax({
		type : 'post',
		async:true,
		url : '/petcommunity/getBoardListByCategory.do?category=지역별&cityName='+$('#cityName').val()+'&province='+$('#province').val(),
		contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
		data:{"searchWord" : $('#keywordInput').val(),
			"searchType" : $('#type').val(),
			"curPage" : curPage
		},
		dataType : 'json',
		success : function(resultData){		
			searchTable(resultData);
			
		},
		error:function(request,status,error){
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
		
	});
}
function listBysearch2(){
	$.ajax({
		type : 'post',
		async:true,
		url : '/petcommunity/getBoardListBySearch.do',
		contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
		data:{"searchWord" : $('#keywordInput').val(),
			"searchType" : $('#type').val(),
			"curPage" : curPage
		},
		dataType : 'json',
		success : function(resultData){		
			searchTable(resultData);
			
		},
		error:function(request,status,error){
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
		
	});
}
function getListByrecommend(){
	$.ajax({
		type : 'post',
		async:true,
		url : '/petcommunity/getBoardListByCategory.do?category=추천순',
		contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
	
		dataType : 'json',
		success : function(resultData){
			if(resultData==null){
				var msg="검색결과가 없습니다.";
				$('#communityList').html(msg);
			}else{
				searchTable(resultData);
				$('#NormalPaging').empty();
				 var totalPages = resultData.pagination.pageCnt;
		         var currentPage = $('#pagination-demo').twbsPagination('getCurrentPage');
		            $('#pagination-demo').twbsPagination('destroy');
		            $('#pagination-demo').twbsPagination($.extend({}, recommend, {
		                startPage: currentPage,
		                totalPages: totalPages
		            }));	
			}
					
		},
		error:function(request,status,error){
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
		
	})
}
function searchTable(data){
	
	$('#communityList').empty();
	$('#communityHide').empty();
	$('#getBoardPaging').empty();
	var imageCheck=""
	var commentCount=""
	var trPrefix = '<tr>';
	var trSuffix = '</tr>';
	var tdPrefix = '<td>';
	var tdSuffix = '</td>';
	for(var i in data.communityBoardListBySearch){
		if(data.communityBoardListBySearch[i].commentCount>0){
			commentCount='['+data.communityBoardListBySearch[i].commentCount+']'
		}else{
			commentCount=""
		}
		for(var k in data.checkImg){
			if(data.checkImg[k]==data.communityBoardListBySearch[i].communityboardId){
				imageCheck="<img src='resources/imgs/communityboard/like/image.PNG'>"
			}else{
				imageCheck=""
			}
		}
		var listContent = 
						trPrefix +
						tdPrefix + data.communityBoardListBySearch[i].communityboardId + tdSuffix + 
						tdPrefix + '<a href=getBoardContent.do?communityboardId='+data.communityBoardListBySearch[i].communityboardId+'>'+
						"[<span id='locationTag' class='text-dark'>"+data.communityBoardListBySearch[i].communityboardLocation+"</span>]"
						+ data.communityBoardListBySearch[i].communityboardTitle  +
						'<span class="text-warning">'+
						commentCount+
						'</span>' +
						'</a>' + imageCheck + tdSuffix +
						tdPrefix + data.communityBoardListBySearch[i].memberId + tdSuffix +
						tdPrefix + data.communityBoardListBySearch[i].communityboardUploadtime + tdSuffix +
						tdPrefix + data.communityBoardListBySearch[i].communityboardRecommend + tdSuffix +
						tdPrefix + data.communityBoardListBySearch[i].communityboardReadcount + tdSuffix +
						trSuffix;
		
		$('#communityList').append(listContent);
	}
}
getListByCategory = function(){
	$.ajax({
		type : 'post',
		async:true,
		url : '/petcommunity/getBoardListByCategory.do?category=지역별&cityName='+$('#cityName').val()+'&province='+$('#province').val(),
		contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
	
		dataType : 'json',
		success : function(resultData){	
			searchTable(resultData);
			$('#NormalPaging').empty();
			 var totalPages = resultData.pagination.pageCnt;
	         var currentPage = $('#pagination-demo').twbsPagination('getCurrentPage');
	            $('#pagination-demo').twbsPagination('destroy');
	            $('#pagination-demo').twbsPagination($.extend({}, listByCateRegionWithPaging, {
	                startPage: currentPage,
	                totalPages: totalPages
	            }));					
		},
		error:function(request,status,error){
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
		
	});
}

//리스트 출력
function drawTable(data){
	
	$('#communityList').empty();
	$('#communityHide').empty();
	var trPrefix = '<tr>';
	var trSuffix = '</tr>';
	var tdPrefix = '<td>';
	var tdSuffix = '</td>';
	for(var i in data){
		
		var listContent = 
						trPrefix +
						tdPrefix + data[i].communityboardId + tdSuffix + 
						tdPrefix + '<a href=getBoardContent.do?communityboardId='+data[i].communityboardId+'>'+
						"[<span id='locationTag' class='text-dark'>"+data[i].communityboardLocation+"</span>]"
						+ data[i].communityboardTitle  +
						'<span class="text-warning">'+
						'['+data[i].commentCount+']'+
						'</span>' +
						'</a>' + tdSuffix +
						tdPrefix + data[i].memberId + tdSuffix +
						tdPrefix + data[i].communityboardUploadtime + tdSuffix +
						tdPrefix + data[i].communityboardRecommend + tdSuffix +
						tdPrefix + data[i].communityboardReadcount + tdSuffix +
						trSuffix;
		
		$('#communityList').append(listContent);
	}
}
