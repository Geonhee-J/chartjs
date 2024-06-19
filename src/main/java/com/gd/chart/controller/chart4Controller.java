package com.gd.chart.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class chart4Controller {

	@GetMapping("/chart4")
	public String chart4() {
		return "chart4";
	}
}
