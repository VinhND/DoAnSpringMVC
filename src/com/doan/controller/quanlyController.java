package com.doan.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.doan.entities.Account;

@Controller
@RequestMapping(value="/showAllUser")
public class quanlyController {
	@RequestMapping(value ="/quanly",method= RequestMethod.GET)
	public String signup(ModelMap mm){
	//	mm.put("editPower",new  Account());
		return "quanly";
	}
	
	
}
