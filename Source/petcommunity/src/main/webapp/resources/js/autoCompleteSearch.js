$(function(){
	searchAutoComplete()
});

function searchAutoComplete(){
	alert("자동완성 js 도착")
	$('#searchSomething').autocomplete({
		source : function( request, response ) {
            $.ajax({
                   type: 'get',
                   url: "/petcommunity/shopAutoCompleteSearch.do",
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