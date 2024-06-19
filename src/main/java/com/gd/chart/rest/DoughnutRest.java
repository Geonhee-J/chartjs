package com.gd.chart.rest;

import org.springframework.web.bind.annotation.RestController;

import com.gd.chart.mapper.DoughnutMapper;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;

@RestController
public class DoughnutRest {
	
	@Autowired
	DoughnutMapper doughnutMapper;

	@GetMapping("/rest/getCountHireDate")
	public List<Map<String, Object>> getCountHireDate() {
		return doughnutMapper.selectCountHireDate();
	}
	
}
