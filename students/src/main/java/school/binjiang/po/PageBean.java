package school.binjiang.po;

import java.util.HashMap;

public class PageBean {
	
	private int rowCount;
	private int curPage = 1;
	private int sizePerPage = 10;
	private int maxPage;
	private HashMap<String, Object> params = new HashMap<String, Object>();
	
	private int iDisplayStart = 0; // 起始索引  
	
	private String sortColumn;
	private String sortType = "asc";
    
	public int getRowCount() {
		return rowCount;
	}
	public void setRowCount(int rowCount) {
		this.rowCount = rowCount;
	}
	public int getCurPage() {
		if(this.curPage>this.maxPage){
			this.curPage=this.maxPage;
		}
		if(this.curPage<=0){
			this.curPage = 1;
		}
		return curPage;
	}
	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
	public int getSizePerPage() {
		return sizePerPage;
	}
	public void setSizePerPage(int sizePerPage) {
		this.sizePerPage = sizePerPage;
	}
	public int getMaxPage() {
		maxPage = this.rowCount%this.sizePerPage == 0 ? this.rowCount/this.sizePerPage
					: this.rowCount/this.sizePerPage + 1;
		return maxPage;
	}
	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}
	public HashMap<String, Object> getParams() {
		return params;
	}
	public void setParams(HashMap<String, Object> params) {
		this.params = params;
	}
	public String getSortType() {
		return sortType;
	}
	public void setSortType(String sortType) {
		this.sortType = sortType;
	}
	public int getiDisplayStart() {
		return iDisplayStart;
	}
	public void setiDisplayStart(int iDisplayStart) {
		this.iDisplayStart = iDisplayStart;
	}
	public String getSortColumn() {
		return sortColumn;
	}
	public void setSortColumn(String sortColumn) {
		this.sortColumn = sortColumn;
	}
	
	
	
	
	
	
	
	

    
	
    

}
