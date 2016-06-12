package model.dto;

public class ScoreRule {

	private int rule_id;
	private int rank_lower;
	private int rank_top;
	private String grade;
	private String detail_grade;
	private int cou_id;
	/**
	 * @return the rule_id
	 */
	public int getRule_id() {
		return rule_id;
	}
	/**
	 * @param rule_id the rule_id to set
	 */
	public void setRule_id(int rule_id) {
		this.rule_id = rule_id;
	}
	/**
	 * @return the rank_lower
	 */
	public int getRank_lower() {
		return rank_lower;
	}
	/**
	 * @param rank_lower the rank_lower to set
	 */
	public void setRank_lower(int rank_lower) {
		this.rank_lower = rank_lower;
	}
	/**
	 * @return the rank_top
	 */
	public int getRank_top() {
		return rank_top;
	}
	/**
	 * @param rank_top the rank_top to set
	 */
	public void setRank_top(int rank_top) {
		this.rank_top = rank_top;
	}
	/**
	 * @return the grade
	 */
	public String getGrade() {
		return grade;
	}
	/**
	 * @param grade the grade to set
	 */
	public void setGrade(String grade) {
		this.grade = grade;
	}
	/**
	 * @return the detail_grade
	 */
	public String getDetail_grade() {
		return detail_grade;
	}
	/**
	 * @param detail_grade the detail_grade to set
	 */
	public void setDetail_grade(String detail_grade) {
		this.detail_grade = detail_grade;
	}
	/**
	 * @return the cou_id
	 */
	public int getCou_id() {
		return cou_id;
	}
	/**
	 * @param cou_id the cou_id to set
	 */
	public void setCou_id(int cou_id) {
		this.cou_id = cou_id;
	}

}
