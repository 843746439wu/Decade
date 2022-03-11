<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="<c:url value="/static/vendor/bootstrap-4.3.1-dist/css/bootstrap.min.css"/>" media="all" />
	<script type="text/javascript" src="<c:url value="/static/vendor/jquery/jquery-3.3.1.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/static/vendor/popper.js/popper.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/static/vendor/bootstrap-4.3.1-dist/js/bootstrap.js"/>"></script>

	<script type="text/javascript">
		function previewImage(file){
			var img = document.getElementById('picAdmin');
			if (file.files && file.files[0])
			{
				//准备一个文件读取器对象，并告诉它文件读取完毕之后要做什么。
				var reader = new FileReader();
				//成功读取了图片信息后，把读取结果赋予
				//FileReader.readAsDataURL()
				//开始读取指定的Blob中的内容。一旦完成，result属性中将包含一个data: URL格式的字符串以表示所读取文件的内容。
				reader.onload = function(evt){
					img.src= evt.target.result;
					console.log("read ok! img src get value!"+evt.target.result);
				}

				console.log("start to read!")
				reader.readAsDataURL(file.files[0]);
			}
			else{
				img.src="<c:url value="/"/>static/pic/default.jpg";
			}
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
		<div style="background-color: #31424B;width: 180px;height: 820px;float: left;">
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
				<li>管理员信息管理</li>
				<li>/管理员信息列表</li>
				<li>/管理员添加</li>
			</ul>
			<form action="<c:url value="/admins/list"/>" class="col-6" method="post" enctype="multipart/form-data">
				<div class="form-group row">
					<label class="col-3 col-form-label">管理员账号</label>
					<div class="col-6">
						<input type="text" class="form-control" name="admin_number" value="">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-3 col-form-label">管理员密码</label>
					<div class="col-6">
						<input type="text" class="form-control" name="admin_password" value="">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-3 col-form-label">管理员名字</label>
					<div class="col-6">
						<input type="text" class="form-control" name="admin_name" value="">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-3 col-form-label">管理员身份证</label>
					<div class="col-6">
						<input type="text" class="form-control" name="admin_id" value="">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-3 col-form-label">管理员电话</label>
					<div class="col-6">
						<input type="text" class="form-control" name="admin_phone" value="">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-3 col-form-label">管理员家庭地址</label>
					<div class="col-6">
						<input type="text" class="form-control" name="admin_address" value="">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-3 col-form-label">管理员邮箱</label>
					<div class="col-6">
						<input type="text" class="form-control" name="admin_email" value="">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-3 col-form-label">管理员生日</label>
					<div class="col-6">
						<input type="text" class="form-control" name="admin_birth" value="">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-3 col-form-label">管理员QQ</label>
					<div class="col-6">
						<input type="text" class="form-control" name="admin_qq" value="">
					</div>
				</div>
				<div class="form-group row" style="margin-left: 50px">
					<img id="picAdmin" src="${pageContext.request.contextPath}/static/pic/default.jpg" class="py-1" style="width: 250px;height: 150px;margin-left: 150px">
				</div>
				<div class="form-group row">
					<label class="col-3 col-form-label">管理员头像</label>
					<div class="col-6">
						<input type="file" name="adminpic" class="form-control-file" onchange="previewImage(this)">
					</div>
				</div>
				<div class="form-group row">
					<button class="btn btn-primary">添加新的管理员</button>
					<a class="btn btn-primary" href="/SecondaryCommunity/admins/list" style="margin-left: 10px">返回</a>
				</div>
			</form>
		</div>
	</div>
</div>
</div>
</body>