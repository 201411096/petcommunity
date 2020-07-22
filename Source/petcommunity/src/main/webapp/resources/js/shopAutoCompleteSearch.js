var searchKeyWord;
$(function(){
	$("#searchSomething").autocomplete(function(key){
		searchKeyWord = $("#searchSomething").val();
		search(searchKeyWord)
	});
});

function search(searchKeyWord){
	console.log("누른 keyword" + searchKeyWord);
	$.ajax({
		type : 'post',
		async:true,
		url : '/petcommunity/shopAutoCompleteSearch.do',
		contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
		data : {"searchSomething" : searchKeyWord,
				},
		dataType : 'json',
		success : function(resultData){
			console.log("ajax로 다시받음" + resultData);
		}
	});
}
