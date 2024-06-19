package com.gd.chart.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DoughnutController {

	@GetMapping("/doughnut")
	public String doughnut() {
		return "doughnut";
	}
	
}
