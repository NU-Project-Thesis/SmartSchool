package model.dto;

import java.io.Serializable;
import java.util.Date;

public class course implements Serializable{
	private int cou_id;
	private String cou_name;
	private Date start_date;
	private Date end_date;
	private int gen_id;
	private boolean is_finish;
	
	public int getCou_id() {
		return cou_id;
	}
	public void setCou_id(int cou_id) {
		this.cou_id = cou_id;
	}
	public String getCou_name() {
		return cou_name;
	}
	public void setCou_name(String cou_name) {
		this.cou_name = cou_name;
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
	public int getGen_id() {
		return gen_id;
	}
	public void setGen_id(int gen_id) {
		this.gen_id = gen_id;
	}
	public boolean isIs_finish() {
		return is_finish;
	}
	public void setIs_finish(boolean is_finish) {
		this.is_finish = is_finish;
	}
	
	
	
}
