<%--
  Created by IntelliJ IDEA.
  User: Decade
  Date: 2022/1/7
  Time: 20:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>修改个人信息</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        function previewImage(file){
            var img = document.getElementById('picUser');
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
            if(confirm("用户${LoginedUser.user_name},您确认要退出系统吗?"))
                location.href="<c:url value="/userLogin"/>";
        }
    </script>
</head>
<body>
<div>
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
        <div style="float: left;width: 1000px;margin-left: 22%">

            <form action="<c:url value="/user"/>/${LoginedUser.user_no}" class="col-6" method="post" enctype="multipart/form-data">
                <div class="form-group row">
                    <label class="col-3 col-form-label">用户密码</label>
                    <div class="col-6">
                        <input type="password" class="form-control" name="user_pwd" value="${LoginedUser.user_pwd}">
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-3 col-form-label">用户名字</label>
                    <div class="col-6">
                        <input type="text" class="form-control" name="user_name" value="${LoginedUser.user_name}">
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-3 col-form-label">用户身份证</label>
                    <div class="col-6">
                        <input type="text" class="form-control" name="user_id" value="${LoginedUser.user_id}">
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-3 col-form-label">用户邮箱</label>
                    <div class="col-6">
                        <input type="text" class="form-control" name="user_email" value="${LoginedUser.user_email}">
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-3 col-form-label">用户家庭地址</label>
                    <div class="col-6">
                        <input type="text" class="form-control" name="user_address" value="${LoginedUser.user_address}">
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-3 col-form-label">用户电话</label>
                    <div class="col-6">
                        <input type="text" class="form-control" name="user_phone" value="${LoginedUser.user_phone}">
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-3 col-form-label">用户座右铭</label>
                    <div class="col-6">
                        <input type="text" class="form-control" name="user_motto" value="${LoginedUser.user_motto}">
                    </div>
                </div>
                <div class="form-group row">
                    <img id="picUser" src="<c:url value="/user"/>/${LoginedUser.user_no}/userpic" class="py-1" style="width: 250px;height: 150px;margin-left: 150px">
                </div>
                <div class="form-group row">
                    <label class="col-3 col-form-label">用户头像</label>
                    <div class="col-6">
                        <input type="file" name="userpic" class="form-control-file" onchange="previewImage(this)">
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-3 col-form-label">用户钱包</label>
                    <div class="col-6">
                        <input type="text" class="form-control" name="user_money" value="${LoginedUser.user_money}">
                    </div>
                </div>
                <div class="form-group row">
                    <button class="btn btn-primary">修改</button>
                </div>
            </form>

        </div>
    </div>
</div>
</div>
</body>
</html>
