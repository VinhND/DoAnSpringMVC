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
@RequestMapping(value="/taikhoan")
public class SignupController {
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
				String passMD5=getMD5(tk.getPassword());
				newObj.put("password", passMD5);
				newObj.put("power","2");
				list.add(newObj);
				session.setAttribute("username", tk.getUsername());
				mm.put("message", "Successfull ");
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
	public String getMD5(String data) {
        String result = null;
        MessageDigest md;
        try {
            md = MessageDigest.getInstance("MD5");
            md.update(data.getBytes(Charset.forName("UTF-8")));
            result = String.format(Locale.ROOT, "%032x", new BigInteger(1, md.digest()));
        } catch (NoSuchAlgorithmException e) {
            throw new IllegalStateException(e);
        }
        return result;
}
//	@RequestMapping(value = "/signup", method = RequestMethod.GET)
//	public String createNew(HttpSession session) {
//		session.removeAttribute("username");
//		return "redirect:login.html";
//		//return "login";
//	}
	
}