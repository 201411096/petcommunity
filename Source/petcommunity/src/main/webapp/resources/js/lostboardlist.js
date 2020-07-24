var curPage;
var latitude = 37.519972628243366;
var longitude = 126.85287648507145;
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
	autoCompleteFunc();
	documentPreventKeyDown();
	searchWordEventHandler();
	searchBtnEventHandler();
	writeBtnEventHandler(); 
});

function documentPreventKeyDown(){
	document.addEventListener('keydown', function(event) {
		  if (event.keyCode === 13) {
		    event.preventDefault();
		  };
		}, true);
}

function searchWordEventHandler(){
	$('#keywordInput').on('keydown', function(e){
		if(e.keyCode === 13){
			$('#searchBtn').click();
		}
	});
}

function searchBtnEventHandler(){
	$('#searchBtn').on('click', getData);
}
function writeBtnEventHandler(){
	$('#writeBtn').on('click', function(){
		location.href='lostBoardWrite.do';
	})
}

//https://jqueryui.com/autocomplete/ 참고
function autoCompleteFunc(){
	$('#keywordInput').autocomplete({
		source : function( request, response ) {
            $.ajax({
                   type: 'get',
                   url: "/petcommunity/autoCompleteForLostBoard.do",
                   dataType: "json",
                   data:{
                	   	"searchWord" : $('#keywordInput').val(),
       					"searchType" : $('#searchType').val()
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
           appendTo :'#search-container',
           minLength: 1,		 // 최소 글자수
           autoFocus: false,		 //첫번째 항목 자동 포커스 기본값 false
           delay : 500,
	});
}

function getDataInPaging(){
	$.ajax({
		type : 'post',
		async:true,
		url : '/petcommunity/lostboardListWithPaging.do',
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
		url : '/petcommunity/lostboardListWithPaging.do',
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
	getDataWithoutPaging();
}

function drawTable(data){
	$('#lostboardTbody').empty();
	var trPrefix = '<tr>';
	var trSuffix = '</tr>';
	var tdPrefix = '<td>';
	var tdSuffix = '</td>';
	for(var i=0; i<data.lostBoardVOListSize; i++){
		var listContent = 
						trPrefix +
						tdPrefix + data.lostBoardVOList[i].lostboardId + tdSuffix +
						tdPrefix + data.lostBoardVOList[i].lostboardStatus + tdSuffix +
						tdPrefix + '<a href=/petcommunity/getLostBoard.do?lostboardId=' +data.lostBoardVOList[i].lostboardId + '>' + data.lostBoardVOList[i].lostboardTitle +'</a>' + tdSuffix +
						tdPrefix + data.lostBoardVOList[i].memberId + tdSuffix +
						tdPrefix + data.lostBoardVOList[i].lostboardReadcount + tdSuffix +
						tdPrefix + data.lostBoardVOList[i].lostboardUploadtime + tdSuffix +
						trSuffix;
		$('#lostboardTbody').append(listContent);
	}
}

function getDataWithoutPaging(){
	$.ajax({
		type : 'post',
		async:true,
		url : '/petcommunity/lostboardListWithoutPaging.do',
		contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
		data : {"searchWord" : $('#keywordInput').val(),
				"searchType" : $('#searchType').val(),
				"curPage" : curPage,
				},
		dataType : 'json',
		success : function(resultData){
			kakaoMapAPI(resultData);
		},
		error:function(request,status,error){
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}		
	});
}
function kakaoMapAPI(data){
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(latitude, longitude), // 지도의 중심좌표
        level: 7 // 지도의 확대 레벨
    };

	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
	for(var i=0; i<data.lostBoardVOListSize; i++){
		var position =  new kakao.maps.LatLng(data.lostBoardVOList[i].lostboardX, data.lostBoardVOList[i].lostboardY);
		
		var marker = new kakao.maps.Marker({
			  position: position
			});
		marker.setMap(map);
		var iwContent = '<div class="alert alert-light"><a href=/petcommunity/getLostBoard.do?lostboardId='+data.lostBoardVOList[i].lostboardId+'>'+data.lostBoardVOList[i].lostboardLocation+'</a></div>';
		var infowindow = new kakao.maps.InfoWindow({
		    content : iwContent
		});
	    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
	    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
	}
	// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
	function makeOverListener(map, marker, infowindow) {
	    return function() {
	        infowindow.open(map, marker);
	    };
	}

	// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
	function makeOutListener(infowindow) {
	    return function() {
	        infowindow.close();
	    };
	}
}