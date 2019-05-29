package com.ama.factory;

import com.ama.common.PageVo;
import com.util.StringUtil;

import ora.json.JSONObject;

public class SqlFactory {
	private static StringBuffer SQL;

	public static String getFactoryInfo(String whereCondition) {
		SQL = new StringBuffer("SELECT ");
		SQL.append(" f.ID, f.NAME, f.CONTACT, f.ADDRESS, f.MOBILE, f.REMARK");
		SQL.append(", (SELECT A.ACCOUNT FROM ACCOUNT A WHERE A.ID = f.CREATE_WHO) AS \"CREATE_WHO\"");
		SQL.append(", (SELECT A.ACCOUNT FROM ACCOUNT A WHERE A.ID = f.UPDATE_WHO) AS \"UPDATE_WHO\", ");
		SQL.append(" DATE_FORMAT(f.UPDATE_DATE,'%Y-%m-%d %T') as \"Update_DATE\"");
		SQL.append(" FROM FACTORY f ");
		SQL.append(" WHERE 1=1 ");
		SQL.append(StringUtil.eliminateNull(whereCondition));
		SQL.append(" ORDER BY f.ID");
		return SQL.toString();
	}
	
	public static String getConsumerInfo(String whereCondition) {
		SQL = new StringBuffer("SELECT ");
		SQL.append(" C.ID, C.NAME, C.STATUS, C.MOBILE, C.REMARK");
		SQL.append(", (SELECT A.ACCOUNT FROM ACCOUNT A WHERE A.ID = C.CREATE_WHO) AS \"CREATE_WHO\"");
		SQL.append(", (SELECT A.ACCOUNT FROM ACCOUNT A WHERE A.ID = C.UPDATE_WHO) AS \"UPDATE_WHO\"");
		SQL.append(", DATE_FORMAT(C.UPDATE_DATE,'%Y-%m-%d %T') as \"Update_DATE\"");
		SQL.append(", DATE_FORMAT(C.CREATE_DATE,'%Y-%m-%d') as \"Create_Date\" ");
		SQL.append(" FROM CONSUMER C ");
		SQL.append(" WHERE 1=1 ");
		SQL.append(StringUtil.eliminateNull(whereCondition));
		SQL.append(" ORDER BY C.ID");
		return SQL.toString();
	}

	public static String getReserveInfo(String whereCondition) {
		SQL = new StringBuffer("SELECT G.ITEM, G.ID, G.NAME, G.STATUS, G.RESERVE, G.PURCHASE, G.SELL, G.COST, G.PRICE, G.REMARK, G.FACTORY AS \"FACTORY_ID\"");
		SQL.append(", (SELECT F.NAME FROM FACTORY F WHERE F.ID = G.FACTORY) AS \"FACTORY_NAME\"");
		SQL.append(", (SELECT A.ACCOUNT FROM ACCOUNT A WHERE A.ID = G.CREATE_WHO) AS \"CREATE_WHO\"");
		SQL.append(", (SELECT A.ACCOUNT FROM ACCOUNT A WHERE A.ID = G.UPDATE_WHO) AS \"UPDATE_WHO\"");
		SQL.append(", DATE_FORMAT(G.UPDATE_DATE,'%Y-%m-%d %T') as \"Update_DATE\"");
		SQL.append(", DATE_FORMAT(G.CREATE_DATE,'%Y-%m-%d') as \"Create_Date\" ");
		SQL.append(" FROM GOODS G ");
		SQL.append(" WHERE 1=1");
		SQL.append(StringUtil.eliminateNull(whereCondition));
		SQL.append(" ORDER BY G.ITEM");
		return SQL.toString();
	}

	public static String getGoodsDetailInfo(String whereCondition) {
		SQL = new StringBuffer("SELECT G.ITEM, G.GOODS_ID, G.CONSUMER_ID, G.STATUS, G.AMOUNT, G.PRICE, G.SELL_DATE, G.REMARK, G.CREATE_DATE, G.CREATE_WHO");
		SQL.append(", (SELECT G1.NAME FROM GOODS G1 WHERE G1.ID = G.GOODS_ID) AS \"GOODS_NAME\"");
		SQL.append(", IF(G.STATUS='I', '¶i³f', '¾P°â') AS \"STATUS_TEXT\"");
		SQL.append(", (SELECT C.NAME FROM CONSUMER C WHERE C.ID = G.CONSUMER_ID) AS \"CONSUMER_NAME\"");
		SQL.append(" FROM GOODS_DETAIL G WHERE 1=1 ");
		SQL.append(StringUtil.eliminateNull(whereCondition));
		SQL.append(" ORDER BY G.SELL_DATE DESC");
		return SQL.toString();
	}

	public static String transToPageSql(String sql, PageVo<JSONObject> pageVo) {
		int startRownum = (pageVo.getCurrentPage() - 1) * pageVo.getShowRecord() + 1;
		SQL = new StringBuffer("select * from ( ");
		SQL.append(" SELECT @rownum := @rownum + 1 AS 'rownum', P.* FROM ( ");
		SQL.append(sql);
		SQL.append(" ) P, (SELECT @rownum := 0) ROW ");
		SQL.append(" ) page where page.rownum between ").append(startRownum).append(" and ").append(startRownum + pageVo.getShowRecord() - 1);
		return SQL.toString();
	}

	public static String countSql(String sql) {
		return String.format("SELECT COUNT(*) as \"ROW_COUNT\" FROM (%s) r001", sql);
	}
}
