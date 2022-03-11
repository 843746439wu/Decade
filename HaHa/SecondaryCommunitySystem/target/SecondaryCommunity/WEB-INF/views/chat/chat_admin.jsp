<%--
  Created by IntelliJ IDEA.
  User: Decade
  Date: 2022/3/2
  Time: 21:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>评论管理</title>
    <link rel="stylesheet" href="<c:url value="/static/vendor/bootstrap-4.3.1-dist/css/bootstrap.min.css"/>" media="all" />
    <script type="text/javascript" src="<c:url value="/static/vendor/jquery/jquery-3.3.1.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/static/vendor/popper.js/popper.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/static/vendor/bootstrap-4.3.1-dist/js/bootstrap.js"/>"></script>
    <script type="text/javascript">
        function reViewDlg(){
            location.href="<c:url value="/chat"/>";
        }
        function logout(){
            if(confirm("管理员${LoginedAdmin.admin_name},您确认要退出系统吗?"))
                location.href="<c:url value="/adminLogin"/>";
        }
        function addChat(chatroom_id){
            document.forms[0].action="<c:url value="/chatroom/"/>"+chatroom_id;
            document.forms[0].submit();
        }
        function delChat(chat_id){
            document.forms[0].action="<c:url value="/chatroom/${ChatRoom.chatroom_id}"/>/"+chat_id;
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
    </script>
    <style type="text/css">
        html,body{height:100%;}/*定义高度为100%*/
        *{margin:0;padding:0;}
        .header{width:100%;height:5%;}/*上下高度5%；中间盒子高度90%*/
        .footer{width:100%;height:25%;}
        .main{overflow-y:scroll;width:100%;height:70%;margin-top: 3%}
    </style>
</head>
<body>
<div>
    <div style="background-color: #367FAA">
        <img src="<c:url value="/admins/list"/>/${LoginedAdmin.admin_number}/adminpic" width="100" height="100" style="margin: 10px">${LoginedAdmin.admin_name}
        <div style="float: right;margin: 30px"><button onclick="logout();" title="点击退出系统">退出系统</button></div>
    </div>
    <div>
        <div style="background-color: #31424B;width: 180px;height: 800px;float: left;">
            <ul style="list-style-type:none;padding-left: 30px">
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
        <div>
            <div style="width: 80%;height: 800px;border: 10px solid #5b6273;float: left;margin-left: 80px">
                <div class="header">
                    <h1 style="margin-left: 30%">欢迎进入${ChatRoom.chatroom_name}
                        <button style="margin-left: 40%" type="button" class="btn btn-primary btn-sm" onclick="reViewDlg()">返回</button>
                    </h1><hr>
                </div>
                <div class="main">
                    <div>
                        <c:forEach var="chat" items="${chatList}">
                            <div>
                                <p>${chat.chatperson_name}
                                    <span>${chat.chat_time}</span>
                                </p>
                                <p>${chat.chat_content}</p>
                                <button type="button" class="btn btn-danger btn-sm" onclick="delChat('${chat.chat_id}')">删除</button>
                            </div>
                        </c:forEach>
                    </div>
                </div><hr>
                <div class="footer">
                    <div style="width: 2500px">
                        <form action="" class="col-6" method="post">
                            <div style="float: left">
                                聊天群id<input style="width: 150px" name="room_id" value="${ChatRoom.chatroom_id}">
                            </div>
                            <div style="float: left;margin-left: 35px">
                                聊天id<input id="t" style="width: 150px" name="chat_id" value="">
                            </div>
                            <div style="float: left;margin-left: 35px">
                                聊天者帐号<input style="width: 100px" name="chatperson_no" value="${LoginedAdmin.admin_number}">
                            </div>
                            <div style="float: left;margin-left: 35px">
                                聊天者名称<input style="width: 100px" name="chatperson_name" value="${LoginedAdmin.admin_name}">
                            </div>
                            <div style="float: left;margin-left: 35px">
                                时间<input id="chattime" style="width: 200px" name="chat_time" value="">
                            </div><br>
                            <div style="margin-top: 15px">
                                <input onclick="time()" style="width: 1180px" class="form-control" name="chat_content" value="" placeholder="请输入要发送的内容！！！">
                            </div>
                            <div style="margin-top: 5px;margin-left: 1090px">
                                <button type="button" class="btn btn-primary" onclick="addChat('${ChatRoom.chatroom_id}')">发送消息</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
</body>
</html>
