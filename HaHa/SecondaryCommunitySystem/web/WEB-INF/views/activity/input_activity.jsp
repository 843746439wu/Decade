<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>动漫添加</title>
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
		<div style="background-color: #31424B;width: 180px;height: 106%;float: left;">
			<ul style="list-style-type:none">
				<li style="margin-top: 50px">
					<a href="/SecondaryCommunity/comics" style="text-decoration: none;"><p style="color: white">动漫管理</p></a>
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
		<div style="float: left;">
			<ul class="breadcrumb" style="width: 1500px">
				<li>活动管理</li>
				<li>/发布活动</li>
			</ul>
			<form action="<c:url value="/activity"/>" class="col-6" method="post">
				<div class="form-group row">
					<label class="col-3 col-form-label">编号</label>
					<div class="col-6">
						<input type="text" class="form-control" name="act_no" value="">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-3 col-form-label">管理员名称</label>
					<div class="col-6">
						<input type="text" class="form-control" name="act_name" value="">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-3 col-form-label">开始时间</label>
					<div class="col-6">
						<input type="text" class="form-control" name="act_uptime" value="">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-3 col-form-label">结束时间</label>
					<div class="col-6">
						<input type="text" class="form-control" name="act_downtime" value="">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-3 col-form-label">活动积分</label>
					<div class="col-6">
						<input type="text" class="form-control" name="act_number" value="">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-3 col-form-label">标题</label>
					<div class="col-6">
						<input type="text" class="form-control" name="act_title" value="">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-3 col-form-label">内容</label>
					<div class="col-6">
						<input type="text" class="form-control" name="act_content" value="">
					</div>
				</div>
				<div class="form-group row">
					<button class="btn btn-primary">发布</button>
					<a class="btn btn-primary" href="/SecondaryCommunity/activity" style="margin-left: 10px">返回</a>
				</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>