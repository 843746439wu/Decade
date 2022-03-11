<%--
  Created by IntelliJ IDEA.
  User: Decade
  Date: 2022/1/3
  Time: 17:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>首页</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        function logout(){
            if(confirm("用户${LoginedUser.user_name},您确认要退出系统吗?"))
                location.href="<c:url value="/userLogin"/>";
        }
    </script>
</head>
<body>
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
                            <li><a href="/SecondaryCommunity/user_chat">社区</a></li>
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
        <div>
            <div id="myCarousel" class="carousel slide">
                <!-- 轮播（Carousel）指标 -->
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#myCarousel" data-slide-to="1"></li>
                    <li data-target="#myCarousel" data-slide-to="2"></li>
                </ol>
                <!-- 轮播（Carousel）项目 -->
                <div class="carousel-inner">
                    <div class="item active">
                        <img src="images/title1.jpg" alt="First slide" style="width: 100%;height: 600px">
                        <div class="carousel-caption">海贼王</div>
                    </div>
                    <div class="item">
                        <img src="images/title2.jpg" alt="Second slide" style="width: 100%;height: 600px">
                        <div class="carousel-caption">斗破苍穹</div>
                    </div>
                    <div class="item">
                        <img src="images/title3.jpg" alt="Third slide" style="width: 100%;height: 600px">
                        <div class="carousel-caption">火影忍者</div>
                    </div>
                </div>
                <!-- 轮播（Carousel）导航 -->
                <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
            <div>
                <div class="container" style="margin-top: 10px;width: 100%;">
                    <h1>动漫推荐</h1>
                    <div class="row">
                        <div class="col-xs-6 col-sm-3" style="background-color: #dedef8;box-shadow: inset 1px -1px 1px #444, inset -1px 1px 1px #444;height: 320px">
                            <div style="padding-top: 5px">
                                <img src="images/dldl.jpg" alt="" style="width: 80%;height: 150px">
                                <p>《斗罗大陆》讲述的是穿越到斗罗大陆的唐三如何一步步修炼武魂，由人修炼为神，最终铲除了斗罗大陆上的邪恶力量，报了杀母之仇，成为斗罗大陆最强者的故事</p>
                                <p>集数：更新至189集</p>
                            </div>
                        </div>
                        <div class="col-xs-6 col-sm-3" style="background-color: #dedef8;box-shadow: inset 1px -1px 1px #444, inset -1px 1px 1px #444;height: 320px">
                            <div style="padding-top: 5px">
                                <img src="images/wmsj.jpg" alt="" style="width: 80%;height: 150px">
                                <p>《完美世界》讲述的一粒尘可填海，一根草斩尽日月星辰，弹指间天翻地覆。群雄并起，万族林立，诸圣争霸，乱天动地；问苍茫大地，谁主沉浮？一个少年从大荒中走出，一切从这里开始。</p>
                                <p>集数：更新至189集</p>
                            </div>
                        </div>
                        <div class="clearfix visible-xs"></div>
                        <div class="col-xs-6 col-sm-3" style="background-color: #dedef8;box-shadow:inset 1px -1px 1px #444, inset -1px 1px 1px #444;height: 320px">
                            <div style="padding-top: 5px">
                                <img src="images/mztkn.jpg" alt="" style="width: 80%;height: 150px">
                                <p>《名侦探柯南》高中生侦探工藤新一和青梅竹马的同学毛利兰一同去游乐园玩的时候，目击了黑衣男子的可疑交易现场。被背后接近的另一名同伙灌下了毒药，当他醒来时，身体居然缩小了！
                                    如果让那些家伙知道工藤新一还活着的话，不仅性命难保，还会危及身边的人。为了揭露那些家伙的真面目，小小侦探江户川柯南开始大显身手！</p>
                                <p>集数：更新至1089集</p>
                            </div>
                        </div>
                        <div class="col-xs-6 col-sm-3" style="background-color: #dedef8;box-shadow: inset 1px -1px 1px #444, inset -1px 1px 1px #444;height: 320px">
                            <div style="padding-top: 5px">
                                <img src="images/lbxx.jpg" alt="" style="width: 80%;height: 150px">
                                <p>《蜡笔小新》讲述的野原新之助是一个年仅5岁，正在幼儿园上学的小男孩。他家住在春日部的市郊，家里有爸爸妈妈，还有一条名叫小白的小狗，随后又加入了新的成员妹妹野原向日葵。作者从日常生活中取材，叙述了野原新之助在日常生活中所发生的故事。故事中的主人公野原新之助是一个有点调皮的小孩，他喜欢别出心裁、富于幻想</p>
                                <p>集数：更新至第七季</p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="container" style="margin-top: 10px;width: 100%;">
                    <h1>商品推荐</h1>
                    <div class="row">
                        <div class="col-xs-6 col-sm-3" style="background-color: #dedef8;box-shadow: inset 1px -1px 1px #444, inset -1px 1px 1px #444;height: 280px">
                            <div style="padding-top: 5px">
                                <img src="images/wzry.jpg" alt="" style="width: 80%;height: 150px">
                                <p style="padding-top: 10px">王者荣耀随机手办 买到就是赚到</p>
                                <p>淘宝价：￥37.96</p>
                            </div>
                        </div>
                        <div class="col-xs-6 col-sm-3" style="background-color: #dedef8;box-shadow: inset 1px -1px 1px #444, inset -1px 1px 1px #444;height: 280px">
                            <div style="padding-top: 5px">
                                <img src="images/bh3.jpg" alt="" style="width: 80%;height: 150px">
                                <p style="padding-top: 10px">崩坏3手办米哈游动漫二次元崩坏学院真炎幸魂手办</p>
                                <p>淘宝价：￥138</p>
                            </div>
                        </div>
                        <div class="clearfix visible-xs"></div>
                        <div class="col-xs-6 col-sm-3" style="background-color: #dedef8;box-shadow:inset 1px -1px 1px #444, inset -1px 1px 1px #444;height: 280px">
                            <div style="padding-top: 5px">
                                <img src="images/sl.jpg" alt="" style="width: 80%;height: 150px">
                                <p style="padding-top: 10px">日本动漫海贼王手办 三千世界索隆 生日礼物男生模型路飞手办摆件</p>
                                <p>淘宝价：158</p>
                            </div>
                        </div>
                        <div class="col-xs-6 col-sm-3" style="background-color: #dedef8;box-shadow: inset 1px -1px 1px #444, inset -1px 1px 1px #444;height: 280px">
                            <div style="padding-top: 5px">
                                <img src="images/wyd.jpg" alt="" style="width: 80%;height: 150px">
                                <p style="padding-top: 10px">火影忍者晓组织宇智波乌鸦殿堂鼬神手办佐助夜凯gk模型摆件礼物</p>
                                <p>淘宝价：108</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>