<%--
  Created by IntelliJ IDEA.
  User: Decade
  Date: 2022/3/3
  Time: 22:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>活动</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript">

        function enterChatRoom(chatroom_id){
            location.href="<c:url value="/user_chat"/>/"+chatroom_id;
        }
        function logout(){
            if(confirm("管理员${LoginedAdmin.admin_name},您确认要退出系统吗?"))
                location.href="<c:url value="/adminLogin"/>";
        }
        function addChat(chatroom_id){
            document.forms[0].action="<c:url value="/chatroom/"/>"+chatroom_id;
            document.forms[0].submit();
        }

        function time(){
            var time= new Date().Format("yyyyMMddHHmmss");
            var time1= new Date().Format("yyyy/MM/dd  HH:mm:ss");
            t.value = time;
            chattime.value = time1;
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
                            <li><a href="/SecondaryCommunity/user_commodity">妖精的尾巴</a></li>
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
        <div style="float: left;">

            <form action="" method="post">

            </form>
            <div>
                <div style="width: 500px;border: 10px solid #5b6273;height: 720px;float: left;margin-left: 100px">
                    <div>
                        <h3>聊天群</h3>
                        <div style="border:10px solid red;height: 645px ">
                            <div style="height: 172px">
                                <c:forEach var="chatroom" items="${chatroomList}">
                                    <div>
                                        <img src="<c:url value="/chat"/>/${chatroom.chatroom_id}/chatroompic" width="150" height="80s">
                                        <button type="button" class="btn btn-primary btn-sm"  onclick="enterChatRoom('${chatroom.chatroom_id}')">进入群聊</button>
                                    </div>
                                    <div>
                                        <p>${chatroom.chatroom_name}
                                            <span>创建者：${chatroom.admin_name}</span></p>
                                    </div><hr>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>

                <div style="width: 1000px;height: 720px;border: 10px solid #5b6273;float: left">
                    <div class="header">
                        <h1>欢迎进入聊天群,点击群进行聊天</h1><hr>
                    </div>
                    <div class="main"></div>
                    <div class="footer"></div>
                </div>
            </div>
        </div>
        </div>
    </div>
</div>
</body>
</html>
