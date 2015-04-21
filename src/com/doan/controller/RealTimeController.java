package com.doan.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/realtime")
public class RealTimeController {
	@RequestMapping(method = RequestMethod.GET)
	public String index(ModelMap mm){
		mm.put("title","RealTime");
		return "index";
	}
}
