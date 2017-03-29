package school.binjiang.po;

import java.io.Serializable;

public class Grade implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -2041828883487236400L;
	
	private int gradeId;
	private String CET4;
	private String CET6;
	private String NCRE1;
	private String NCRE2;
	private String account;
	private String teacher;
	private int stuId;
	
	private Student stu;
	
	private String stuNo;
	private String stuName;
	private String gender;
	private String major;
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
	public int getGradeId() {
		return gradeId;
	}
	public void setGradeId(int gradeId) {
		this.gradeId = gradeId;
	}
	public String getCET4() {
		return CET4;
	}
	public void setCET4(String cET4) {
		CET4 = cET4;
	}
	public String getCET6() {
		return CET6;
	}
	public void setCET6(String cET6) {
		CET6 = cET6;
	}
	public String getNCRE1() {
		return NCRE1;
	}
	public void setNCRE1(String nCRE1) {
		NCRE1 = nCRE1;
	}
	public String getNCRE2() {
		return NCRE2;
	}
	public void setNCRE2(String nCRE2) {
		NCRE2 = nCRE2;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getTeacher() {
		return teacher;
	}
	public void setTeacher(String teacher) {
		this.teacher = teacher;
	}
	public int getStuId() {
		return stuId;
	}
	public void setStuId(int stuId) {
		this.stuId = stuId;
	}
	public Student getStu() {
		return stu;
	}
	public void setStu(Student stu) {
		this.stu = stu;
	}
	
	
	

}
