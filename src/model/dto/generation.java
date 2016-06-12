package model.dto;

import java.io.Serializable;
import java.util.Date;

public class generation implements Serializable {
	private int gen_id;
	private String gen_name;
	private Date start_date;
	private Date end_date;
	private boolean is_finish;
	
	public int getGen_id() {
		return gen_id;
	}
	public void setGen_id(int gen_id) {
		this.gen_id = gen_id;
	}
	public String getGen_name() {
		return gen_name;
	}
	public void setGen_name(String gen_name) {
		this.gen_name = gen_name;
	}
	public Date getStart_date() {
		return start_date;
	}
	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}
	public Date getEnd_date() {
		return end_date;
	}
	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}
	public boolean isIs_finish() {
		return is_finish;
	}
	public void setIs_finish(boolean is_finish) {
		this.is_finish = is_finish;
	}
		
	
}
