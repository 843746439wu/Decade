<%--
  Created by IntelliJ IDEA.
  User: Decade
  Date: 2022/1/3
  Time: 17:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>首页</title>
    <link rel="stylesheet" href="<c:url value="/static/vendor/bootstrap-4.3.1-dist/css/bootstrap.min.css"/>" media="all" />
    <script type="text/javascript" src="<c:url value="/static/vendor/jquery/jquery-3.3.1.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/static/vendor/popper.js/popper.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/static/vendor/bootstrap-4.3.1-dist/js/bootstrap.js"/>"></script>
    <style type="text/css">
        .content {
            color: #ffffff;
            font-size: 40px;
        }
        .bg {
            background: url('static/pic/bg.jpg');
            height:800px;
            text-align: center;
            line-height: 600px;
        }
        .bg-blur {
            float: left;
            width: 100%;
            background-repeat: no-repeat;
            background-position: center;
            background-size: cover;
            -webkit-filter: blur(15px);
            -moz-filter: blur(15px);
            -o-filter: blur(15px);
            -ms-filter: blur(15px);
            filter: blur(15px);
        }
        .content-front {
            position:absolute;
            left: 10px;
            right: 10px;
            height:600px;
            line-height: 600px;
            text-align: center;
        }

    </style>
</head>
<body>
    <div>
        <div class="bg bg-blur"></div>
        <div class="content content-front">
            <div class="row col-12 col-md-6 offset-md-2" style="margin-top:50px">
                <h1><b>欢迎来到二次元社区</b></h1>
            </div>
            <div class="row py-5" style="margin-top: 15%;margin-left: 10%">
                <div class="form-group" style="margin-left: 10%">
                    <button class="btn btn-primary" onclick="location.href='<c:url value="/adminLogin"/>'">管理员登录</button>
                </div>
                <div class="form-group" style="margin-left: 10%">
                    <button class="btn btn-primary" onclick="location.href='<c:url value="/userLogin"/>'">用户登录</button>
                </div>
                <div class="form-group" style="margin-left: 10%">
                    <button class="btn btn-primary" onclick="location.href='<c:url value="/userRegister"/>'">用户注册</button>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
