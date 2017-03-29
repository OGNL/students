package school.binjiang.po;

import java.io.Serializable;

public class Score implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 3110810589841228412L;
	private int scoreId;
	private int stuId;
	private int english;
	private int math;
	private int computer;
	private int mzd;
	private int dxp;
	private int xxds;
	private int history;
	
	private Student stu;
	
	private String stuNo;
	private String stuName;
	private String gender;
	private String major;
	public int getScoreId() {
		return scoreId;
	}
	public void setScoreId(int scoreId) {
		this.scoreId = scoreId;
	}
	public int getEnglish() {
		return english;
	}
	public void setEnglish(int english) {
		this.english = english;
	}
	public int getMath() {
		return math;
	}
	public void setMath(int math) {
		this.math = math;
	}
	public int getComputer() {
		return computer;
	}
	public void setComputer(int computer) {
		this.computer = computer;
	}
	public int getMzd() {
		return mzd;
	}
	public void setMzd(int mzd) {
		this.mzd = mzd;
	}
	public int getDxp() {
		return dxp;
	}
	public void setDxp(int dxp) {
		this.dxp = dxp;
	}

	public int getXxds() {
		return xxds;
	}
	public void setXxds(int xxds) {
		this.xxds = xxds;
	}

	public Student getStu() {
		return stu;
	}
	public void setStu(Student stu) {
		this.stu = stu;
	}
	public int getStuId() {
		return stuId;
	}
	public void setStuId(int stuId) {
		this.stuId = stuId;
	}
	public int getHistory() {
		return history;
	}
	public void setHistory(int history) {
		this.history = history;
	}
	public String getStuNo() {
		return stuNo;
	}
	public void setStuNo(String stuNo) {
		this.stuNo = stuNo;
	}
	public String getStuName() {
		return stuName;
	}
	public void setStuName(String stuName) {
		this.stuName = stuName;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	
	
	

}
