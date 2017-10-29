package com.kimremain.chart;

import java.util.List;

public interface ChartDAO {
	
	public List<ChartVO> getChartData() throws Exception;
	
	/*json:[{"dt_year":"2011","cn_sum_hp":13,"cn_sum_dell":25,"cn_sum_ibm":1},{"dt_year":"2012","cn_sum_hp":14,"cn_sum_dell":26,"cn_sum_ibm":2},{"dt_year":"2013","cn_sum_hp":15,"cn_sum_dell":27,"cn_sum_ibm":3},{"dt_year":"2014","cn_sum_hp":16,"cn_sum_dell":28,"cn_sum_ibm":4},{"dt_year":"2015","cn_sum_hp":17,"cn_sum_dell":29,"cn_sum_ibm":5},{"dt_year":"2016","cn_sum_hp":18,"cn_sum_dell":30,"cn_sum_ibm":6},{"dt_year":"2017","cn_sum_hp":19,"cn_sum_dell":31,"cn_sum_ibm":7},{"dt_year":"2018","cn_sum_hp":20,"cn_sum_dell":32,"cn_sum_ibm":8},{"dt_year":"2019","cn_sum_hp":21,"cn_sum_dell":33,"cn_sum_ibm":9},{"dt_year":"2020","cn_sum_hp":22,"cn_sum_dell":34,"cn_sum_ibm":10},{"dt_year":"2021","cn_sum_hp":23,"cn_sum_dell":35,"cn_sum_ibm":11},{"dt_year":"2022","cn_sum_hp":24,"cn_sum_dell":36,"cn_sum_ibm":12}]*/	
}
