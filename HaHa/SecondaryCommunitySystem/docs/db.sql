/** 创建用户
*用户：2018user
*密码：123321
*/
create  user '2018user'@'%' identified by '123321';

/** 管理员模块数据库*/
create database db_administer;

/** 授权*/
grant all privileges on db_administer.* to '2018user'@'%';

/** 创建表*/
CREATE TABLE `tbl_comic` (
             `comic_pinyin` varchar(70) NOT NULL,
             `comic_name` varchar(30) NOT NULL,
             `comic_number` int NOT NULL,
             `comic_pic` mediumblob,
             `comic_introduce` varchar(500) NOT NULL,
             `comic_type1` varchar(10) NOT NULL,
             `comic_type2` varchar(10) NOT NULL,
             `comic_time` varchar(10) NOT NULL,
             `comic_platform` varchar(20) NOT NULL,
             `comic_aplatform` varchar(50) NOT NULL,
             `comic_bplatform` varchar(50) NOT NULL,
             PRIMARY KEY (`comic_pinyin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `tbl_commodity` (
             `commodity_pinyin` varchar(100) NOT NULL,
             `commodity_name` varchar(30) NOT NULL,
             `commodity_number` int NOT NULL,
             `commodity_introduce` varchar(500) NOT NULL,
             `commodity_pic` mediumblob,
             `commodity_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
             `commodity_time` datetime(6) NOT NULL,
             `commodity_price` decimal(7,2) NOT NULL,
             PRIMARY KEY (`commodity_pinyin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `tbl_administrators` (
              `admin_number` varchar(20) NOT NULL,
              `admin_password` varchar(20) NOT NULL,
              `admin_name` varchar(10) NOT NULL,
              `admin_id` varchar(18) NOT NULL,
              `admin_phone` varchar(11) NOT NULL,
              `admin_address` varchar(255) NOT NULL,
              `admin_email` varchar(20) NOT NULL,
              `admin_birth` varchar(10) NOT NULL,
              `admin_qq` int(20) NOT NULL,
              `admin_guaranteename` varchar(10) ,
              `admin_guaranteeid` varchar(18) ,
              `admin_pic` mediumblob,
              PRIMARY KEY (`admin_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `tbl_activity` (
             `act_no` varchar(20) NOT NULL,
             `act_name` varchar(20) NOT NULL,
             `act_uptime` varchar(10) NOT NULL,
             `act_downtime` vvarchar(10) NOT NULL,
             `act_content` varchar(500) NOT NULL,
             `act_title` varchar(255) NOT NULL,
             PRIMARY KEY (`act_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;