package com.ama.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.ama.common.BaseManager;
import com.ama.common.Keys;
import com.ama.common.PageVo;
import com.ama.data.info.UserInfo;
import com.ama.factory.SqlFactory;
import com.ama.view.Views;
import com.util.DataBaseUtil;
import com.util.DatesUtil;
import com.util.SessionUtil;
import com.util.StringUtil;

import ora.json.JSONArray;
import ora.json.JSONObject;

public class queryTable extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public queryTable() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
//	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter result = null;
		Connection conn = null;
		try {
			result = response.getWriter();
			conn = DataBaseUtil.getConnection(Keys.COMPANY_JNDI_NAME, Boolean.FALSE);
			ora.json.JSONObject reqJson = com.util.JsonsUtil.getJsonObject(request);
			result.append(execute(request, response, reqJson, conn));
		} catch (Exception e) {
			e.printStackTrace();
			result.append(new JSONObject().put("status", Boolean.FALSE).put("message", "something error").toString());
			DataBaseUtil.RollBack(conn);
		} finally{
			DataBaseUtil.closeConnection(conn);
			result.close();
		}
	}
	private String execute(HttpServletRequest request, HttpServletResponse response, ora.json.JSONObject reqJson, Connection conn) throws SQLException, ParseException{
		JSONObject result = new JSONObject().put("status", Boolean.TRUE);
		String whereConditionStr = "";
		List<Object> condition = new ArrayList<Object>();
		
		if(reqJson.has("searchConsumer") && reqJson.getJSONArray("searchConsumer").length() > 0) {
			JSONArray sConsumer = reqJson.getJSONArray("searchConsumer");
			whereConditionStr += " AND G.CONSUMER_ID IN " + StringUtil.getWhereCondiotnIn(sConsumer.length());
			condition.addAll(sConsumer.toList());
		}
		if(reqJson.has("searchStatus") && reqJson.getJSONArray("searchStatus").length() > 0) {
			JSONArray sStatus = reqJson.getJSONArray("searchStatus");
			whereConditionStr += " AND G.STATUS IN " + StringUtil.getWhereCondiotnIn(sStatus.length());
			condition.addAll(sStatus.toList());
		}
		if(reqJson.has("searchDate")) {
			JSONArray sDate = reqJson.getJSONArray("searchDate");
			if(!StringUtil.isNull(sDate.get(0))) {
				whereConditionStr += " AND G.SELL_DATE >= ? ";
				condition.add(DatesUtil.StringToTimestamp(sDate.getString(0), DatesUtil.DateFormat));
			}
			if(!StringUtil.isNull(sDate.get(1))) {
				whereConditionStr += " AND G.SELL_DATE <= ? ";
				condition.add(DatesUtil.StringToTimestamp(sDate.getString(1), DatesUtil.DateFormat));
			}
		}
		if(reqJson.has("superSearchInput") && !StringUtil.isNull(reqJson.getString("superSearchInput"))) {
			String sInput = "%" + reqJson.getString("superSearchInput") + "%";
			whereConditionStr += " AND ( G.PRICE LIKE ? OR G.AMOUNT LIKE ? OR G.REMARK LIKE ? OR G.GOODS_ID LIKE ? OR G.GOODS_ID IN (SELECT G1.ID FROM GOODS G1 WHERE G1.NAME LIKE ?) ) ";
			condition.addAll(Arrays.asList(sInput, sInput, sInput, sInput, sInput));
		}

		Views vw = new Views(SqlFactory.getGoodsDetailInfo(whereConditionStr), conn);
		vw.setPstmt(condition.toArray());
		JSONArray dataList = vw.getDatalistJSONArray(Boolean.FALSE);
		result.put("dataList", dataList);
		return result.toString();
	}
}
