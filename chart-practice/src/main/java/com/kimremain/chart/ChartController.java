package com.kimremain.chart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

@RestController
public class ChartController extends BaseController{
	
	@Autowired
	private ChartDAO chartDAO;	
	
	@RequestMapping("/chart-rmate")	
	public ModelAndView getRmateChartData() throws Exception{
		return getChartData("chart-rmate");
	}
	
	@RequestMapping("/chart-nvd")	
	public ModelAndView getNvdChartData() throws Exception{
		return getChartData("chart-nvd");
	}
	
	public ModelAndView getChartData(String viewName) throws Exception {
		List<ChartVO> list = chartDAO.getChartData();
		Gson gson = new Gson();
		String json = gson.toJson(list);
		
		for(ChartVO dummy : list) {
			logger.debug("ChartVO :" + dummy.getYear());
		}
		logger.debug("json:"+json);
				
		ModelAndView view = new ModelAndView(viewName);
		view.addObject("list", list);
		view.addObject("json", json);
		
		return view;
	}
	
	/*
	[
	{"year":"2011","hp":47,"dell":210,"ibm":1},
	{"year":"2012","hp":14,"dell":26,"ibm":2},
	{"year":"2013","hp":15,"dell":27,"ibm":39},
	{"year":"2014","hp":250,"dell":28,"ibm":4},
	{"year":"2015","hp":17,"dell":310,"ibm":120},
	{"year":"2016","hp":18,"dell":30,"ibm":6},
	{"year":"2017","hp":19,"dell":31,"ibm":7},
	{"year":"2018","hp":20,"dell":32,"ibm":8},
	{"year":"2019","hp":21,"dell":74,"ibm":9},
	{"year":"2020","hp":22,"dell":34,"ibm":10},
	{"year":"2021","hp":23,"dell":35,"ibm":11},
	{"year":"2022","hp":24,"dell":36,"ibm":12}
	]
	*/

}
