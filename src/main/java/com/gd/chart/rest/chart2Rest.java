package com.gd.chart.rest;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gd.chart.mapper.chart2Mapper;

@RestController
public class chart2Rest {

	@Autowired
	chart2Mapper chart2Mapper;
	
	@GetMapping("/rest/getCountDeptName")
	public List<Map<String, Object>> getCountDeptName() {
		return chart2Mapper.selectCountDeptName();
	}
}
