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
		function previewImage(file){
			var img = document.getElementById('picImg');
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
		function logout(){
			if(confirm("管理员${LoginedAdmin.admin_name},您确认要退出系统吗?"))
				location.href="<c:url value="/adminLogin"/>";
		}
		function time(){
			var time= new Date().Format("yyyyMMddHHmmss");
			t.value = time;
		}
		Date.prototype.Format = function (fmt) {
			var o = {
				"M+": this.getMonth() + 1, //月份
				"d+": this.getDate(), //日
				"H+": this.getHours(), //小时
				"m+": this.getMinutes(), //分
				"s+": this.getSeconds(), //秒
			};
			if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
			for (var k in o)
				if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
			return fmt;
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
			<div style="width: 1500px">
				<ul class="breadcrumb" style="width: 1500px">
					<li>商品管理</li>
					<li>/商品信息列表</li>
					<li class="active">/商品添加</li>
				</ul>
				<form action="<c:url value="/commodity"/>" class="col-6" method="post" enctype="multipart/form-data">
					<div class="form-group row">
						<label class="col-3 col-form-label">商品ID</label>
						<div class="col-6">
							<input type="text" class="form-control" onclick="time()" id="t" name="commodity_id" value="">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-3 col-form-label">商品名称</label>
						<div class="col-6">
							<input type="text" class="form-control" name="commodity_name" value="">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-3 col-form-label">商品类型</label>
						<div class="col-6">
							<input type="text" class="form-control" name="commodity_type" value="">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-3 col-form-label">商品价格</label>
						<div class="col-6">
							<input type="text" class="form-control" name="commodity_price" value="">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-3 col-form-label">商品描述</label>
						<div class="col-6">
							<input type="text" class="form-control" name="commodity_describe" value="">
						</div>
					</div>
					<div class="form-group row" style="margin-left: 40px">
						<img id="picImg" src="${pageContext.request.contextPath}/static/pic/default.jpg" class="py-1" style="width: 250px;height: 150px;margin-left: 150px">
					</div>
					<div class="form-group row">
						<label class="col-3 col-form-label">动漫图片</label>
						<div class="col-6">
							<input type="file" name="commpic" class="form-control-file" onchange="previewImage(this)">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-3 col-form-label">商品数量</label>
						<div class="col-6">
							<input type="text" class="form-control" name="commodity_num" value="">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-3 col-form-label">商品规模</label>
						<div class="col-6">
							<input type="text" class="form-control" name="commodity_style" value="">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-3 col-form-label">商品运费</label>
						<div class="col-6">
							<input type="text" class="form-control" name="commodity_shipping" value="">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-3 col-form-label">商品折扣</label>
						<div class="col-6">
							<input type="text" class="form-control" name="commodity_discount" value="">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-3 col-form-label">商品货源</label>
						<div class="col-6">
							<input type="text" class="form-control" name="commodity_address" value="">
						</div>
					</div>
					<div class="form-group row">
						<button class="btn btn-primary">新商品上架</button>
						<a class="btn btn-primary" href="/SecondaryCommunity/commodity" style="margin-left: 10px">返回</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
</body>
</html>