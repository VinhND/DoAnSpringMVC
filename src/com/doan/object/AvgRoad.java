package com.doan.object;

import java.io.Serializable;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * template.convertAndSend method that will use name of all set and get method of this class 
 * example:
 * {"velocity: xxx, name: xxx, timeStr: xxx"}
 * <=> getVelocity(), getName(), getTimeStr() 
 * @author rimberry
 *
 */
public class AvgRoad implements Serializable {
	
	private  static final long serialVersionUID = 1L;
	
	private DateFormat dateFormat = new SimpleDateFormat("dd MMM yyyy, HH:mm:ss");
	
	private String _name 		= "";
	private double _velocity 	= 0;
	private Date   _time		= new Date();
	
	public AvgRoad() {}
	
	public AvgRoad(String name, double velocity) {
		this._name = name;
		this._velocity = velocity;
	}
	
	public void setName(String name) {
		this._name = name;
	}
	
	public String getName() {
		return this._name;
	}
	
	public void setVelocity(double velocity) {
		this._velocity = velocity;
	}
	
	public double getVelocity() {
		return this._velocity;
	}
	
	public void setTime(Date time) {
		this._time = time;
	}
	
	public String getTimeStr() {
		return dateFormat.format(_time);
	}
	
	@Override
	public String toString() {
	return "Road [name=" + _name + ", velocity=" + _velocity + ", time=" + getTimeStr() + "]";
	}
}
