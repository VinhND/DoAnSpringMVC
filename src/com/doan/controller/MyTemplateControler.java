package com.doan.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value= "mytemplate")
public class MyTemplateControler {
	
	@RequestMapping(method = RequestMethod.GET)
	public String home(ModelMap mm){
		mm.put("title","Home");
		return "xyz";
	}
	@RequestMapping(value="/aboutus",method = RequestMethod.GET)
	public String aboutus(ModelMap mm){
		mm.put("title","AboutUs");
		return "aboutus";
	}
	@RequestMapping(value="/news",method = RequestMethod.GET)
	public String news(ModelMap mm){
		mm.put("title","news");
		return "news";
	}
}
