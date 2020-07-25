var graph1 = new GraphClass("/petcommunity/testForGraph_01.do", "test_container_01", "graph01", "graph01_name");
graph1.inputData.option1 = "abc";
graph1.inputData.option2 = "def";

GraphClass.makeChartWithAjax(graph1);
	