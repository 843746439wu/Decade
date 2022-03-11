<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>登录界面</title>
    <link rel="stylesheet" href="<c:url value="/static/vendor/bootstrap-4.3.1-dist/css/bootstrap.min.css"/>" media="all" />
    <script type="text/javascript" src="<c:url value="/static/vendor/jquery/jquery-3.3.1.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/static/vendor/popper.js/popper.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/static/vendor/bootstrap-4.3.1-dist/js/bootstrap.js"/>"></script>
</head>
<body>

<div class="container">
    <div class="row col-12 col-md-6 offset-md-2" style="margin-top:100px">
        <h2><b>用户登录</b></h2>
        <hr>
    </div>
    <div class="row py-5">
        <form action="<c:url value="/login_user"/>" method="post" class="col-12 col-md-6 offset-md-3">
            <input type="hidden" name="task" value="login"/>
            <div class="form-group">
                <label>账户名称</label>
                <input type="text" name="userNo" class="form-control" value="${param.userNo}">
            </div>
            <div class="form-group">
                <label>账户密码</label>
                <input type="password" name="userPwd" class="form-control">
            </div>
            <c:if test="${not empty errMsg}">
                <div class="alert alert-danger text-center">${errMsg}</div>
            </c:if>
            <div>
                <button class="btn btn-primary">登录</button>
                <a class="btn btn-primary" href="/SecondaryCommunity">返回</a>
            </div>
        </form>
    </div>
</div>
</body>
</html>

