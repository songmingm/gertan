/*
 Navicat Premium Data Transfer

 Source Server         : 101.200.91.104
 Source Server Type    : MySQL
 Source Server Version : 80028 (8.0.28)
 Source Host           : 101.200.91.104:3306
 Source Schema         : nacos

 Target Server Type    : MySQL
 Target Server Version : 80028 (8.0.28)
 File Encoding         : 65001

 Date: 30/04/2023 02:18:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for config_info
-- ----------------------------
DROP TABLE IF EXISTS `config_info`;
CREATE TABLE `config_info` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text COLLATE utf8_bin COMMENT 'source user',
  `src_ip` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'source ip',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  `c_desc` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `c_use` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `effect` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `type` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `c_schema` text COLLATE utf8_bin,
  `encrypted_data_key` text COLLATE utf8_bin NOT NULL COMMENT '秘钥',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfo_datagrouptenant` (`data_id`,`group_id`,`tenant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='config_info';

-- ----------------------------
-- Records of config_info
-- ----------------------------
BEGIN;
INSERT INTO `config_info` (`id`, `data_id`, `group_id`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `app_name`, `tenant_id`, `c_desc`, `c_use`, `effect`, `type`, `c_schema`, `encrypted_data_key`) VALUES (9, 'service-push-dev.yaml', 'DEFAULT_GROUP', '# springdoc-openapi项目配置\nspringdoc:\n  group-configs:\n    - group: \'push\'\n      packages-to-scan: org.online.push.controller', '170bfd65570326a541ca07278903acaf', '2023-04-29 17:18:11', '2023-04-29 17:53:44', 'nacos', '183.233.81.30', 'service-push', '559c8da1-1e90-489d-b99d-381588f9d639', '推送服务配置文件', '', '', 'yaml', '', '');
INSERT INTO `config_info` (`id`, `data_id`, `group_id`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `app_name`, `tenant_id`, `c_desc`, `c_use`, `effect`, `type`, `c_schema`, `encrypted_data_key`) VALUES (10, 'service-gateway-dev.yaml', 'DEFAULT_GROUP', 'spring:\n  cloud:\n    # 网关配置\n    gateway:\n      routes:\n        # 司机服务路由\n        - id: driver_route\n          uri: lb://service-driver\n          predicates:\n            - Path=/service-driver/**\n          filters:\n            - StripPrefix=1\n        # 乘客服务路由\n        - id: passenger_route\n          uri: lb://service-passenger\n          predicates:\n            - Path=/service-passenger/**\n          filters:\n            - StripPrefix=1\n        # 验证码服务路由\n        - id: captcha_route\n          uri: lb://service-captcha\n          predicates:\n            - Path=/service-captcha/**\n          filters:\n            - StripPrefix=1\n        # 订单服务\n        - id: order_route\n          uri: lb://service-order\n          predicates:\n            - Path=/service-order/**\n          filters:\n            - StripPrefix=1\n        # 安全登录服务路由\n        - id: security_route\n          uri: lb://service-security\n          predicates:\n            - Path=/service-security/**\n          filters:\n            - StripPrefix=1\n        # 地图服务服务路由\n        - id: map_route\n          uri: lb://service-map\n          predicates:\n            - Path=/service-map/**\n          filters:\n            - StripPrefix=1\n        # 地图服务服务路由\n        - id: push_route\n          uri: lb://service-push\n          predicates:\n            - Path=/service-push/**\n          filters:\n            - StripPrefix=1\n\n\nknife4j:\n  gateway:\n    enabled: true\n    strategy: discover\n    discover:\n      enabled: true\n      version: openapi3\n      excluded-services:\n        - service-gateway', 'f8613d149e785931b37cebf8ea9f9542', '2023-04-29 17:18:11', '2023-04-29 17:52:24', 'nacos', '183.233.81.30', 'service-gateway', '559c8da1-1e90-489d-b99d-381588f9d639', '网关服务配置', '', '', 'yaml', '', '');
INSERT INTO `config_info` (`id`, `data_id`, `group_id`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `app_name`, `tenant_id`, `c_desc`, `c_use`, `effect`, `type`, `c_schema`, `encrypted_data_key`) VALUES (11, 'white-url.yaml', 'DEFAULT_GROUP', 'gateway:\n    whetherEnableAuthentication: false\n    whiteURL: \n        # 服务Api文档url\n        - /service-security/v3/api-docs\n        - /service-captcha/v3/api-docs\n        - /service-passenger/v3/api-docs\n        - /service-driver/v3/api-docs\n        # 登录接口\n        - /service-security/security/driver-login\n        - /service-security/security/passenger-login\n        # 查看乘客，司机是否存在\n        - /service-passenger/passenger/is-exist\n        - /service-driver/driver/is-exist\n        # 验证码签发\n        - /service-captcha/captcha/num\n        - /service-captcha/captcha/img', '5580432e65925908eac3ef8d51d1d960', '2023-04-29 17:18:11', '2023-04-29 17:18:11', NULL, '183.233.81.30', 'service-gateway', '559c8da1-1e90-489d-b99d-381588f9d639', '网关白名单资源配置文件', NULL, NULL, 'yaml', NULL, '');
INSERT INTO `config_info` (`id`, `data_id`, `group_id`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `app_name`, `tenant_id`, `c_desc`, `c_use`, `effect`, `type`, `c_schema`, `encrypted_data_key`) VALUES (12, 'redis.yaml', 'DEFAULT_GROUP', 'spring:\n  redis:\n    host: 101.200.91.104\n    port: 6379\n    database: 0\n', '3c3d88a61a0c683f6bf043b623f4c9d5', '2023-04-29 17:18:11', '2023-04-29 17:21:35', 'nacos', '183.233.81.30', '', '559c8da1-1e90-489d-b99d-381588f9d639', 'Redis连接配置', '', '', 'yaml', '', '');
INSERT INTO `config_info` (`id`, `data_id`, `group_id`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `app_name`, `tenant_id`, `c_desc`, `c_use`, `effect`, `type`, `c_schema`, `encrypted_data_key`) VALUES (13, 'service-driver-dev.yaml', 'DEFAULT_GROUP', 'spring:\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://101.200.91.104:3306/service_driver?characterEncoding=utf-8&serverTimezone=GMT%2B8\n    username: root\n    password: root\n\n\n# springdoc-openapi项目配置\nspringdoc:\n  group-configs:\n    - group: \'driver\'\n      packages-to-scan: org.online.driver.controller', '8880771560f1c91d900eed6bc80c98fc', '2023-04-29 17:18:11', '2023-04-29 17:51:43', 'nacos', '183.233.81.30', 'service-driver', '559c8da1-1e90-489d-b99d-381588f9d639', '司机服务配置文件', '', '', 'yaml', '', '');
INSERT INTO `config_info` (`id`, `data_id`, `group_id`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `app_name`, `tenant_id`, `c_desc`, `c_use`, `effect`, `type`, `c_schema`, `encrypted_data_key`) VALUES (14, 'service-order-dev.yaml', 'DEFAULT_GROUP', 'spring:\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://101.200.91.104:3306/service_order?characterEncoding=utf-8&serverTimezone=GMT%2B8\n    username: root\n    password: root\n\n# springdoc-openapi项目配置\nspringdoc:\n  group-configs:\n    - group: \'order\'\n      packages-to-scan: org.online.order.controller', '6dd1f03e5b83f1848aabcdabdd1d2706', '2023-04-29 17:18:11', '2023-04-29 17:54:23', 'nacos', '183.233.81.30', 'service-order', '559c8da1-1e90-489d-b99d-381588f9d639', '订单服务配置文件', '', '', 'yaml', '', '');
INSERT INTO `config_info` (`id`, `data_id`, `group_id`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `app_name`, `tenant_id`, `c_desc`, `c_use`, `effect`, `type`, `c_schema`, `encrypted_data_key`) VALUES (15, 'service-passenger-dev.yaml', 'DEFAULT_GROUP', 'spring:\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://101.200.91.104:3306/service_passenger?characterEncoding=utf-8&serverTimezone=GMT%2B8\n    username: root\n    password: root\n\n# springdoc-openapi项目配置\nspringdoc:\n  group-configs:\n    - group: \'passenger\'\n      packages-to-scan: org.online.passenger.controller', '90be8dd857f7d5d63eed1ac312eba501', '2023-04-29 17:18:11', '2023-04-29 17:54:45', 'nacos', '183.233.81.30', 'service-passenger', '559c8da1-1e90-489d-b99d-381588f9d639', '乘客服务配置文件', '', '', 'yaml', '', '');
INSERT INTO `config_info` (`id`, `data_id`, `group_id`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `app_name`, `tenant_id`, `c_desc`, `c_use`, `effect`, `type`, `c_schema`, `encrypted_data_key`) VALUES (16, 'service-map-dev.yaml', 'DEFAULT_GROUP', 'spring:\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://101.200.91.104:3306/service_map?characterEncoding=utf-8&serverTimezone=GMT%2B8\n    username: root\n    password: root\n\namap:\n  key: 8a3c390e0154249364d91fb7104f7529\n\n# springdoc-openapi项目配置\nspringdoc:\n  group-configs:\n    - group: \'map\'\n      packages-to-scan: org.online.map.controller', 'd74dfcfc656e017c64b93e47094a4dc9', '2023-04-29 17:18:11', '2023-04-29 17:52:59', 'nacos', '183.233.81.30', 'service-map', '559c8da1-1e90-489d-b99d-381588f9d639', '地图行政区域服务配置文件', '', '', 'yaml', '', '');
INSERT INTO `config_info` (`id`, `data_id`, `group_id`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `app_name`, `tenant_id`, `c_desc`, `c_use`, `effect`, `type`, `c_schema`, `encrypted_data_key`) VALUES (23, 'service-captcha-dev.yaml', 'DEFAULT_GROUP', '# springdoc-openapi项目配置\nspringdoc:\n  group-configs:\n    - group: \'captcha\'\n      packages-to-scan: org.online.captcha.controller', '070378dee7a321d4be64d2a9828b7942', '2023-04-29 17:50:22', '2023-04-29 17:50:22', 'nacos', '183.233.81.30', 'service-captcha', '559c8da1-1e90-489d-b99d-381588f9d639', '验证码服务配置文件', NULL, NULL, 'yaml', NULL, '');
INSERT INTO `config_info` (`id`, `data_id`, `group_id`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `app_name`, `tenant_id`, `c_desc`, `c_use`, `effect`, `type`, `c_schema`, `encrypted_data_key`) VALUES (30, 'service-security-dev.yaml', 'DEFAULT_GROUP', '# springdoc-openapi项目配置\nspringdoc:\n  group-configs:\n    - group: \'security\'\n      packages-to-scan: org.online.security.controller', '7b6509ba44c56091140fd1b4520e0f55', '2023-04-29 17:56:33', '2023-04-29 17:56:33', 'nacos', '183.233.81.30', 'service-security', '559c8da1-1e90-489d-b99d-381588f9d639', '认证模块配置文件', NULL, NULL, 'yaml', NULL, '');
INSERT INTO `config_info` (`id`, `data_id`, `group_id`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `app_name`, `tenant_id`, `c_desc`, `c_use`, `effect`, `type`, `c_schema`, `encrypted_data_key`) VALUES (32, 'zipkin.yaml', 'DEFAULT_GROUP', 'spring:\n    zipkin:\n        enable: true\n        base-url: http://101.200.91.104:9411\n    sleuth:\n        sampler:\n            probability: 1', 'a50ef114e2a1e45f8811bd79c9476e47', '2023-04-29 18:18:27', '2023-04-29 18:18:27', 'nacos', '183.233.81.30', '', '559c8da1-1e90-489d-b99d-381588f9d639', '链路追踪配置', NULL, NULL, 'yaml', NULL, '');
COMMIT;

-- ----------------------------
-- Table structure for config_info_aggr
-- ----------------------------
DROP TABLE IF EXISTS `config_info_aggr`;
CREATE TABLE `config_info_aggr` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `datum_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'datum_id',
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT '内容',
  `gmt_modified` datetime NOT NULL COMMENT '修改时间',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfoaggr_datagrouptenantdatum` (`data_id`,`group_id`,`tenant_id`,`datum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='增加租户字段';

-- ----------------------------
-- Records of config_info_aggr
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for config_info_beta
-- ----------------------------
DROP TABLE IF EXISTS `config_info_beta`;
CREATE TABLE `config_info_beta` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT 'content',
  `beta_ips` varchar(1024) COLLATE utf8_bin DEFAULT NULL COMMENT 'betaIps',
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text COLLATE utf8_bin COMMENT 'source user',
  `src_ip` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'source ip',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  `encrypted_data_key` text COLLATE utf8_bin NOT NULL COMMENT '秘钥',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfobeta_datagrouptenant` (`data_id`,`group_id`,`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='config_info_beta';

-- ----------------------------
-- Records of config_info_beta
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for config_info_tag
-- ----------------------------
DROP TABLE IF EXISTS `config_info_tag`;
CREATE TABLE `config_info_tag` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_id',
  `tag_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'tag_id',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text COLLATE utf8_bin COMMENT 'source user',
  `src_ip` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'source ip',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfotag_datagrouptenanttag` (`data_id`,`group_id`,`tenant_id`,`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='config_info_tag';

-- ----------------------------
-- Records of config_info_tag
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for config_tags_relation
-- ----------------------------
DROP TABLE IF EXISTS `config_tags_relation`;
CREATE TABLE `config_tags_relation` (
  `id` bigint NOT NULL COMMENT 'id',
  `tag_name` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'tag_name',
  `tag_type` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT 'tag_type',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_id',
  `nid` bigint NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`nid`),
  UNIQUE KEY `uk_configtagrelation_configidtag` (`id`,`tag_name`,`tag_type`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='config_tag_relation';

-- ----------------------------
-- Records of config_tags_relation
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for group_capacity
-- ----------------------------
DROP TABLE IF EXISTS `group_capacity`;
CREATE TABLE `group_capacity` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Group ID，空字符表示整个集群',
  `quota` int unsigned NOT NULL DEFAULT '0' COMMENT '配额，0表示使用默认值',
  `usage` int unsigned NOT NULL DEFAULT '0' COMMENT '使用量',
  `max_size` int unsigned NOT NULL DEFAULT '0' COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int unsigned NOT NULL DEFAULT '0' COMMENT '聚合子配置最大个数，，0表示使用默认值',
  `max_aggr_size` int unsigned NOT NULL DEFAULT '0' COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int unsigned NOT NULL DEFAULT '0' COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='集群、各Group容量信息表';

-- ----------------------------
-- Records of group_capacity
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for his_config_info
-- ----------------------------
DROP TABLE IF EXISTS `his_config_info`;
CREATE TABLE `his_config_info` (
  `id` bigint unsigned NOT NULL,
  `nid` bigint unsigned NOT NULL AUTO_INCREMENT,
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL,
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL,
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext COLLATE utf8_bin NOT NULL,
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `src_user` text COLLATE utf8_bin,
  `src_ip` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `op_type` char(10) COLLATE utf8_bin DEFAULT NULL,
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  `encrypted_data_key` text COLLATE utf8_bin NOT NULL COMMENT '秘钥',
  PRIMARY KEY (`nid`),
  KEY `idx_gmt_create` (`gmt_create`),
  KEY `idx_gmt_modified` (`gmt_modified`),
  KEY `idx_did` (`data_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='多租户改造';

-- ----------------------------
-- Records of his_config_info
-- ----------------------------
BEGIN;
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (0, 1, 'service-push-dev.yaml', 'DEFAULT_GROUP', 'service-push', '1', 'c4ca4238a0b923820dcc509a6f75849b', '2023-04-30 01:17:49', '2023-04-29 17:17:49', NULL, '183.233.81.30', 'I', '', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (0, 2, 'service-gateway-dev.yaml', 'DEFAULT_GROUP', 'service-gateway', 'spring:\n  cloud:\n    # 网关配置\n    gateway:\n      routes:\n        # 司机服务路由\n        - id: driver_route\n          uri: lb://service-driver\n          predicates:\n            - Path=/service-driver/**\n          filters:\n            - StripPrefix=1\n        # 乘客服务路由\n        - id: passenger_route\n          uri: lb://service-passenger\n          predicates:\n            - Path=/service-passenger/**\n          filters:\n            - StripPrefix=1\n        # 验证码服务路由\n        - id: captcha_route\n          uri: lb://service-captcha\n          predicates:\n            - Path=/service-captcha/**\n          filters:\n            - StripPrefix=1\n        # 订单服务\n        - id: order_route\n          uri: lb://service-order\n          predicates:\n            - Path=/service-order/**\n          filters:\n            - StripPrefix=1\n        # 安全登录服务路由\n        - id: security_route\n          uri: lb://service-security\n          predicates:\n            - Path=/service-security/**\n          filters:\n            - StripPrefix=1\n        # 地图服务服务路由\n        - id: map_route\n          uri: lb://service-map\n          predicates:\n            - Path=/service-map/**\n          filters:\n            - StripPrefix=1\n        # 地图服务服务路由\n        - id: push_route\n          uri: lb://service-push\n          predicates:\n            - Path=/service-push/**\n          filters:\n            - StripPrefix=1', '3144f7faa6b97f8a0c8e562a685c0460', '2023-04-30 01:17:49', '2023-04-29 17:17:49', NULL, '183.233.81.30', 'I', '', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (0, 3, 'white-url.yaml', 'DEFAULT_GROUP', 'service-gateway', 'gateway:\n    whetherEnableAuthentication: false\n    whiteURL: \n        # 服务Api文档url\n        - /service-security/v3/api-docs\n        - /service-captcha/v3/api-docs\n        - /service-passenger/v3/api-docs\n        - /service-driver/v3/api-docs\n        # 登录接口\n        - /service-security/security/driver-login\n        - /service-security/security/passenger-login\n        # 查看乘客，司机是否存在\n        - /service-passenger/passenger/is-exist\n        - /service-driver/driver/is-exist\n        # 验证码签发\n        - /service-captcha/captcha/num\n        - /service-captcha/captcha/img', '5580432e65925908eac3ef8d51d1d960', '2023-04-30 01:17:49', '2023-04-29 17:17:49', NULL, '183.233.81.30', 'I', '', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (0, 4, 'redis.yaml', 'DEFAULT_GROUP', '', 'spring:\n  redis:\n    host: 172.16.155.129\n    port: 6379\n    database: 0\n', '14e09c2c5ec7a0ec4dbaa65f896c1e84', '2023-04-30 01:17:49', '2023-04-29 17:17:49', NULL, '183.233.81.30', 'I', '', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (0, 5, 'service-driver-dev.yaml', 'DEFAULT_GROUP', 'service-driver', 'spring:\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://172.16.155.129:3306/service-driver-user?characterEncoding=utf-8&serverTimezone=GMT%2B8\n    username: root\n    password: root', '73c6510533d980781f0c776d24c9b02b', '2023-04-30 01:17:49', '2023-04-29 17:17:49', NULL, '183.233.81.30', 'I', '', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (0, 6, 'service-order-dev.yaml', 'DEFAULT_GROUP', 'service-order', 'spring:\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://172.16.155.129:3306/service-order?characterEncoding=utf-8&serverTimezone=GMT%2B8\n    username: root\n    password: root', '3527926c51f5e23cc34f534363ab45e1', '2023-04-30 01:17:49', '2023-04-29 17:17:49', NULL, '183.233.81.30', 'I', '', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (0, 7, 'service-passenger-dev.yaml', 'DEFAULT_GROUP', 'service-passenger', 'spring:\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://172.16.155.129:3306/service-passenger-user?characterEncoding=utf-8&serverTimezone=GMT%2B8\n    username: root\n    password: root', 'b11fc870a5b70174520419f9a134f974', '2023-04-30 01:17:49', '2023-04-29 17:17:49', NULL, '183.233.81.30', 'I', '', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (0, 8, 'service-map-dev.yaml', 'DEFAULT_GROUP', 'service-map', 'spring:\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://172.16.155.129:3306/service-map?characterEncoding=utf-8&serverTimezone=GMT%2B8\n    username: root\n    password: root\n\namap:\n  key: 8a3c390e0154249364d91fb7104f7529', '823b71a7870d3c0e34fd55253bfcc0a9', '2023-04-30 01:17:49', '2023-04-29 17:17:49', NULL, '183.233.81.30', 'I', '', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (1, 9, 'service-push-dev.yaml', 'DEFAULT_GROUP', 'service-push', '1', 'c4ca4238a0b923820dcc509a6f75849b', '2023-04-30 01:17:56', '2023-04-29 17:17:57', NULL, '183.233.81.30', 'D', '', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (2, 10, 'service-gateway-dev.yaml', 'DEFAULT_GROUP', 'service-gateway', 'spring:\n  cloud:\n    # 网关配置\n    gateway:\n      routes:\n        # 司机服务路由\n        - id: driver_route\n          uri: lb://service-driver\n          predicates:\n            - Path=/service-driver/**\n          filters:\n            - StripPrefix=1\n        # 乘客服务路由\n        - id: passenger_route\n          uri: lb://service-passenger\n          predicates:\n            - Path=/service-passenger/**\n          filters:\n            - StripPrefix=1\n        # 验证码服务路由\n        - id: captcha_route\n          uri: lb://service-captcha\n          predicates:\n            - Path=/service-captcha/**\n          filters:\n            - StripPrefix=1\n        # 订单服务\n        - id: order_route\n          uri: lb://service-order\n          predicates:\n            - Path=/service-order/**\n          filters:\n            - StripPrefix=1\n        # 安全登录服务路由\n        - id: security_route\n          uri: lb://service-security\n          predicates:\n            - Path=/service-security/**\n          filters:\n            - StripPrefix=1\n        # 地图服务服务路由\n        - id: map_route\n          uri: lb://service-map\n          predicates:\n            - Path=/service-map/**\n          filters:\n            - StripPrefix=1\n        # 地图服务服务路由\n        - id: push_route\n          uri: lb://service-push\n          predicates:\n            - Path=/service-push/**\n          filters:\n            - StripPrefix=1', '3144f7faa6b97f8a0c8e562a685c0460', '2023-04-30 01:17:56', '2023-04-29 17:17:57', NULL, '183.233.81.30', 'D', '', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (3, 11, 'white-url.yaml', 'DEFAULT_GROUP', 'service-gateway', 'gateway:\n    whetherEnableAuthentication: false\n    whiteURL: \n        # 服务Api文档url\n        - /service-security/v3/api-docs\n        - /service-captcha/v3/api-docs\n        - /service-passenger/v3/api-docs\n        - /service-driver/v3/api-docs\n        # 登录接口\n        - /service-security/security/driver-login\n        - /service-security/security/passenger-login\n        # 查看乘客，司机是否存在\n        - /service-passenger/passenger/is-exist\n        - /service-driver/driver/is-exist\n        # 验证码签发\n        - /service-captcha/captcha/num\n        - /service-captcha/captcha/img', '5580432e65925908eac3ef8d51d1d960', '2023-04-30 01:17:56', '2023-04-29 17:17:57', NULL, '183.233.81.30', 'D', '', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (4, 12, 'redis.yaml', 'DEFAULT_GROUP', '', 'spring:\n  redis:\n    host: 172.16.155.129\n    port: 6379\n    database: 0\n', '14e09c2c5ec7a0ec4dbaa65f896c1e84', '2023-04-30 01:17:56', '2023-04-29 17:17:57', NULL, '183.233.81.30', 'D', '', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (5, 13, 'service-driver-dev.yaml', 'DEFAULT_GROUP', 'service-driver', 'spring:\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://172.16.155.129:3306/service-driver-user?characterEncoding=utf-8&serverTimezone=GMT%2B8\n    username: root\n    password: root', '73c6510533d980781f0c776d24c9b02b', '2023-04-30 01:17:56', '2023-04-29 17:17:57', NULL, '183.233.81.30', 'D', '', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (6, 14, 'service-order-dev.yaml', 'DEFAULT_GROUP', 'service-order', 'spring:\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://172.16.155.129:3306/service-order?characterEncoding=utf-8&serverTimezone=GMT%2B8\n    username: root\n    password: root', '3527926c51f5e23cc34f534363ab45e1', '2023-04-30 01:17:56', '2023-04-29 17:17:57', NULL, '183.233.81.30', 'D', '', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (7, 15, 'service-passenger-dev.yaml', 'DEFAULT_GROUP', 'service-passenger', 'spring:\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://172.16.155.129:3306/service-passenger-user?characterEncoding=utf-8&serverTimezone=GMT%2B8\n    username: root\n    password: root', 'b11fc870a5b70174520419f9a134f974', '2023-04-30 01:17:56', '2023-04-29 17:17:57', NULL, '183.233.81.30', 'D', '', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (8, 16, 'service-map-dev.yaml', 'DEFAULT_GROUP', 'service-map', 'spring:\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://172.16.155.129:3306/service-map?characterEncoding=utf-8&serverTimezone=GMT%2B8\n    username: root\n    password: root\n\namap:\n  key: 8a3c390e0154249364d91fb7104f7529', '823b71a7870d3c0e34fd55253bfcc0a9', '2023-04-30 01:17:56', '2023-04-29 17:17:57', NULL, '183.233.81.30', 'D', '', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (0, 17, 'service-push-dev.yaml', 'DEFAULT_GROUP', 'service-push', '1', 'c4ca4238a0b923820dcc509a6f75849b', '2023-04-30 01:18:11', '2023-04-29 17:18:11', NULL, '183.233.81.30', 'I', '559c8da1-1e90-489d-b99d-381588f9d639', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (0, 18, 'service-gateway-dev.yaml', 'DEFAULT_GROUP', 'service-gateway', 'spring:\n  cloud:\n    # 网关配置\n    gateway:\n      routes:\n        # 司机服务路由\n        - id: driver_route\n          uri: lb://service-driver\n          predicates:\n            - Path=/service-driver/**\n          filters:\n            - StripPrefix=1\n        # 乘客服务路由\n        - id: passenger_route\n          uri: lb://service-passenger\n          predicates:\n            - Path=/service-passenger/**\n          filters:\n            - StripPrefix=1\n        # 验证码服务路由\n        - id: captcha_route\n          uri: lb://service-captcha\n          predicates:\n            - Path=/service-captcha/**\n          filters:\n            - StripPrefix=1\n        # 订单服务\n        - id: order_route\n          uri: lb://service-order\n          predicates:\n            - Path=/service-order/**\n          filters:\n            - StripPrefix=1\n        # 安全登录服务路由\n        - id: security_route\n          uri: lb://service-security\n          predicates:\n            - Path=/service-security/**\n          filters:\n            - StripPrefix=1\n        # 地图服务服务路由\n        - id: map_route\n          uri: lb://service-map\n          predicates:\n            - Path=/service-map/**\n          filters:\n            - StripPrefix=1\n        # 地图服务服务路由\n        - id: push_route\n          uri: lb://service-push\n          predicates:\n            - Path=/service-push/**\n          filters:\n            - StripPrefix=1', '3144f7faa6b97f8a0c8e562a685c0460', '2023-04-30 01:18:11', '2023-04-29 17:18:11', NULL, '183.233.81.30', 'I', '559c8da1-1e90-489d-b99d-381588f9d639', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (0, 19, 'white-url.yaml', 'DEFAULT_GROUP', 'service-gateway', 'gateway:\n    whetherEnableAuthentication: false\n    whiteURL: \n        # 服务Api文档url\n        - /service-security/v3/api-docs\n        - /service-captcha/v3/api-docs\n        - /service-passenger/v3/api-docs\n        - /service-driver/v3/api-docs\n        # 登录接口\n        - /service-security/security/driver-login\n        - /service-security/security/passenger-login\n        # 查看乘客，司机是否存在\n        - /service-passenger/passenger/is-exist\n        - /service-driver/driver/is-exist\n        # 验证码签发\n        - /service-captcha/captcha/num\n        - /service-captcha/captcha/img', '5580432e65925908eac3ef8d51d1d960', '2023-04-30 01:18:11', '2023-04-29 17:18:11', NULL, '183.233.81.30', 'I', '559c8da1-1e90-489d-b99d-381588f9d639', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (0, 20, 'redis.yaml', 'DEFAULT_GROUP', '', 'spring:\n  redis:\n    host: 172.16.155.129\n    port: 6379\n    database: 0\n', '14e09c2c5ec7a0ec4dbaa65f896c1e84', '2023-04-30 01:18:11', '2023-04-29 17:18:11', NULL, '183.233.81.30', 'I', '559c8da1-1e90-489d-b99d-381588f9d639', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (0, 21, 'service-driver-dev.yaml', 'DEFAULT_GROUP', 'service-driver', 'spring:\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://172.16.155.129:3306/service-driver-user?characterEncoding=utf-8&serverTimezone=GMT%2B8\n    username: root\n    password: root', '73c6510533d980781f0c776d24c9b02b', '2023-04-30 01:18:11', '2023-04-29 17:18:11', NULL, '183.233.81.30', 'I', '559c8da1-1e90-489d-b99d-381588f9d639', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (0, 22, 'service-order-dev.yaml', 'DEFAULT_GROUP', 'service-order', 'spring:\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://172.16.155.129:3306/service-order?characterEncoding=utf-8&serverTimezone=GMT%2B8\n    username: root\n    password: root', '3527926c51f5e23cc34f534363ab45e1', '2023-04-30 01:18:11', '2023-04-29 17:18:11', NULL, '183.233.81.30', 'I', '559c8da1-1e90-489d-b99d-381588f9d639', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (0, 23, 'service-passenger-dev.yaml', 'DEFAULT_GROUP', 'service-passenger', 'spring:\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://172.16.155.129:3306/service-passenger-user?characterEncoding=utf-8&serverTimezone=GMT%2B8\n    username: root\n    password: root', 'b11fc870a5b70174520419f9a134f974', '2023-04-30 01:18:11', '2023-04-29 17:18:11', NULL, '183.233.81.30', 'I', '559c8da1-1e90-489d-b99d-381588f9d639', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (0, 24, 'service-map-dev.yaml', 'DEFAULT_GROUP', 'service-map', 'spring:\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://172.16.155.129:3306/service-map?characterEncoding=utf-8&serverTimezone=GMT%2B8\n    username: root\n    password: root\n\namap:\n  key: 8a3c390e0154249364d91fb7104f7529', '823b71a7870d3c0e34fd55253bfcc0a9', '2023-04-30 01:18:11', '2023-04-29 17:18:11', NULL, '183.233.81.30', 'I', '559c8da1-1e90-489d-b99d-381588f9d639', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (16, 25, 'service-map-dev.yaml', 'DEFAULT_GROUP', 'service-map', 'spring:\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://172.16.155.129:3306/service-map?characterEncoding=utf-8&serverTimezone=GMT%2B8\n    username: root\n    password: root\n\namap:\n  key: 8a3c390e0154249364d91fb7104f7529', '823b71a7870d3c0e34fd55253bfcc0a9', '2023-04-30 01:19:06', '2023-04-29 17:19:07', 'nacos', '183.233.81.30', 'U', '559c8da1-1e90-489d-b99d-381588f9d639', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (15, 26, 'service-passenger-dev.yaml', 'DEFAULT_GROUP', 'service-passenger', 'spring:\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://172.16.155.129:3306/service-passenger-user?characterEncoding=utf-8&serverTimezone=GMT%2B8\n    username: root\n    password: root', 'b11fc870a5b70174520419f9a134f974', '2023-04-30 01:19:41', '2023-04-29 17:19:41', 'nacos', '183.233.81.30', 'U', '559c8da1-1e90-489d-b99d-381588f9d639', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (14, 27, 'service-order-dev.yaml', 'DEFAULT_GROUP', 'service-order', 'spring:\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://172.16.155.129:3306/service-order?characterEncoding=utf-8&serverTimezone=GMT%2B8\n    username: root\n    password: root', '3527926c51f5e23cc34f534363ab45e1', '2023-04-30 01:19:57', '2023-04-29 17:19:57', 'nacos', '183.233.81.30', 'U', '559c8da1-1e90-489d-b99d-381588f9d639', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (13, 28, 'service-driver-dev.yaml', 'DEFAULT_GROUP', 'service-driver', 'spring:\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://172.16.155.129:3306/service-driver-user?characterEncoding=utf-8&serverTimezone=GMT%2B8\n    username: root\n    password: root', '73c6510533d980781f0c776d24c9b02b', '2023-04-30 01:20:21', '2023-04-29 17:20:22', 'nacos', '183.233.81.30', 'U', '559c8da1-1e90-489d-b99d-381588f9d639', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (15, 29, 'service-passenger-dev.yaml', 'DEFAULT_GROUP', 'service-passenger', 'spring:\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://101.200.91.104:3306/service_passenger-user?characterEncoding=utf-8&serverTimezone=GMT%2B8\n    username: root\n    password: root', '4d5c865f83ff6fa8e1f329d29d87af29', '2023-04-30 01:20:39', '2023-04-29 17:20:40', 'nacos', '183.233.81.30', 'U', '559c8da1-1e90-489d-b99d-381588f9d639', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (12, 30, 'redis.yaml', 'DEFAULT_GROUP', '', 'spring:\n  redis:\n    host: 172.16.155.129\n    port: 6379\n    database: 0\n', '14e09c2c5ec7a0ec4dbaa65f896c1e84', '2023-04-30 01:21:35', '2023-04-29 17:21:35', 'nacos', '183.233.81.30', 'U', '559c8da1-1e90-489d-b99d-381588f9d639', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (0, 31, 'service-captcha-dev.yaml', 'DEFAULT_GROUP', 'service-captcha', '# springdoc-openapi项目配置\nspringdoc:\n  group-configs:\n    - group: \'captcha\'\n      packages-to-scan: org.online.captcha.controller', '070378dee7a321d4be64d2a9828b7942', '2023-04-30 01:50:22', '2023-04-29 17:50:22', 'nacos', '183.233.81.30', 'I', '559c8da1-1e90-489d-b99d-381588f9d639', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (13, 32, 'service-driver-dev.yaml', 'DEFAULT_GROUP', 'service-driver', 'spring:\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://101.200.91.104:3306/service_driver?characterEncoding=utf-8&serverTimezone=GMT%2B8\n    username: root\n    password: root', 'bd2b865f70ef18e63fe4a0ffea815c65', '2023-04-30 01:51:43', '2023-04-29 17:51:43', 'nacos', '183.233.81.30', 'U', '559c8da1-1e90-489d-b99d-381588f9d639', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (10, 33, 'service-gateway-dev.yaml', 'DEFAULT_GROUP', 'service-gateway', 'spring:\n  cloud:\n    # 网关配置\n    gateway:\n      routes:\n        # 司机服务路由\n        - id: driver_route\n          uri: lb://service-driver\n          predicates:\n            - Path=/service-driver/**\n          filters:\n            - StripPrefix=1\n        # 乘客服务路由\n        - id: passenger_route\n          uri: lb://service-passenger\n          predicates:\n            - Path=/service-passenger/**\n          filters:\n            - StripPrefix=1\n        # 验证码服务路由\n        - id: captcha_route\n          uri: lb://service-captcha\n          predicates:\n            - Path=/service-captcha/**\n          filters:\n            - StripPrefix=1\n        # 订单服务\n        - id: order_route\n          uri: lb://service-order\n          predicates:\n            - Path=/service-order/**\n          filters:\n            - StripPrefix=1\n        # 安全登录服务路由\n        - id: security_route\n          uri: lb://service-security\n          predicates:\n            - Path=/service-security/**\n          filters:\n            - StripPrefix=1\n        # 地图服务服务路由\n        - id: map_route\n          uri: lb://service-map\n          predicates:\n            - Path=/service-map/**\n          filters:\n            - StripPrefix=1\n        # 地图服务服务路由\n        - id: push_route\n          uri: lb://service-push\n          predicates:\n            - Path=/service-push/**\n          filters:\n            - StripPrefix=1', '3144f7faa6b97f8a0c8e562a685c0460', '2023-04-30 01:52:24', '2023-04-29 17:52:24', 'nacos', '183.233.81.30', 'U', '559c8da1-1e90-489d-b99d-381588f9d639', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (16, 34, 'service-map-dev.yaml', 'DEFAULT_GROUP', 'service-map', 'spring:\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://101.200.91.104:3306/service_map?characterEncoding=utf-8&serverTimezone=GMT%2B8\n    username: root\n    password: root\n\namap:\n  key: 8a3c390e0154249364d91fb7104f7529', 'be752ab44f2657931151fa784ee4d551', '2023-04-30 01:52:59', '2023-04-29 17:52:59', 'nacos', '183.233.81.30', 'U', '559c8da1-1e90-489d-b99d-381588f9d639', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (9, 35, 'service-push-dev.yaml', 'DEFAULT_GROUP', 'service-push', '1', 'c4ca4238a0b923820dcc509a6f75849b', '2023-04-30 01:53:43', '2023-04-29 17:53:44', 'nacos', '183.233.81.30', 'U', '559c8da1-1e90-489d-b99d-381588f9d639', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (14, 36, 'service-order-dev.yaml', 'DEFAULT_GROUP', 'service-order', 'spring:\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://101.200.91.104:3306/service_order?characterEncoding=utf-8&serverTimezone=GMT%2B8\n    username: root\n    password: root', '1a12d4eb3eb8db5e89cefd91d0f6f69e', '2023-04-30 01:54:23', '2023-04-29 17:54:23', 'nacos', '183.233.81.30', 'U', '559c8da1-1e90-489d-b99d-381588f9d639', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (15, 37, 'service-passenger-dev.yaml', 'DEFAULT_GROUP', 'service-passenger', 'spring:\n  datasource:\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    url: jdbc:mysql://101.200.91.104:3306/service_passenger?characterEncoding=utf-8&serverTimezone=GMT%2B8\n    username: root\n    password: root', 'bae35b8a58119663d161ca70ef1eb002', '2023-04-30 01:54:45', '2023-04-29 17:54:45', 'nacos', '183.233.81.30', 'U', '559c8da1-1e90-489d-b99d-381588f9d639', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (0, 38, 'service-security-dev.yaml', 'DEFAULT_GROUP', 'service-security', '# springdoc-openapi项目配置\nspringdoc:\n  group-configs:\n    - group: \'security\'\n      packages-to-scan: org.online.security.controller', '7b6509ba44c56091140fd1b4520e0f55', '2023-04-30 01:56:33', '2023-04-29 17:56:33', 'nacos', '183.233.81.30', 'I', '559c8da1-1e90-489d-b99d-381588f9d639', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (30, 39, 'service-security-dev.yaml', 'DEFAULT_GROUP', 'service-security', '# springdoc-openapi项目配置\nspringdoc:\n  group-configs:\n    - group: \'security\'\n      packages-to-scan: org.online.security.controller', '7b6509ba44c56091140fd1b4520e0f55', '2023-04-30 01:56:33', '2023-04-29 17:56:33', 'nacos', '183.233.81.30', 'U', '559c8da1-1e90-489d-b99d-381588f9d639', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (0, 40, 'zipkin.yaml', 'DEFAULT_GROUP', '', 'spring:\n    zipkin:\n        enable: true\n        base-url: http://101.200.91.104:9411\n    sleuth:\n        sampler:\n            probability: 1', 'a50ef114e2a1e45f8811bd79c9476e47', '2023-04-30 02:18:27', '2023-04-29 18:18:27', 'nacos', '183.233.81.30', 'I', '559c8da1-1e90-489d-b99d-381588f9d639', '');
COMMIT;

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `role` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `resource` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `action` varchar(8) COLLATE utf8mb4_general_ci NOT NULL,
  UNIQUE KEY `uk_role_permission` (`role`,`resource`,`action`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of permissions
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `username` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `role` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  UNIQUE KEY `idx_user_role` (`username`,`role`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of roles
-- ----------------------------
BEGIN;
INSERT INTO `roles` (`username`, `role`) VALUES ('nacos', 'ROLE_ADMIN');
COMMIT;

-- ----------------------------
-- Table structure for tenant_capacity
-- ----------------------------
DROP TABLE IF EXISTS `tenant_capacity`;
CREATE TABLE `tenant_capacity` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Tenant ID',
  `quota` int unsigned NOT NULL DEFAULT '0' COMMENT '配额，0表示使用默认值',
  `usage` int unsigned NOT NULL DEFAULT '0' COMMENT '使用量',
  `max_size` int unsigned NOT NULL DEFAULT '0' COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int unsigned NOT NULL DEFAULT '0' COMMENT '聚合子配置最大个数',
  `max_aggr_size` int unsigned NOT NULL DEFAULT '0' COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int unsigned NOT NULL DEFAULT '0' COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='租户容量信息表';

-- ----------------------------
-- Records of tenant_capacity
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tenant_info
-- ----------------------------
DROP TABLE IF EXISTS `tenant_info`;
CREATE TABLE `tenant_info` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `kp` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'kp',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_id',
  `tenant_name` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_name',
  `tenant_desc` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT 'tenant_desc',
  `create_source` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'create_source',
  `gmt_create` bigint NOT NULL COMMENT '创建时间',
  `gmt_modified` bigint NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_tenant_info_kptenantid` (`kp`,`tenant_id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='tenant_info';

-- ----------------------------
-- Records of tenant_info
-- ----------------------------
BEGIN;
INSERT INTO `tenant_info` (`id`, `kp`, `tenant_id`, `tenant_name`, `tenant_desc`, `create_source`, `gmt_create`, `gmt_modified`) VALUES (2, '1', '559c8da1-1e90-489d-b99d-381588f9d639', 'dev', '开发环境', 'nacos', 1682788643766, 1682788643766);
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `username` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(500) COLLATE utf8mb4_general_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` (`username`, `password`, `enabled`) VALUES ('nacos', '$2a$10$EuWPZHzz32dJN7jexM34MOeYirDdFAZm2kuWj7VEOJhhZkDrxfvUu', 1);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
