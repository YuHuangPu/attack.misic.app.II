package com.ama.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ama.common.BaseManager;
import com.ama.common.Keys;
import com.ama.data.info.UserInfo;
import com.util.DataBaseUtil;
import com.util.SessionUtil;
import com.util.StringUtil;

import ora.json.JSONObject;

/**
 * Servlet implementation class addFactory
 */
@WebServlet("/addFactory")
public class addFactory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addFactory() {
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
	private String execute(HttpServletRequest request, HttpServletResponse response, ora.json.JSONObject reqJson, Connection conn) throws SQLException{
		JSONObject result = new JSONObject().put("status", Boolean.TRUE);
		String sql = "INSERT INTO FACTORY (`ITEM`, `ID`, `NAME`, `STATUS`, `CONTACT`, `ADDRESS`, `MOBILE`, `REMARK`, `CREATE_DATE`, `UPDATE_DATE`, `CREATE_WHO`, `UPDATE_WHO`) "
				+ "VALUES ('0', ?, ?, 'S', ?, ?, ?, ?, ?, ?, ?, ?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		String userID = (((UserInfo)request.getSession().getAttribute(Keys.Session.LoginAccount)).getId());
		java.sql.Timestamp CreateDate = new java.sql.Timestamp(new Date().getTime());
		pstmt.setString(1, StringUtil.isNull(reqJson.getString("Id"))?"0":reqJson.getString("Id"));
		pstmt.setString(2, reqJson.getString("Name"));
		pstmt.setString(3, reqJson.getString("Contact"));
		pstmt.setString(4, reqJson.getString("Address"));
		pstmt.setString(5, reqJson.getString("Mobile"));
		pstmt.setString(6, reqJson.getString("Remark"));
		pstmt.setTimestamp(7, CreateDate);
		pstmt.setTimestamp(8, CreateDate);
		pstmt.setString(9, userID);
		pstmt.setString(10, userID);
		pstmt.execute();
		return result.toString();
	}
}