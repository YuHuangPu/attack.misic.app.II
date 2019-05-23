<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
</style>
</head>
<body>
	<div class="sidebar">
		<nav class="sidebar-nav">
		<ul class="nav">
			<li class="nav-item">
				<a class="nav-link" href="ownerPage.action">
					<i class="nav-icon cui-speedometer"></i>
					<s:property value="lgView.getId('001')" />
				</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="factoryPage.action">
					<i class="nav-icon fa fa-handshake-o"></i>
					<s:property value="lgView.getId('002')" />
				</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="consumerPage.action">
					<i class="nav-icon cui-people"></i>
					<s:property value="lgView.getId('036')" />
				</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="reservePage.action">
					<i class="nav-icon fa fa-cubes"></i>
					<s:property value="lgView.getId('013')" />
				</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="transactionPage.action">
					<i class="nav-icon fa fa-bitcoin resize"></i>
					<s:property value="lgView.getId('019')" />
				</a>
			</li>

		</ul>
		</nav>
		<button class="sidebar-minimizer brand-minimizer" type="button"></button>
	</div>
</body>
</html>