package com.gd.chart.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class chart2Controller {

	@GetMapping("/chart2")
	public String chart2() {
		return "chart2";
	}
	
}
