<%--
  Created by IntelliJ IDEA.
  User: Decade
  Date: 2022/1/4
  Time: 19:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>管理员</title>
    <link rel="stylesheet" href="<c:url value="/static/vendor/bootstrap-4.3.1-dist/css/bootstrap.min.css"/>" media="all" />
    <script type="text/javascript" src="<c:url value="/static/vendor/jquery/jquery-3.3.1.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/static/vendor/popper.js/popper.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/static/vendor/bootstrap-4.3.1-dist/js/bootstrap.js"/>"></script>
    <script type="text/javascript">

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
        <div style="background-color: #31424B;width: 180px;height: 730px;float: left;">
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
                <li>个人信息</li>
                <li class="active">/登录的管理员信息</li>
            </ul>
                <div class="form-group row">
                    <label class="col-3 col-form-label">管理员头像</label>
                    <div class="col-6">
                        <div><img src="<c:url value="/admins/list"/>/${LoginedAdmin.admin_number}/adminpic" width="200" height="150"></div><hr>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-3 col-form-label">管理员名字</label>
                    <div class="col-6">
                        <p type="text" class="form-control" name="admin_name">${LoginedAdmin.admin_name}</p>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-3 col-form-label">管理员电话</label>
                    <div class="col-6">
                        <p type="text" class="form-control" name="admin_phone">${LoginedAdmin.admin_phone}</p>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-3 col-form-label">管理员家庭地址</label>
                    <div class="col-6">
                        <p type="text" class="form-control" name="admin_address">${LoginedAdmin.admin_address}</p>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-3 col-form-label">管理员邮箱</label>
                    <div class="col-6">
                        <p type="text" class="form-control" name="admin_email">${LoginedAdmin.admin_email}</p>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-3 col-form-label">管理员生日</label>
                    <div class="col-6">
                        <p type="text" class="form-control" name="admin_birth">${LoginedAdmin.admin_birth}</p>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-3 col-form-label">管理员QQ</label>
                    <div class="col-6">
                        <p type="text" class="form-control" name="admin_qq" >${LoginedAdmin.admin_qq}</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>