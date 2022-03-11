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
		<div style="background-color: #31424B;width: 180px;height: 100%;float: left;">
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
				<li>动漫管理</li>
				<li class="active">/动漫信息列表</li>
			</ul>
			<form action="" method="post">
				<input type="hidden" name="_method" value="DELETE"/>
			</form>
			<div>
				<div class="my-2 text-right" style="width: 1500px">
					<button class="btn btn-primary" onclick="location.href='<c:url value="/comics/input"/>';">动漫登记</button>
				</div>
				<table class="table table-striped table-hover table-bordered" style="width: 1500px">
					<thead>
					<tr style="text-align: center">
						<th>序号</th>
						<th>动漫</th>
						<th>动漫简介</th>
						<th>动漫类型</th>
						<th>动漫播放平台</th>
						<th>操作</th>
					</tr>
					</thead>
					<tbody>
					<c:forEach var="comic" items="${comicList}" varStatus="idx">
						<tr>
							<th style="width: 80px;text-align: center;">${idx.index+1}</th>
							<td>
								<div><img src="<c:url value="/comics"/>/${comic.comic_name}/comicpic" width="200" height="150"></div><hr>
								<div>${comic.comic_name}</div>
							</td>
							<td style="width: 600px;">
								<div>${comic.comic_introduce}</div>
							</td>
							<td style="width: 150px">
								<p>国家：${comic.comic_type1}</p>
								<p>类型：${comic.comic_type2}</p><hr>
								<p>上映时间：</p>${comic.comic_time}<hr>
								<p>集数：${comic.comic_number}</p>
							</td>
							<td>
								<div style="margin-top: 30px">授权播放平台：<button class="btn btn-primary btn-sm" onclick="pagejumpA('${comic.comic_aplatform}')">${comic.comic_platform}</button></div>
								<div style="margin-top: 50px">免费观看平台：<button class="btn btn-primary btn-sm" onclick="pagejumpB('${comic.comic_bplatform}')">其他网站</button></div>
							</td>
							<td>
								<div><button class="btn btn-primary btn-sm" onclick="updateComic('${comic.comic_name}')">修改</button></div>
								<div style="margin-top: 100px"><button class="btn btn-danger btn-sm" onclick="showRemoveDlg('${comic.comic_name}')">删除</button></div>
							</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>

			<div class="modal fade" id="removeComicModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">操作提示</h5>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body" id="message">
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
							<button type="button" class="btn btn-primary" onclick="removeComic()">确认删除</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>