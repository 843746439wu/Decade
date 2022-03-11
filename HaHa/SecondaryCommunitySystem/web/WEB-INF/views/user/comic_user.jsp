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
    <title>动漫</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        function pagejumpA(comic_aplatform){
                location.href=comic_aplatform;
        }
        function pagejumpB(){
                location.href=comic_bplatform;
        }
        function pagejumpC(comic_name){
                location.href="<c:url value="/commentcomic"/>/"+comic_name;
        }
        function logout(){
            if(confirm("用户${LoginedUser.user_name},您确认要退出系统吗?"))
                location.href="<c:url value="/userLogin"/>";
        }
        function showCollectDlg(comic_name){
            location.href="<c:url value="/user_comic"/>/"+comic_name;
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
        <div style="float: left;">
            <form action="" method="post">
                <input type="hidden" name="_method" value="DELETE"/>
            </form>
            <div style="margin-left: 10%">
                <table class="table table-striped table-hover table-bordered" style="width: 1500px">
                    <thead>
                    <tr style="text-align: center">
                        <th>序号</th>
                        <th>动漫</th>
                        <th>动漫简介</th>
                        <th>动漫类型</th>
                        <th>动漫播放平台</th>
                    </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="comic" items="${comicList}" varStatus="idx">
                            <tr>
                                <th style="width: 80px;text-align: center;">${idx.index+1}</th>
                                <td>
                                    <div><img src="<c:url value="/comics"/>/${comic.comic_name}/comicpic" width="200" height="150"></div><hr>
                                    <div>${comic.comic_name}</div>
                                </td>
                                <td style="width: 600px;">
                                    <div>${comic.comic_introduce}</div>
                                </td>
                                <td style="width: 150px">
                                    <p>国家：${comic.comic_type1}</p>
                                    <p>类型：${comic.comic_type2}</p><hr>
                                    <p>上映时间：</p>${comic.comic_time}<hr>
                                    <p>集数：${comic.comic_number}</p>
                                </td>
                                <td>
                                    <div style="margin-top: 10px">授权播放平台：<button class="btn btn-primary btn-sm" onclick="pagejumpA('${comic.comic_aplatform}')">${comic.comic_platform}</button></div>
                                    <div style="margin-top: 30px">免费观看平台：<button class="btn btn-primary btn-sm" onclick="pagejumpB('${comic.comic_bplatform}')">其他网站</button></div>
                                    <div style="margin-top: 30px">看别人怎么说：<button class="btn btn-primary btn-sm" onclick="pagejumpC('${comic.comic_name}')">查看评论</button></div>
                                    <div style="margin-top: 30px">收藏喜欢的动漫：<button class="btn btn-primary btn-sm" onclick="showCollectDlg('${comic.comic_name}')">收藏</button></div>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
<%--            <div class="col-12 text-right">--%>
<%--                共${page.totalRecNum}条, 当前显示${page.startIndex+1}-${page.endIndex}条, 第${page.pageNo}/${page.totalPageNum}页--%>
<%--                <c:if test="${page.totalPageNum>1}">|</c:if>--%>
<%--                <c:if test="${page.pageNo>1}">--%>
<%--                    <button class="btn btn-sm btn-outline-info" onclick="doQuery(1)">首页</button>&nbsp;--%>
<%--                </c:if>--%>
<%--                <c:if test="${page.prePage}">--%>
<%--                    <button class="btn btn-sm btn-outline-info" onclick="doQuery(${page.pageNo-1})">上一页</button>&nbsp;--%>
<%--                </c:if>--%>
<%--                <c:if test="${page.nextPage}">--%>
<%--                    <button class="btn btn-sm btn-outline-info" onclick="doQuery(${page.pageNo+1})">下一页</button>&nbsp;--%>
<%--                </c:if>--%>
<%--                <c:if test="${page.pageNo!=page.totalPageNum}">--%>
<%--                    <button class="btn btn-sm btn-outline-info" onclick="doQuery(${page.totalPageNum})">末页</button>&nbsp;--%>
<%--                </c:if>--%>
<%--                &nbsp;|&nbsp;--%>
<%--                到&nbsp;<input type="text" class="text-center" id="pageNo" size=4 style="text-align:right;"/> 页--%>
<%--                <button class="btn btn-sm btn-success" onclick="doQuery(parseInt($('#pageNo').val()));"> 跳 转 </button>--%>
<%--            </div>--%>

        </div>
    </div>
</div>
</div>
</body>
</html>
