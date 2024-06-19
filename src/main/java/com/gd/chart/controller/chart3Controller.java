package com.gd.chart.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class chart3Controller {

	@GetMapping("/chart3")
	public String chart3() {
		return "chart3";
	}
}
