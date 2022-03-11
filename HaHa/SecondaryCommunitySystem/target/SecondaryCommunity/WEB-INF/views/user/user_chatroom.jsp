<%--
  Created by IntelliJ IDEA.
  User: Decade
  Date: 2022/3/3
  Time: 22:11
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
        function reViewDlg(){
            location.href="<c:url value="/user_chat"/>";
        }
        function addChat(chatroom_id){
            document.forms[0].action="<c:url value="/user_chat/"/>"+chatroom_id;
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
    <style type="text/css">
        html,body{height:100%;}/*定义高度为100%*/
        *{margin:0;padding:0;}
        .header{width:100%;height:5%;}/*上下高度5%；中间盒子高度90%*/
        .footer{width:100%;height:28%;}
        .main{overflow-y:scroll;width:100%;height:67%;margin-top: 3%}
    </style>

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
            <div style="width: 65%;height: 800px;border: 10px solid #5b6273;float: left;margin-left: 20px">
                <div class="header">
                    <h1 style="margin-left: 30%">欢迎进入${ChatRoom.chatroom_name}
                        <button style="margin-left: 40%" type="button" class="btn btn-primary btn-sm" onclick="reViewDlg()">返回</button>
                    </h1><hr>
                </div>
                <div class="main">
                    <div>
                        <c:forEach var="chat" items="${chatList}">
                            <div>
                                <h4>${chat.chatperson_name}
                                    <span>${chat.chat_time}</span>
                                </h4>
                                <p>${chat.chat_content}</p>
                            </div>
                        </c:forEach>
                    </div>
                </div><hr>
                <div class="footer">
                    <div style="width: 2500px">
                        <form action="" class="col-6" method="post">
                            <div style="float: left;margin-left: 30px">
                                聊天群id<input style="width: 150px" name="room_id" value="${ChatRoom.chatroom_id}">
                            </div>
                            <div style="float: left;margin-left: 100px">
                                聊天id<input id="t" style="width: 200px" name="chat_id" value="">
                            </div>
                            <div style="float: left;margin-left: 100px">
                                聊天者帐号<input style="width: 150px" name="chatperson_no" value="${LoginedUser.user_no}">
                            </div>
                            <div style="float: left;margin-left: 100px">
                                聊天者名称<input style="width: 150px" name="chatperson_name" value="${LoginedUser.user_name}">
                            </div>
                            <div style="float: left;margin-left: 100px">
                                时间<input id="chattime" style="width: 250px" name="chat_time" value="">
                            </div><br />
                            <div style="margin-top: 15px;margin-left: 30px">
                                <input onclick="time()" style="width: 1560px" class="form-control" name="chat_content" value="" placeholder="请输入要发送的内容！！！">
                            </div>
                            <div style="margin-top: 5px;margin-left: 1500px">
                                <button type="button" class="btn btn-primary" onclick="addChat('${ChatRoom.chatroom_id}')">发送消息</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
