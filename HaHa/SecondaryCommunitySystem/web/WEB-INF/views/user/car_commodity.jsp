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
      function time(){
          var time= new Date().Format("yyyyMMddHHmmss");
          var time1= new Date().Format("yyyy/MM/dd");
          t.value = time;
          ordertime.value = time1;
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

    function multiplication() {

      var q = ${commodity.commodity_price}*${commodity.commodity_discount}/10;
      var settings = document.getElementById('price');
      settings.value = q;
    }

    function Allprice() {
        var num = parseInt(document.getElementById('number').value);
        var c = ${commodity.commodity_price}*${commodity.commodity_discount}/10*num;
        var settings = document.getElementById('allprice');
        settings.value = c;
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
        <div style="margin-left: 15%">
            <form action="<c:url value="/user_commodity/shopcar"/>" class="col-6" method="post">
                <h2>加入购物车?物品信息如下：</h2>
                <div style="width: 500px;float: left;margin-left: 10%">
                    <div class="form-group row">
                        <label class="col-3 col-form-label">订单编号：</label>
                        <div class="col-6">
                            <input style="border: none" readonly="readonly" type="text" onclick="time()" id="t" class="form-control" name="shop_id" value="">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-3 col-form-label">商品编号：</label>
                        <div class="col-6">
                            <input style="border: none" readonly="readonly" type="text" class="form-control" name="commodity_id" value="${commodity.commodity_id}">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-3 col-form-label">用户名称：</label>
                        <div class="col-6">
                            <input style="border: none" type="text" class="form-control" name="user_name" value="${LoginedUser.user_name}">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-3 col-form-label">商品名称：</label>
                        <div class="col-6">
                            <input style="border: none" readonly="readonly" type="text" class="form-control" name="commodity_name" value="${commodity.commodity_name}">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-3 col-form-label">商品描述：</label>
                        <div class="col-6">
                            <input style="border: none;" readonly="readonly" type="text" class="form-control" name="commodity_describe" value="${commodity.commodity_describe}">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-3 col-form-label">商品类型：</label>
                        <div class="col-6">
                            <input style="border: none;" readonly="readonly" type="text" class="form-control" name="commodity_type" value="${commodity.commodity_type}">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-3 col-form-label">商品价格：</label>
                        <div class="col-6">
                            <input style="border: none;" readonly="readonly" type="text" class="form-control" value="${commodity.commodity_price}">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-3 col-form-label">商品折扣：</label>
                        <div class="col-6">
                            <input style="border: none;" readonly="readonly" type="text" class="form-control" name="commodity_discount" value="${commodity.commodity_discount}">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-3 col-form-label">商品折扣价：</label>
                        <div class="col-6">
                            <input style="border: none;" readonly="readonly" type="text" class="form-control" onclick="multiplication();" id="price">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-3 col-form-label">购买数量：</label>
                        <div class="col-6">
                            <input style="border: none;" type="text" class="form-control" name="shop_number" id="number" value="">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-3 col-form-label">商品运费：</label>
                        <div class="col-6">
                            <input style="border: none;" readonly="readonly" type="text" class="form-control" name="commodity_shipping" value="${commodity.commodity_shipping}">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-3 col-form-label">商品发货地：</label>
                        <div class="col-6">
                            <input style="border: none;" readonly="readonly" type="text" class="form-control" name="commodity_address" value="${commodity.commodity_address}">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-3 col-form-label">购买商品总价格：</label>
                        <div class="col-6">
                            <input style="border: none;" readonly="readonly" type="text" class="form-control" name="commodity_price" onclick="Allprice();" id="allprice" >
                        </div>
                    </div>
                    <div class="form-group row">
                        <button class="btn btn-primary">加入购物车</button>
                        <a class="btn btn-primary" href="/SecondaryCommunity/user_commodity" style="margin-left: 10px">取消</a>
                    </div>
                </div>
            </form>
        </div>

    </div>
</div>
</body>
</html>
