var lostGraph = new GraphClass("/petcommunity/lostGraph.do", "lostGraph_container", "lostGraph", "lostgraph");
GraphClass.makeChartWithAjax(lostGraph);

$('#lostGraph_chartShape_option').on('change', function(){
	lostGraph.inputData.chartType=$('#lostGraph_chartShape_option').val();
	GraphClass.makeChartWithAjax(lostGraph)
});
$('#lostGraph_chartTime_option').on('change', function(){
	lostGraph.inputData.timeOption=$('#lostGraph_chartTime_option').val();	
	GraphClass.makeChartWithAjax(lostGraph)
});


