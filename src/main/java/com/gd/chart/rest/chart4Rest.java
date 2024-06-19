package com.gd.chart.rest;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import com.gd.chart.mapper.chart4Mapper;
import org.springframework.web.bind.annotation.GetMapping;


@RestController
public class chart4Rest {

	@Autowired
	chart4Mapper chart4Mapper;
	
	@GetMapping("/rest/getGenderCountByYear")
	public List<Map<String, Object>> getGenderCountByYear() {
		return chart4Mapper.selectGenderCountByYear();
	}
	
}
