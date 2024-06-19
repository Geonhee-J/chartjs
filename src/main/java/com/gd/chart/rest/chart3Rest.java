package com.gd.chart.rest;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gd.chart.mapper.chart3Mapper;

@RestController
public class chart3Rest {

	@Autowired
	chart3Mapper chart3Mapper;
	
	@GetMapping("/rest/getSalaryByDeptName")
	public List<Map<String, Object>> getSalaryByDeptName() {
		return chart3Mapper.selectSalaryByDeptName();
	}
}
