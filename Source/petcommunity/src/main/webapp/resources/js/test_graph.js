var graph1 = new GraphClass("/petcommunity/testForGraph_01.do", "test_container_01", "graph01", "graph01_name");
graph1.inputData.option1 = "abc";
graph1.inputData.option2 = "def";

GraphClass.makeChartWithAjax(graph1);

var graph2 = new GraphClass("/petcommunity/testForGraph_01.do", "test_container_02", "graph02", "graph02_name");
graph2.inputData.option1 = "gggg";
graph2.inputData.option2 = "hhhh";

setInterval(function(){GraphClass.makeChartWithAjax(graph2)}, 1000);
setInterval(function(){console.log('aa')}, 1000);