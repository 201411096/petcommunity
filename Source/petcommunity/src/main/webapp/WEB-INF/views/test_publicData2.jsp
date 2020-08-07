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
	var serviceKey = 'Cs8el%2FuhtlYCY%2BHBBp9jCapmuo%2FmEjVkn0P%2BU6BY78tnS%2BTrPlz7BUEk%2BDfKOvvioI9hcaSuAJT%2FpgGsqAQG9A%3D%3D'
	var requestUrl = 'http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/abandonmentPublic';

	console.log('getPublicData 함수 호출 확인');
	$.ajax({
// 		headers:{
// 			"Access-Control-Allow-Origin":"*",
// 			"Access-Control-Allow-Methods":"GET, POST, PUT, DELETE, OPTIONS",
// 			"Access-Control-Allow-Headers":"X-Requested-With,content-type,Origin,Accept,Access-Control-Request-Method,Access-Control-Request-Headers,Authorization",
// 			"Access-Control-Allow-Credentials":"true",
// 			"Access-Control-Max-Age":"3600"
// 		},
		type:"GET",
		url:requestUrl,
		data : {"bgnde":beginDate,
				"endde":endDate,
				"pageNo":pageNo,
				"numOfRows":numOfRows,
				"ServiceKey":serviceKey
				},
		dataType:'jsonp',
		success:function(result){
			console.log('success..');
			console.log(result.message);
		},
		error:function(request,status,error){
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}
</script>
</body>
</html>