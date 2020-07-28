// 게시글 수 (실종동물 요일별, 시간별 통계)
var graph_01 = new GraphClass("/petcommunity/lostGraph.do", "graph_01_container", "graph_01", "lostgraph");
GraphClass.makeChartWithAjax(graph_01);

$('#graph_01_chartShape_option').on('change', function(){
	graph_01.inputData.chartType=$('#graph_01_chartShape_option').val();
	GraphClass.makeChartWithAjax(graph_01)
});
$('#graph_01_chartTime_option').on('change', function(){
	graph_01.inputData.timeOption=$('#graph_01_chartTime_option').val();	
	GraphClass.makeChartWithAjax(graph_01)
});

//게시글 수 (찾은 실종동물 요일별, 시간별 통계)
var graph_02 = new GraphClass("/petcommunity/findGraphFromLostBoard.do", "graph_02_container", "graph_02", "graph_02");
GraphClass.makeChartWithAjax(graph_02);

$('#graph_02_chartShape_option').on('change', function(){
	graph_02.inputData.chartType=$('#graph_02_chartShape_option').val();
	GraphClass.makeChartWithAjax(graph_02)
});
$('#graph_02_chartTime_option').on('change', function(){
	graph_02.inputData.timeOption=$('#graph_02_chartTime_option').val();	
	GraphClass.makeChartWithAjax(graph_02)
});

//매출 통계 ( 요일별, 시간별 통계)
var graph_03 = new GraphClass("/petcommunity/makeSalesHistoryChartWithGrouping.do", "graph_03_container", "graph_03", "graph_03");
GraphClass.makeChartWithAjax(graph_03);

$('#graph_03_chartShape_option').on('change', function(){
	graph_03.inputData.chartType=$('#graph_03_chartShape_option').val();
	GraphClass.makeChartWithAjax(graph_03)
});
$('#graph_03_chartTime_option').on('change', function(){
	graph_03.inputData.timeOption=$('#graph_03_chartTime_option').val();	
	GraphClass.makeChartWithAjax(graph_03)
});

//매출 통계 (특정기간만)
//var graph_04 = new GraphClass("/petcommunity/makeSalesHistoryChart.do", "graph_04_container", "graph_04", "graph_04");
//GraphClass.makeChartWithAjax(graph_04);
//
//$('#graph_04_chartShape_option').on('change', function(){
//	graph_04.inputData.chartType=$('#graph_04_chartShape_option').val();
//	GraphClass.makeChartWithAjax(graph_04)
//});
//$('#graph_04_chartTime_option').on('change', function(){
//	graph_04.inputData.timeOption=$('#graph_04_chartTime_option').val();	
//	GraphClass.makeChartWithAjax(graph_04)
//});