CREATE DATABASE  IF NOT EXISTS `indonesia_park` ;
USE `indonesia_park`;

-- 园区list
DROP TABLE IF EXISTS `park`;
CREATE TABLE `park` (
                            `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
                            `type` int DEFAULT NULL COMMENT '类型   1 中国产业园 2 其他',
                            `name` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '产业名称',
                            `image` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '园区图片概览',
                            `description` MEDIUMTEXT CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '描述信息',
                            `sort` int NOT NULL DEFAULT '0' COMMENT '顺序',
                            `status` int DEFAULT NULL COMMENT '分类状态 0:禁用，1:启用',
                            `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                            `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                            `create_user` bigint DEFAULT NULL COMMENT '创建人',
                            `update_user` bigint DEFAULT NULL COMMENT '修改人',
                            PRIMARY KEY (`id`),
                            UNIQUE KEY `idx_park_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='产业园及分类';
# alter table park add column image varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '图片' after name ;
-- 分类
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type` int DEFAULT NULL COMMENT '类型   1 分类一  2 分类二',
  `name` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '分类名称',
  `sort` int NOT NULL DEFAULT '0' COMMENT '顺序',
  `status` int DEFAULT NULL COMMENT '分类状态 0:禁用，1:启用',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_user` bigint DEFAULT NULL COMMENT '创建人',
  `update_user` bigint DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_category_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='指引分类';

-- 标签
DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '标签名称',
  `category_id` bigint NOT NULL COMMENT '标签分类id',
  `image` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '图片',
  `icon` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '标签icon',
  `description` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '描述信息',
  `status` int DEFAULT '1' COMMENT '0:禁用，1:启用',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_user` bigint DEFAULT NULL COMMENT '创建人',
  `update_user` bigint DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_tags_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='标签';

DROP TABLE IF EXISTS `tag_category`;
CREATE TABLE `tag_category` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tag_id` bigint DEFAULT NULL COMMENT '标签id',
  `category_id` bigint DEFAULT NULL COMMENT '分类id',
  `mark` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '备注 （冗余字段）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='标签和分类关系';

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
                        `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
                        `openid` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '微信用户唯一标识',
                        `name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '姓名',
                        `phone` varchar(11) COLLATE utf8_bin DEFAULT NULL COMMENT '手机号',
                        `sex` varchar(2) COLLATE utf8_bin DEFAULT NULL COMMENT '性别',
                        `id_number` varchar(18) COLLATE utf8_bin DEFAULT NULL COMMENT '身份证号',
                        `avatar` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '头像',
                        `create_time` datetime DEFAULT NULL,
                        PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='用户信息';