package com.gd.chart.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class chart5Controller {

	@GetMapping("/chart5")
	public String chart5() {
		return "chart5";
	}
}
