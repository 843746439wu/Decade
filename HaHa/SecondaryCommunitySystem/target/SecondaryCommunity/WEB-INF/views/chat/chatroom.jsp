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
        function previewImage(file){
            var img = document.getElementById('picImg');
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
        function showChatRoomDlg(){
            $("#addChatRoomModal").modal('show');
        }
        function addChatRoom(){
            document.forms[0].action="<c:url value="/chat"/>";
            document.forms[0].submit();
        }
        function delChatRoom(chatroom_id){
            document.forms[0].action="<c:url value="/chat"/>/"+chatroom_id;
            document.forms[0].submit();
        }
        function delChat(chat_id){
            document.forms[0].action="<c:url value="/chatroom"/>/"+chat_id;
            document.forms[0].submit();
        }
        function enterChatRoom(chatroom_id){
            location.href="<c:url value="/chatroom"/>/"+chatroom_id;
        }
        function logout(){
            if(confirm("管理员${LoginedAdmin.admin_name},您确认要退出系统吗?"))
                location.href="<c:url value="/adminLogin"/>";
        }
        function time(){
            var time= new Date().Format("yyyyMMddHHmmss");
            var time1= new Date().Format("yyyy/MM/dd  HH:mm:ss");
            t.value = time;
            t1.value = time;
            bulidtime.value = time1;
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
        .header,.footer{width:100%;height:5%;}/*上下高度5%；中间盒子高度90%*/
        .main{overflow-y:scroll;width:100%;height:80%;margin-top: 3%}
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
        <div>
            <div style="width: 20%;border: 10px solid #5b6273;height: 800px;float: left">
                <div>
                    <h3>聊天群</h3>
                    <div style="border:10px solid red;height: 689px ">
                        <div style="height: 172px">
                            <c:forEach var="chatroom" items="${chatroomList}">
                                <div>
                                   <img src="<c:url value="/chat"/>/${chatroom.chatroom_id}/chatroompic" width="150" height="80s">
                                    <button type="button" class="btn btn-primary btn-sm"  onclick="enterChatRoom('${chatroom.chatroom_id}')">进入群聊</button>
                                    <button type="button" class="btn btn-danger btn-sm" onclick="delChatRoom('${chatroom.chatroom_id}')">解散</button>
                                </div>
                                <div>
                                    <p>${chatroom.chatroom_name}
                                        <span>创建者：${chatroom.admin_name}</span></p>
                                </div><hr>
                            </c:forEach>
                        </div>
                    </div>
                </div>
                <div>
                    <button class="btn-primary btn-lg" style="width: 100%" onclick="showChatRoomDlg()">+</button>
                </div>
            </div>
            <div class="modal fade" id="addChatRoomModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content" style="width: 1000px">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">操作提示</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form action="" class="col-6" method="post" enctype="multipart/form-data">
                                <div class="form-group row">
                                    <label class="col-3 col-form-label">聊天群id</label>
                                    <div class="col-6">
                                        <input id="t" type="text" class="form-control" name="chatroom_id" value="">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-3 col-form-label">聊天群名称</label>
                                    <div class="col-6">
                                        <input onclick="time()" type="text" class="form-control" name="chatroom_name" value="">
                                    </div>
                                </div>
                                <div class="form-group row" >
                                    <img id="picImg" src="${pageContext.request.contextPath}/static/pic/default.jpg" class="py-1" style="width: 250px;height: 150px;margin-left: 150px">
                                </div>
                                <div class="form-group row">
                                    <label class="col-3 col-form-label">聊天群头像</label>
                                    <div class="col-6">
                                        <input type="file" name="chatroompic" class="form-control-file" onchange="previewImage(this)">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-3 col-form-label">创建者帐号</label>
                                    <div class="col-6">
                                        <input type="text" class="form-control" name="admin_number" value="${LoginedAdmin.admin_number}">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-3 col-form-label">创建者名称</label>
                                    <div class="col-6">
                                        <input type="text" class="form-control" name="admin_name" value="${LoginedAdmin.admin_name}">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-3 col-form-label">创建时间</label>
                                    <div class="col-6">
                                        <input id="bulidtime" type="text" class="form-control" name="bulid_time" value="">
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                            <button type="button" class="btn btn-primary" onclick="addChatRoom()">确认添加群</button>
                        </div>
                    </div>
                </div>
            </div>
            <div style="width: 69%;height: 800px;border: 10px solid #5b6273;float: left">
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
</body>
</html>
