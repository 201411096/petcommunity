<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<a href="/petcommunity/controllertest.do">컨트롤러 테스트</a><br>
<a href="/petcommunity/login.do">로그인</a><br>
<a href="/petcommunity/signup.do">회원가입</a><br>
<a href="/petcommunity/shop.do">쇼핑페이지</a><br>
<a href="/petcommunity/communityBoardList.do">커뮤니티 보드</a><br>
<a href="/petcommunity/productCart.do">장바구니</a><br>
<a href="/petcommunity/findboardlist.do">findboardlist 페이지</a><br>
<a href="/petcommunity/lostboardlist.do">lostboardlist 페이지</a><br>
<a href="/petcommunity/sample_graph.do">그래프 샘플 페이지</a><br>
<a href="/petcommunity/test_graph.do">그래프 테스트 페이지</a><br>
<a href="/petcommunity/test_chat.do">테스트 페이지</a><br>
<a href="/petcommunity/test_chatWithOptions.do">테스트 채팅 페이지</a><br>

<button id="chatWindowBtn">채팅 창 띄우기</button>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	openChatWindow();
	function openChatWindow(){
		var w = 600;
		var h = 700;
		var LeftPosition=(screen.width-w)/2;
		var TopPosition=(screen.height-h)/2;
		console.log();
		$('#chatWindowBtn').on('click', function(){
			window.open("/petcommunity/test_chat.do", "_blank", "width="+w+", height="+h+", top="+TopPosition+", left="+LeftPosition+", scrollbars=no");
// 			window.open("/petcommunity/test_chat.do", "_blank", "width=600, height=600");
		});
	}
</script>
</body>
</html>