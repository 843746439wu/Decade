<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>动漫信息列表</title>
	<link rel="stylesheet" href="<c:url value="/static/vendor/bootstrap-4.3.1-dist/css/bootstrap.min.css"/>" media="all" />
	<script type="text/javascript" src="<c:url value="/static/vendor/jquery/jquery-3.3.1.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/static/vendor/popper.js/popper.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/static/vendor/bootstrap-4.3.1-dist/js/bootstrap.js"/>"></script>
	<script>
		var delComicName ="";

		function showRemoveDlg(comic_name){
			delComicName=comic_name;
			$("#message").html('您确认要删除的动漫名为['+comic_name+']的动漫吗?');
			$("#removeComicModal").modal('show');
		}

		function removeComic(){
			document.forms[0].action="<c:url value="/comics"/>/"+delComicName;
			document.forms[0].submit();
		}

		function updateComic(comic_name){
			location.href="<c:url value="/comics"/>/"+comic_name;
		}

		function pagejumpA(comic_aplatform){
			location.href = comic_aplatform;
		}
		function pagejumpB(comic_bplatform){
			location.href = comic_bplatform;
		}
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
		<div style="background-color: #31424B;width: 150px;height: 106%;float: left;">
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
			<div style="width: 1528px">
				<ul class="breadcrumb" style="width: 1538px">
					<li>动漫管理</li>
					<li>/动漫信息列表</li>
					<li class="active">/动漫修改</li>
				</ul>
				<form action="<c:url value="/comics"/>/${comic.comic_name}" class="col-6" method="post" enctype="multipart/form-data">
					<input type="hidden" name="_method" value="PUT"/>
					<div class="form-group row">
						<label class="col-3 col-form-label">动漫拼音</label>
						<div class="col-6">
							<input type="text" class="form-control" name="comic_pinyin" value="${comic.comic_pinyin}">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-3 col-form-label">动漫名称</label>
						<div class="col-6">
							<input type="text" class="form-control" name="comic_name" value="${comic.comic_name}" readonly>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-3 col-form-label">动漫集数</label>
						<div class="col-6">
							<input type="text" class="form-control" name="comic_number" value="${comic.comic_number}">
						</div>
					</div>
					<div class="form-group row" style="margin-left: 40px">
						<img id="picImg" src="<c:url value="/comics"/>/${comic.comic_name}/comicpic" class="py-1" style="width: 250px;height: 150px;margin-left: 150px">
					</div>
					<div class="form-group row" >
						<label class="col-3 col-form-label">动漫图片</label>
						<div class="col-6">
							<input type="file" name="comicpic" class="form-control-file" onchange="previewImage(this)">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-3 col-form-label">动漫简介</label>
						<div class="col-6">
							<input type="text" class="form-control" name="comic_introduce" value="${comic.comic_introduce}">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-3 col-form-label">动漫国家</label>
						<div class="col-6">
							<input type="text" class="form-control" name="comic_type1" value="${comic.comic_type1}">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-3 col-form-label">动漫类型</label>
						<div class="col-6">
							<input type="text" class="form-control" name="comic_type2" value="${comic.comic_type2}">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-3 col-form-label">动漫上映时间</label>
						<div class="col-6">
							<input type="text" class="form-control" name="comic_time" value="${comic.comic_time}">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-3 col-form-label">动漫上映平台</label>
						<div class="col-6">
							<input type="text" class="form-control" name="comic_platform" value="${comic.comic_platform}">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-3 col-form-label">动漫上映平台网址</label>
						<div class="col-6">
							<input type="text" class="form-control" name="comic_aplatform" value="${comic.comic_aplatform}">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-3 col-form-label">动漫网页观看平台</label>
						<div class="col-6">
							<input type="text" class="form-control" name="comic_bplatform" value="${comic.comic_bplatform}">
						</div>
					</div>
					<div class="form-group row">
						<button class="btn btn-primary">确认修改</button>
						<a class="btn btn-primary" href="/SecondaryCommunity/comics" style="margin-left: 10px">返回</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
</body>
</html>