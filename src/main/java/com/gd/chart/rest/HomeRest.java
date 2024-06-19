package com.gd.chart.rest;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gd.chart.mapper.EmployeesMapper;

@RestController
public class HomeRest {
	
	@Autowired
	EmployeesMapper employeesMapper;

	@GetMapping("/rest/getCountGender")
	public List<Map<String, Object>> getCountGender() {
		return employeesMapper.selectCountGender();
	}
}
