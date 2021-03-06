package com.ama.service;

import java.sql.SQLException;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.ama.common.Keys;
import com.ama.common.PageVo;
import com.ama.factory.SqlFactory;
import com.ama.view.Views;
import com.util.SessionUtil;
import com.util.StringUtil;

import ora.json.JSONArray;
import ora.json.JSONObject;

public class consumerPageManager extends com.ama.common.BaseManager{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public String execute(){
		HttpServletRequest request;
		try {
			request = (HttpServletRequest) ServletActionContext.getRequest();
			this.setConn(com.util.DataBaseUtil.getConnection(Keys.COMPANY_JNDI_NAME, Boolean.TRUE));
			
			int goPage = Integer.valueOf(StringUtil.eliminateNull(request.getParameter("goPage"), "1"));

			pageVo = new PageVo<JSONObject>();
			pageVo.setCurrentPage(goPage);
			
			Views vw = new Views(SqlFactory.countSql(SqlFactory.getConsumerInfo(null)), this.getConn());
			JSONArray countSql = vw.getDatalistJSONArray(Boolean.FALSE);
			pageVo.setTotalRecord(countSql.getJSONObject(0).getInt("RowCount"));

			vw = new Views(SqlFactory.getConsumerInfo(null), this.getConn());
			
			JSONArray consumers = vw.getDatalistJSONArray(Boolean.FALSE);
			
			request = (HttpServletRequest) ServletActionContext.getRequest();
			request.setAttribute("consumers", consumers.toString().replace("\"", "\\\"").replace("'", "\\'"));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			com.util.DataBaseUtil.closeConnection(this.getConn());
			
		}
		return Keys.WEB_SUCCESSFUL;
	}
}
