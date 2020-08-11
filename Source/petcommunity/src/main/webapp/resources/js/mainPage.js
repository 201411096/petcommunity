
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
});

