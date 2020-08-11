 var lastScroll = 0;
    $(window).scroll(function(event){ // 스크롤이 움직일때 마다 이벤트 실행
        // 현재 스크롤의 위치를 저장할 st 변수
        var st = $(this).scrollTop();
        // 스크롤 상하에 따른 반응 정의
        if (st > lastScroll){
            if ($(window).scrollTop() >= 300 && $(window).scrollTop()<=400) { 
            	$.ajax({
            		type : 'post',
            		async : true,
            		url : '/petcommunity/mainCount1.do',
            		contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
            		success : function(data) {
            			var memberCountConTxt = data;
            			$({
            				val : 0
            			}).animate({
            				val : memberCountConTxt
            			}, {
            				duration : 2000,
            				step : function() {
            					var num = numberWithCommas(Math.floor(this.val));
            					$("#memberCountCon1").text(num);
            				},
            				complete : function() {
            					var num = numberWithCommas(Math.floor(this.val));
            					$("#memberCountCon1").text(num);
            				}
            			});

            			function numberWithCommas(x) {
            				return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
            			}
            			
            		}
            	});



            	$.ajax({
            		type : 'post',
            		async : true,
            		url : '/petcommunity/mainCount2.do',
            		contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
            		success : function(data) {
            			var memberCountConTxt = data;
            			$({
            				val : 0
            			}).animate({
            				val : memberCountConTxt
            			}, {
            				duration : 2000,
            				step : function() {
            					var num = numberWithCommas(Math.floor(this.val));
            					$("#memberCountCon2").text(num);
            				},
            				complete : function() {
            					var num = numberWithCommas(Math.floor(this.val));
            					$("#memberCountCon2").text(num);
            				}
            			});

            			function numberWithCommas(x) {
            				return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
            			}
            			
            		}
            	});



            	$.ajax({
            		type : 'post',
            		async : true,
            		url : '/petcommunity/mainCount3.do',
            		contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
            		success : function(data) {
            			var memberCountConTxt = data;
            			$({
            				val : 0
            			}).animate({
            				val : memberCountConTxt
            			}, {
            				duration : 2000,
            				step : function() {
            					var num = numberWithCommas(Math.floor(this.val));
            					$("#memberCountCon3").text(num);
            				},
            				complete : function() {
            					var num = numberWithCommas(Math.floor(this.val));
            					$("#memberCountCon3").text(num);
            				}
            			});

            			function numberWithCommas(x) {
            				return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
            			}
            			
            		}
            	});	// 이벤트 정의
  
            }
        } else {
        }
        // 현재 스크롤 위치(st)를 마지막 위치로 업데이트
        lastScroll = st;
   

    });

