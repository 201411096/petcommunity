class GraphClass{
	constructor(url, chartContainerId, chartElementId, labelName){
		this.url=url;
		this.chartContainerId=chartContainerId;
		this.chartElementId=chartElementId;
		this.inputData= {};
		this.chartData;
		this.labelName=labelName;
		this.chartOptions={
				maintainAspectRatio : false //부모가 만든 크기 안에 꽉 차게 함(default 값: true)
		}
		this.chartType = 'line';
		this.mainColor = "rgba(75,192,192,1)"; // generator 사용전
		this.subColor = "rgba(75,192,192,0.4)"; // generator 사용전
	}
//ajax에서 받아온 json 데이터를 가공하여 차트의 데이터를 만들어주는 과정
	static makeChartData(graphClass, outputData){
		var dataLabels = new Array();
		var chartJsData = new Array();
		
		if(graphClass.chartType!=='line'){ // line타입이 아니면 그래프 색깔 생성
			graphClass.mainColor = GraphClass.mainColorGenerator(outputData.dataSize);
		}else if(graphClass.chartType==='line'){
			graphClass.mainColor = "rgba(75,192,192,1)";
		}
		
		for(var i=0; i< outputData.dataSize; i++){
			dataLabels.push(outputData.data[i].name);
			chartJsData.push(outputData.data[i].value);
		}

		var chartData ={
			      labels : dataLabels,
			      datasets : [
			         {
			            label : graphClass.labelName,
			            fill : false,
			            lineTension : 0.1,
			            backgroundColor : graphClass.mainColor, //subColor
			            borderColor : graphClass.mainColor,
			            borderCapStyle : 'butt',
			            borderJoinStyle : 'miter',
			            pointBorderColor : graphClass.mainColor,
			            pointBackgroundColor : '#fff',
			            pointBorderWitdh : 2,
			            pointRadius : 1,
			            pointHitRadius : 10,
			            data : chartJsData,
			            spanGaps : false
			         },
			      ]
			   };
	   return chartData;
	}
//차트를 그려주는 함수
//차트의 데이터를 받는 과정을 포함함
	static makeChartWithAjax(graphClass){
		$('#'+graphClass.chartContainerId).empty();
		$('#'+graphClass.chartContainerId).append('<canvas id="'+graphClass.chartElementId+'"></canvas>');
		$.ajax({
		      type:'post',
		      async:true,
		      url:graphClass.url,
		      contentType : 'application/x-www-form-urlencoded;charset=UTF-8', //넘어가는 데이터를 인코딩하기 위함
		      data : JSON.stringify(graphClass.inputData),
//		      			{
//		    	  		"option" : $('#termOption').val(),
//		    	  		"chartDataCnt" : $('#chartDataCntOption').val()
//		      },
		      dataType : 'json',
		      success : function(outputData){
//		    	  chartType = $(chartShapeOption).val();
		    	  graphClass.chartType= outputData.chartType; // controller단에서 차트 모양을 정해줌
		    	  graphClass.chartData= GraphClass.makeChartData(graphClass, outputData);
		    	  GraphClass.makeChart(graphClass, graphClass.chartData, graphClass.chartOptions);		    	  
		      },
		      error:function(request,status,error){
		         console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		      }
		   });
	}

//makeChartWithAjax에서 내부적으로 불리는 함수 : chart.js에서 제공하는 기본함수
	static makeChart(graphClass, chartData, chartOptions){
		   var ctx = document.getElementById(graphClass.chartElementId).getContext('2d');
		   var myChart = new Chart(ctx, {
			  type : graphClass.chartType,
		      data : chartData,
		      options : chartOptions
		   });
	}
//차트의 색깔을 구성해주는 함수
//		ㄴ 차트의 데이터 개수만큼 색깔을 만들어서 반환함
//		ㄴ makeChartData에서 내부적으로 불림
	mainColorGenerator(size){
		var resultColor;
		var rRanNum =  Math.floor(Math.random()*255);
		var gRanNum =  Math.floor(Math.random()*255);
		var bRanNum =  Math.floor(Math.random()*255);
		
		if(size>1){
			resultColor = new Array();
			for(var i=0; i<size; i++){
				rRanNum =  Math.floor(Math.random()*255);
				gRanNum =  Math.floor(Math.random()*255);
				bRanNum =  Math.floor(Math.random()*255);
				temp = 'rgba(' +rRanNum + ', ' + gRanNum + ', ' + bRanNum + ')';
				resultColor.push(temp);
			}
		}else if(size==1){
			resultColor = 'rgba(' +rRanNum + ', ' + gRanNum + ', ' + bRanNum + ')';
		}
		
		return resultColor
	}
}