package com.mycompany.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class GraphController {

	@RequestMapping(value = "/testForGraph_01", produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map testMakeGraph(@RequestBody HashMap inputData) {
		System.out.println("graphcontroller 진입확인");
		System.out.println("graphcontroller에서 inputdata확인" + inputData);
		System.out.println(inputData.get("option1"));
		Map result = new HashMap();
		List<Map> dataList = new ArrayList();
		for(int i=0; i<10; i++) {
			HashMap data = new HashMap();
			data.put("name", "name"+Integer.toString(i));
			data.put("value", 10-i);
			dataList.add(data);
		}
		result.put("chartType", "bar");
		result.put("data", dataList);
		result.put("dataSize", dataList.size());
		return result;
	}
}
