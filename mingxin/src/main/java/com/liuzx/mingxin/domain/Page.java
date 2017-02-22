package com.liuzx.mingxin.domain;

public class Page {
	private int pageIndex = 1;
	private int pageSize = 50;

	public int getPageIndex() {
		return pageIndex;
	}

	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getStart() {
		int index = pageIndex - 1;
		if (index < 0) {
			index = 0;
		}
		return index * pageSize;
	}

}
