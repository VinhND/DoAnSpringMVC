package com.doan.controller;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.doan.entities.Account;

@Controller
@RequestMapping(value="/taikhoan")
public class SignupController {
//	public ArrayList<Account> accs = new ArrayList<Account>();
//	private Account acc=new Account(null,null,2);
//	private Account acc2=new Account(null,null,2);

//		@RequestMapping("/api")
//		public ModelAndView Signup( @RequestParam(value="name") String name){
//			return new ModelAndView("welcome","message","{'name:':'vinh'}");
//}
	
	@RequestMapping(value ="/signup",method= RequestMethod.GET)
	public String signup(ModelMap mm){
		mm.put("tk",new  Account());
		return "signup";
	}
	@RequestMapping(value ="/signup",method= RequestMethod.POST)
	public String signup(@ModelAttribute(value="tk") Account tk, ModelMap mm,HttpSession session) throws IOException{
		JSONObject objToWrite = new JSONObject();
		JSONParser parser = new JSONParser();
		JSONArray list = new JSONArray();
		try {
			 
			Object obj = parser.parse(new FileReader("/home/hduser/Desktop/modified/DoAnSpringMVC/WebContent/resources/doantheme/js/data.json"));
		//	JSONObject jsonObject = (JSONObject) obj;
			JSONArray arr = (JSONArray) obj;//jsonObject.get("info");
			
	
			
			for (int i=0; i<arr.size();i++){
//			JSONObject detail = (JSONObject) arr.get(i);
			list.add(arr.get(i));		
			}
				

			
			int checkExist=0;
			for (int i=0;i<arr.size();i++){
				JSONObject detail = (JSONObject) arr.get(i);
				if (tk.getUsername().equals(detail.get("username"))){
					checkExist=1;
					mm.put("message", "Account already exists ");
					break;
				}
			}
			
			if (checkExist==0){
				JSONObject newObj= new JSONObject();
				newObj.put("username",tk.getUsername());
				newObj.put("password", tk.getPassword());
				newObj.put("power","1");
				list.add(newObj);
				session.setAttribute("username", tk.getUsername());
				mm.put("message", "Successfull "+objToWrite.toJSONString());
			}
			

//			return "signup";
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		}	
		
		
		FileWriter file = new FileWriter("/home/hduser/Desktop/modified/DoAnSpringMVC/WebContent/resources/doantheme/js/data.json");
		 try {
				//objToWrite.add("info", list);
			 list.writeJSONString(file);
	          //  file.write(objToWrite.toJSONString());
//	            mm.put("message", "adding successfully"+objToWrite.toString());
		 }catch (IOException e){
			 e.printStackTrace();
		 }finally{
			 file.flush();
			 file.close();
		 }
		 
		return "signup";
	}
	
//	@RequestMapping(value = "/signup", method = RequestMethod.GET)
//	public String createNew(HttpSession session) {
//		session.removeAttribute("username");
//		return "redirect:login.html";
//		//return "login";
//	}
	
}