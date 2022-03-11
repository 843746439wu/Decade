<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>商品展示</title>
    <link rel="stylesheet" href="<c:url value="/static/vendor/bootstrap-4.3.1-dist/css/bootstrap.min.css"/>" media="all" />
    <script type="text/javascript" src="<c:url value="/static/vendor/jquery/jquery-3.3.1.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/static/vendor/popper.js/popper.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/static/vendor/bootstrap-4.3.1-dist/js/bootstrap.js"/>"></script>
    <script>
        var delCommodityName ="";

        function showRemoveDlg(commodity_name){
            delCommodityName=commodity_name;
            $("#message").html('您确认要删除的商品名为['+commodity_name+']的商品吗?');
            $("#removeCommodityModal").modal('show');
        }

        function removeCommodity(){
            document.forms[0].action="<c:url value="/commodity"/>/"+delCommodityName;
            document.forms[0].submit();
        }

        function updateCommodity(commodity_name){
            location.href="<c:url value="/commodity"/>/"+commodity_name;
        }

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
                <li>商品管理</li>
                <li class="active">/商品信息列表</li>
            </ul>
            <form action="" method="post">
                <input type="hidden" name="_method" value="DELETE"/>
            </form>
            <div>
                <div class="my-2 text-right" style="width: 1500px">
                    <button class="btn btn-primary" onclick="location.href='<c:url value="/commodity/input"/>';">商品登记</button>
                </div>
                <table class="table table-striped table-hover table-bordered" style="width: 1500px">
                    <thead>
                    <tr style="text-align: center">
                        <th>序号</th>
                        <th>商品</th>
                        <th>商品信息</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="commodity" items="${commList}" varStatus="idx">
                        <tr>
                            <th style="width: 80px;text-align: center;">${idx.index+1}</th>
                            <td>
                                <div><img src="<c:url value="/commodity"/>/${commodity.commodity_name}/commpic" width="300" height="200"></div>
                            </td>
                            <td style="width: 1000px;">
                                <div>
                                    <p>商品名称：${commodity.commodity_name}</p>
                                    <p>商品类型：${commodity.commodity_type}</p>
                                    <p>商品描述：${commodity.commodity_describe}</p>
                                    <p>发货地址：${commodity.commodity_address}</p>
                                    <p>商品规模：${commodity.commodity_style}</p>
                                    <p>商品价格：${commodity.commodity_price}</p>
                                    <p>商品数量：${commodity.commodity_num}</p>
                                </div>
                            </td>
                            <td>
                                <div><button class="btn btn-primary btn-sm" onclick="updateCommodity('${commodity.commodity_name}')">修改</button></div>
                                <div style="margin-top: 100px"><button class="btn btn-danger btn-sm" onclick="showRemoveDlg('${commodity.commodity_name}')">删除</button></div>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

            <div class="modal fade" id="removeCommodityModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
                            <button type="button" class="btn btn-primary" onclick="removeCommodity()">确认删除</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>