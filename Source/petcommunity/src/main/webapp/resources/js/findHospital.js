$(function(){
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
    var kyunggido = ["수원시","고양시","용인시","성남시","화성시","부천시","남양주시","안산시","안양시","평택시","광명시","하남시","의정부시","파주시"];
    var ganwondo = ["춘천시","원주시","강릉시","동해시","태백시","속초시","삼척시"];
    var chungbuk = ["청주시","충주시","제천시"];
    var chungnam = ["천안시","공주시","보령시","아산시","서산시","논산시","계룡시","당진시"];
    var jeonbuk = ["전주시","익산시","군산시","정읍시","남원시","김제시"];
    var jeonnam = ["목포시","여수시","순천시","나주시","광양시"];
    var kyungbuk = ["포항시","경주시","김천시","안동시","구미시","영주시","영천시","상주시","문경시","경산시"];
    var kyungnam = ["창원시","김해시","양산시","진주시","거제시","통영시","사천시","밀양시"];
    var jeju = ["제주시","서귀포시"];
    //province 항목 동적 생성하기
    $('#cityName').change(function(){
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
     
        for(var cityName in changeItem){
        	var option = $("<option>"+changeItem[cityName]+"</option>");
            $('#province').append(option);
        }
    });
    
    
    //검색버튼 클릭
    $('#searchLocation').click(function(){	
    	listByLocation();
    });
    //검색버튼 클릭
    $('#searchName').click(function(){
    	listBySearch();
    });
});    
 
var listByLocationWithPaging = {
	    visiblePages : 5,
	    onPageClick: function (event, page) {
	    	$('#page-content').text('Page ' + page);
	    	    curPage=page;
	    	    listByLocation();         
	}
};


var listBySearchWithPaging = {
	    visiblePages : 5,
	    onPageClick: function (event, page) {
	    	$('#page-content').text('Page ' + page);
	    	    curPage=page;
	    	    listBySearch();         
	}
};

function listByLocation(){

	$.ajax({
		type : 'post',
		async:true,
		url : '/petcommunity/getFindHospitalListByLocation.do',
		contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
		dataType : 'json',
		data:{
			cityName : $('#cityName').val(),
			province : $('#province').val()
		},
		success : function(resultData){		
			drawTable(resultData);
			$('#NormalPaging').empty();
			 var totalPages = resultData.pagination.pageCnt;
	         var currentPage = $('#pagination-demo').twbsPagination('getCurrentPage');
	            $('#pagination-demo').twbsPagination('destroy');
	            $('#pagination-demo').twbsPagination($.extend({}, listByLocationWithPaging, {
	                startPage: currentPage,
	                totalPages: totalPages
	            }));
		},
		error:function(request,status,error){
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
		
	});
}

function listBySearch(){
	$.ajax({
		type : 'post',
		async:true,
		url : '/petcommunity/getFindHospitalListBySearch.do',
		contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
		data:{"searchWord" : $('#keywordInput').val(),
			"curPage" : curPage
			},
		dataType : 'json',
		success : function(resultData){		
				drawTable(resultData);
				$('#NormalPaging').empty();
				 var totalPages = resultData.pagination.pageCnt;
		         var currentPage = $('#pagination-demo').twbsPagination('getCurrentPage');
		            $('#pagination-demo').twbsPagination('destroy');
		            $('#pagination-demo').twbsPagination($.extend({}, listBySearchWithPaging, {
		                startPage: currentPage,
		                totalPages: totalPages
		            }));
		},
		error:function(request,status,error){
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
		
	});
}


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
	autoCompleteFunc();
	autoCompleteFuncForMap();
	documentPreventKeyDown();
	searchForMapEventHandler();
});

function documentPreventKeyDown(){
	document.addEventListener('keydown', function(event) {
		  if (event.keyCode === 13) {
		    event.preventDefault();
		  };
		}, true);
}

function autoCompleteFunc(){
	$('#keywordInput').autocomplete({
		source : function( request, response ) {
            $.ajax({
                   type: 'get',
                   url: "/petcommunity/autoCompleteForFindHospital.do",
                   dataType: "json",
                   data:{
                	   	"searchWord" : $('#keywordInput').val()
                	   	
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
           autoFocus: true,		 //첫번째 항목 자동 포커스 기본값 false
           delay : 500,
	});
}

function autoCompleteFuncForMap2(){
	$('#locationForSearch').autocomplete({
		source : function( request, response ) {
            $.ajax({
                   type: 'get',
                   url: "/petcommunity/autoCompleteForMap2.do",
                   dataType: "json",
                   data:{
                	   	"searchWord" : $('#locationForSearch').val(),
       					"searchType" : 'location'
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

           minLength: 1,		 // 최소 글자수
           autoFocus: false,		 //첫번째 항목 자동 포커스 기본값 false
           delay : 500,
	});
}


function getDataInPaging(){
	$.ajax({
		type : 'post',
		async:true,
		url : '/petcommunity/findHospitalListWithPaging.do',
		contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
		data : {"searchWord" : $('#keywordInput').val(),
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
		url : '/petcommunity/findHospitalListWithPaging.do',
		contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
		data : {"searchWord" : $('#keywordInput').val(),
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
	$('#findHospitalTbody').empty();
	var trPrefix = '<tr>';
	var trSuffix = '</tr>';
	var tdPrefix = '<td>';
	var tdSuffix = '</td>';
	for(var i=0; i<data.findHospitalVOListSize; i++){
		var listContent = 
						trPrefix +
						tdPrefix + data.findHospitalVOList[i].findhospitalName + tdSuffix +
						tdPrefix + data.findHospitalVOList[i].findhospitalTel + tdSuffix +
						tdPrefix + data.findHospitalVOList[i].findhospitalAddress + tdSuffix +
						tdPrefix + data.findHospitalVOList[i].findhospitalOpenhour + tdSuffix +
						trSuffix;
		$('#findHospitalTbody').append(listContent);
	}
}




var latitude = $('#findHospitalX').val();
var longitude = $('#findHospitalY').val();
var findHospitalLocation = $('#findHospitalLocation').val();



$(function() {
	kakaoMapAPI();
	$('#listButton').on('click', function(){
		location.href='/petcommunity/findHospitallist.do';
	});
});

function kakaoMapAPI() {

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center : new kakao.maps.LatLng(37.519972628243366, 126.85287648507145), // 지도의 중심좌표
		level : 7
	// 지도의 확대 레벨
	};

	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

	// 지도를 클릭한 위치에 표출할 마커입니다
	var marker = new kakao.maps.Marker({ 
	    // 지도 중심좌표에 마커를 생성합니다 
	    position: map.getCenter() 
	});
	
	// 지도에 마커를 표시합니다
	marker.setMap(map);
	
	var iwContent = '<div class="alert alert-light">'+ findHospitalLocation +'</div>'
    iwPosition = new kakao.maps.LatLng(latitude, longitude); //인포윈도우 표시 위치입니다
	
	// 인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({
	    position : iwPosition, 
	    content : iwContent 
	});
	
	// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
	infowindow.open(map, marker);
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
	var mapTypeControl = new kakao.maps.MapTypeControl();

	// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
	// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);	
	
	
	
	// 지도 클릭 이벤트
	kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
	    
	    // 클릭한 위도, 경도 정보를 가져옵니다 
	    var latlng = mouseEvent.latLng;
	    latitude = latlng.getLat();
	    longitude = latlng.getLng();
	    
	    // 마커 위치를 클릭한 위치로 옮깁니다
	    marker.setPosition(latlng);
	    // hidden 태그에 위도 경도 표시
	    setLocation(latitude,  longitude);
	    
	    searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
	        if (status === kakao.maps.services.Status.OK) {
	        	if(!!result[0].road_address){
	        		console.log('도로명 주소', result[0].road_address.address_name);
	        		setAddress(result[0].road_address.address_name, 0);
	        	}else{
	        		console.log('지번 주소', result[0].address.address_name);
	        		setAddress(result[0].address.address_name, 1);
	        	}
	        }   
	    });
	});
	
	function searchDetailAddrFromCoords(coords, callback) {
	    // 좌표로 법정동 상세 주소 정보를 요청합니다
	    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
	}
}	

function setLocation(latitude, longitude){
	$('#findhospitalX').val(latitude);
	$('#findhospitalY').val(longitude);
}

// 주소 타입 : 도로명 주소 0, 지번 주소1
function setAddress(addressname, addressType){
	$('#findhospitaladdress').val(addressname);
	$('#findhospitaladdresstype').val(addressType);     
}

//현재 작업경로를 가져오는 함수
function getContextPath() {
	   return window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
}