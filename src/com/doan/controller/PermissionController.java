package com.doan.controller;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.math.BigInteger;
import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Locale;

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

import com.doan.entities.Account;

@Controller
@RequestMapping(value="/showAllUser")
public class PermissionController {
	@RequestMapping(value ="/permission",method= RequestMethod.GET)
	public String permission(ModelMap mm){
		mm.put("tk",new  Account());
		return "permission";
	}
	@RequestMapping(value ="/permission",method= RequestMethod.POST)
	public String permission(@ModelAttribute(value="tk") Account tk, ModelMap mm,HttpSession session) throws IOException{
		JSONParser parser = new JSONParser();
		JSONObject objToWrite = new JSONObject();
		JSONArray list = new JSONArray();
		try {
			int check=3; 
			Object obj = parser.parse(new FileReader("/home/hduser/Desktop/modified/DoAnSpringMVC/WebContent/resources/doantheme/js/data.json"));
			JSONArray arr = (JSONArray) obj;
			for (int i=0; i<arr.size();i++){
				list.add(arr.get(i));		
				}
			System.out.println(tk.getPower());
			for (int i=0;i<arr.size();i++){
				JSONObject detail = (JSONObject) arr.get(i);
				if(tk.getUsername().equals(detail.get("username"))){
					if (tk.getPower().equals("admin")){
						list.remove(i);
						JSONObject newObj= new JSONObject();
						newObj.put("username",tk.getUsername());
//						String passMD5=getMD5(tk.getPassword());
						newObj.put("password", detail.get("password"));
						newObj.put("power","0");
						list.add(newObj);
						session.setAttribute("username", tk.getUsername());
						mm.put("message", "Successfull ,welcome new admin");
						check=0;
						break;
					}
					if (tk.getPower().equals("user")){
						list.remove(i);
						JSONObject newObj= new JSONObject();
						newObj.put("username",tk.getUsername());
						newObj.put("password", detail.get("password"));
						newObj.put("power","1");
						list.add(newObj);
						session.setAttribute("username", tk.getUsername());
						mm.put("message", "Successfull ,welcome new user");
						check=1;
						break;
					}
					if (tk.getPower().equals("ban")){
						list.remove(i);
						JSONObject newObj= new JSONObject();
						newObj.put("username",tk.getUsername());
						newObj.put("password", detail.get("password"));
						newObj.put("power","2");
						list.add(newObj);
						session.setAttribute("username", tk.getUsername());
						mm.put("message", "Successfull ,this acc is banned");
						check=2;
						break;
					}
				}
			}
			if (check==3) mm.put("message", "Wrong permission !!!");
		//	else return "quanly";
		}catch (FileNotFoundException e) {
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
		return "permission";
	}
}
