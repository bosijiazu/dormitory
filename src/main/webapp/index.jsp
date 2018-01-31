<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>教务管理系统-登录</title>
	<link rel="stylesheet" type="text/css" href="./easyui1_5/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="./easyui1_5/themes/style/login.css">
		
	<script type="text/javascript" src="./easyui1_5/jquery.min.js"></script>
	<script type="text/javascript" src="./easyui1_5/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="./easyui1_5/jquery.easyui.min.js"></script>
</head>

<body>
	<div class="header">
		<h2>教务管理系统</h2>
	</div>
	<div class="easyui-panel">
		<image src="./easyui1_5/themes/style/image/login-bg.png" />
		<div class="loginbox">
			<h3>教务管理系统</h3>
			<ul class="switcher">
				<li class="selected"><a href="###">登 录</a></li>
				<!-- <li><a href="###">注 册</a></li> -->
			</ul>
			<div id="login">
				<!-- 登录 -->
				<form method="post" action="/${projectName}/sysmanage/login/login.action">
					<input type="text" name="loginname" value="student" class="name" placeholder="Email地址" />
					<input type="text" name="password" value="123456" class="pwd" placeholder="密码" />
					<input type="submit" value="登 录">
				</form>
			</div>
			<div id="signup">
				<!-- 注册 -->
				<form method="post" action="">
				    <input class="easyui-textbox" name="username" value=""/>
					<input type="text" name="loginname1" value="javamao" class="name" placeholder="Email地址" />
					<input type="text" name="loginpassword1" value="yzx1201" class="pwd" placeholder="密码" />
					<input type="submit" value="注 册">
				</form>
			</div>
		</div>
	</div>
	<div class="footer">Copyright 2013-2017 华唐中科教育科技（北京）有限公司 www.cnccss.cn</div>
</body>
</html>