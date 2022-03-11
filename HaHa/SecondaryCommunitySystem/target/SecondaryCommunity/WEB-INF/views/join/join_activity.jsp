<%--
  Created by IntelliJ IDEA.
  User: Decade
  Date: 2022/2/25
  Time: 23:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>活动</title>
    <link rel="stylesheet" href="<c:url value="/static/vendor/bootstrap-4.3.1-dist/css/bootstrap.min.css"/>" media="all" />
    <script type="text/javascript" src="<c:url value="/static/vendor/jquery/jquery-3.3.1.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/static/vendor/popper.js/popper.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/static/vendor/bootstrap-4.3.1-dist/js/bootstrap.js"/>"></script>
    <script type="text/javascript">

        var delActivityNO ="";

        function showRemoveDlg(act_no){
            delActivityNO=act_no;
            $("#message").html('您确认要删除的编号为['+act_no+']的活动或公告吗?');
            $("#removeActivityModal").modal('show');
        }

        function removeActivity(){
            document.forms[0].action="<c:url value="/activity"/>/"+delActivityNO;
            document.forms[0].submit();
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
        <div style="background-color: #31424B;width: 180px;height: 800px;float: left;">
            <ul style="list-style-type:none">
                <li style="margin-top: 50px">
                    <a href="/SecondaryCommunity/comics" style="text-decoration: none;"><p style="color: white">动漫管理</p></a>
                </li>
                <li style="margin-top: 30px">
                    <a href="/SecondaryCommunity/commodity"><p style="color: white">商品管理</p></a>
                </li>
                <li style="margin-top: 30px">
                    <a href="#"><p style="color: white">订单管理</p></a>
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
                <li>活动管理</li>
                <li>/活动信息列表</li>
                <li class="active">/活动报名人员管理</li>
            </ul>
            <div class="my-2 text-right">
                <button class="btn btn-primary" onclick="location.href='<c:url value="/activity"/>'">返回</button>
            </div>
            <form action="" method="post">
                <input type="hidden" name="_method" value="DELETE"/>
            </form>
            <div style="width: 1500px">
                <table class="table table-striped table-hover table-bordered">
                    <thead>
                    <tr>
                        <th>序号</th>
                        <th>活动编号</th>
                        <th style="width: 140px">发布的管理员</th>
                        <th>起止时间</th>
                        <th>活动积分</th>
                        <th style="width: 200px">活动标题标题</th>
                        <th style="width: 500px">内容</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="act" items="${activityList}" varStatus="idx">
                        <tr>
                            <th>${idx.index+1}</th>
                            <td>
                                <div>${act.act_no}</div>
                            </td>
                            <td>
                                <div>${act.act_name}</div>
                            </td>
                            <td>
                                <div>${act.act_uptime}~${act.act_downtime}</div>
                            </td>
                            <td>
                                <div>${act.act_number}</div>
                            </td>
                            <td>
                                <div>${act.act_title}</div>
                            </td>
                            <td>
                                <div>${act.act_content}</div>
                            </td>
                            <td>
                                <div><button class="btn btn-danger btn-sm" onclick="showRemoveDlg('${act.act_no}')">删除</button></div>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

            <div class="modal fade" id="removeActivityModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
                            <button type="button" class="btn btn-primary" onclick="removeActivity()">确认删除</button>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
</body>
</html>
