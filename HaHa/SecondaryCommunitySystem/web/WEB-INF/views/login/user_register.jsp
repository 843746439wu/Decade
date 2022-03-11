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
        function time(){
            var time= new Date().Format("yyyyMMddHHmmss");
            t.value = time;
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
<div class="container">
    <div class="row col-12 col-md-6 offset-md-2" style="margin-top:100px">
        <h2><b>用户注册</b></h2>
        <hr>
    </div>
    <div class="row py-5">
        <form action="<c:url value="/user_wait"/>" class="col-6" method="post" enctype="multipart/form-data">
            <div class="form-group row">
                <label class="col-3 col-form-label">用户账号</label>
                <div class="col-6">
                    <input id="t" type="text" class="form-control" name="user_no" value="">
                </div>
            </div>
            <div class="form-group row">
                <label class="col-3 col-form-label">用户密码</label>
                <div class="col-6">
                    <input onclick="time()" type="password" class="form-control" name="user_pwd" value="">
                </div>
            </div>
            <div class="form-group row">
                <label class="col-3 col-form-label">用户名字</label>
                <div class="col-6">
                    <input type="text" class="form-control" name="user_name" value="">
                </div>
            </div>
            <div class="form-group row">
                <label class="col-3 col-form-label">用户身份证</label>
                <div class="col-6">
                    <input type="text" class="form-control" name="user_id" value="">
                </div>
            </div>
            <div class="form-group row">
                <label class="col-3 col-form-label">用户邮箱</label>
                <div class="col-6">
                    <input type="text" class="form-control" name="user_email" value="">
                </div>
            </div>
            <div class="form-group row">
                <label class="col-3 col-form-label">用户家庭地址</label>
                <div class="col-6">
                    <input type="text" class="form-control" name="user_address" value="">
                </div>
            </div>
            <div class="form-group row">
                <label class="col-3 col-form-label">用户电话</label>
                <div class="col-6">
                    <input type="text" class="form-control" name="user_phone" value="">
                </div>
            </div>
            <div class="form-group row">
                <label class="col-3 col-form-label">用户座右铭</label>
                <div class="col-6">
                    <input type="text" class="form-control" name="user_motto" value="">
                </div>
            </div>
            <div class="form-group row">
                <img id="picUser" src="${pageContext.request.contextPath}/static/pic/default.jpg" class="py-1" style="width: 250px;height: 150px;margin-left: 150px">
            </div>
            <div class="form-group row">
                <label class="col-3 col-form-label">用户头像</label>
                <div class="col-6">
                    <input type="file" name="userpic" class="form-control-file" onchange="previewImage(this)">
                </div>
            </div>
            <div class="form-group row">
                <button class="btn btn-primary">注册并登录</button>
                <a class="btn btn-primary" href="/SecondaryCommunity" style="margin-left: 10px">返回</a>
            </div>
        </form>
    </div>
</div>
</body>
</html>

