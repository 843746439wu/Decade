<%--
  Created by IntelliJ IDEA.
  User: Decade
  Date: 2022/2/25
  Time: 22:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>商品</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        function multiplication() {
            var c = ${commodity.commodity_price}*${commodity.commodity_discount}/10;
            var settings = document.getElementById('price');
            settings.value = c;
        }
        function buycommodity(commodity_id){
            location.href="<c:url value="/user_commodity/order"/>/"+commodity_id;
        }
        function shopcar(commodity_id){
            location.href="<c:url value="/user_commodity/shopcar"/>/"+commodity_id;
        }
        function logout(){
            if(confirm("用户${LoginedUser.user_name},您确认要退出系统吗?"))
            location.href="<c:url value="/userLogin"/>";
        }
        function time(){
          var time= new Date().Format("yyyyMMddHHmmss");
          var time1= new Date().Format("yyyy/MM/dd  HH:mm:ss");
          t.value = time;
          commtime.value = time1;
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
        <div class="my-2 text-right" style="width: 1500px">
            <a class="btn btn-primary" href="/SecondaryCommunity/user_commodity" style="margin-left: 10px">返回</a>
        </div>
        <div style="margin-left: 15%">
            <div style="width: 100%">
                <div style="width: 40%;float: left">
                    <img src="<c:url value="/commodity"/>/${commodity.commodity_name}/commpic" width="400" height="400">
                </div>
                <div style="padding-left: 10%">
                    <h1>商品名称：${commodity.commodity_name}</h1>
                    <p style="padding-top: 10px">商品描述：${commodity.commodity_describe}</p>
                    <p style="padding-top: 10px">商品类型：${commodity.commodity_type}</p>
                    <p style="padding-top: 10px">商品价格：${commodity.commodity_price}</p>
                    <p style="padding-top: 10px">
                        商品折扣：${commodity.commodity_discount}
                        <button class="btn btn-primary btn-sm" onclick="multiplication()">查看折扣价</button>
                    </p>
                    <p>商品折扣价：<input id="price"></p>
                    <p style="padding-top: 10px">商品数量：${commodity.commodity_num}</p>
                    <p style="padding-top: 10px">商品规模：${commodity.commodity_style}</p>
                    <p style="padding-top: 10px">商品运费：${commodity.commodity_shipping}</p>
                    <p style="padding-top: 10px">商品发货地：${commodity.commodity_address}</p>
                </div>
            </div>
            <div style="margin-left: 40%">
                <button class="btn btn-primary btn-lg" onclick="buycommodity('${commodity.commodity_id}')">立即购买</button>
                <button class="btn btn-danger btn-lg" onclick="shopcar('${commodity.commodity_id}')">加入购物车</button>
            </div>
        </div>

        <div style="width: 1500px">
            <div style="margin-top: 4%;margin-left: 15%;border: 20px solid #3beaf1">
                <form action="<c:url value="/comment/commoditycomment"/>" class="col-6" method="post">
                    <div style="margin: 2%">
                        <div class="form-group row">
                          <label class="col-3 col-form-label">发表评论的id：</label>
                          <input style="border: none" type="text" id="t" name="comment_id" value="">
                          <label class="col-3 col-form-label">时间：</label>
                          <input style="border: none" type="text" onclick="time()" id="commtime" name="comment_time" value="">
                        </div>
                        <div class="form-group row">
                            <label class="col-3 col-form-label">
                                <p name="user_name" value="${LoginedUser.user_name}">用户${LoginedUser.user_name}帐号为：
                                  <span name="user_no" value="${LoginedUser.user_no}">${LoginedUser.user_no}</span>
                                  <span style="padding-left: 10px" name="commodity_id" value="${commodity.commodity_id}">评论${commodity.commodity_name}</span>
                                </p>
                            </label>
                            <input onclick="time()" type="text" class="form-control" name="commodity_comment" value="" placeholder="评论内容">
                        </div>
                      <div class="form-group row">
                        <button class="btn btn-primary">发表评论</button>
                      </div>
                    </div>
                </form>
            </div>
            <div style="margin-top: 2%;margin-left: 15%;border: 20px solid #c4c6c6">
                <h1>历史网友评论记录：</h1>
                <div style="margin: 2%">
                    <c:forEach var="commcommodity" items="${commcommodityList}">
                        <div>
                            <div>
                                <p>${commcommodity.user_name}帐号为：${commcommodity.user_no}
                                    <span style="padding-left: 10px">评论时间为：${commcommodity.comment_time}</span></p>
                            </div>
                            <div style="margin-left: 20px">
                                <p>${commcommodity.commodity_comment}</p>
                            </div>
                        </div><hr>
                    </c:forEach>
                </div>
            </div>
        </div>

    </div>
</div>
</body>
</html>
