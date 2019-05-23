package com.ama.common;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Iterator;

import org.apache.struts2.ServletActionContext;

import com.ama.data.info.UserInfo;
import com.ama.language.LanguageView;
import com.ama.view.Views;
import com.opensymphony.xwork2.ActionSupport;
import com.util.SessionUtil;
import com.util.StringUtil;

import ora.json.JSONArray;
import ora.json.JSONException;
import ora.json.JSONObject;

public class BaseManager extends ActionSupport implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public BaseManager() {
		this.setUserInfo(((UserInfo) SessionUtil.getSession(Keys.Session.LoginAccount)));
		this.setLgView((LanguageView) SessionUtil.getSession("lgView"));
		setMap();
	}
	protected PageVo<JSONObject> pageVo;
	
	public PageVo<JSONObject> getPageVo() {
		return pageVo;
	}

	public void setPageVo(PageVo<JSONObject> pageVo) {
		this.pageVo = pageVo;
	}
	private LanguageView lgView;

	public LanguageView getLgView() {
		return lgView;
	}

	public void setLgView(LanguageView lgView) {
		this.lgView = lgView;
	}

	private JSONObject accountMap, factoryMap, GoodsMap, ConsumerMap;

	public JSONObject getAccountMap() {
		return accountMap;
	}

	public void setAccountMap(JSONObject accountMap) {
		this.accountMap = accountMap;
	}

	public JSONObject getFactoryMap() {
		return factoryMap;
	}

	public void setFactoryMap(JSONObject factoryMap) {
		this.factoryMap = factoryMap;
	}

	public JSONObject getGoodsMap() {
		return GoodsMap;
	}

	public void setGoodsMap(JSONObject goodsMap) {
		GoodsMap = goodsMap;
	}

	public JSONObject getConsumerMap() {
		return ConsumerMap;
	}

	public void setConsumerMap(JSONObject consumerMap) {
		ConsumerMap = consumerMap;
	}

	private Connection conn;
	private com.ama.data.info.UserInfo userInfo;

	public Connection getConn() {
		return conn;
	}

	public void setConn(Connection conn) {
		this.conn = conn;
	}

	public com.ama.data.info.UserInfo getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(com.ama.data.info.UserInfo login) {
		this.userInfo = login;
	}

	private void setMap() {
		Connection conn = null;
		try {
			conn = com.util.DataBaseUtil.getConnection(Keys.COMPANY_JNDI_NAME, Boolean.TRUE);
			Views accountMap = new Views(conn, Keys.View.AccountMap);
			this.setAccountMap(queryMap(accountMap));

			Views factoryMap = new Views(conn, Keys.View.FactoryMap);
			this.setFactoryMap(queryMap(factoryMap));

			Views GoodsMap = new Views(conn, Keys.View.GoodsMap);
			this.setGoodsMap(queryMap(GoodsMap));

			Views ConsumerMap = new Views(conn, Keys.View.ConsumerMap);
			this.setConsumerMap(queryMap(ConsumerMap));
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			com.util.DataBaseUtil.closeConnection(conn);
		}
	}

	private JSONObject queryMap(Views map) throws JSONException, SQLException {
		JSONArray aMap = map.getDatalistJSONArray(Boolean.FALSE);
		JSONObject v = new JSONObject(aMap.length());
		Iterator<Object> itrs = aMap.iterator();
		while (itrs.hasNext()) {
			JSONObject itr = (JSONObject) itrs.next();
			v.put(itr.getString("Key"), itr.getString("Value"));
		}
		return v;
	}

	public String getPageName() {
		String target = StringUtil.eliminateNull(com.opensymphony.xwork2.ActionContext.getContext().getName());
		switch (target) {
		case "ownerPage":
			return null;
		case "factoryPage":
			return lgView.getId("002");
		case "consumerPage":
			return lgView.getId("036");
		case "reservePage":
			return lgView.getId("013");
		case "transactionPage":
			return lgView.getId("019");
		}
		return target;
	}

}
