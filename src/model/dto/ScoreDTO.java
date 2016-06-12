package model.dto;

import java.util.Date;

public class ScoreDTO {
	
	private int scoreId;
	private float score;
	private Date scoreDate;
	private int stuId;
	private int subId;
	
	
	public ScoreDTO() {
	}
	
	public ScoreDTO(int scoreId, int score, Date scoreDate, int stuId, int subId) {
		
		this.scoreId = scoreId;
		this.score = score;
		this.scoreDate = scoreDate;
		this.stuId = stuId;
		this.subId = subId;
	}
	
	public ScoreDTO(int score, Date scoreDate, int stuId, int subId) {

		this.score = score;
		this.scoreDate = scoreDate;
		this.stuId = stuId;
		this.subId = subId;
	}
	
	public int getScoreId() {
		return scoreId;
	}
	public void setScoreId(int scoreId) {
		this.scoreId = scoreId;
	}
	public float getScore() {
		return score;
	}
	public void setScore(float score) {
		this.score = score;
	}
	public Date getScoreDate() {
		return scoreDate;
	}
	public void setScoreDate(Date scoreDate) {
		this.scoreDate = scoreDate;
	}
	public int getStuId() {
		return stuId;
	}
	public void setStuId(int stuId) {
		this.stuId = stuId;
	}
	public int getSubId() {
		return subId;
	}
	public void setSubId(int subId) {
		this.subId = subId;
	}
	
	
}
