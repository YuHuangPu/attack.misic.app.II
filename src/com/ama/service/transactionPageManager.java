package com.ama.service;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.util.Date;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.ama.common.Keys;
import com.ama.common.PageVo;
import com.ama.factory.SqlFactory;
import com.ama.language.LanguageView;
import com.ama.view.Views;
import com.util.DatesUtil;
import com.util.SessionUtil;
import com.util.StringUtil;

import ora.json.JSONArray;
import ora.json.JSONObject;

public class transactionPageManager extends com.ama.common.BaseManager {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public String execute() throws ParseException {
		HttpServletRequest request;
		try {
			String whereCondition = null;
//			String whereCondition = "AND SELL_DATE BETWEEN ? AND ? AND CONSUMER_ID = ?";
//			Timestamp[] dateRange = new Timestamp[2];
//			dateRange[0] = DatesUtil.getFirstDayByMonth(new Date());
//			dateRange[0] = DatesUtil.StringToTimestamp("2019-01-01", DatesUtil.DateFormat);
//			dateRange[1] = DatesUtil.getLastDayByMonth(new Date());
//			JSONArray consumers = new JSONArray();
//			consumers.put("001");

			request = (HttpServletRequest) ServletActionContext.getRequest();
			this.setConn(com.util.DataBaseUtil.getConnection(Keys.COMPANY_JNDI_NAME, Boolean.TRUE));

			int goPage = Integer.valueOf(StringUtil.eliminateNull(request.getParameter("goPage"), "1"));

			pageVo = new PageVo<JSONObject>();
			pageVo.setCurrentPage(goPage);

			Views vw = new Views(SqlFactory.countSql(SqlFactory.getGoodsDetailInfo(whereCondition)), this.getConn());
//			vw.setPstmt(new Object[] {dateRange[0], dateRange[1], consumers.getString(0)});
			JSONArray countSql = vw.getDatalistJSONArray(Boolean.FALSE);
			pageVo.setTotalRecord(countSql.getJSONObject(0).getInt("RowCount"));

			vw = new Views(SqlFactory.getGoodsDetailInfo(whereCondition), this.getConn());
//			vw.setPstmt(new Object[] {dateRange[0], dateRange[1], consumers.getString(0)});
			JSONArray dataList = vw.getDatalistJSONArray(Boolean.FALSE);
//			JSONArray dataList = new JSONArray();

			vw = new Views(SqlFactory.getConsumerInfo(null), this.getConn());
			JSONArray consumers = vw.getDatalistJSONArray(Boolean.FALSE);

			vw = new Views(SqlFactory.getReserveInfo(null), this.getConn());
			JSONArray reserve = vw.getDatalistJSONArray(Boolean.FALSE);

//			JSONArray dateRangeStr = new JSONArray();
//			dateRangeStr.put(DatesUtil.DateFormat.format(dateRange[0]));
//			dateRangeStr.put(DatesUtil.DateFormat.format(dateRange[1]));
//			request.setAttribute("dateRange", dateRangeStr);
//			request.setAttribute("consumers", consumers.toString().replace("\"", "\\\"").replace("'", "\\'"));
			request.setAttribute("consumers", consumers.toString().replace("\"", "\\\"").replace("'", "\\'"));
			request.setAttribute("reserve", reserve.toString().replace("\"", "\\\"").replace("'", "\\'"));
			request.setAttribute("dataList", dataList.toString().replace("\"", "\\\"").replace("'", "\\'"));

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			com.util.DataBaseUtil.closeConnection(this.getConn());
		}
		return Keys.WEB_SUCCESSFUL;
	}

}
