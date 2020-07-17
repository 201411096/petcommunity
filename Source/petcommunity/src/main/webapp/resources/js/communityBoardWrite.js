$(function(){
	//글쓰기취소 버튼 클릭시 boardlist로 돌아간다
    $('#cancelWrite').click(function(){
    	window.location.href='/petcommunity/communityBoardList.do';
    });
    
    
    
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
    
    var citys=['서울특별시','인천광역시','대전광역시','광주광역시','울산광역시','부산광역시','세종특별자치시',
    	'충청북도','경기도','강원도','충청남도','전라북도','전라남도','경상북도','경상남도','제주도'];
    $('#cityName').change(function(){
    	var selectItem = $("#cityName").val();
        	
        var changeItem;
          
       
        
        switch (selectItem) {
        case "서울특별시" :
        	changeItem = seoul;
            break;
        case "인천광역시" :
        	changeItem = incheon;
            break;
        case "대전광역시" :
        	changeItem = dajeon;
            break;
        case "대구광역시" :
        	changeItem = daegu;
            break;
        case "광주광역시" :
        	changeItem = gwangju;
            break;
        case "울산광역시" :
        	changeItem = ulsan;
            break;
        case "부산광역시" :
        	changeItem = busan;
            break;
        case "세종특별자치시" :
        	changeItem = sejong;
            break;
        case "충청북도" :
        	changeItem = chungbuk;
            break;
        case "경기도" :
        	changeItem = kyunggido;
            break;
        case "강원도" :
        	changeItem = ganwondo;
            break;
        case "충청남도" :
        	changeItem = chungnam;
            break;
        case "전라북도" :
        	changeItem = jeonbuk;
            break;
        case "전라남도" :
        	changeItem = jeonnam;
            break;
        case "경상북도" :
        	changeItem = kyungbuk;
            break;
        case "경상남도" :
        	changeItem = kyungnam;
            break;
        case "제주도" :
        	changeItem = jeju;
            break;
      }
        
       
         
        $('#province').empty();
        alert(changeItem[0]);
        for(var count in changeItem){
        	var option = $("<option>"+changeItem[count]+"</option>");
            $('#province').append(option);
        }
    });
    


  
    
});