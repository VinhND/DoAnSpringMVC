package com.doan.controller;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Random;

import javax.annotation.PostConstruct;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.scheduling.TaskScheduler;
import org.springframework.scheduling.concurrent.ConcurrentTaskScheduler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.doan.object.AvgRoad;


@Controller
public class IndexController {
	
	@Autowired private SimpMessagingTemplate template;
	private TaskScheduler scheduler = new ConcurrentTaskScheduler();
	private List<AvgRoad> roadIndex = new ArrayList<AvgRoad>();
	private Random rand = new Random(System.currentTimeMillis());
	//private AvgRoad avgRoad = new AvgRoad("null", 0.0);
	private AvgRoad[] avg = new AvgRoad[11000];
	private int numR=0;

	private void updateAvgVelocityForEachRoad() {
		 
//		for (int i=0 ; i< roadIndex.size();i++){
//			String s="road_";
//			s=s+rand.nextInt(10);
//			avg[i]= new AvgRoad("0", 0.0);
//			avg[i].setName(s);
//			avg[i].setVelocity(rand.nextDouble() * 30);
//			avg[i].setTime(new Date());
//			roadIndex.set(i, avg[i]);
//		}
		for (int i=0 ;i < roadIndex.size();i++){
			roadIndex.set(i,avg[i]);
		}
	//	template.convertAndSend("/topic/road2", roadIndex);
		template.convertAndSend("/topic/road", roadIndex);

	//	System.out.println(roadIndex);
	}
	
	
	@PostConstruct
	private void broadcastTimePeriodically() {
		

		scheduler.scheduleAtFixedRate(new Runnable() {
			@Override
			public void run() {
				

				for (int i=0; i<11000;i++){
					avg[i]= new AvgRoad("null", 0.0);
				}
				/*updatePriceAndBroadcast();*/
//				for (int i=0; i<2;i++){
//					avg[i] = new AvgRoad("1", 0.0);
//					avg[i].setName(i+"");
//					avg[i].setVelocity(i*10);
//					avg[i].setTime(new Date());
//					roadIndex.add(avg[i]);
//				}
				
			JSONParser parser = new JSONParser();
			try {
				 
				Object obj = parser.parse(new FileReader("/home/hduser/Desktop/modified/DoAnSpringMVC/WebContent/resources/doantheme/js/modifiedOsmdataForJava.json"));
				JSONObject jsonObject = (JSONObject) obj;
				JSONArray arr = (JSONArray) jsonObject.get("info");
//				System.out.println("Size: " +arr.size());
				for (int i=0; i<arr.size();i++){
				JSONObject detail = (JSONObject) arr.get(i);
//				System.out.println(detail.get("name"));
//				System.out.println(detail.get("id"));
				// loop array
				JSONArray seg = (JSONArray) detail.get("segments");
				for (int j=0; j<seg.size();j++){
					JSONObject segIndex = (JSONObject) seg.get(j);
//					System.out.println(segIndex.get(j+1+""));
//					JSONArray points = (JSONArray) segIndex.get(j+1+"");
//					for (int k=0;k<points.size();k++){
//				//	System.out.println("latlon "+k+":"+points.get(k));
//					JSONObject latlng = (JSONObject) points.get(k);
//				//	System.out.println("latitude= "+ latlng.get("lat")+" and longitude= "+ latlng.get("lon"));			
//					}
					double velo= rand.nextDouble() * 30;
					if (velo<10){
					
					String s=detail.get("name").toString()+",segment "+(j+1);

					avg[numR].setName(s);
					avg[numR].setVelocity(velo);
					avg[numR].setTime(new Date());
					numR++;
					}				
					
				}
				}


		 
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} catch (ParseException e) {
				e.printStackTrace();
			}
		 
		     
				updateAvgVelocityForEachRoad();
			//	roadIndex.clear();
				numR=0;
			}
		}, 3000);
	}
	
//	@MessageMapping("/changeVelocity")
//	public void changeVelocity(AvgRoad avgRoad) {
//		this.avgRoad.setVelocity(avgRoad.getVelocity());
//		//this.avgRoad.setTime(avgRoad.getTime());
//		this.avgRoad.getName();
//		updateAvgVelocityForEachRoad();
////		System.out.println(roadIndex.get(1));
//	}
	
	
	/**
	 * Handle to add one stock
	 */
	@MessageMapping("/addRoad")
	public void addRoad(AvgRoad road) {
		roadIndex.add(road);
		updateAvgVelocityForEachRoad();
	}
	
	/**
	 * Handle to remove all stocks
	 */
	@MessageMapping("/clearRoads")
	public void removeAllStocks() {
		roadIndex.clear();
		updateAvgVelocityForEachRoad();
	}
	

}









