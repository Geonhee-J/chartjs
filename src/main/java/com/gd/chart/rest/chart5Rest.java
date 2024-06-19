package com.gd.chart.rest;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gd.chart.mapper.chart5Mapper;

@RestController
public class chart5Rest {

	@Autowired
	chart5Mapper chart5Mapper;
	
	@GetMapping("/rest/getDeptMemberForYear")
	public List<Map<String, Object>> getDeptMemberForYear() {
		return chart5Mapper.selectDeptMemberForYear();
	}
}
