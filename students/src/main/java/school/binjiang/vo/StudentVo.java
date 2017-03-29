package school.binjiang.vo;

import school.binjiang.po.Student;

public class StudentVo extends Student{
	

	/**
	 * 
	 */
	private static final long serialVersionUID = 7499942009155527350L;

	private int rs;
	
	private String startDate;
	private String endDate;

	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public int getRs() {
		return rs;
	}
	public void setRs(int rs) {
		this.rs = rs;
	}
	
	

}
