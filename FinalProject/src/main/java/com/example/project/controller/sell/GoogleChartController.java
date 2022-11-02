package com.example.project.controller.sell;

import javax.inject.Inject;

import org.json.simple.JSONObject;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.project.service.sell.GoogleChartService;

@RestController //ajax => json으로 리턴(스프링4.0부터 지원)
@RequestMapping("sell/*")
public class GoogleChartController {
	@Inject
	GoogleChartService googleChartService;
	
	@RequestMapping("chart.do")
	public ModelAndView chart2() {
		return new ModelAndView("sell/chart");
	}
	
	@RequestMapping("cart_money_list.do")
	public JSONObject cart_money_list() {
		return googleChartService.getChartData();
	}
}
