<%--
  Created by IntelliJ IDEA.
  User: Decade
  Date: 2022/1/7
  Time: 16:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>个人信息</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        function logout(){
            if(confirm("用户${LoginedUser.user_name},您确认要退出系统吗?"))
                location.href="<c:url value="/userLogin"/>";
        }
    </script>
</head>
<body>
    <div>
        <div>
            <nav class="navbar navbar-inverse" role="navigation">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <a class="navbar-brand" href="/SecondaryCommunity/main_user">二次元社区</a>
                    </div>
                    <div>
                        <ul class="nav navbar-nav">
                            <li><a href="/SecondaryCommunity/user_comic">番剧</a></li>
                            <li><a href="#">妖精的尾巴</a></li>
                            <li><a href="/SecondaryCommunity/user_act">活动</a></li>
                            <li><a href="/SecondaryCommunity/user_notice">公告</a></li>
                            <li><a href="#">社区</a></li>
                            <li style="padding-left: 1128px;padding-top: 8px">
                                <button type="button" class="btn dropdown-toggle" id="dropdownMenu1" data-toggle="dropdown" >${LoginedUser.user_name}
                                    <span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1" style="margin-left: 1128px">
                                    <li role="presentation">
                                        <a role="menuitem" tabindex="-1" href="/SecondaryCommunity/user">个人信息</a>
                                    </li>
                                    <li role="presentation">
                                        <a role="menuitem" tabindex="-1" href="/SecondaryCommunity/user/{user_no}">修改个人信息</a>
                                    </li>
                                    <li role="presentation">
                                        <a role="menuitem" tabindex="-1" href="/SecondaryCommunity/collect/list">动漫收藏</a>
                                    </li>
                                    <li role="presentation">
                                        <a role="menuitem" tabindex="-1" name="cartname" href="/SecondaryCommunity/user_cart/${LoginedUser.user_name}" value="${LoginedUser.user_name}">购物车</a>
                                    </li>
                                    <li role="presentation">
                                        <a role="menuitem" tabindex="-1" name="ordername" href="/SecondaryCommunity/user_order/${LoginedUser.user_name}" value="${LoginedUser.user_name}">订单</a>
                                    </li>
                                    <li role="presentation">
                                        <a role="menuitem" tabindex="-1" href="#" onclick="logout();">退出登录</a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </div>
    </div>
    <div style="width: 1000px;margin-left: 22%">
        <div class="form-group row">
            <label class="col-3 col-form-label">用户头像</label>
            <div class="col-6">
                <div><img src="<c:url value="/user"/>/${LoginedUser.user_no}/userpic" width="200" height="150"></div><hr>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-3 col-form-label">用户名字</label>
            <div class="col-6">
                <p type="text" class="form-control" name="user_name">${LoginedUser.user_name}</p>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-3 col-form-label">用户邮箱</label>
            <div class="col-6">
                <p type="text" class="form-control" name="user_email">${LoginedUser.user_email}</p>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-3 col-form-label">用户家庭地址</label>
            <div class="col-6">
                <p type="text" class="form-control" name="user_address">${LoginedUser.user_address}</p>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-3 col-form-label">用户电话</label>
            <div class="col-6">
                <p type="text" class="form-control" name="user_phone">${LoginedUser.user_phone}</p>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-3 col-form-label">用户座右铭</label>
            <div class="col-6">
                <p type="text" class="form-control" name="user_motto">${LoginedUser.user_motto}</p>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-3 col-form-label">用户钱包</label>
            <div class="col-6">
                <p type="text" class="form-control" name="user_money" >${LoginedUser.user_money}</p>
            </div>
        </div>
    </div>
</body>
</html>
