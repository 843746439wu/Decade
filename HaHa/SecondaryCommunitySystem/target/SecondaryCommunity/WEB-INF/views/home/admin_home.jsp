<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title></title>
	<link rel="stylesheet" href="<c:url value="/static/vendor/bootstrap-4.3.1-dist/css/bootstrap.min.css"/>" media="all" />
	<script type="text/javascript" src="<c:url value="/static/vendor/jquery/jquery-3.3.1.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/static/vendor/popper.js/popper.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/static/vendor/bootstrap-4.3.1-dist/js/bootstrap.js"/>"></script>
	<script>
		function logout(){
			if(confirm("管理员${LoginedAdmin.admin_name},您确认要退出系统吗?"))
				location.href="<c:url value="/adminLogin"/>";
		}
	</script>
</head>
<body>
	<div>
		<div style="background-color: #367FAA">
			<img src="<c:url value="/admins/list"/>/${LoginedAdmin.admin_number}/adminpic" width="100" height="100" style="margin: 10px">${LoginedAdmin.admin_name}
			<div style="float: right;margin: 30px"><button onclick="logout();" title="点击退出系统">退出系统</button></div>
		</div>
		<div>
			<div style="background-color: #31424B;width: 180px;height: 100%;float: left;">
				<ul style="list-style-type:none">
					<li style="margin-top: 50px">
						<a href="/SecondaryCommunity/comics"><p style="color: white">动漫管理</p></a>
					</li>
					<li style="margin-top: 30px">
						<a href="/SecondaryCommunity/commodity"><p style="color: white">商品管理</p></a>
					</li>
					<li style="margin-top: 30px">
						<a href="/SecondaryCommunity/order"><p style="color: white">订单管理</p></a>
					</li>
					<li style="margin-top: 30px">
						<a href="/SecondaryCommunity/comment"><p style="color: white">评论管理</p></a>
					</li>
					<li style="margin-top: 30px">
						<a href="/SecondaryCommunity/chat"><p style="color: white">社区聊天</p></a>
					</li>
					<li style="margin-top: 30px">
						<a href="/SecondaryCommunity/activity"><p style="color: white">活动管理</p></a>
					</li>
					<li style="margin-top: 30px">
						<a href="/SecondaryCommunity/notice"><p style="color: white">公告管理</p></a>
					</li>
					<li style="margin-top: 30px">
						<a href="/SecondaryCommunity/users/list"><p style="color: white">用户信息管理</p></a>
					</li>
					<li style="margin-top: 30px">
						<a href="/SecondaryCommunity/admins/list"><p style="color: white">管理员信息管理</p></a>
					</li>
					<li style="margin-top: 30px">
						<a href="/SecondaryCommunity/admins"><p style="color: white">个人信息</p></a>
					</li>
				</ul>
			</div>
			<div style="border: 5px solid white;float: left;background-image: url(../../../static/pic/bg.jpg)">
				<h1 class="display-4" style="margin: 50px">欢迎来到二次元社区</h1>
				<p class="lead" style="margin: 50px">The second dimensional community will take you to understand a different world.</p>
			</div>
		</div>
	</div>
</body>
</html>