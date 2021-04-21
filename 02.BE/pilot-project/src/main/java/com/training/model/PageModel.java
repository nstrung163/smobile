package com.training.model;

import java.util.ArrayList;
import java.util.List;

public class PageModel {

	public static final int DISABLE_PAGE = 0;
	public static final int NUMBER_OF_MAX_PAGE = 5 ;

	private int currentPage;
	private int totalPage;
	private int nextPage;
	private int prevPage;
	private int firstPage = 1;
	private int lastPage;
	private List<Integer> pageNumberList; 
	
	/**
	 * Page number
	 * 
	 * @param currentPage
	 * @param totalPage
	 */
	public PageModel(int currentPage, int totalPage) {
		
		this.currentPage = currentPage;
		this.totalPage = totalPage;
		
		if ( currentPage == this.firstPage) {
			this.prevPage = DISABLE_PAGE;
			this.firstPage = DISABLE_PAGE;
		} else {
			this.prevPage = currentPage - 1;
		}
		
		if (currentPage == totalPage) {
			this.lastPage = DISABLE_PAGE;
			this.nextPage = DISABLE_PAGE;
		} else if ( totalPage > 0) {
			this.lastPage = totalPage;
			this.nextPage = currentPage + 1;
		}
		this.pageNumberList = getPageNumberList( currentPage, totalPage, NUMBER_OF_MAX_PAGE);
	}
	
	/**
	 * Get List Page Number
	 * 
	 * @param currentPage
	 * @param totalPage
	 * @param numberOfMaxPage
	 * @return List Page Number
	 */
	private List<Integer> getPageNumberList(int currentPage, int totalPage, int numberOfMaxPage) {
		
		List<Integer> pageNumberList = new ArrayList<Integer>();
		
		int pageMin, pageMax;
		pageMin = currentPage - (numberOfMaxPage - 1 ) / 2;
		pageMax = currentPage + (numberOfMaxPage - 1 ) / 2;
		
		if (pageMin <= 0) {
			pageMin = 1;
			pageMax = numberOfMaxPage;
		}
		
		if (pageMax > totalPage) {
			pageMax = totalPage;
			pageMin = totalPage - numberOfMaxPage + 1;
		}
		
		for (int i = pageMin; i <= pageMax; i++) {
			if (i > 0) {
				pageNumberList.add(i);
			}
		}
		return pageNumberList;
	}
	
	/* Getter and Setter */
	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getNextPage() {
		return nextPage;
	}

	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}

	public int getPrevPage() {
		return prevPage;
	}

	public void setPrevPage(int prevPage) {
		this.prevPage = prevPage;
	}

	public int getFirstPage() {
		return firstPage;
	}

	public void setFirstPage(int firstPage) {
		this.firstPage = firstPage;
	}

	public int getLastPage() {
		return lastPage;
	}

	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}

	public List<Integer> getPageNumberList() {
		return pageNumberList;
	}

	public void setPageNumberList(List<Integer> pageNumberList) {
		this.pageNumberList = pageNumberList;
	}

}
