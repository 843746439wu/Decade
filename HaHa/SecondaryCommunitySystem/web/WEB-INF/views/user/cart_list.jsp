<%--
  Created by IntelliJ IDEA.
  User: Decade
  Date: 2022/1/7
  Time: 16:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>购物车</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        function logout(){
            if(confirm("用户${LoginedUser.user_name},您确认要退出系统吗?"))
                location.href="<c:url value="/userLogin"/>";
        }
        function jumpbuy(commodity_id){
                location.href="<c:url value="/user_commodity"/>/"+commodity_id;
        }
        var delCartNo ="";

        function showRemoveDlg(shop_id){
            delCartNo=shop_id;
            $("#message").html('您确认要删除该商品吗?');
            $("#removeCartModal").modal('show');
        }

        function removeCart(){
            document.forms[0].action="<c:url value="/user_cart/${LoginedUser.user_name}"/>/"+delCartNo;
            document.forms[0].submit();
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
                                        <a role="menuitem" tabindex="-1" href="/SecondaryCommunity/user/${LoginedUser.user_no}">修改个人信息</a>
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
                <input type="hidden" name="_method" value="DELETE"/>
            </form>
            <div style="width: 1500px;margin-left: 6%">
                <form action="" method="post">
                    <input type="hidden" name="_method" value="DELETE"/>
                </form>
                <div style="width: 1500px;">
                    <table class="table table-striped table-hover table-bordered">
                        <thead>
                        <tr>
                            <th style="width: 100px">序号</th>
                            <th style="width: 200px">物品名称</th>
                            <th style="width: 700px">物品信息</th>
                            <th style="width: 300px">物品总价</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="cart" items="${cartList}" varStatus="idx">
                            <tr>
                                <th>${idx.index+1}</th>
                                <td>
                                    <div>
                                        <p>物品名称：${cart.commodity_name}</p>
                                    </div>
                                </td>
                                <td>
                                    <div>
                                        <p>物品描述：${cart.commodity_describe}</p>
                                        <p>物品类型：${cart.commodity_type}</p>
                                        <p>物品货源：${cart.commodity_address}</p>
                                    </div>
                                </td>
                                <td>
                                    <div>
                                        <p>物品数量：${cart.shop_number}</p>
                                        <p>物品运费：${cart.commodity_shipping}</p>
                                        <p>物品价格：${cart.commodity_price}</p>
                                    </div>
                                </td>
                                <td>
                                    <div>
                                        <button class="btn btn-primary btn-sm" onclick="jumpbuy('${cart.commodity_id}')">跳转购买</button>
                                        <button class="btn btn-danger btn-sm" onclick="showRemoveDlg('${cart.shop_id}')">删除</button>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="modal fade" id="removeCartModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">操作提示</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body" id="message">
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                            <button type="button" class="btn btn-primary" onclick="removeCart()">确认删除</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
</body>
</html>