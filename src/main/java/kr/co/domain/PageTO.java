package kr.co.domain;

import java.util.List;

public class PageTO<T>{
	private int curPage = 1;
	private int perPage = 10; //한 페이지에 10개
	private int pageLine = 10;
	private int amount;
	private int totalPage;
	private int startNum; //해당 페이지의 시작 num값
	private int endNum; //해당 페이지의 끝 num값
	private int beginPageNum; //페이지세트에서 시작페이지
	private int stopPageNum;  //페이지세트에서 끝페이지
	private List<T> list;
	
	public PageTO() {
		executeAll();
	}
	
	public PageTO(int curPage) {
		super();
		this.curPage = curPage;
		executeAll();
	}
	
	
	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
		executeAll();
	}

	public int getPerPage() {
		return perPage;
	}

	public void setPerPage(int perPage) {
		this.perPage = perPage;
		executeAll();
	}

	public int getPageLine() {
		return pageLine;
	}

	public void setPageLine(int pageLine) {
		this.pageLine = pageLine;
		executeAll();
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
		executeAll();
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getStartNum() {
		return startNum;
	}

	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}

	public int getEndNum() {
		return endNum;
	}

	public void setEndNum(int endNum) {
		this.endNum = endNum;
	}

	public int getBeginPageNum() {
		return beginPageNum;
	}

	public void setBeginPageNum(int beginPageNum) {
		this.beginPageNum = beginPageNum;
	}

	public int getStopPageNum() {
		return stopPageNum;
	}

	public void setStopPageNum(int stopPageNum) {
		this.stopPageNum = stopPageNum;
	}

	public List<T> getList() {
		return list;
	}

	public void setList(List<T> list) {
		this.list = list;
	}

	private void executeAll() {
		totalPage = (amount-1)/perPage+1;
		startNum = (curPage-1)*perPage+1;
		endNum = curPage*perPage;
		if(endNum>amount) {
			endNum = amount;
		}
		beginPageNum = ((curPage-1)/pageLine)*pageLine+1;
		stopPageNum = beginPageNum + (pageLine-1);
		if(stopPageNum > totalPage) {
			stopPageNum = totalPage;
		}
	}
	
	

	
	
	

}
