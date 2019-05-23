package com.ama.common;

import java.util.ArrayList;
import java.util.List;

import ora.json.JSONObject;

public class PageVo<T> {
	private int currentPage;
	private int totalRecord;
	private int showRecord;

	private List<T> recordList = new ArrayList<T>();

	public int getTotalRecord() {
		return totalRecord;
	}

	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}

	public int getShowRecord() {
		return (showRecord == 0 ? Integer.valueOf(Keys.FIRST_RECORDS_FORMAT) : showRecord);
	}

	public void setShowRecord(int showRecord) {
		this.showRecord = showRecord;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

//	---------
	public List<T> getRecordList() {
		return recordList;
	}

	public void setRecordList(List<T> recordList) {
		this.recordList = recordList;
	}

	public void addRecord(T obj) {
		recordList.add(obj);
	}

	public int getPageCounts() {
		return (this.getTotalRecord() / this.getShowRecord()) + ((this.getTotalRecord() % this.getShowRecord() == 0) ? 0 : 1);
	}

	public JSONObject getObject() {
		return new JSONObject().put("pageCounts", getPageCounts()).put("currentPage", getCurrentPage()).put("totalRecord", getTotalRecord()).put("showRecord", getShowRecord());
	}

}
