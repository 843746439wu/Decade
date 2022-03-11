<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>订单管理</title>
    <link rel="stylesheet" href="<c:url value="/static/vendor/bootstrap-4.3.1-dist/css/bootstrap.min.css"/>" media="all" />
    <script type="text/javascript" src="<c:url value="/static/vendor/jquery/jquery-3.3.1.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/static/vendor/popper.js/popper.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/static/vendor/bootstrap-4.3.1-dist/js/bootstrap.js"/>"></script>
    <script>
        function logout(){
            if(confirm("管理员${LoginedAdmin.admin_name},您确认要退出系统吗?"))
                location.href="<c:url value="/adminLogin"/>";
        }
    </script>
</head>
<body>
<div>
    <div style="background-color: #367FAA">
        <img src="<c:url value="/admins/list"/>/${LoginedAdmin.admin_number}/adminpic" width="100" height="100" style="margin: 10px">${LoginedAdmin.admin_name}
        <div style="float: right;margin: 30px"><button onclick="logout();" title="点击退出系统">退出系统</button></div>
    </div>
    <div>
        <div style="background-color: #31424B;width: 180px;height: 100%;float: left;">
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
        <div style="float: left;">
            <ul class="breadcrumb" style="width: 1500px">
                <li>订单</li>
                <li class="active">/订单列表</li>
            </ul>
            <form action="" method="post">
                <input type="hidden" name="_method" value="DELETE"/>
            </form>
            <div style="width: 1500px;">
                <table class="table table-striped table-hover table-bordered">
                    <thead>
                    <tr>
                        <th style="width: 100px">序号</th>
                        <th style="width: 200px">用户信息</th>
                        <th style="width: 700px">物品信息</th>
                        <th style="width: 200px">价格</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="order" items="${orderList}" varStatus="idx">
                        <tr>
                            <th>${idx.index+1}</th>
                            <td>
                                <div>
                                    <p>用户名称：${order.user_name}</p>
                                    <p>用户电话：${order.user_phone}</p>
                                    <p>用户地址：${order.user_address}</p>
                                </div>
                            </td>
                            <td>
                                <div>
                                    <p>物品名称：${order.commodity_name}</p>
                                    <p>下单时间：${order.order_time}</p>
                                    <p>物品描述：${order.commodity_describe}</p>
                                    <p>物品类型：${order.commodity_type}</p>
                                </div>
                            </td>
                            <td>
                                <div>
                                    <p>物品数量：${order.order_number}</p>
                                    <p>物品运费：${order.commodity_shipping}</p>
                                    <p>物品货源：${order.commodity_address}</p>
                                    <p>物品价格：${order.commodity_price}</p>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

        </div>
    </div>
</div>
</body>
</html>