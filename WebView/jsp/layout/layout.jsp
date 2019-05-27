<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%
	if (((int) (Math.random() * 100)) % 15 == 0) {
%>
<!-- 

//
//                       _oo0oo_
//                      o8888888o
//                      88" . "88
//                      (| -_- |)
//                      0\  =  /0
//                    ___/`---'\___
//                  .' \\|     |// '.
//                 / \\|||  :  |||// \
//                / _||||| -:- |||||- \
//               |   | \\\  -  /// |   |
//               | \_|  ''\---/''  |_/ |
//               \  .-\__  '-'  ___/-. /
//             ___'. .'  /--.--\  `. .'___
//          ."" '<  `.___\_<|>_/___.' >' "".
//         | | :  `- \`.;`\ _ /`;.`/ - ` : | |
//         \  \ `_.   \_ __\ /__ _/   .-` /  /
//     =====`-.____`.___ \_____/___.-`___.-'=====
//                       `=---='
//
//
//     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//
//               佛祖保佑         永無bug
//
//***************************************************

 -->

<%
	} else {

	}
%>
<html lang="en">
<head>
<meta HTTP-EQUIV="content-type" CONTENT="text/html; charset=UTF-8" />
<!-- lib start-->
<tiles:insertAttribute name="lib" />
<!-- lib  end -->
<title><tiles:insertAttribute name="title" /></title>
</head>
<style type="text/css">
</style>
<!-- menu start -->
<body class="app header-fixed sidebar-fixed aside-menu-fixed sidebar-lg-show">
	<tiles:insertAttribute name="menu" />
	<div class="app-body">
		<tiles:insertAttribute name="sidebar" />
		<main class="main"> <tiles:insertAttribute name="breadcrumb" />
		<div class="container-fluid">
			<div class="animated fadeIn">
				<tiles:insertAttribute name="body" />
			</div>
		</div>
		</main>
<%-- 		<tiles:insertAttribute name="aside-menu" /> --%>
	</div>
	<tiles:insertAttribute name="footer" />
</body>
<!-- footer end-->
</html>
