<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
<script type="text/javascript">
getPublicData();
function getPublicData(){
	var beginDate = '20200101';
	var endDate = '20201231';
	var numOfRows = '10000';
	var pageNo = '1';
	var requestUrl = 'http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/abandonmentPublic?bgnde=' + beginDate + '&endde=' + endDate + '&pageNo=' + pageNo + '&numOfRows=' + numOfRows + '&ServiceKey=';
	console.log('getPublicData 함수 호출 확인');
	$.ajax({
		type:"GET",
		url:requestUrl,
		success:function(result){
			console.log(result.content)
		}
			
	});
}
</script>
</body>
</html>