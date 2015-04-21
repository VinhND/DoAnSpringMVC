package com.doan.controller;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.doan.entities.*;
//import com.doan.object.AvgRoad;

@Controller
@RequestMapping(value="/taikhoan")
public class AccountController {
	


	@RequestMapping(value ="/login",method= RequestMethod.GET)
	public String login(ModelMap mm){
		mm.put("tk",new  Account());
		return "login";
	}
	@RequestMapping(value ="/login",method= RequestMethod.POST)
	public String login(@ModelAttribute(value="tk") Account tk, ModelMap mm,HttpSession session){

		JSONParser parser = new JSONParser();
		try {
			 
			Object obj = parser.parse(new FileReader("/home/hduser/Desktop/modified/DoAnSpringMVC/WebContent/resources/doantheme/js/data.json"));
//			JSONObject jsonObject = (JSONObject) obj;
			JSONArray arr = (JSONArray) obj;//jsonObject.get("info");
			int check=3;
			for (int i=0;i<arr.size();i++){
				JSONObject detail = (JSONObject) arr.get(i);
				if(tk.getUsername().equals(detail.get("username"))&&tk.getPassword().equals(detail.get("password"))){
					if (detail.get("power").equals("0")){
						session.setAttribute("username", tk.getUsername());
						check=0;
					}
					if (detail.get("power").equals("1")){
						session.setAttribute("username", tk.getUsername());
						check=1;
					}
					break;
				}
			}
			if (check==0){

				return "quanly";
			}
			else {
				if (check==1)	

					return "map";
					//return "index";
				mm.put("message", "Your account is not valid ");
				return "login";
			}
		}catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return "login";
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.removeAttribute("username");
		return "redirect:login.html";
		//return "login";
	}
	}
