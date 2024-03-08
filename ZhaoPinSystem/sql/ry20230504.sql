/*
 Navicat Premium Data Transfer

 Source Server         : java_mysql01
 Source Server Type    : MySQL
 Source Server Version : 80032
 Source Host           : localhost:3306
 Source Schema         : ry

 Target Server Type    : MySQL
 Target Server Version : 80032
 File Encoding         : 65001

 Date: 04/05/2023 22:14:33
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作 sub主子表操作）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1, 'student', '', NULL, NULL, 'Student', 'crud', 'com.ruoyi.system', 'system', 'student', NULL, 'ruoyi', '0', '/', NULL, 'admin', '2023-03-24 09:30:17', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (2, 'zhaopin', '', NULL, NULL, 'Zhaopin', 'crud', 'com.ruoyi.system', 'system', 'zhaopin', NULL, 'ruoyi', '0', '/', NULL, 'admin', '2023-03-29 19:50:04', '', NULL, NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(0) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1, '1', 'id', NULL, 'varchar(255)', 'String', 'id', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-03-24 09:30:18', '', NULL);
INSERT INTO `gen_table_column` VALUES (2, '1', 'name', NULL, 'varchar(255)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2023-03-24 09:30:18', '', NULL);
INSERT INTO `gen_table_column` VALUES (3, '1', 'age', NULL, 'int', 'Long', 'age', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-03-24 09:30:18', '', NULL);
INSERT INTO `gen_table_column` VALUES (4, '1', 'sex', NULL, 'varchar(255)', 'String', 'sex', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 4, 'admin', '2023-03-24 09:30:18', '', NULL);
INSERT INTO `gen_table_column` VALUES (5, '2', 'job_id', '岗位id', 'int', 'Long', 'jobId', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-03-29 19:50:04', '', NULL);
INSERT INTO `gen_table_column` VALUES (6, '2', 'job_name', '岗位名', 'varchar(255)', 'String', 'jobName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2023-03-29 19:50:04', '', NULL);
INSERT INTO `gen_table_column` VALUES (7, '2', 'job_salary', '薪资水平(高减低)', 'int', 'Long', 'jobSalary', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-03-29 19:50:04', '', NULL);
INSERT INTO `gen_table_column` VALUES (8, '2', 'status', '目前状态', 'char(255)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 4, 'admin', '2023-03-29 19:50:04', '', NULL);
INSERT INTO `gen_table_column` VALUES (9, '2', 'job_company', '所属公司', 'varchar(255)', 'String', 'jobCompany', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2023-03-29 19:50:04', '', NULL);
INSERT INTO `gen_table_column` VALUES (10, '2', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 6, 'admin', '2023-03-29 19:50:04', '', NULL);
INSERT INTO `gen_table_column` VALUES (11, '2', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 7, 'admin', '2023-03-29 19:50:04', '', NULL);

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '日历信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint(0) NOT NULL COMMENT '触发的时间',
  `sched_time` bigint(0) NOT NULL COMMENT '定时器制定的时间',
  `priority` int(0) NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '已触发的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '任务详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '暂停的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint(0) NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint(0) NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '调度器状态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint(0) NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint(0) NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint(0) NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int(0) NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int(0) NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint(0) NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint(0) NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint(0) NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint(0) NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int(0) NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint(0) NOT NULL COMMENT '开始时间',
  `end_time` bigint(0) NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint(0) NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '触发器详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '学号',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '姓名',
  `age` int(0) NULL DEFAULT NULL COMMENT '年龄',
  `sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '性别',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('2019', '201901', 19, '男');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2023-03-24 08:36:58', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2023-03-24 08:36:58', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2023-03-24 08:36:58', '', NULL, '深黑主题theme-dark，浅色主题theme-light，深蓝主题theme-blue');
INSERT INTO `sys_config` VALUES (4, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2023-03-24 08:36:58', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '用户管理-密码字符范围', 'sys.account.chrtype', '0', 'Y', 'admin', '2023-03-24 08:36:58', '', NULL, '默认任意字符范围，0任意（密码可以输入任意字符），1数字（密码只能为0-9数字），2英文字母（密码只能为a-z和A-Z字母），3字母和数字（密码必须包含字母，数字）,4字母数字和特殊字符（目前支持的特殊字符包括：~!@#$%^&*()-=_+）');
INSERT INTO `sys_config` VALUES (6, '用户管理-初始密码修改策略', 'sys.account.initPasswordModify', '0', 'Y', 'admin', '2023-03-24 08:36:58', '', NULL, '0：初始密码修改策略关闭，没有任何提示，1：提醒用户，如果未修改初始密码，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES (7, '用户管理-账号密码更新周期', 'sys.account.passwordValidateDays', '0', 'Y', 'admin', '2023-03-24 08:36:58', '', NULL, '密码更新周期（填写数字，数据初始化值为0不限制，若修改必须为大于0小于365的正整数），如果超过这个周期登录系统时，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES (8, '主框架页-菜单导航显示风格', 'sys.index.menuStyle', 'default', 'Y', 'admin', '2023-03-24 08:36:58', '', NULL, '菜单导航显示风格（default为左侧导航菜单，topnav为顶部导航菜单）');
INSERT INTO `sys_config` VALUES (9, '主框架页-是否开启页脚', 'sys.index.footer', 'true', 'Y', 'admin', '2023-03-24 08:36:58', '', NULL, '是否开启底部页脚显示（true显示，false隐藏）');
INSERT INTO `sys_config` VALUES (10, '主框架页-是否开启页签', 'sys.index.tagsView', 'true', 'Y', 'admin', '2023-03-24 08:36:58', '', NULL, '是否开启菜单多页签显示（true显示，false隐藏）');
INSERT INTO `sys_config` VALUES (11, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2023-03-24 08:36:58', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(0) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(0) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 204 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '计算机科学技术学院', 0, '院长', '18888888888', 'admin@qq.com', '0', '0', 'admin', '2023-03-24 08:36:57', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '网络工程系', 1, '网络系主任', '', '', '0', '0', 'admin', '2023-03-24 08:36:57', 'admin', '2023-03-26 22:50:26');
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '软件工程系', 2, '软件系主任', '', '', '0', '0', 'admin', '2023-03-24 08:36:57', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '网络19.1', 1, '', '', '', '0', '0', 'admin', '2023-03-24 08:36:57', 'admin', '2023-03-26 22:50:03');
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '网络19.2', 2, '', '', '', '0', '0', 'admin', '2023-03-24 08:36:57', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '网络20.1', 3, '', '', '', '0', '0', 'admin', '2023-03-24 08:36:57', 'admin', '2023-03-26 22:50:49');
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '网络20.2', 4, '', '', '', '0', '0', 'admin', '2023-03-24 08:36:57', 'admin', '2023-03-26 22:51:07');
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '软件19.1', 1, '', '', '', '0', '0', 'admin', '2023-03-24 08:36:57', 'admin', '2023-03-26 10:22:15');
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '软件19.2', 2, '', '', '', '0', '0', 'admin', '2023-03-24 08:36:57', 'admin', '2023-03-26 10:22:26');
INSERT INTO `sys_dept` VALUES (200, 101, '0,100,101', '网络22.1', 5, NULL, NULL, NULL, '0', '0', 'admin', '2023-03-26 10:20:10', '', NULL);
INSERT INTO `sys_dept` VALUES (201, 101, '0,100,101', '网络22.2', 6, NULL, NULL, NULL, '0', '0', 'admin', '2023-03-26 10:20:51', '', NULL);
INSERT INTO `sys_dept` VALUES (202, 102, '0,100,102', '软件19.3', 3, NULL, NULL, NULL, '0', '0', 'admin', '2023-03-26 10:22:06', '', NULL);
INSERT INTO `sys_dept` VALUES (203, 102, '0,100,102', '软件19.4', 4, NULL, NULL, NULL, '0', '0', 'admin', '2023-03-26 22:49:41', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(0) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2023-03-24 08:36:58', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-03-24 08:36:58', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-03-24 08:36:58', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2023-03-24 08:36:58', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2023-03-24 08:36:58', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正在招聘', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2023-03-24 08:36:58', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停止招聘', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2023-03-24 08:36:58', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2023-03-24 08:36:58', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '停用', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2023-03-24 08:36:58', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2023-03-24 08:36:58', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2023-03-24 08:36:58', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2023-03-24 08:36:58', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2023-03-24 08:36:58', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2023-03-24 08:36:58', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2023-03-24 08:36:58', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2023-03-24 08:36:58', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2023-03-24 08:36:58', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-03-24 08:36:58', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-03-24 08:36:58', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-03-24 08:36:58', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-03-24 08:36:58', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2023-03-24 08:36:58', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-03-24 08:36:58', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-03-24 08:36:58', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-03-24 08:36:58', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-03-24 08:36:58', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-03-24 08:36:58', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2023-03-24 08:36:58', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2023-03-24 08:36:58', '', NULL, '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2023-03-24 08:36:58', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2023-03-24 08:36:58', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2023-03-24 08:36:58', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2023-03-24 08:36:58', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2023-03-24 08:36:58', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2023-03-24 08:36:58', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2023-03-24 08:36:58', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2023-03-24 08:36:58', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2023-03-24 08:36:58', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2023-03-24 08:36:58', '', NULL, '登录状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2023-03-24 08:36:58', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2023-03-24 08:36:58', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2023-03-24 08:36:58', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status`) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 512 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-24 09:19:43');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-03-24 10:55:18');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-24 10:55:27');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-24 11:11:08');
INSERT INTO `sys_logininfor` VALUES (104, '2019150001', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-24 11:11:34');
INSERT INTO `sys_logininfor` VALUES (105, '2019150001', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-24 11:25:37');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-03-24 11:25:53');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-24 11:25:57');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-24 11:37:40');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-24 11:44:14');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-24 11:47:26');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-24 11:48:43');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-24 11:48:47');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-24 12:03:29');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-24 14:41:13');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-25 08:40:15');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '192.168.1.6', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-25 10:14:44');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-03-25 15:58:11');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-03-25 16:18:13');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-03-25 16:48:53');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-25 16:49:38');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-25 17:11:35');
INSERT INTO `sys_logininfor` VALUES (122, '2019150002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-03-25 17:11:53');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-25 17:13:22');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-25 17:13:47');
INSERT INTO `sys_logininfor` VALUES (125, '2019150002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-03-25 17:14:39');
INSERT INTO `sys_logininfor` VALUES (126, '2019150002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误1次', '2023-03-25 17:14:43');
INSERT INTO `sys_logininfor` VALUES (127, '2019150002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误2次', '2023-03-25 17:15:12');
INSERT INTO `sys_logininfor` VALUES (128, '2019150002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-03-25 17:15:18');
INSERT INTO `sys_logininfor` VALUES (129, '2019150002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-25 17:15:28');
INSERT INTO `sys_logininfor` VALUES (130, '2019150002', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '1', '密码输入错误1次', '2023-03-25 17:29:14');
INSERT INTO `sys_logininfor` VALUES (131, '2019150002', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '1', '密码输入错误2次', '2023-03-25 17:29:21');
INSERT INTO `sys_logininfor` VALUES (132, '2019150002', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '1', '密码输入错误3次', '2023-03-25 17:29:29');
INSERT INTO `sys_logininfor` VALUES (133, '2019150002', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '1', '密码输入错误4次', '2023-03-25 17:29:34');
INSERT INTO `sys_logininfor` VALUES (134, '2019150002', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-03-25 17:29:57');
INSERT INTO `sys_logininfor` VALUES (135, '2019150002', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '退出成功', '2023-03-25 17:36:01');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-03-25 17:36:22');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-03-25 17:39:43');
INSERT INTO `sys_logininfor` VALUES (138, '2019150002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-25 17:47:40');
INSERT INTO `sys_logininfor` VALUES (139, '2019150002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-25 17:47:50');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-25 17:47:55');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-25 17:56:09');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-03-25 17:58:31');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-25 19:35:17');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-25 19:40:21');
INSERT INTO `sys_logininfor` VALUES (145, '2019150002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-25 19:40:37');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-25 20:12:51');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-25 21:25:02');
INSERT INTO `sys_logininfor` VALUES (148, '2019150002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-25 21:25:15');
INSERT INTO `sys_logininfor` VALUES (149, '2019150002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-25 21:27:09');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-25 21:27:17');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-25 21:37:52');
INSERT INTO `sys_logininfor` VALUES (152, '2019150002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-25 21:38:05');
INSERT INTO `sys_logininfor` VALUES (153, '2019150002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-25 21:53:35');
INSERT INTO `sys_logininfor` VALUES (154, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-25 21:53:41');
INSERT INTO `sys_logininfor` VALUES (155, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-25 21:54:04');
INSERT INTO `sys_logininfor` VALUES (156, '20190002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-03-25 21:54:23');
INSERT INTO `sys_logininfor` VALUES (157, '20190002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-03-25 21:54:28');
INSERT INTO `sys_logininfor` VALUES (158, '20190002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-03-25 21:54:31');
INSERT INTO `sys_logininfor` VALUES (159, '2019150002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-25 21:54:40');
INSERT INTO `sys_logininfor` VALUES (160, '2019150002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-25 22:40:59');
INSERT INTO `sys_logininfor` VALUES (161, '2019150002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-25 22:41:04');
INSERT INTO `sys_logininfor` VALUES (162, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-25 22:41:08');
INSERT INTO `sys_logininfor` VALUES (163, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-26 08:36:04');
INSERT INTO `sys_logininfor` VALUES (164, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-26 08:50:43');
INSERT INTO `sys_logininfor` VALUES (165, 'ry', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误1次', '2023-03-26 08:50:53');
INSERT INTO `sys_logininfor` VALUES (166, 'ry', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-26 08:51:04');
INSERT INTO `sys_logininfor` VALUES (167, 'ry', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-26 08:51:44');
INSERT INTO `sys_logininfor` VALUES (168, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-26 08:52:00');
INSERT INTO `sys_logininfor` VALUES (169, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-26 09:02:54');
INSERT INTO `sys_logininfor` VALUES (170, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-26 09:07:31');
INSERT INTO `sys_logininfor` VALUES (171, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-26 09:27:35');
INSERT INTO `sys_logininfor` VALUES (172, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-26 10:00:20');
INSERT INTO `sys_logininfor` VALUES (173, '2019150001', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-26 10:00:38');
INSERT INTO `sys_logininfor` VALUES (174, '2019150001', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-26 10:10:04');
INSERT INTO `sys_logininfor` VALUES (175, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-26 10:10:09');
INSERT INTO `sys_logininfor` VALUES (176, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-26 10:11:08');
INSERT INTO `sys_logininfor` VALUES (177, '2019150001', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-26 10:11:29');
INSERT INTO `sys_logininfor` VALUES (178, '2019150001', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-26 10:18:11');
INSERT INTO `sys_logininfor` VALUES (179, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-26 10:18:21');
INSERT INTO `sys_logininfor` VALUES (180, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-26 10:22:59');
INSERT INTO `sys_logininfor` VALUES (181, '2019150001', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-26 10:23:14');
INSERT INTO `sys_logininfor` VALUES (182, '2019150001', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-26 10:30:32');
INSERT INTO `sys_logininfor` VALUES (183, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-26 10:30:35');
INSERT INTO `sys_logininfor` VALUES (184, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-26 11:08:45');
INSERT INTO `sys_logininfor` VALUES (185, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-26 11:22:07');
INSERT INTO `sys_logininfor` VALUES (186, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-26 11:40:16');
INSERT INTO `sys_logininfor` VALUES (187, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-26 11:47:07');
INSERT INTO `sys_logininfor` VALUES (188, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-26 11:56:11');
INSERT INTO `sys_logininfor` VALUES (189, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-26 11:59:19');
INSERT INTO `sys_logininfor` VALUES (190, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-26 12:00:49');
INSERT INTO `sys_logininfor` VALUES (191, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-26 12:02:29');
INSERT INTO `sys_logininfor` VALUES (192, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-26 12:06:43');
INSERT INTO `sys_logininfor` VALUES (193, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-26 12:13:33');
INSERT INTO `sys_logininfor` VALUES (194, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-26 12:15:22');
INSERT INTO `sys_logininfor` VALUES (195, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-26 15:35:40');
INSERT INTO `sys_logininfor` VALUES (196, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-26 15:40:48');
INSERT INTO `sys_logininfor` VALUES (197, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-26 15:41:41');
INSERT INTO `sys_logininfor` VALUES (198, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-26 15:44:05');
INSERT INTO `sys_logininfor` VALUES (199, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-26 15:46:15');
INSERT INTO `sys_logininfor` VALUES (200, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-26 15:50:08');
INSERT INTO `sys_logininfor` VALUES (201, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-26 15:55:05');
INSERT INTO `sys_logininfor` VALUES (202, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-26 15:58:18');
INSERT INTO `sys_logininfor` VALUES (203, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-26 16:03:20');
INSERT INTO `sys_logininfor` VALUES (204, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-26 16:03:59');
INSERT INTO `sys_logininfor` VALUES (205, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-26 16:07:19');
INSERT INTO `sys_logininfor` VALUES (206, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-26 16:08:36');
INSERT INTO `sys_logininfor` VALUES (207, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-26 16:10:27');
INSERT INTO `sys_logininfor` VALUES (208, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-26 16:11:40');
INSERT INTO `sys_logininfor` VALUES (209, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-26 16:15:40');
INSERT INTO `sys_logininfor` VALUES (210, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-26 16:16:44');
INSERT INTO `sys_logininfor` VALUES (211, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-26 16:20:00');
INSERT INTO `sys_logininfor` VALUES (212, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-26 16:25:15');
INSERT INTO `sys_logininfor` VALUES (213, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-26 16:27:06');
INSERT INTO `sys_logininfor` VALUES (214, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-26 20:12:35');
INSERT INTO `sys_logininfor` VALUES (215, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-26 20:54:35');
INSERT INTO `sys_logininfor` VALUES (216, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-26 21:48:32');
INSERT INTO `sys_logininfor` VALUES (217, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-26 22:00:21');
INSERT INTO `sys_logininfor` VALUES (218, '2019150002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-26 22:00:35');
INSERT INTO `sys_logininfor` VALUES (219, '2019150002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-26 22:01:01');
INSERT INTO `sys_logininfor` VALUES (220, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-26 22:01:15');
INSERT INTO `sys_logininfor` VALUES (221, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-26 22:02:08');
INSERT INTO `sys_logininfor` VALUES (222, '2019150002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-26 22:02:22');
INSERT INTO `sys_logininfor` VALUES (223, '2019150002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-26 22:09:20');
INSERT INTO `sys_logininfor` VALUES (224, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-03-26 22:09:26');
INSERT INTO `sys_logininfor` VALUES (225, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-26 22:09:30');
INSERT INTO `sys_logininfor` VALUES (226, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-26 23:05:32');
INSERT INTO `sys_logininfor` VALUES (227, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-26 23:09:42');
INSERT INTO `sys_logininfor` VALUES (228, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-27 08:26:00');
INSERT INTO `sys_logininfor` VALUES (229, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-27 11:08:06');
INSERT INTO `sys_logininfor` VALUES (230, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-27 12:01:49');
INSERT INTO `sys_logininfor` VALUES (231, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-27 16:13:07');
INSERT INTO `sys_logininfor` VALUES (232, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-27 18:46:25');
INSERT INTO `sys_logininfor` VALUES (233, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 10', '0', '登录成功', '2023-03-27 19:19:13');
INSERT INTO `sys_logininfor` VALUES (234, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-27 19:19:44');
INSERT INTO `sys_logininfor` VALUES (235, 'admin', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-03-27 19:22:32');
INSERT INTO `sys_logininfor` VALUES (236, 'admin', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '退出成功', '2023-03-27 19:22:45');
INSERT INTO `sys_logininfor` VALUES (237, '2019150002', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-03-27 19:23:04');
INSERT INTO `sys_logininfor` VALUES (238, '2019150002', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '退出成功', '2023-03-27 19:25:06');
INSERT INTO `sys_logininfor` VALUES (239, 'admin', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-03-27 19:25:13');
INSERT INTO `sys_logininfor` VALUES (240, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-27 19:25:57');
INSERT INTO `sys_logininfor` VALUES (241, '2019150002', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-03-27 19:33:42');
INSERT INTO `sys_logininfor` VALUES (242, '2019150002', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-03-27 19:35:11');
INSERT INTO `sys_logininfor` VALUES (243, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-27 19:36:31');
INSERT INTO `sys_logininfor` VALUES (244, 'admin', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-03-27 19:37:50');
INSERT INTO `sys_logininfor` VALUES (245, 'admin', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-03-27 19:41:15');
INSERT INTO `sys_logininfor` VALUES (246, '2019150002', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-03-27 19:43:03');
INSERT INTO `sys_logininfor` VALUES (247, '2019150002', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '1', '验证码错误', '2023-03-27 19:44:55');
INSERT INTO `sys_logininfor` VALUES (248, '2019150002', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-03-27 19:45:00');
INSERT INTO `sys_logininfor` VALUES (249, '2019150002', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '1', '验证码错误', '2023-03-27 19:46:42');
INSERT INTO `sys_logininfor` VALUES (250, '2019150002', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-03-27 19:46:48');
INSERT INTO `sys_logininfor` VALUES (251, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-27 19:48:50');
INSERT INTO `sys_logininfor` VALUES (252, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-03-27 19:49:28');
INSERT INTO `sys_logininfor` VALUES (253, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-27 19:49:32');
INSERT INTO `sys_logininfor` VALUES (254, '2019150002', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '1', '验证码错误', '2023-03-27 19:51:02');
INSERT INTO `sys_logininfor` VALUES (255, '2019150002', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-03-27 19:51:15');
INSERT INTO `sys_logininfor` VALUES (256, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-28 22:13:43');
INSERT INTO `sys_logininfor` VALUES (257, 'admin', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-03-28 22:14:55');
INSERT INTO `sys_logininfor` VALUES (258, 'admin', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '退出成功', '2023-03-28 22:15:35');
INSERT INTO `sys_logininfor` VALUES (259, '2019150002', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-03-28 22:16:50');
INSERT INTO `sys_logininfor` VALUES (260, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-28 22:42:06');
INSERT INTO `sys_logininfor` VALUES (261, '2019150002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误1次', '2023-03-28 22:42:29');
INSERT INTO `sys_logininfor` VALUES (262, '2019150002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误2次', '2023-03-28 22:42:37');
INSERT INTO `sys_logininfor` VALUES (263, '2019150002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-28 22:42:55');
INSERT INTO `sys_logininfor` VALUES (264, '2019150002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-28 22:43:46');
INSERT INTO `sys_logininfor` VALUES (265, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-28 22:43:50');
INSERT INTO `sys_logininfor` VALUES (266, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-28 22:44:59');
INSERT INTO `sys_logininfor` VALUES (267, '2019150002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-28 22:45:13');
INSERT INTO `sys_logininfor` VALUES (268, '2019150002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-28 22:45:36');
INSERT INTO `sys_logininfor` VALUES (269, '2019150002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-28 22:45:50');
INSERT INTO `sys_logininfor` VALUES (270, '2019150002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-28 22:45:55');
INSERT INTO `sys_logininfor` VALUES (271, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-28 22:45:58');
INSERT INTO `sys_logininfor` VALUES (272, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-28 22:46:21');
INSERT INTO `sys_logininfor` VALUES (273, '20190002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-03-28 22:46:39');
INSERT INTO `sys_logininfor` VALUES (274, '2019150002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-28 22:46:47');
INSERT INTO `sys_logininfor` VALUES (275, '2019150002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-28 22:52:05');
INSERT INTO `sys_logininfor` VALUES (276, '2019150002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-28 22:52:19');
INSERT INTO `sys_logininfor` VALUES (277, '2019150002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-28 22:52:25');
INSERT INTO `sys_logininfor` VALUES (278, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-28 22:52:32');
INSERT INTO `sys_logininfor` VALUES (279, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-29 16:03:25');
INSERT INTO `sys_logininfor` VALUES (280, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-29 16:56:51');
INSERT INTO `sys_logininfor` VALUES (281, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-29 17:35:05');
INSERT INTO `sys_logininfor` VALUES (282, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-29 17:35:49');
INSERT INTO `sys_logininfor` VALUES (283, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-29 17:37:13');
INSERT INTO `sys_logininfor` VALUES (284, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-29 17:41:10');
INSERT INTO `sys_logininfor` VALUES (285, '201915030116', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-03-29 17:41:28');
INSERT INTO `sys_logininfor` VALUES (286, '2019150002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-29 17:41:37');
INSERT INTO `sys_logininfor` VALUES (287, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-29 17:44:26');
INSERT INTO `sys_logininfor` VALUES (288, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-29 17:44:36');
INSERT INTO `sys_logininfor` VALUES (289, '2019150002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-29 17:44:57');
INSERT INTO `sys_logininfor` VALUES (290, '2019150002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-29 17:51:58');
INSERT INTO `sys_logininfor` VALUES (291, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-29 17:52:12');
INSERT INTO `sys_logininfor` VALUES (292, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-29 17:53:07');
INSERT INTO `sys_logininfor` VALUES (293, '2019150002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-29 17:53:19');
INSERT INTO `sys_logininfor` VALUES (294, '2019150002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-29 17:53:34');
INSERT INTO `sys_logininfor` VALUES (295, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-29 17:53:49');
INSERT INTO `sys_logininfor` VALUES (296, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-29 17:54:48');
INSERT INTO `sys_logininfor` VALUES (297, '2019150002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-29 17:55:06');
INSERT INTO `sys_logininfor` VALUES (298, '2019150002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-29 18:02:05');
INSERT INTO `sys_logininfor` VALUES (299, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-29 18:52:23');
INSERT INTO `sys_logininfor` VALUES (300, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-29 18:57:52');
INSERT INTO `sys_logininfor` VALUES (301, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-29 20:06:41');
INSERT INTO `sys_logininfor` VALUES (302, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-29 20:08:16');
INSERT INTO `sys_logininfor` VALUES (303, '2019150002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-29 20:08:28');
INSERT INTO `sys_logininfor` VALUES (304, '2019150002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-29 20:08:48');
INSERT INTO `sys_logininfor` VALUES (305, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-29 20:08:53');
INSERT INTO `sys_logininfor` VALUES (306, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-29 20:09:34');
INSERT INTO `sys_logininfor` VALUES (307, '2019150002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-29 20:09:45');
INSERT INTO `sys_logininfor` VALUES (308, '2019150002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-29 20:09:55');
INSERT INTO `sys_logininfor` VALUES (309, '2019150002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-29 20:10:08');
INSERT INTO `sys_logininfor` VALUES (310, '2019150002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-29 20:11:27');
INSERT INTO `sys_logininfor` VALUES (311, '2019150002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-29 20:11:38');
INSERT INTO `sys_logininfor` VALUES (312, '2019150002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-29 20:11:42');
INSERT INTO `sys_logininfor` VALUES (313, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-29 20:11:46');
INSERT INTO `sys_logininfor` VALUES (314, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-29 20:12:29');
INSERT INTO `sys_logininfor` VALUES (315, '2019150002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-29 20:12:46');
INSERT INTO `sys_logininfor` VALUES (316, '2019150002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-29 20:13:18');
INSERT INTO `sys_logininfor` VALUES (317, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-29 20:13:28');
INSERT INTO `sys_logininfor` VALUES (318, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-29 20:15:45');
INSERT INTO `sys_logininfor` VALUES (319, '2019150002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误1次', '2023-03-29 20:15:55');
INSERT INTO `sys_logininfor` VALUES (320, '2019150002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-29 20:16:08');
INSERT INTO `sys_logininfor` VALUES (321, '2019150002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-29 20:16:47');
INSERT INTO `sys_logininfor` VALUES (322, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-29 20:16:57');
INSERT INTO `sys_logininfor` VALUES (323, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-29 20:24:07');
INSERT INTO `sys_logininfor` VALUES (324, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-29 20:35:14');
INSERT INTO `sys_logininfor` VALUES (325, '2019150002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-29 20:35:28');
INSERT INTO `sys_logininfor` VALUES (326, '2019150002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-29 20:35:40');
INSERT INTO `sys_logininfor` VALUES (327, '2019150002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-29 20:35:59');
INSERT INTO `sys_logininfor` VALUES (328, '2019150002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-29 20:50:03');
INSERT INTO `sys_logininfor` VALUES (329, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-29 20:50:09');
INSERT INTO `sys_logininfor` VALUES (330, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-29 21:26:30');
INSERT INTO `sys_logininfor` VALUES (331, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-29 21:28:31');
INSERT INTO `sys_logininfor` VALUES (332, '2019150002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-29 21:28:42');
INSERT INTO `sys_logininfor` VALUES (333, '2019150002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-29 21:33:39');
INSERT INTO `sys_logininfor` VALUES (334, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-29 21:33:43');
INSERT INTO `sys_logininfor` VALUES (335, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-29 21:38:36');
INSERT INTO `sys_logininfor` VALUES (336, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-29 21:45:22');
INSERT INTO `sys_logininfor` VALUES (337, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-03-29 21:58:12');
INSERT INTO `sys_logininfor` VALUES (338, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-29 21:58:18');
INSERT INTO `sys_logininfor` VALUES (339, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-29 22:11:01');
INSERT INTO `sys_logininfor` VALUES (340, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-29 22:36:38');
INSERT INTO `sys_logininfor` VALUES (341, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-29 22:37:18');
INSERT INTO `sys_logininfor` VALUES (342, '2019150002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-29 22:37:29');
INSERT INTO `sys_logininfor` VALUES (343, '2019150002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-29 22:38:04');
INSERT INTO `sys_logininfor` VALUES (344, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-03-29 22:38:35');
INSERT INTO `sys_logininfor` VALUES (345, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-29 22:38:39');
INSERT INTO `sys_logininfor` VALUES (346, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-03-29 22:41:35');
INSERT INTO `sys_logininfor` VALUES (347, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-29 22:41:38');
INSERT INTO `sys_logininfor` VALUES (348, 'admin', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-03-29 22:46:29');
INSERT INTO `sys_logininfor` VALUES (349, 'admin', '192.168.1.5', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2023-03-29 22:49:38');
INSERT INTO `sys_logininfor` VALUES (350, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-30 17:31:46');
INSERT INTO `sys_logininfor` VALUES (351, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-30 17:38:53');
INSERT INTO `sys_logininfor` VALUES (352, '2019150002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-30 17:39:02');
INSERT INTO `sys_logininfor` VALUES (353, '2019150002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-30 17:39:32');
INSERT INTO `sys_logininfor` VALUES (354, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-30 17:39:40');
INSERT INTO `sys_logininfor` VALUES (355, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-30 17:46:21');
INSERT INTO `sys_logininfor` VALUES (356, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-30 17:46:31');
INSERT INTO `sys_logininfor` VALUES (357, '2019150002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-30 17:46:46');
INSERT INTO `sys_logininfor` VALUES (358, '2019150002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-30 17:47:19');
INSERT INTO `sys_logininfor` VALUES (359, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-30 17:47:25');
INSERT INTO `sys_logininfor` VALUES (360, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-30 17:50:00');
INSERT INTO `sys_logininfor` VALUES (361, '2019150002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-30 17:50:11');
INSERT INTO `sys_logininfor` VALUES (362, '2019150002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-30 17:52:46');
INSERT INTO `sys_logininfor` VALUES (363, '2019150002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-30 17:52:58');
INSERT INTO `sys_logininfor` VALUES (364, '2019150002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-30 17:53:03');
INSERT INTO `sys_logininfor` VALUES (365, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-03-30 17:53:09');
INSERT INTO `sys_logininfor` VALUES (366, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-30 17:53:13');
INSERT INTO `sys_logininfor` VALUES (367, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-30 19:39:57');
INSERT INTO `sys_logininfor` VALUES (368, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-30 19:41:07');
INSERT INTO `sys_logininfor` VALUES (369, '2019150002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-30 19:41:16');
INSERT INTO `sys_logininfor` VALUES (370, '2019150002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-30 19:41:42');
INSERT INTO `sys_logininfor` VALUES (371, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-30 19:41:46');
INSERT INTO `sys_logininfor` VALUES (372, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-30 19:43:27');
INSERT INTO `sys_logininfor` VALUES (373, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-30 19:43:31');
INSERT INTO `sys_logininfor` VALUES (374, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-30 19:43:56');
INSERT INTO `sys_logininfor` VALUES (375, '2019150002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-30 19:44:05');
INSERT INTO `sys_logininfor` VALUES (376, '2019150002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-30 19:44:36');
INSERT INTO `sys_logininfor` VALUES (377, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-03-30 19:44:42');
INSERT INTO `sys_logininfor` VALUES (378, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-30 19:44:45');
INSERT INTO `sys_logininfor` VALUES (379, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-30 19:46:09');
INSERT INTO `sys_logininfor` VALUES (380, '2019150002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-30 19:46:18');
INSERT INTO `sys_logininfor` VALUES (381, '2019150002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-30 19:46:40');
INSERT INTO `sys_logininfor` VALUES (382, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-30 19:46:43');
INSERT INTO `sys_logininfor` VALUES (383, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-30 19:47:21');
INSERT INTO `sys_logininfor` VALUES (384, '2019150002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-30 19:47:29');
INSERT INTO `sys_logininfor` VALUES (385, '2019150002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-30 20:06:56');
INSERT INTO `sys_logininfor` VALUES (386, '2019150002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-30 20:07:15');
INSERT INTO `sys_logininfor` VALUES (387, '2019150002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-30 20:07:20');
INSERT INTO `sys_logininfor` VALUES (388, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-30 20:07:24');
INSERT INTO `sys_logininfor` VALUES (389, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-30 20:11:37');
INSERT INTO `sys_logininfor` VALUES (390, '2019150002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-30 20:11:46');
INSERT INTO `sys_logininfor` VALUES (391, '2019150002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-30 20:12:00');
INSERT INTO `sys_logininfor` VALUES (392, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-30 20:12:04');
INSERT INTO `sys_logininfor` VALUES (393, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-30 20:18:06');
INSERT INTO `sys_logininfor` VALUES (394, '2019150002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-30 20:18:21');
INSERT INTO `sys_logininfor` VALUES (395, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-30 20:34:28');
INSERT INTO `sys_logininfor` VALUES (396, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-30 21:09:16');
INSERT INTO `sys_logininfor` VALUES (397, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-03-30 21:20:12');
INSERT INTO `sys_logininfor` VALUES (398, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-30 21:20:18');
INSERT INTO `sys_logininfor` VALUES (399, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-30 21:36:46');
INSERT INTO `sys_logininfor` VALUES (400, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-30 21:43:43');
INSERT INTO `sys_logininfor` VALUES (401, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-30 21:55:53');
INSERT INTO `sys_logininfor` VALUES (402, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-30 22:00:11');
INSERT INTO `sys_logininfor` VALUES (403, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-30 22:08:30');
INSERT INTO `sys_logininfor` VALUES (404, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-30 22:27:29');
INSERT INTO `sys_logininfor` VALUES (405, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-03-30 22:40:39');
INSERT INTO `sys_logininfor` VALUES (406, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-30 22:40:43');
INSERT INTO `sys_logininfor` VALUES (407, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-30 22:57:15');
INSERT INTO `sys_logininfor` VALUES (408, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-30 22:57:30');
INSERT INTO `sys_logininfor` VALUES (409, '2019150002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-30 22:57:40');
INSERT INTO `sys_logininfor` VALUES (410, '2019150002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-30 22:58:01');
INSERT INTO `sys_logininfor` VALUES (411, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-30 22:58:07');
INSERT INTO `sys_logininfor` VALUES (412, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-30 22:58:45');
INSERT INTO `sys_logininfor` VALUES (413, '20190002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-03-30 22:58:57');
INSERT INTO `sys_logininfor` VALUES (414, '20190002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-03-30 22:59:00');
INSERT INTO `sys_logininfor` VALUES (415, '20190002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-03-30 22:59:04');
INSERT INTO `sys_logininfor` VALUES (416, '2019150002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-30 22:59:12');
INSERT INTO `sys_logininfor` VALUES (417, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-01 10:15:24');
INSERT INTO `sys_logininfor` VALUES (418, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-01 10:51:38');
INSERT INTO `sys_logininfor` VALUES (419, 'SQT', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误1次', '2023-04-01 11:24:04');
INSERT INTO `sys_logininfor` VALUES (420, 'SQT', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误2次', '2023-04-01 11:24:13');
INSERT INTO `sys_logininfor` VALUES (421, 'SQT', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误3次', '2023-04-01 11:25:06');
INSERT INTO `sys_logininfor` VALUES (422, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误1次', '2023-04-01 11:25:16');
INSERT INTO `sys_logininfor` VALUES (423, '2019150002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-01 11:25:27');
INSERT INTO `sys_logininfor` VALUES (424, '2019150002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-04-01 11:25:38');
INSERT INTO `sys_logininfor` VALUES (425, 'SQT', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误4次', '2023-04-01 11:26:23');
INSERT INTO `sys_logininfor` VALUES (426, 'SQT', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误5次', '2023-04-01 11:26:26');
INSERT INTO `sys_logininfor` VALUES (427, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-01 11:27:12');
INSERT INTO `sys_logininfor` VALUES (428, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-04-01 11:33:26');
INSERT INTO `sys_logininfor` VALUES (429, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-01 11:34:09');
INSERT INTO `sys_logininfor` VALUES (430, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-04-01 11:35:05');
INSERT INTO `sys_logininfor` VALUES (431, 'SQT', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误5次，帐户锁定10分钟', '2023-04-01 11:35:16');
INSERT INTO `sys_logininfor` VALUES (432, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-01 11:35:36');
INSERT INTO `sys_logininfor` VALUES (433, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-04-01 11:36:17');
INSERT INTO `sys_logininfor` VALUES (434, 'SQT', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误5次，帐户锁定10分钟', '2023-04-01 11:36:23');
INSERT INTO `sys_logininfor` VALUES (435, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-01 11:36:38');
INSERT INTO `sys_logininfor` VALUES (436, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-04-01 11:41:19');
INSERT INTO `sys_logininfor` VALUES (437, '201915030116', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误1次', '2023-04-01 11:41:31');
INSERT INTO `sys_logininfor` VALUES (438, '201915030116', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-04-01 11:41:33');
INSERT INTO `sys_logininfor` VALUES (439, '2019150002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-04-01 11:41:45');
INSERT INTO `sys_logininfor` VALUES (440, '201915030116', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-04-01 11:42:22');
INSERT INTO `sys_logininfor` VALUES (441, '201915030116', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误2次', '2023-04-01 11:42:27');
INSERT INTO `sys_logininfor` VALUES (442, '201915030116', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误1次', '2023-04-01 11:43:25');
INSERT INTO `sys_logininfor` VALUES (443, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-01 11:43:33');
INSERT INTO `sys_logininfor` VALUES (444, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-04-01 11:43:36');
INSERT INTO `sys_logininfor` VALUES (445, '2019150002', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-04-01 11:43:48');
INSERT INTO `sys_logininfor` VALUES (446, '201915030101', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误1次', '2023-04-01 11:43:58');
INSERT INTO `sys_logininfor` VALUES (447, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-01 11:44:11');
INSERT INTO `sys_logininfor` VALUES (448, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-04-01 11:48:34');
INSERT INTO `sys_logininfor` VALUES (449, '201901', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-04-01 11:48:42');
INSERT INTO `sys_logininfor` VALUES (450, '201901', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-04-01 11:49:20');
INSERT INTO `sys_logininfor` VALUES (451, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-01 11:49:30');
INSERT INTO `sys_logininfor` VALUES (452, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-04-01 12:01:26');
INSERT INTO `sys_logininfor` VALUES (453, '201915030116', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-01 12:01:38');
INSERT INTO `sys_logininfor` VALUES (454, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-01 21:17:27');
INSERT INTO `sys_logininfor` VALUES (455, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-03 17:13:42');
INSERT INTO `sys_logininfor` VALUES (456, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-04-03 17:37:43');
INSERT INTO `sys_logininfor` VALUES (457, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-03 17:37:47');
INSERT INTO `sys_logininfor` VALUES (458, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-04-03 17:37:53');
INSERT INTO `sys_logininfor` VALUES (459, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-03 17:37:57');
INSERT INTO `sys_logininfor` VALUES (460, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-04-03 17:38:01');
INSERT INTO `sys_logininfor` VALUES (461, '201915030101', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-03 17:38:11');
INSERT INTO `sys_logininfor` VALUES (462, '201915030101', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-04-03 17:39:36');
INSERT INTO `sys_logininfor` VALUES (463, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-03 17:39:44');
INSERT INTO `sys_logininfor` VALUES (464, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-03 21:38:32');
INSERT INTO `sys_logininfor` VALUES (465, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-19 17:03:27');
INSERT INTO `sys_logininfor` VALUES (466, '201915030116', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-19 17:13:37');
INSERT INTO `sys_logininfor` VALUES (467, '201915030116', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-19 19:36:08');
INSERT INTO `sys_logininfor` VALUES (468, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-19 20:29:00');
INSERT INTO `sys_logininfor` VALUES (469, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-04-19 20:33:56');
INSERT INTO `sys_logininfor` VALUES (470, '201915030116', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-19 20:34:15');
INSERT INTO `sys_logininfor` VALUES (471, '201915030116', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-04-19 20:34:53');
INSERT INTO `sys_logininfor` VALUES (472, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-19 20:35:03');
INSERT INTO `sys_logininfor` VALUES (473, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-04-19 20:35:50');
INSERT INTO `sys_logininfor` VALUES (474, '201915030116', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-19 20:35:57');
INSERT INTO `sys_logininfor` VALUES (475, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-04-21 16:15:25');
INSERT INTO `sys_logininfor` VALUES (476, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-21 16:15:31');
INSERT INTO `sys_logininfor` VALUES (477, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-22 22:24:33');
INSERT INTO `sys_logininfor` VALUES (478, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-04-22 22:25:58');
INSERT INTO `sys_logininfor` VALUES (479, '2019150001', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-04-22 22:26:29');
INSERT INTO `sys_logininfor` VALUES (480, '2019150001', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-04-22 22:26:35');
INSERT INTO `sys_logininfor` VALUES (481, '201915030101', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-22 22:27:01');
INSERT INTO `sys_logininfor` VALUES (482, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-24 13:16:54');
INSERT INTO `sys_logininfor` VALUES (483, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-24 14:43:17');
INSERT INTO `sys_logininfor` VALUES (484, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-24 14:49:03');
INSERT INTO `sys_logininfor` VALUES (485, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-24 19:01:45');
INSERT INTO `sys_logininfor` VALUES (486, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-04-24 19:36:47');
INSERT INTO `sys_logininfor` VALUES (487, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-24 19:36:56');
INSERT INTO `sys_logininfor` VALUES (488, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-24 20:39:15');
INSERT INTO `sys_logininfor` VALUES (489, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-25 13:16:33');
INSERT INTO `sys_logininfor` VALUES (490, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-26 16:09:36');
INSERT INTO `sys_logininfor` VALUES (491, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-26 16:35:16');
INSERT INTO `sys_logininfor` VALUES (492, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-26 16:44:08');
INSERT INTO `sys_logininfor` VALUES (493, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-26 16:54:59');
INSERT INTO `sys_logininfor` VALUES (494, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-26 17:24:05');
INSERT INTO `sys_logininfor` VALUES (495, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-26 19:05:53');
INSERT INTO `sys_logininfor` VALUES (496, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-04-26 19:08:38');
INSERT INTO `sys_logininfor` VALUES (497, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-26 19:08:45');
INSERT INTO `sys_logininfor` VALUES (498, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-26 20:38:17');
INSERT INTO `sys_logininfor` VALUES (499, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-26 20:45:53');
INSERT INTO `sys_logininfor` VALUES (500, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-26 20:52:57');
INSERT INTO `sys_logininfor` VALUES (501, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-26 20:55:35');
INSERT INTO `sys_logininfor` VALUES (502, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-26 21:09:17');
INSERT INTO `sys_logininfor` VALUES (503, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-29 11:48:05');
INSERT INTO `sys_logininfor` VALUES (504, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-29 15:09:25');
INSERT INTO `sys_logininfor` VALUES (505, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-29 15:15:10');
INSERT INTO `sys_logininfor` VALUES (506, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-29 15:35:55');
INSERT INTO `sys_logininfor` VALUES (507, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-29 23:34:46');
INSERT INTO `sys_logininfor` VALUES (508, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-29 23:41:04');
INSERT INTO `sys_logininfor` VALUES (509, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-04-29 23:42:41');
INSERT INTO `sys_logininfor` VALUES (510, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-04 21:05:13');
INSERT INTO `sys_logininfor` VALUES (511, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-04 21:28:07');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(0) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(0) NULL DEFAULT 0 COMMENT '显示顺序',
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '#' COMMENT '请求地址',
  `target` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '打开方式（menuItem页签 menuBlank新窗口）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `is_refresh` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '是否刷新（0刷新 1不刷新）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2028 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 4, '#', 'menuItem', 'M', '0', '1', '', 'fa fa-gear', 'admin', '2023-03-24 08:36:57', 'admin', '2023-04-24 13:19:05', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 5, '#', 'menuItem', 'M', '0', '1', '', 'fa fa-video-camera', 'admin', '2023-03-24 08:36:57', 'admin', '2023-04-24 13:19:15', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 1110, '#', 'menuItem', 'M', '0', '1', '', 'fa fa-bars', 'admin', '2023-03-24 08:36:57', 'admin', '2023-03-29 19:24:06', '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '若依官网', 0, 1111, 'http://ruoyi.vip', 'menuBlank', 'C', '1', '1', '', 'fa fa-location-arrow', 'admin', '2023-03-24 08:36:57', 'admin', '2023-03-26 22:11:07', '若依官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, '/system/user', '', 'C', '0', '1', 'system:user:view', 'fa fa-user-o', 'admin', '2023-03-24 08:36:57', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, '/system/role', '', 'C', '0', '1', 'system:role:view', 'fa fa-user-secret', 'admin', '2023-03-24 08:36:57', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, '/system/menu', '', 'C', '0', '1', 'system:menu:view', 'fa fa-th-list', 'admin', '2023-03-24 08:36:57', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '班级管理', 1, 4, '/system/dept', 'menuItem', 'C', '0', '1', 'system:dept:view', 'fa fa-outdent', 'admin', '2023-03-24 08:36:57', 'admin', '2023-03-27 08:26:39', '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, '/system/jiuye', 'menuItem', 'C', '1', '1', 'system:jiuye:view', 'fa fa-address-card-o', 'admin', '2023-03-24 08:36:57', 'admin', '2023-03-30 20:08:14', '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, '/system/dict', 'menuItem', 'C', '1', '1', 'system:dict:view', 'fa fa-bookmark-o', 'admin', '2023-03-24 08:36:57', 'admin', '2023-03-26 22:13:13', '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, '/system/config', 'menuItem', 'C', '1', '1', 'system:config:view', 'fa fa-sun-o', 'admin', '2023-03-24 08:36:57', 'admin', '2023-03-26 22:13:28', '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, '/system/tongzhi', 'menuItem', 'C', '1', '1', 'system:tongzhi:view', 'fa fa-bullhorn', 'admin', '2023-03-24 08:36:57', 'admin', '2023-03-30 20:10:15', '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, '#', '', 'M', '0', '1', '', 'fa fa-pencil-square-o', 'admin', '2023-03-24 08:36:57', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, '/monitor/online', '', 'C', '0', '1', 'monitor:online:view', 'fa fa-user-circle', 'admin', '2023-03-24 08:36:57', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, '/monitor/job', 'menuItem', 'C', '1', '1', 'monitor:job:view', 'fa fa-tasks', 'admin', '2023-03-24 08:36:57', 'admin', '2023-03-26 22:15:44', '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, '/monitor/data', '', 'C', '0', '1', 'monitor:data:view', 'fa fa-bug', 'admin', '2023-03-24 08:36:57', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, '/monitor/server', '', 'C', '0', '1', 'monitor:server:view', 'fa fa-server', 'admin', '2023-03-24 08:36:57', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, '/monitor/cache', '', 'C', '0', '1', 'monitor:cache:view', 'fa fa-cube', 'admin', '2023-03-24 08:36:57', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '表单构建', 3, 1, '/tool/build', '', 'C', '0', '1', 'tool:build:view', 'fa fa-wpforms', 'admin', '2023-03-24 08:36:57', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (115, '代码生成', 3, 2, '/tool/gen', '', 'C', '0', '1', 'tool:gen:view', 'fa fa-code', 'admin', '2023-03-24 08:36:57', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (116, '系统接口', 3, 3, '/tool/swagger', '', 'C', '0', '1', 'tool:swagger:view', 'fa fa-gg', 'admin', '2023-03-24 08:36:57', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, '/monitor/operlog', '', 'C', '0', '1', 'monitor:operlog:view', 'fa fa-address-book', 'admin', '2023-03-24 08:36:57', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, '/monitor/logininfor', '', 'C', '0', '1', 'monitor:logininfor:view', 'fa fa-file-image-o', 'admin', '2023-03-24 08:36:57', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '#', '', 'F', '0', '1', 'system:user:list', '#', 'admin', '2023-03-24 08:36:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '#', '', 'F', '0', '1', 'system:user:add', '#', 'admin', '2023-03-24 08:36:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '#', '', 'F', '0', '1', 'system:user:edit', '#', 'admin', '2023-03-24 08:36:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '#', '', 'F', '0', '1', 'system:user:remove', '#', 'admin', '2023-03-24 08:36:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '#', '', 'F', '0', '1', 'system:user:export', '#', 'admin', '2023-03-24 08:36:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '#', '', 'F', '0', '1', 'system:user:import', '#', 'admin', '2023-03-24 08:36:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '#', '', 'F', '0', '1', 'system:user:resetPwd', '#', 'admin', '2023-03-24 08:36:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '#', '', 'F', '0', '1', 'system:role:list', '#', 'admin', '2023-03-24 08:36:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '#', '', 'F', '0', '1', 'system:role:add', '#', 'admin', '2023-03-24 08:36:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '#', '', 'F', '0', '1', 'system:role:edit', '#', 'admin', '2023-03-24 08:36:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '#', '', 'F', '0', '1', 'system:role:remove', '#', 'admin', '2023-03-24 08:36:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '#', '', 'F', '0', '1', 'system:role:export', '#', 'admin', '2023-03-24 08:36:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '#', '', 'F', '0', '1', 'system:menu:list', '#', 'admin', '2023-03-24 08:36:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '#', '', 'F', '0', '1', 'system:menu:add', '#', 'admin', '2023-03-24 08:36:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '#', '', 'F', '0', '1', 'system:menu:edit', '#', 'admin', '2023-03-24 08:36:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '#', '', 'F', '0', '1', 'system:menu:remove', '#', 'admin', '2023-03-24 08:36:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '班级查询', 103, 1, '#', 'menuItem', 'F', '0', '1', 'system:dept:list', '#', 'admin', '2023-03-24 08:36:57', 'admin', '2023-03-27 08:27:03', '');
INSERT INTO `sys_menu` VALUES (1017, '班级新增', 103, 2, '#', 'menuItem', 'F', '0', '1', 'system:dept:add', '#', 'admin', '2023-03-24 08:36:57', 'admin', '2023-03-27 08:27:16', '');
INSERT INTO `sys_menu` VALUES (1018, '班级修改', 103, 3, '#', 'menuItem', 'F', '0', '1', 'system:dept:edit', '#', 'admin', '2023-03-24 08:36:57', 'admin', '2023-03-27 08:29:10', '');
INSERT INTO `sys_menu` VALUES (1019, '班级删除', 103, 4, '#', 'menuItem', 'F', '0', '1', 'system:dept:remove', '#', 'admin', '2023-03-24 08:36:57', 'admin', '2023-03-27 08:29:23', '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '#', 'menuItem', 'F', '0', '1', 'system:jiuye:list', '#', 'admin', '2023-03-24 08:36:57', 'admin', '2023-03-30 20:08:40', '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '#', 'menuItem', 'F', '0', '1', 'system:jiuye:add', '#', 'admin', '2023-03-24 08:36:57', 'admin', '2023-03-30 20:08:56', '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '#', 'menuItem', 'F', '0', '1', 'system:jiuye:edit', '#', 'admin', '2023-03-24 08:36:57', 'admin', '2023-03-30 20:09:11', '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '#', 'menuItem', 'F', '0', '1', 'system:jiuye:remove', '#', 'admin', '2023-03-24 08:36:57', 'admin', '2023-03-30 20:09:27', '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '#', 'menuItem', 'F', '0', '1', 'system:jiuye:export', '#', 'admin', '2023-03-24 08:36:57', 'admin', '2023-03-30 20:09:41', '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', 'F', '0', '1', 'system:dict:list', '#', 'admin', '2023-03-24 08:36:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', 'F', '0', '1', 'system:dict:add', '#', 'admin', '2023-03-24 08:36:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', 'F', '0', '1', 'system:dict:edit', '#', 'admin', '2023-03-24 08:36:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', 'F', '0', '1', 'system:dict:remove', '#', 'admin', '2023-03-24 08:36:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', 'F', '0', '1', 'system:dict:export', '#', 'admin', '2023-03-24 08:36:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', 'F', '0', '1', 'system:config:list', '#', 'admin', '2023-03-24 08:36:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', 'F', '0', '1', 'system:config:add', '#', 'admin', '2023-03-24 08:36:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', 'F', '0', '1', 'system:config:edit', '#', 'admin', '2023-03-24 08:36:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', 'F', '0', '1', 'system:config:remove', '#', 'admin', '2023-03-24 08:36:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', 'F', '0', '1', 'system:config:export', '#', 'admin', '2023-03-24 08:36:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', 'menuItem', 'F', '0', '1', 'system:tongzhi:list', '#', 'admin', '2023-03-24 08:36:57', 'admin', '2023-03-30 20:10:31', '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', 'menuItem', 'F', '0', '1', 'system:tongzhi:add', '#', 'admin', '2023-03-24 08:36:57', 'admin', '2023-03-30 20:10:47', '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', 'menuItem', 'F', '0', '1', 'system:tongzhi:edit', '#', 'admin', '2023-03-24 08:36:57', 'admin', '2023-03-30 20:11:07', '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', 'menuItem', 'F', '0', '1', 'system:tongzhi:remove', '#', 'admin', '2023-03-24 08:36:57', 'admin', '2023-03-30 20:11:23', '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', 'F', '0', '1', 'monitor:operlog:list', '#', 'admin', '2023-03-24 08:36:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', 'F', '0', '1', 'monitor:operlog:remove', '#', 'admin', '2023-03-24 08:36:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '详细信息', 500, 3, '#', '', 'F', '0', '1', 'monitor:operlog:detail', '#', 'admin', '2023-03-24 08:36:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', 'F', '0', '1', 'monitor:operlog:export', '#', 'admin', '2023-03-24 08:36:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', 'F', '0', '1', 'monitor:logininfor:list', '#', 'admin', '2023-03-24 08:36:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', 'F', '0', '1', 'monitor:logininfor:remove', '#', 'admin', '2023-03-24 08:36:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', 'F', '0', '1', 'monitor:logininfor:export', '#', 'admin', '2023-03-24 08:36:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '账户解锁', 501, 4, '#', '', 'F', '0', '1', 'monitor:logininfor:unlock', '#', 'admin', '2023-03-24 08:36:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '在线查询', 109, 1, '#', '', 'F', '0', '1', 'monitor:online:list', '#', 'admin', '2023-03-24 08:36:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '批量强退', 109, 2, '#', '', 'F', '0', '1', 'monitor:online:batchForceLogout', '#', 'admin', '2023-03-24 08:36:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '单条强退', 109, 3, '#', '', 'F', '0', '1', 'monitor:online:forceLogout', '#', 'admin', '2023-03-24 08:36:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务查询', 110, 1, '#', '', 'F', '0', '1', 'monitor:job:list', '#', 'admin', '2023-03-24 08:36:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务新增', 110, 2, '#', '', 'F', '0', '1', 'monitor:job:add', '#', 'admin', '2023-03-24 08:36:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务修改', 110, 3, '#', '', 'F', '0', '1', 'monitor:job:edit', '#', 'admin', '2023-03-24 08:36:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '任务删除', 110, 4, '#', '', 'F', '0', '1', 'monitor:job:remove', '#', 'admin', '2023-03-24 08:36:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '状态修改', 110, 5, '#', '', 'F', '0', '1', 'monitor:job:changeStatus', '#', 'admin', '2023-03-24 08:36:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '任务详细', 110, 6, '#', '', 'F', '0', '1', 'monitor:job:detail', '#', 'admin', '2023-03-24 08:36:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '任务导出', 110, 7, '#', '', 'F', '0', '1', 'monitor:job:export', '#', 'admin', '2023-03-24 08:36:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成查询', 115, 1, '#', '', 'F', '0', '1', 'tool:gen:list', '#', 'admin', '2023-03-24 08:36:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '生成修改', 115, 2, '#', '', 'F', '0', '1', 'tool:gen:edit', '#', 'admin', '2023-03-24 08:36:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '生成删除', 115, 3, '#', '', 'F', '0', '1', 'tool:gen:remove', '#', 'admin', '2023-03-24 08:36:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '预览代码', 115, 4, '#', '', 'F', '0', '1', 'tool:gen:preview', '#', 'admin', '2023-03-24 08:36:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1061, '生成代码', 115, 5, '#', '', 'F', '0', '1', 'tool:gen:code', '#', 'admin', '2023-03-24 08:36:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2005, '个人中心', 0, 0, '/system/user/profile', 'menuItem', 'C', '0', '0', '', 'fa fa-vcard', 'admin', '2023-03-25 21:34:55', 'admin', '2023-04-26 16:11:33', '');
INSERT INTO `sys_menu` VALUES (2007, '本地招聘信息', 0, 9, '/system/post', 'menuItem', 'C', '0', '0', 'system:post:view', 'fa fa-briefcase', 'admin', '2023-03-25 23:10:06', 'admin', '2023-03-30 20:14:32', '');
INSERT INTO `sys_menu` VALUES (2008, '通知与公告', 0, 8, '/system/notice', 'menuItem', 'C', '0', '1', 'system:notice:view', 'fa fa-bullhorn', 'admin', '2023-03-25 23:13:12', 'admin', '2023-03-30 20:12:49', '');
INSERT INTO `sys_menu` VALUES (2009, '学校官网', 0, 12, 'https://webvpn.beihua.edu.cn/https/77726476706e69737468656265737421e7f2438a373e26527b0181b9991b2631fb4c4ab1/login?cas_login=true&ticket=ST-2506671-qLbLRAJROgVLiairwsDQ1679835899710-1j2U-cas', 'menuBlank', 'C', '0', '1', '', 'fa fa-mortar-board', 'admin', '2023-03-26 21:02:55', 'admin', '2023-03-27 12:02:32', '');
INSERT INTO `sys_menu` VALUES (2011, '信息查询', 2007, 1, '#', 'menuItem', 'F', '0', '1', 'system:post:list', '#', 'admin', '2023-03-27 20:00:28', 'admin', '2023-03-30 20:14:45', '');
INSERT INTO `sys_menu` VALUES (2012, '信息新增', 2007, 2, '#', 'menuItem', 'F', '0', '1', 'system:post:add', '#', 'admin', '2023-03-27 20:02:11', 'admin', '2023-03-30 20:15:18', '');
INSERT INTO `sys_menu` VALUES (2013, '信息修改', 2007, 3, '#', 'menuItem', 'F', '0', '1', 'system:post:edit', '#', 'admin', '2023-03-27 20:02:34', 'admin', '2023-03-30 20:15:52', '');
INSERT INTO `sys_menu` VALUES (2014, '信息删除', 2007, 4, '#', 'menuItem', 'F', '0', '1', 'system:post:remove', '#', 'admin', '2023-03-27 20:03:07', 'admin', '2023-03-30 20:16:04', '');
INSERT INTO `sys_menu` VALUES (2015, '信息导出', 2007, 5, '#', 'menuItem', 'F', '0', '1', 'system:post:export', '#', 'admin', '2023-03-27 20:03:26', 'admin', '2023-03-30 20:18:03', '');
INSERT INTO `sys_menu` VALUES (2016, '公告查询', 2008, 1, '#', 'menuItem', 'F', '0', '1', 'system:notice:list', '#', 'admin', '2023-03-30 17:33:30', 'admin', '2023-03-30 20:13:16', '');
INSERT INTO `sys_menu` VALUES (2017, '公告新增', 2008, 2, '#', 'menuItem', 'F', '0', '1', 'system:notice:add', '#', 'admin', '2023-03-30 17:34:13', 'admin', '2023-03-30 20:13:27', '');
INSERT INTO `sys_menu` VALUES (2018, '公告修改', 2008, 3, '#', 'menuItem', 'F', '0', '1', 'system:notice:edit', '#', 'admin', '2023-03-30 17:35:58', 'admin', '2023-03-30 20:13:38', '');
INSERT INTO `sys_menu` VALUES (2019, '公告删除', 2008, 4, '#', 'menuItem', 'F', '0', '1', 'system:notice:remove', '#', 'admin', '2023-03-30 17:37:19', 'admin', '2023-03-30 20:13:49', '');
INSERT INTO `sys_menu` VALUES (2021, '去招聘网站瞅瞅', 0, 14, '#', 'menuItem', 'M', '0', '1', '', 'fa fa-globe', 'admin', '2023-04-03 21:41:37', 'admin', '2023-04-03 21:52:49', '');
INSERT INTO `sys_menu` VALUES (2022, '前程无忧', 2021, 1, 'https://we.51job.com/pc/search', 'menuItem', 'C', '0', '1', '', '#', 'admin', '2023-04-03 21:47:36', 'admin', '2023-04-03 21:47:59', '');
INSERT INTO `sys_menu` VALUES (2023, '24365校园招聘', 2021, 2, 'https://www.ncss.cn/student/24365', 'menuBlank', 'C', '0', '1', '', '#', 'admin', '2023-04-03 21:49:03', 'admin', '2023-04-03 22:16:44', '');
INSERT INTO `sys_menu` VALUES (2024, '高校毕业生就业服务', 2021, 3, 'http://job.mohrss.gov.cn/202008gx/index.jhtml', 'menuItem', 'C', '0', '1', NULL, '#', 'admin', '2023-04-03 21:50:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2025, '城市需求分布', 0, 1, '/system/city', 'menuItem', 'C', '0', '1', '', 'fa fa-asl-interpreting', 'admin', '2023-04-24 13:21:38', 'admin', '2023-04-26 16:51:30', '');
INSERT INTO `sys_menu` VALUES (2026, '可视化分析', 0, 2, '#', 'menuItem', 'M', '0', '1', NULL, 'fa fa-pie-chart', 'admin', '2023-04-26 16:49:03', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2027, '城市需求分析', 2026, 1, '#', 'menuItem', 'C', '0', '1', NULL, 'fa fa-pie-chart', 'admin', '2023-04-26 16:51:12', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2023-03-24 招聘网站数据新V1.0发布啦！', '2', '<p><b>版本内容：</b></p><p>1.招聘数据的展示</p><p>2.学生角色的登录与注册</p><p>3.个人信息修改</p>', '0', 'admin', '2023-03-24 08:36:58', 'admin', '2023-03-27 16:26:32', '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2023-03-25 招聘网站数据分析系统凌晨维护', '1', '<p><b>维护内容：</b></p><p>1.修复登录界面验证码问题</p><p>2.完善个人信息界面</p><p>3.修复部分bug，增强用户体验</p>', '0', 'admin', '2023-03-24 08:36:58', 'admin', '2023-03-27 16:27:04', '管理员');
INSERT INTO `sys_notice` VALUES (10, '温馨提醒：2023-03-24 招聘网站数据分析系统V1.1发布啦！', '2', '<p><b>版本内容：</b></p><p>1.招聘数据的展示</p><p>2.学生角色的登录与注册</p><p>3.个人信息修改<br></p><p><b>新增：</b></p><p>登录验证码</p><p><br></p>', '0', 'admin', '2023-03-25 09:13:54', 'admin', '2023-03-27 16:27:42', '管理员');
INSERT INTO `sys_notice` VALUES (11, '学院通知  “屏相见  向未来” 就业信息推送 | 3月25日', '1', '<p><b>通知人：</b>学生就业处</p><p><b>时间：</b>2023-3-25</p><p><b>内容：</b></p><p>海兴电力（上市公司、总部杭州）2023春季校园招聘</p><p>中电金信2023年校园招聘</p><p>点击查看详情：<a href=\"https://m.bysjy.com.cn/student/chance/newsdetails.html?token=yxqqnn0100000010&amp;notice_id=816303\" target=\"_blank\">https://m.bysjy.com.cn/student/chance/newsdetails.html?token=yxqqnn0100000010¬ice_id=816303</a><br></p>', '0', 'admin', '2023-03-25 16:24:07', 'admin', '2023-03-27 16:26:20', '学生就业处');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(0) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(0) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(0) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint(0) NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type`) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status`) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 379 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"student\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-24 09:30:18', 624);
INSERT INTO `sys_oper_log` VALUES (101, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/student', '127.0.0.1', '内网IP', '\"student\"', NULL, 0, NULL, '2023-03-24 09:30:59', 174);
INSERT INTO `sys_oper_log` VALUES (102, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"学生管理\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"10\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-24 11:00:18', 30);
INSERT INTO `sys_oper_log` VALUES (103, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2000\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"学生管理\"],\"url\":[\"/system/student\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"10\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-24 11:01:57', 14);
INSERT INTO `sys_oper_log` VALUES (104, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2000\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"学生管理\"],\"url\":[\"/system/student\"],\"target\":[\"menuItem\"],\"perms\":[\"system.student.view\"],\"orderNum\":[\"10\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-24 11:02:43', 14);
INSERT INTO `sys_oper_log` VALUES (105, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2000\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"学生管理\"],\"url\":[\"/system/student\"],\"target\":[\"menuItem\"],\"perms\":[\"system:student:view\"],\"orderNum\":[\"10\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-24 11:03:09', 19);
INSERT INTO `sys_oper_log` VALUES (106, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2000\"],\"menuType\":[\"F\"],\"menuName\":[\"学生查询\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"system:student:list\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-24 11:04:45', 13);
INSERT INTO `sys_oper_log` VALUES (107, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2000\"],\"menuType\":[\"F\"],\"menuName\":[\"学生添加\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"system:student:add\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-24 11:05:50', 11);
INSERT INTO `sys_oper_log` VALUES (108, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/role/add', '127.0.0.1', '内网IP', '{\"roleName\":[\"学生\"],\"roleKey\":[\"student\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045,1046,2000,2001,2002,2,109,1047,1048,1049,110,1050,1051,1052,1053,1054,1055,1056,111,112,113,3,114,115,1057,1058,1059,1060,1061,116,4\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-24 11:07:38', 62);
INSERT INTO `sys_oper_log` VALUES (109, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"\"],\"userName\":[\"java\"],\"deptName\":[\"\"],\"phonenumber\":[\"\"],\"email\":[\"\"],\"loginName\":[\"2019150001\"],\"sex\":[\"0\"],\"role\":[\"100\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"100\"],\"postIds\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-24 11:10:58', 28);
INSERT INTO `sys_oper_log` VALUES (110, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2000\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"学生管理\"],\"url\":[\"/system/student\"],\"target\":[\"menuItem\"],\"perms\":[\"system:student:view\"],\"orderNum\":[\"10\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-24 11:41:37', 28);
INSERT INTO `sys_oper_log` VALUES (111, '【请填写功能名称】', 1, 'com.ruoyi.web.controller.system.StudentController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/student/add', '127.0.0.1', '内网IP', '{\"name\":[\"123\"],\"age\":[\"12\"]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\SKY\\Desktop\\就业管理\\RuoYi-master\\ruoyi-system\\target\\classes\\mapper\\system\\StudentMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.StudentMapper.insertStudent-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into student          ( name,             age )           values ( ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value', '2023-03-24 11:49:35', 193);
INSERT INTO `sys_oper_log` VALUES (112, '【请填写功能名称】', 1, 'com.ruoyi.web.controller.system.StudentController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/student/add', '127.0.0.1', '内网IP', '{\"name\":[\"2019\"],\"age\":[\"12\"]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\SKY\\Desktop\\就业管理\\RuoYi-master\\ruoyi-system\\target\\classes\\mapper\\system\\StudentMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.StudentMapper.insertStudent-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into student          ( name,             age )           values ( ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value', '2023-03-24 11:49:52', 6);
INSERT INTO `sys_oper_log` VALUES (113, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"学生管理2\"],\"url\":[\"/system/student\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"11\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-24 12:04:49', 140);
INSERT INTO `sys_oper_log` VALUES (114, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2003\"],\"menuType\":[\"F\"],\"menuName\":[\"学生test\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-24 12:05:17', 664);
INSERT INTO `sys_oper_log` VALUES (115, '【请填写功能名称】', 1, 'com.ruoyi.web.controller.system.StudentController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/student/add', '127.0.0.1', '内网IP', '{\"name\":[\"1\"],\"age\":[\"1\"]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\SKY\\Desktop\\就业管理\\RuoYi-master\\ruoyi-system\\target\\classes\\mapper\\system\\StudentMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.StudentMapper.insertStudent-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into student          ( name,             age )           values ( ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value', '2023-03-24 12:07:51', 84);
INSERT INTO `sys_oper_log` VALUES (116, '【请填写功能名称】', 1, 'com.ruoyi.web.controller.system.StudentController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/student/add', '127.0.0.1', '内网IP', '{\"name\":[\"2020\"],\"age\":[\"19\"]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\SKY\\Desktop\\就业管理\\RuoYi-master\\ruoyi-system\\target\\classes\\mapper\\system\\StudentMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.StudentMapper.insertStudent-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into student          ( name,             age )           values ( ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value', '2023-03-24 12:09:19', 5);
INSERT INTO `sys_oper_log` VALUES (117, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/2000', '127.0.0.1', '内网IP', '2000', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":301}', 0, NULL, '2023-03-25 16:53:44', 157);
INSERT INTO `sys_oper_log` VALUES (118, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/2001', '127.0.0.1', '内网IP', '2001', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":301}', 0, NULL, '2023-03-25 16:53:51', 15);
INSERT INTO `sys_oper_log` VALUES (119, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/2002', '127.0.0.1', '内网IP', '2002', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":301}', 0, NULL, '2023-03-25 16:53:58', 10);
INSERT INTO `sys_oper_log` VALUES (120, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/2004', '127.0.0.1', '内网IP', '2004', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-25 16:54:09', 47);
INSERT INTO `sys_oper_log` VALUES (121, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/2003', '127.0.0.1', '内网IP', '2003', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-25 16:54:16', 29);
INSERT INTO `sys_oper_log` VALUES (122, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/2002', '127.0.0.1', '内网IP', '2002', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":301}', 0, NULL, '2023-03-25 16:54:26', 12);
INSERT INTO `sys_oper_log` VALUES (123, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2002\"],\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"学生添加\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"system:student:add\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-25 16:54:41', 18);
INSERT INTO `sys_oper_log` VALUES (124, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/2002', '127.0.0.1', '内网IP', '2002', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":301}', 0, NULL, '2023-03-25 16:54:50', 9);
INSERT INTO `sys_oper_log` VALUES (125, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/2001', '127.0.0.1', '内网IP', '2001', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":301}', 0, NULL, '2023-03-25 16:54:59', 9);
INSERT INTO `sys_oper_log` VALUES (126, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"3\"],\"roleName\":[\"学生\"],\"roleKey\":[\"student\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-25 16:57:40', 37);
INSERT INTO `sys_oper_log` VALUES (127, '角色管理', 3, 'com.ruoyi.web.controller.system.SysRoleController.remove()', 'POST', 1, 'admin', '研发部门', '/system/role/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"3\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-25 16:57:55', 49);
INSERT INTO `sys_oper_log` VALUES (128, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/2000', '127.0.0.1', '内网IP', '2000', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":301}', 0, NULL, '2023-03-25 16:58:07', 4);
INSERT INTO `sys_oper_log` VALUES (129, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/2001', '127.0.0.1', '内网IP', '2001', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":301}', 0, NULL, '2023-03-25 16:58:14', 11);
INSERT INTO `sys_oper_log` VALUES (130, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/2002', '127.0.0.1', '内网IP', '2002', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":301}', 0, NULL, '2023-03-25 16:59:43', 14);
INSERT INTO `sys_oper_log` VALUES (131, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/role/add', '127.0.0.1', '内网IP', '{\"roleName\":[\"大学生\"],\"roleKey\":[\"senior\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1,104,1020,1024,107,1035\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-25 17:10:03', 58);
INSERT INTO `sys_oper_log` VALUES (132, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"\"],\"userName\":[\"小强\"],\"deptName\":[\"\"],\"phonenumber\":[\"\"],\"email\":[\"\"],\"loginName\":[\"201915002\"],\"sex\":[\"0\"],\"role\":[\"101\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"101\"],\"postIds\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-25 17:11:22', 29);
INSERT INTO `sys_oper_log` VALUES (133, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'POST', 1, 'admin', '研发部门', '/system/user/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"101\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-25 17:14:05', 24);
INSERT INTO `sys_oper_log` VALUES (134, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"\"],\"userName\":[\"小强\"],\"deptName\":[\"\"],\"phonenumber\":[\"\"],\"email\":[\"\"],\"loginName\":[\"2019150002\"],\"sex\":[\"0\"],\"role\":[\"101\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"101\"],\"postIds\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-25 17:14:28', 27);
INSERT INTO `sys_oper_log` VALUES (135, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"101\"],\"roleName\":[\"学生\"],\"roleKey\":[\"senior\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1,104,1020,1024,107,1035\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-25 19:37:18', 161);
INSERT INTO `sys_oper_log` VALUES (136, '岗位管理', 1, 'com.ruoyi.web.controller.system.SysPostController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/post/add', '127.0.0.1', '内网IP', '{\"postName\":[\"java开发\"],\"postCode\":[\"java\"],\"postSort\":[\"5\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-25 20:19:41', 22);
INSERT INTO `sys_oper_log` VALUES (137, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/2001', '127.0.0.1', '内网IP', '2001', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":301}', 0, NULL, '2023-03-25 21:18:14', 7);
INSERT INTO `sys_oper_log` VALUES (138, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/2002', '127.0.0.1', '内网IP', '2002', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":301}', 0, NULL, '2023-03-25 21:18:30', 7);
INSERT INTO `sys_oper_log` VALUES (139, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.update()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/update', '127.0.0.1', '内网IP', '{\"id\":[\"\"],\"userName\":[\"拾柒\"],\"phonenumber\":[\"15888888888\"],\"email\":[\"admin@sqt.com\"],\"sex\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-25 21:28:48', 21);
INSERT INTO `sys_oper_log` VALUES (140, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"个人信息修改\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"0\"],\"icon\":[\"fa fa-vcard\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-25 21:34:55', 12);
INSERT INTO `sys_oper_log` VALUES (141, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2005\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"个人信息修改\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"0\"],\"icon\":[\"fa fa-vcard\"],\"visible\":[\"0\"],\"isRefresh\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-25 21:36:10', 10);
INSERT INTO `sys_oper_log` VALUES (142, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2005\"],\"parentId\":[\"0\"],\"menuType\":[\"F\"],\"menuName\":[\"个人信息修改\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"0\"],\"icon\":[\"fa fa-vcard\"],\"visible\":[\"0\"],\"isRefresh\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-25 21:36:28', 33);
INSERT INTO `sys_oper_log` VALUES (143, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2005\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"个人信息修改\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"0\"],\"icon\":[\"fa fa-vcard\"],\"visible\":[\"0\"],\"isRefresh\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-25 21:36:55', 21);
INSERT INTO `sys_oper_log` VALUES (144, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2005\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"个人信息修改\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"0\"],\"icon\":[\"fa fa-vcard\"],\"visible\":[\"0\"],\"isRefresh\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-25 21:37:17', 9);
INSERT INTO `sys_oper_log` VALUES (145, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"101\"],\"roleName\":[\"学生\"],\"roleKey\":[\"senior\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"2005,1,104,1020,1024,107,1035\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-25 21:37:48', 16);
INSERT INTO `sys_oper_log` VALUES (146, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"101\"],\"roleName\":[\"学生\"],\"roleKey\":[\"senior\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"2005,1,104,1020,1024,107,1035,4\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-25 21:54:00', 17);
INSERT INTO `sys_oper_log` VALUES (147, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"前程无忧官网\"],\"url\":[\"https://we.51job.com/pc/search\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"5\"],\"icon\":[\"fa fa-suitcase\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-25 22:47:07', 21);
INSERT INTO `sys_oper_log` VALUES (148, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"101\"],\"roleName\":[\"学生\"],\"roleKey\":[\"senior\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"2005,1,104,1020,1024,107,1035,4,2006\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-25 22:48:32', 23);
INSERT INTO `sys_oper_log` VALUES (149, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2005\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"个人信息修改\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"6\"],\"icon\":[\"fa fa-vcard\"],\"visible\":[\"0\"],\"isRefresh\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-25 23:09:01', 13);
INSERT INTO `sys_oper_log` VALUES (150, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"招聘信息\"],\"url\":[\"/system/post\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"7\"],\"icon\":[\"fa fa-briefcase\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-25 23:10:06', 14);
INSERT INTO `sys_oper_log` VALUES (151, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2006\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"前程无忧官网\"],\"url\":[\"https://we.51job.com/pc/search\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"5\"],\"icon\":[\"fa fa-binoculars\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-25 23:10:21', 19);
INSERT INTO `sys_oper_log` VALUES (152, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"通知与公告\"],\"url\":[\"/system/notice\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"8\"],\"icon\":[\"fa fa-bullhorn\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-25 23:13:12', 23);
INSERT INTO `sys_oper_log` VALUES (153, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"101\"],\"roleName\":[\"学生\"],\"roleKey\":[\"senior\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"1,104,1020,1024,107,1035,4,2006,2005,2007,2008\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-25 23:13:53', 30);
INSERT INTO `sys_oper_log` VALUES (154, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2005\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"个人信息修改\"],\"url\":[\"/system/user/profile\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"6\"],\"icon\":[\"fa fa-vcard\"],\"visible\":[\"0\"],\"isRefresh\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-26 08:47:28', 140);
INSERT INTO `sys_oper_log` VALUES (155, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2005\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"个人信息修改\"],\"url\":[\"/system/user/profile\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"0\"],\"icon\":[\"fa fa-vcard\"],\"visible\":[\"0\"],\"isRefresh\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-26 08:48:31', 15);
INSERT INTO `sys_oper_log` VALUES (156, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2005\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"个人信息\"],\"url\":[\"/system/user/profile\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"0\"],\"icon\":[\"fa fa-vcard\"],\"visible\":[\"0\"],\"isRefresh\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-26 09:36:54', 171);
INSERT INTO `sys_oper_log` VALUES (157, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"101\"],\"roleName\":[\"学生\"],\"roleKey\":[\"senior\"],\"roleSort\":[\"4\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"2005,1,104,1020,1024,107,1035,4,2006,2007,2008\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-26 09:50:05', 44);
INSERT INTO `sys_oper_log` VALUES (158, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/role/add', '127.0.0.1', '内网IP', '{\"roleName\":[\"管理员\"],\"roleKey\":[\"admin1\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"2005,1,100,1000,1001,1002,1003,1004,1005,1006,104,1020,1021,1022,1023,1024,107,1035,1036,1037,1038,108,501,1043,1044,1045,2,109,1047,1048,1049,111,112,113,2006,2007,2008\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-26 09:57:11', 31);
INSERT INTO `sys_oper_log` VALUES (159, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"100\"],\"deptId\":[\"\"],\"userName\":[\"java\"],\"dept.deptName\":[\"\"],\"phonenumber\":[\"\"],\"email\":[\"\"],\"loginName\":[\"2019150001\"],\"sex\":[\"0\"],\"role\":[\"102\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"102\"],\"postIds\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-26 10:00:16', 31);
INSERT INTO `sys_oper_log` VALUES (160, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"103\"],\"parentId\":[\"101\"],\"parentName\":[\"计算机科学技术学院\"],\"deptName\":[\"网络工程\"],\"orderNum\":[\"1\"],\"leader\":[\"拾柒\"],\"phone\":[\"15888888888\"],\"email\":[\"ry@qq.com\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-26 10:11:01', 23);
INSERT INTO `sys_oper_log` VALUES (161, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.editSave()', 'POST', 1, '2019150001', NULL, '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"102\"],\"deptId\":[\"103\"],\"userName\":[\"小强\"],\"dept.deptName\":[\"网络工程\"],\"phonenumber\":[\"\"],\"email\":[\"\"],\"loginName\":[\"2019150002\"],\"sex\":[\"0\"],\"role\":[\"101\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"101\"],\"postIds\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-26 10:13:15', 32);
INSERT INTO `sys_oper_log` VALUES (162, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'GET', 1, 'admin', '网络19.1', '/system/dept/remove/107', '127.0.0.1', '内网IP', '107', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-26 10:18:47', 20);
INSERT INTO `sys_oper_log` VALUES (163, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.addSave()', 'POST', 1, 'admin', '网络19.1', '/system/dept/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"101\"],\"deptName\":[\"网络22.1\"],\"orderNum\":[\"5\"],\"leader\":[\"\"],\"phone\":[\"\"],\"email\":[\"\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-26 10:20:10', 24);
INSERT INTO `sys_oper_log` VALUES (164, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.addSave()', 'POST', 1, 'admin', '网络19.1', '/system/dept/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"101\"],\"deptName\":[\"网络22.2\"],\"orderNum\":[\"6\"],\"leader\":[\"\"],\"phone\":[\"\"],\"email\":[\"\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-26 10:20:51', 12);
INSERT INTO `sys_oper_log` VALUES (165, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.addSave()', 'POST', 1, 'admin', '网络19.1', '/system/dept/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"102\"],\"deptName\":[\"软件19.3\"],\"orderNum\":[\"3\"],\"leader\":[\"\"],\"phone\":[\"\"],\"email\":[\"\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-26 10:22:06', 23);
INSERT INTO `sys_oper_log` VALUES (166, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"108\"],\"parentId\":[\"102\"],\"parentName\":[\"软件工程系\"],\"deptName\":[\"软件19.1\"],\"orderNum\":[\"1\"],\"leader\":[\"拾柒\"],\"phone\":[\"15888888888\"],\"email\":[\"ry@qq.com\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-26 10:22:15', 24);
INSERT INTO `sys_oper_log` VALUES (167, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"109\"],\"parentId\":[\"102\"],\"parentName\":[\"软件工程系\"],\"deptName\":[\"软件19.2\"],\"orderNum\":[\"2\"],\"leader\":[\"拾柒\"],\"phone\":[\"15888888888\"],\"email\":[\"ry@qq.com\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-26 10:22:26', 24);
INSERT INTO `sys_oper_log` VALUES (168, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"102\"],\"roleName\":[\"管理员\"],\"roleKey\":[\"admin1\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"2005,1,100,1000,1001,1002,1003,1004,1005,1006,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,107,1035,1036,1037,1038,108,501,1043,1044,1045,2,109,1047,1048,1049,111,112,113,2006,2007,2008\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-26 10:22:53', 27);
INSERT INTO `sys_oper_log` VALUES (169, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.editSave()', 'POST', 1, '2019150001', NULL, '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"2\"],\"deptId\":[\"103\"],\"userName\":[\"拾柒\"],\"dept.deptName\":[\"网络19.1\"],\"phonenumber\":[\"15666666666\"],\"email\":[\"ry@qq.com\"],\"loginName\":[\"ry\"],\"sex\":[\"1\"],\"role\":[\"2\"],\"remark\":[\"测试员\"],\"status\":[\"0\"],\"roleIds\":[\"2\"],\"postIds\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-26 10:24:26', 33);
INSERT INTO `sys_oper_log` VALUES (170, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 'POST', 1, 'admin', '网络19.1', '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"userId\":[\"1\"],\"status\":[\"1\"]}', NULL, 1, '不允许操作超级管理员用户', '2023-03-26 10:31:22', 5);
INSERT INTO `sys_oper_log` VALUES (171, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 'POST', 1, 'admin', '网络19.1', '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"userId\":[\"1\"],\"status\":[\"1\"]}', NULL, 1, '不允许操作超级管理员用户', '2023-03-26 10:31:33', 1);
INSERT INTO `sys_oper_log` VALUES (172, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"4\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"若依官网\"],\"url\":[\"http://ruoyi.vip\"],\"target\":[\"menuBlank\"],\"perms\":[\"\"],\"orderNum\":[\"4\"],\"icon\":[\"fa fa-location-arrow\"],\"visible\":[\"1\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-26 10:33:06', 21);
INSERT INTO `sys_oper_log` VALUES (173, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"学校官网\"],\"url\":[\"https://webvpn.beihua.edu.cn/\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"6\"],\"icon\":[\"fa fa-mortar-board\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-26 21:02:55', 213);
INSERT INTO `sys_oper_log` VALUES (174, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2009\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"学校官网\"],\"url\":[\"https://webvpn.beihua.edu.cn/\"],\"target\":[\"menuBlank\"],\"perms\":[\"\"],\"orderNum\":[\"6\"],\"icon\":[\"fa fa-mortar-board\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-26 21:04:16', 15);
INSERT INTO `sys_oper_log` VALUES (175, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2009\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"学校官网\"],\"url\":[\"https://webvpn.beihua.edu.cn/https/77726476706e69737468656265737421e7f2438a373e26527b0181b9991b2631fb4c4ab1/login?cas_login=true&ticket=ST-2506671-qLbLRAJROgVLiairwsDQ1679835899710-1j2U-cas\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"6\"],\"icon\":[\"fa fa-mortar-board\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-26 21:06:34', 25);
INSERT INTO `sys_oper_log` VALUES (176, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2009\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"学校官网\"],\"url\":[\"https://webvpn.beihua.edu.cn/https/77726476706e69737468656265737421e7f2438a373e26527b0181b9991b2631fb4c4ab1/login?cas_login=true&ticket=ST-2506671-qLbLRAJROgVLiairwsDQ1679835899710-1j2U-cas\"],\"target\":[\"menuBlank\"],\"perms\":[\"\"],\"orderNum\":[\"6\"],\"icon\":[\"fa fa-mortar-board\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-26 21:07:12', 21);
INSERT INTO `sys_oper_log` VALUES (177, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"102\"],\"roleName\":[\"管理员\"],\"roleKey\":[\"admin1\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"2005,1,100,1000,1001,1002,1003,1004,1005,1006,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,107,1035,1036,1037,1038,108,501,1043,1044,1045,2,109,1047,1048,1049,111,112,113,2006,2009,2007,2008\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-26 21:59:47', 85);
INSERT INTO `sys_oper_log` VALUES (178, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"101\"],\"roleName\":[\"学生\"],\"roleKey\":[\"senior\"],\"roleSort\":[\"4\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"2005,1,104,1020,1024,107,1035,4,2006,2009,2007,2008\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-26 22:00:12', 18);
INSERT INTO `sys_oper_log` VALUES (179, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"101\"],\"roleName\":[\"学生\"],\"roleKey\":[\"senior\"],\"roleSort\":[\"4\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"2005,2006,2009,2007,2008\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-26 22:01:43', 29);
INSERT INTO `sys_oper_log` VALUES (180, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2007\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"本地招聘信息\"],\"url\":[\"/system/post\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"9\"],\"icon\":[\"fa fa-briefcase\"],\"visible\":[\"0\"],\"isRefresh\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-26 22:10:17', 12);
INSERT INTO `sys_oper_log` VALUES (181, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2006\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"前程无忧官网\"],\"url\":[\"https://we.51job.com/pc/search\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"10\"],\"icon\":[\"fa fa-binoculars\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-26 22:10:34', 17);
INSERT INTO `sys_oper_log` VALUES (182, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2009\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"学校官网\"],\"url\":[\"https://webvpn.beihua.edu.cn/https/77726476706e69737468656265737421e7f2438a373e26527b0181b9991b2631fb4c4ab1/login?cas_login=true&ticket=ST-2506671-qLbLRAJROgVLiairwsDQ1679835899710-1j2U-cas\"],\"target\":[\"menuBlank\"],\"perms\":[\"\"],\"orderNum\":[\"11\"],\"icon\":[\"fa fa-mortar-board\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-26 22:10:54', 13);
INSERT INTO `sys_oper_log` VALUES (183, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"4\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"若依官网\"],\"url\":[\"http://ruoyi.vip\"],\"target\":[\"menuBlank\"],\"perms\":[\"\"],\"orderNum\":[\"1111\"],\"icon\":[\"fa fa-location-arrow\"],\"visible\":[\"1\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-26 22:11:07', 16);
INSERT INTO `sys_oper_log` VALUES (184, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"3\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"系统工具\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1110\"],\"icon\":[\"fa fa-bars\"],\"visible\":[\"1\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-26 22:11:42', 12);
INSERT INTO `sys_oper_log` VALUES (185, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"104\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"岗位管理\"],\"url\":[\"/system/post\"],\"target\":[\"menuItem\"],\"perms\":[\"system:post:view\"],\"orderNum\":[\"5\"],\"icon\":[\"fa fa-address-card-o\"],\"visible\":[\"1\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-26 22:12:46', 12);
INSERT INTO `sys_oper_log` VALUES (186, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"107\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"通知公告\"],\"url\":[\"/system/notice\"],\"target\":[\"menuItem\"],\"perms\":[\"system:notice:view\"],\"orderNum\":[\"8\"],\"icon\":[\"fa fa-bullhorn\"],\"visible\":[\"1\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-26 22:13:00', 13);
INSERT INTO `sys_oper_log` VALUES (187, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"105\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"字典管理\"],\"url\":[\"/system/dict\"],\"target\":[\"menuItem\"],\"perms\":[\"system:dict:view\"],\"orderNum\":[\"6\"],\"icon\":[\"fa fa-bookmark-o\"],\"visible\":[\"1\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-26 22:13:13', 12);
INSERT INTO `sys_oper_log` VALUES (188, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"106\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"参数设置\"],\"url\":[\"/system/config\"],\"target\":[\"menuItem\"],\"perms\":[\"system:config:view\"],\"orderNum\":[\"7\"],\"icon\":[\"fa fa-sun-o\"],\"visible\":[\"1\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-26 22:13:28', 8);
INSERT INTO `sys_oper_log` VALUES (189, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"110\"],\"parentId\":[\"2\"],\"menuType\":[\"C\"],\"menuName\":[\"定时任务\"],\"url\":[\"/monitor/job\"],\"target\":[\"menuItem\"],\"perms\":[\"monitor:job:view\"],\"orderNum\":[\"2\"],\"icon\":[\"fa fa-tasks\"],\"visible\":[\"1\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-26 22:15:44', 15);
INSERT INTO `sys_oper_log` VALUES (190, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"102\"],\"roleName\":[\"管理员\"],\"roleKey\":[\"admin1\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"2005,1,100,1000,1001,1002,1003,1004,1005,1006,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,107,1035,1036,1037,1038,108,501,1043,1044,1045,2,109,1047,1048,1049,111,112,113,2008,2007,2006,2009\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-26 22:30:22', 31);
INSERT INTO `sys_oper_log` VALUES (191, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.addSave()', 'POST', 1, 'admin', '网络19.1', '/system/dept/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"102\"],\"deptName\":[\"软件19.4\"],\"orderNum\":[\"4\"],\"leader\":[\"\"],\"phone\":[\"\"],\"email\":[\"\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-26 22:49:41', 23);
INSERT INTO `sys_oper_log` VALUES (192, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"103\"],\"parentId\":[\"101\"],\"parentName\":[\"网络工程系\"],\"deptName\":[\"网络19.1\"],\"orderNum\":[\"1\"],\"leader\":[\"\"],\"phone\":[\"\"],\"email\":[\"\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-26 22:50:05', 41);
INSERT INTO `sys_oper_log` VALUES (193, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"101\"],\"parentId\":[\"100\"],\"parentName\":[\"计算机科学技术学院\"],\"deptName\":[\"网络工程系\"],\"orderNum\":[\"1\"],\"leader\":[\"\"],\"phone\":[\"\"],\"email\":[\"\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-26 22:50:26', 2244);
INSERT INTO `sys_oper_log` VALUES (194, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"105\"],\"parentId\":[\"101\"],\"parentName\":[\"网络工程系\"],\"deptName\":[\"网络20.1\"],\"orderNum\":[\"3\"],\"leader\":[\"\"],\"phone\":[\"\"],\"email\":[\"\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-26 22:50:50', 31);
INSERT INTO `sys_oper_log` VALUES (195, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"106\"],\"parentId\":[\"101\"],\"parentName\":[\"网络工程系\"],\"deptName\":[\"网络20.2\"],\"orderNum\":[\"4\"],\"leader\":[\"\"],\"phone\":[\"\"],\"email\":[\"\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-26 22:51:08', 34);
INSERT INTO `sys_oper_log` VALUES (196, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"103\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"班级管理\"],\"url\":[\"/system/dept\"],\"target\":[\"menuItem\"],\"perms\":[\"system:dept:view\"],\"orderNum\":[\"4\"],\"icon\":[\"fa fa-outdent\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-27 08:26:39', 404);
INSERT INTO `sys_oper_log` VALUES (197, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1016\"],\"parentId\":[\"103\"],\"menuType\":[\"F\"],\"menuName\":[\"班级查询\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"system:dept:list\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-27 08:27:03', 15);
INSERT INTO `sys_oper_log` VALUES (198, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1017\"],\"parentId\":[\"103\"],\"menuType\":[\"F\"],\"menuName\":[\"班级新增\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"system:dept:add\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-27 08:27:16', 49);
INSERT INTO `sys_oper_log` VALUES (199, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1018\"],\"parentId\":[\"103\"],\"menuType\":[\"F\"],\"menuName\":[\"班级修改\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"system:dept:edit\"],\"orderNum\":[\"3\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-27 08:29:10', 20);
INSERT INTO `sys_oper_log` VALUES (200, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1019\"],\"parentId\":[\"103\"],\"menuType\":[\"F\"],\"menuName\":[\"班级删除\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"system:dept:remove\"],\"orderNum\":[\"4\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-27 08:29:23', 26);
INSERT INTO `sys_oper_log` VALUES (201, '通知公告', 2, 'com.ruoyi.web.controller.system.SysNoticeController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/notice/edit', '127.0.0.1', '内网IP', '{\"noticeId\":[\"1\"],\"noticeTitle\":[\"温馨提醒：2023-03-24 招聘网站数据新V1.0发布啦！\"],\"noticeType\":[\"2\"],\"noticeContent\":[\"<p>版本内容：</p><p>1.招聘数据的展示</p><p>2.学生角色的登录与注册</p><p>3.个人信息修改</p>\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-27 09:10:54', 14);
INSERT INTO `sys_oper_log` VALUES (202, '通知公告', 2, 'com.ruoyi.web.controller.system.SysNoticeController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/notice/edit', '127.0.0.1', '内网IP', '{\"noticeId\":[\"2\"],\"noticeTitle\":[\"维护通知：2023-03-24 招聘网站数据分析系统凌晨维护\"],\"noticeType\":[\"1\"],\"noticeContent\":[\"<p>维护内容：</p><p>1.登录界面验证码问题</p><p>2.个人信息界面的完善</p>\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-27 09:12:57', 25);
INSERT INTO `sys_oper_log` VALUES (203, '通知公告', 1, 'com.ruoyi.web.controller.system.SysNoticeController.addSave()', 'POST', 1, 'admin', '网络19.1', '/system/notice/add', '127.0.0.1', '内网IP', '{\"noticeTitle\":[\"温馨提醒：2023-03-24 招聘网站数据分析系统V1.1发布啦！\"],\"noticeType\":[\"2\"],\"noticeContent\":[\"<p><br></p>\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-27 09:13:54', 21);
INSERT INTO `sys_oper_log` VALUES (204, '通知公告', 2, 'com.ruoyi.web.controller.system.SysNoticeController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/notice/edit', '127.0.0.1', '内网IP', '{\"noticeId\":[\"2\"],\"noticeTitle\":[\"维护通知：2023-03-24 招聘网站数据分析系统凌晨维护\"],\"noticeType\":[\"1\"],\"noticeContent\":[\"<p>维护内容：</p><p>1.登录界面验证码问题</p><p>2.个人信息界面的完善</p><p>3.修复部分bug，增强用户体验</p>\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-27 09:15:11', 17);
INSERT INTO `sys_oper_log` VALUES (205, '通知公告', 2, 'com.ruoyi.web.controller.system.SysNoticeController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/notice/edit', '127.0.0.1', '内网IP', '{\"noticeId\":[\"2\"],\"noticeTitle\":[\"维护通知：2023-03-25 招聘网站数据分析系统凌晨维护\"],\"noticeType\":[\"1\"],\"noticeContent\":[\"<p>维护内容：</p><p>1.登录界面验证码问题</p><p>2.个人信息界面的完善</p><p>3.修复部分bug，增强用户体验</p>\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-27 09:19:52', 15);
INSERT INTO `sys_oper_log` VALUES (206, '通知公告', 2, 'com.ruoyi.web.controller.system.SysNoticeController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/notice/edit', '127.0.0.1', '内网IP', '{\"noticeId\":[\"10\"],\"noticeTitle\":[\"温馨提醒：2023-03-24 招聘网站数据分析系统V1.1发布啦！\"],\"noticeType\":[\"2\"],\"noticeContent\":[\"<p>版本内容：</p><p>1.招聘数据的展示</p><p>2.学生角色的登录与注册，新增登录验证码</p><p>3.个人信息修改</p>\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-27 09:22:16', 16);
INSERT INTO `sys_oper_log` VALUES (207, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2009\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"学校官网\"],\"url\":[\"https://webvpn.beihua.edu.cn/https/77726476706e69737468656265737421e7f2438a373e26527b0181b9991b2631fb4c4ab1/login?cas_login=true&ticket=ST-2506671-qLbLRAJROgVLiairwsDQ1679835899710-1j2U-cas\"],\"target\":[\"menuBlank\"],\"perms\":[\"\"],\"orderNum\":[\"12\"],\"icon\":[\"fa fa-mortar-board\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-27 12:02:32', 22);
INSERT INTO `sys_oper_log` VALUES (208, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"24365校园招聘\"],\"url\":[\"https://www.ncss.cn/student/24365\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"11\"],\"icon\":[\"fa fa-globe\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-27 12:04:14', 16);
INSERT INTO `sys_oper_log` VALUES (209, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"101\"],\"roleName\":[\"学生\"],\"roleKey\":[\"senior\"],\"roleSort\":[\"4\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"2005,2008,2007,2006,2010,2009\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-27 12:04:25', 83);
INSERT INTO `sys_oper_log` VALUES (210, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"102\"],\"roleName\":[\"管理员\"],\"roleKey\":[\"admin1\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"2005,1,100,1000,1001,1002,1003,1004,1005,1006,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,107,1035,1036,1037,1038,108,501,1043,1044,1045,2,109,1047,1048,1049,111,112,113,2008,2007,2006,2010,2009\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-27 12:04:30', 19);
INSERT INTO `sys_oper_log` VALUES (211, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2010\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"24365校园招聘\"],\"url\":[\"https://www.ncss.cn/student/24365\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"11\"],\"icon\":[\"fa fa-globe\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-27 12:07:10', 18);
INSERT INTO `sys_oper_log` VALUES (212, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2010\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"24365校园招聘\"],\"url\":[\"https://www.ncss.cn/student/24365\"],\"target\":[\"menuBlank\"],\"perms\":[\"\"],\"orderNum\":[\"11\"],\"icon\":[\"fa fa-globe\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-27 12:07:34', 20);
INSERT INTO `sys_oper_log` VALUES (213, '通知公告', 1, 'com.ruoyi.web.controller.system.SysNoticeController.addSave()', 'POST', 1, 'admin', '网络19.1', '/system/notice/add', '127.0.0.1', '内网IP', '{\"noticeTitle\":[\"学院通知  “屏相见  向未来” 就业信息推送 | 3月25日\"],\"noticeType\":[\"1\"],\"noticeContent\":[\"<p><b>通知人：</b>学生就业处</p><p><b>时间：</b>2023-3-25</p><p><b>内容：</b></p><p>海兴电力（上市公司、总部杭州）2023春季校园招聘</p><p>中电金信2023年校园招聘</p><p>点击查看详情：<a href=\\\"https://m.bysjy.com.cn/student/chance/newsdetails.html?token=yxqqnn0100000010&amp;notice_id=816303\\\" target=\\\"_blank\\\">https://m.bysjy.com.cn/student/chance/newsdetails.html?token=yxqqnn0100000010¬ice_id=816303</a><br></p>\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-27 16:24:07', 117);
INSERT INTO `sys_oper_log` VALUES (214, '通知公告', 2, 'com.ruoyi.web.controller.system.SysNoticeController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/notice/edit', '127.0.0.1', '内网IP', '{\"noticeId\":[\"11\"],\"noticeTitle\":[\"学院通知  “屏相见  向未来” 就业信息推送 | 3月25日\"],\"noticeType\":[\"1\"],\"noticeContent\":[\"<p><b>通知人：</b>学生就业处</p><p><b>时间：</b>2023-3-25</p><p><b>内容：</b></p><p>海兴电力（上市公司、总部杭州）2023春季校园招聘</p><p>中电金信2023年校园招聘</p><p>点击查看详情：<a href=\\\"https://m.bysjy.com.cn/student/chance/newsdetails.html?token=yxqqnn0100000010&amp;notice_id=816303\\\" target=\\\"_blank\\\">https://m.bysjy.com.cn/student/chance/newsdetails.html?token=yxqqnn0100000010¬ice_id=816303</a><br></p>\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-27 16:26:20', 19);
INSERT INTO `sys_oper_log` VALUES (215, '通知公告', 2, 'com.ruoyi.web.controller.system.SysNoticeController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/notice/edit', '127.0.0.1', '内网IP', '{\"noticeId\":[\"1\"],\"noticeTitle\":[\"温馨提醒：2023-03-24 招聘网站数据新V1.0发布啦！\"],\"noticeType\":[\"2\"],\"noticeContent\":[\"<p><b>版本内容：</b></p><p>1.招聘数据的展示</p><p>2.学生角色的登录与注册</p><p>3.个人信息修改</p>\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-27 16:26:32', 20);
INSERT INTO `sys_oper_log` VALUES (216, '通知公告', 2, 'com.ruoyi.web.controller.system.SysNoticeController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/notice/edit', '127.0.0.1', '内网IP', '{\"noticeId\":[\"2\"],\"noticeTitle\":[\"维护通知：2023-03-25 招聘网站数据分析系统凌晨维护\"],\"noticeType\":[\"1\"],\"noticeContent\":[\"<p><b>维护内容：</b></p><p>1.修复登录界面验证码问题</p><p>2.完善个人信息界面</p><p>3.修复部分bug，增强用户体验</p>\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-27 16:27:04', 10);
INSERT INTO `sys_oper_log` VALUES (217, '通知公告', 2, 'com.ruoyi.web.controller.system.SysNoticeController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/notice/edit', '127.0.0.1', '内网IP', '{\"noticeId\":[\"10\"],\"noticeTitle\":[\"温馨提醒：2023-03-24 招聘网站数据分析系统V1.1发布啦！\"],\"noticeType\":[\"2\"],\"noticeContent\":[\"<p><b>版本内容：</b></p><p>1.招聘数据的展示</p><p>2.学生角色的登录与注册</p><p>3.个人信息修改<br></p><p><b>新增：</b></p><p>登录验证码</p><p><br></p>\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-27 16:27:42', 8);
INSERT INTO `sys_oper_log` VALUES (218, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.addSave()', 'POST', 1, 'admin', '网络19.1', '/system/role/add', '127.0.0.1', '内网IP', '{\"roleName\":[\"学生就业处\"],\"roleKey\":[\"employment department\"],\"roleSort\":[\"5\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"2005,1,104,1020,1021,1022,1023,1024,107,1035,1036,1037,1038,2008,2007,2006,2010,2009\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-27 16:33:40', 73);
INSERT INTO `sys_oper_log` VALUES (219, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"101\"],\"roleName\":[\"学生\"],\"roleKey\":[\"senior\"],\"roleSort\":[\"4\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"2005,1,103,1016,104,1020,1024,107,1035,2008,2007,2006,2010,2009\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-27 19:27:50', 207);
INSERT INTO `sys_oper_log` VALUES (220, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"103\"],\"roleName\":[\"学生就业处\"],\"roleKey\":[\"employment department\"],\"roleSort\":[\"5\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"2005,1,103,1016,104,1020,1021,1022,1023,1024,107,1035,1036,1037,1038,2008,2007,2006,2010,2009\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-27 19:28:14', 25);
INSERT INTO `sys_oper_log` VALUES (221, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"101\"],\"roleName\":[\"学生\"],\"roleKey\":[\"senior\"],\"roleSort\":[\"4\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"2005,1,103,1016,104,1020,1021,1022,1023,1024,107,1035,1036,1037,1038,2008,2007,2006,2010,2009\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-27 19:37:18', 146);
INSERT INTO `sys_oper_log` VALUES (222, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"101\"],\"roleName\":[\"学生\"],\"roleKey\":[\"senior\"],\"roleSort\":[\"4\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"2005,1,103,1016,104,1020,1021,1022,1024,107,1035,1036,1037,1038,2008,2007,2006,2010,2009\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-27 19:40:47', 19);
INSERT INTO `sys_oper_log` VALUES (223, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"101\"],\"roleName\":[\"学生\"],\"roleKey\":[\"senior\"],\"roleSort\":[\"4\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"2005,1,103,1016,104,1020,1021,1024,107,1035,1036,1037,1038,2008,2007,2006,2010,2009\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-27 19:42:17', 22);
INSERT INTO `sys_oper_log` VALUES (224, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"101\"],\"roleName\":[\"学生\"],\"roleKey\":[\"senior\"],\"roleSort\":[\"4\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"2005,1,103,1016,104,1020,1021,1022,1024,107,1035,1036,1037,1038,2008,2007,2006,2010,2009\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-27 19:43:53', 30);
INSERT INTO `sys_oper_log` VALUES (225, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"101\"],\"roleName\":[\"学生\"],\"roleKey\":[\"senior\"],\"roleSort\":[\"4\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"2005,1,103,1016,104,1020,1021,1022,1023,1024,107,1035,1036,1037,1038,2008,2007,2006,2010,2009\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-27 19:44:10', 28);
INSERT INTO `sys_oper_log` VALUES (226, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"101\"],\"roleName\":[\"学生\"],\"roleKey\":[\"senior\"],\"roleSort\":[\"4\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"2005,1,103,1016,104,1020,1021,1022,1024,107,1035,1036,1037,1038,2008,2007,2006,2010,2009\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-27 19:44:30', 27);
INSERT INTO `sys_oper_log` VALUES (227, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"101\"],\"roleName\":[\"学生\"],\"roleKey\":[\"senior\"],\"roleSort\":[\"4\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"2005,1,103,1016,104,1020,1021,1022,1023,1024,107,1035,1036,1037,1038,2008,2007,2006,2010,2009\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-27 19:45:28', 28);
INSERT INTO `sys_oper_log` VALUES (228, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"101\"],\"roleName\":[\"学生\"],\"roleKey\":[\"senior\"],\"roleSort\":[\"4\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"2005,1,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,107,1035,1036,1037,1038,2008,2007,2006,2010,2009\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-27 19:47:40', 16);
INSERT INTO `sys_oper_log` VALUES (229, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"101\"],\"roleName\":[\"学生\"],\"roleKey\":[\"senior\"],\"roleSort\":[\"4\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"2005,1,104,1020,1021,1022,1023,1024,107,1035,1036,1037,1038,2008,2007,2006,2010,2009\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-27 19:50:07', 24);
INSERT INTO `sys_oper_log` VALUES (230, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"104\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"岗位管理\"],\"url\":[\"/system/post\"],\"target\":[\"menuItem\"],\"perms\":[\"system:post:view\"],\"orderNum\":[\"5\"],\"icon\":[\"fa fa-address-card-o\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-27 19:50:27', 13);
INSERT INTO `sys_oper_log` VALUES (231, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"104\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"岗位管理\"],\"url\":[\"/system/post\"],\"target\":[\"menuItem\"],\"perms\":[\"system:post:view\"],\"orderNum\":[\"5\"],\"icon\":[\"fa fa-address-card-o\"],\"visible\":[\"1\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-27 19:53:59', 16);
INSERT INTO `sys_oper_log` VALUES (232, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"101\"],\"roleName\":[\"学生\"],\"roleKey\":[\"senior\"],\"roleSort\":[\"4\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"2005,1,104,1020,1021,1022,1023,1024,107,1035,1036,1037,1038,2008,2007,2006,2010,2009\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-27 19:55:13', 17);
INSERT INTO `sys_oper_log` VALUES (233, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"104\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"岗位管理\"],\"url\":[\"/system/post\"],\"target\":[\"menuItem\"],\"perms\":[\"system:post:view\"],\"orderNum\":[\"5\"],\"icon\":[\"fa fa-address-card-o\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-27 19:56:35', 12);
INSERT INTO `sys_oper_log` VALUES (234, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2007\"],\"menuType\":[\"F\"],\"menuName\":[\"信息查询\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-27 20:00:28', 20);
INSERT INTO `sys_oper_log` VALUES (235, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2007\"],\"menuType\":[\"F\"],\"menuName\":[\"信息新增\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-27 20:02:11', 20);
INSERT INTO `sys_oper_log` VALUES (236, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2007\"],\"menuType\":[\"F\"],\"menuName\":[\"信息修改\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-27 20:02:34', 11);
INSERT INTO `sys_oper_log` VALUES (237, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2007\"],\"menuType\":[\"F\"],\"menuName\":[\"信息删除\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"4\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-27 20:03:07', 19);
INSERT INTO `sys_oper_log` VALUES (238, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2007\"],\"menuType\":[\"F\"],\"menuName\":[\"信息导出\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"5\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-27 20:03:26', 11);
INSERT INTO `sys_oper_log` VALUES (239, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"101\"],\"roleName\":[\"学生\"],\"roleKey\":[\"senior\"],\"roleSort\":[\"4\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"2005,1,104,1020,1024,107,1035,1036,1037,1038,2008,2007,2011,2015,2006,2010,2009\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-27 20:16:00', 28);
INSERT INTO `sys_oper_log` VALUES (240, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"101\"],\"roleName\":[\"学生\"],\"roleKey\":[\"senior\"],\"roleSort\":[\"4\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"2005,1,107,1035,1036,1037,1038,2008,2007,2011,2015,2006,2010,2009\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-27 20:16:57', 25);
INSERT INTO `sys_oper_log` VALUES (241, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"101\"],\"roleName\":[\"学生\"],\"roleKey\":[\"senior\"],\"roleSort\":[\"4\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"2005,1,104,1020,1021,1022,1023,1024,107,1035,1036,1037,1038,2008,2007,2011,2015,2006,2010,2009\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-28 22:37:55', 218);
INSERT INTO `sys_oper_log` VALUES (242, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"107\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"通知公告\"],\"url\":[\"/system/notice\"],\"target\":[\"menuItem\"],\"perms\":[\"system:notice:view\"],\"orderNum\":[\"8\"],\"icon\":[\"fa fa-bullhorn\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-28 22:44:12', 10);
INSERT INTO `sys_oper_log` VALUES (243, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"101\"],\"roleName\":[\"学生\"],\"roleKey\":[\"senior\"],\"roleSort\":[\"4\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"2005,1,104,1020,1024,107,1035,1038,2008,2007,2011,2015,2006,2010,2009\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-28 22:44:56', 20);
INSERT INTO `sys_oper_log` VALUES (244, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"101\"],\"roleName\":[\"学生\"],\"roleKey\":[\"senior\"],\"roleSort\":[\"4\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"2005,1,104,1020,1024,107,1035,2008,2007,2011,2015,2006,2010,2009\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-28 22:46:13', 32);
INSERT INTO `sys_oper_log` VALUES (245, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2005\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"个人中心\"],\"url\":[\"/system/user/profile\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"0\"],\"icon\":[\"fa fa-vcard\"],\"visible\":[\"0\"],\"isRefresh\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-28 22:52:45', 8);
INSERT INTO `sys_oper_log` VALUES (246, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"104\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"岗位管理\"],\"url\":[\"/system/jiuye\"],\"target\":[\"menuItem\"],\"perms\":[\"system:post:view\"],\"orderNum\":[\"5\"],\"icon\":[\"fa fa-address-card-o\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-29 16:58:02', 174);
INSERT INTO `sys_oper_log` VALUES (247, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"101\"],\"roleName\":[\"学生\"],\"roleKey\":[\"senior\"],\"roleSort\":[\"4\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"2005,2008,2007,2011,2015,2006,2010,2009\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-29 17:41:06', 316);
INSERT INTO `sys_oper_log` VALUES (248, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2007\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"本地招聘信息\"],\"url\":[\"/system/jiuye\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"9\"],\"icon\":[\"fa fa-briefcase\"],\"visible\":[\"0\"],\"isRefresh\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-29 17:52:33', 315);
INSERT INTO `sys_oper_log` VALUES (249, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"104\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"岗位管理\"],\"url\":[\"/system/post\"],\"target\":[\"menuItem\"],\"perms\":[\"system:post:view\"],\"orderNum\":[\"5\"],\"icon\":[\"fa fa-address-card-o\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-29 17:52:56', 30);
INSERT INTO `sys_oper_log` VALUES (250, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"104\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"岗位管理\"],\"url\":[\"/system/post\"],\"target\":[\"menuItem\"],\"perms\":[\"system:post:view\"],\"orderNum\":[\"5\"],\"icon\":[\"fa fa-address-card-o\"],\"visible\":[\"1\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-29 17:54:09', 32);
INSERT INTO `sys_oper_log` VALUES (251, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"101\"],\"roleName\":[\"学生\"],\"roleKey\":[\"senior\"],\"roleSort\":[\"4\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"2005,1,104,1020,1024,2008,2007,2011,2015,2006,2010,2009\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-29 17:54:46', 79);
INSERT INTO `sys_oper_log` VALUES (252, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"104\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"岗位管理\"],\"url\":[\"/system/jiuye\"],\"target\":[\"menuItem\"],\"perms\":[\"system:post:view\"],\"orderNum\":[\"5\"],\"icon\":[\"fa fa-address-card-o\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-29 18:52:58', 280);
INSERT INTO `sys_oper_log` VALUES (253, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"3\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"系统工具\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1110\"],\"icon\":[\"fa fa-bars\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-29 19:24:06', 333);
INSERT INTO `sys_oper_log` VALUES (254, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '网络19.1', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"zhaopin\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-29 19:50:04', 222);
INSERT INTO `sys_oper_log` VALUES (255, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '网络19.1', '/tool/gen/download/zhaopin', '127.0.0.1', '内网IP', '\"zhaopin\"', NULL, 0, NULL, '2023-03-29 19:53:59', 769);
INSERT INTO `sys_oper_log` VALUES (256, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2007\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"本地招聘信息\"],\"url\":[\"/system/zhaopin\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"9\"],\"icon\":[\"fa fa-briefcase\"],\"visible\":[\"0\"],\"isRefresh\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-29 20:07:53', 177);
INSERT INTO `sys_oper_log` VALUES (257, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"101\"],\"roleName\":[\"学生\"],\"roleKey\":[\"senior\"],\"roleSort\":[\"4\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"2005,1,104,1020,1024,2008,2007,2011,2015,2006,2010,2009\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-29 20:08:13', 50);
INSERT INTO `sys_oper_log` VALUES (258, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"101\"],\"roleName\":[\"学生\"],\"roleKey\":[\"senior\"],\"roleSort\":[\"4\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"2005,2008,2007,2011,2012,2013,2014,2015,2006,2010,2009\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-29 20:09:26', 21);
INSERT INTO `sys_oper_log` VALUES (259, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2007\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"本地招聘信息\"],\"url\":[\"/system/zhaopin\"],\"target\":[\"menuItem\"],\"perms\":[\"system:zhaopin:view\"],\"orderNum\":[\"9\"],\"icon\":[\"fa fa-briefcase\"],\"visible\":[\"0\"],\"isRefresh\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-29 20:12:25', 14);
INSERT INTO `sys_oper_log` VALUES (260, '重置密码', 2, 'com.ruoyi.web.controller.system.SysProfileController.resetPwd()', 'POST', 1, 'admin', '网络19.1', '/system/user/profile/resetPwd', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-29 20:14:41', 36);
INSERT INTO `sys_oper_log` VALUES (261, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2007\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"本地招聘信息\"],\"url\":[\"/system/zhaopin\"],\"target\":[\"menuItem\"],\"perms\":[\"system:zhaopin:list\"],\"orderNum\":[\"9\"],\"icon\":[\"fa fa-briefcase\"],\"visible\":[\"0\"],\"isRefresh\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-29 20:15:09', 13);
INSERT INTO `sys_oper_log` VALUES (262, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"101\"],\"roleName\":[\"学生\"],\"roleKey\":[\"senior\"],\"roleSort\":[\"4\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"2005,2008,2007,2011,2015,2006,2010,2009\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-29 20:15:27', 17);
INSERT INTO `sys_oper_log` VALUES (263, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2007\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"本地招聘信息\"],\"url\":[\"/system/zhaopin\"],\"target\":[\"menuItem\"],\"perms\":[\"system:zhaopin:view\"],\"orderNum\":[\"9\"],\"icon\":[\"fa fa-briefcase\"],\"visible\":[\"0\"],\"isRefresh\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-29 20:17:55', 39);
INSERT INTO `sys_oper_log` VALUES (264, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2011\"],\"parentId\":[\"2007\"],\"menuType\":[\"F\"],\"menuName\":[\"信息查询\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"system:zhaopin:list\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-29 20:18:16', 15);
INSERT INTO `sys_oper_log` VALUES (265, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2012\"],\"parentId\":[\"2007\"],\"menuType\":[\"F\"],\"menuName\":[\"信息新增\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"system:zhaopin:add\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-29 20:18:50', 23);
INSERT INTO `sys_oper_log` VALUES (266, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2013\"],\"parentId\":[\"2007\"],\"menuType\":[\"F\"],\"menuName\":[\"信息修改\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"system:zhaopin:edit\"],\"orderNum\":[\"3\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-29 20:19:17', 13);
INSERT INTO `sys_oper_log` VALUES (267, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2014\"],\"parentId\":[\"2007\"],\"menuType\":[\"F\"],\"menuName\":[\"信息删除\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"system:zhaopin:remove\"],\"orderNum\":[\"4\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-29 20:19:51', 22);
INSERT INTO `sys_oper_log` VALUES (268, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2015\"],\"parentId\":[\"2007\"],\"menuType\":[\"F\"],\"menuName\":[\"信息导出\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"system:zhaopin:export\"],\"orderNum\":[\"5\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-29 20:20:13', 14);
INSERT INTO `sys_oper_log` VALUES (269, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2015\"],\"parentId\":[\"2007\"],\"menuType\":[\"F\"],\"menuName\":[\"信息导出\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"system:zhaopin:export\"],\"orderNum\":[\"5\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-29 20:21:00', 18);
INSERT INTO `sys_oper_log` VALUES (270, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"104\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"岗位管理\"],\"url\":[\"/system/post\"],\"target\":[\"menuItem\"],\"perms\":[\"system:post:view\"],\"orderNum\":[\"5\"],\"icon\":[\"fa fa-address-card-o\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-29 20:50:46', 156);
INSERT INTO `sys_oper_log` VALUES (271, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2007\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"本地招聘信息\"],\"url\":[\"/system/就业\"],\"target\":[\"menuItem\"],\"perms\":[\"system:jiuye:view\"],\"orderNum\":[\"9\"],\"icon\":[\"fa fa-briefcase\"],\"visible\":[\"0\"],\"isRefresh\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-29 20:54:56', 15);
INSERT INTO `sys_oper_log` VALUES (272, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2011\"],\"parentId\":[\"2007\"],\"menuType\":[\"F\"],\"menuName\":[\"信息查询\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"system:jiuye:list\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-29 20:55:13', 13);
INSERT INTO `sys_oper_log` VALUES (273, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2012\"],\"parentId\":[\"2007\"],\"menuType\":[\"F\"],\"menuName\":[\"信息新增\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"system:jiuye:add\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-29 20:56:01', 15);
INSERT INTO `sys_oper_log` VALUES (274, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2013\"],\"parentId\":[\"2007\"],\"menuType\":[\"F\"],\"menuName\":[\"信息修改\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"system:jiuye:edit\"],\"orderNum\":[\"3\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-29 20:56:12', 23);
INSERT INTO `sys_oper_log` VALUES (275, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2014\"],\"parentId\":[\"2007\"],\"menuType\":[\"F\"],\"menuName\":[\"信息删除\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"system:jiuye:remove\"],\"orderNum\":[\"4\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-29 20:56:23', 12);
INSERT INTO `sys_oper_log` VALUES (276, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2015\"],\"parentId\":[\"2007\"],\"menuType\":[\"F\"],\"menuName\":[\"信息导出\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"system:jiuye:export\"],\"orderNum\":[\"5\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-29 20:56:35', 21);
INSERT INTO `sys_oper_log` VALUES (277, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2007\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"本地招聘信息\"],\"url\":[\"/system/jiuye\"],\"target\":[\"menuItem\"],\"perms\":[\"system:jiuye:view\"],\"orderNum\":[\"9\"],\"icon\":[\"fa fa-briefcase\"],\"visible\":[\"0\"],\"isRefresh\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-29 21:26:58', 158);
INSERT INTO `sys_oper_log` VALUES (278, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"101\"],\"roleName\":[\"学生\"],\"roleKey\":[\"senior\"],\"roleSort\":[\"4\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"2005,2008,2007,2011,2015,2006,2010,2009\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-29 21:28:29', 51);
INSERT INTO `sys_oper_log` VALUES (279, '岗位管理', 1, 'com.ruoyi.web.controller.system.JiuyeController.addSave()', 'POST', 1, 'admin', '网络19.1', '/system/jiuye/add', '127.0.0.1', '内网IP', '{\"postName\":[\"北京\"],\"postCode\":[\"python\"],\"postSort\":[\"7\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-29 21:39:01', 155);
INSERT INTO `sys_oper_log` VALUES (280, '岗位管理', 3, 'com.ruoyi.web.controller.system.JiuyeController.remove()', 'POST', 1, 'admin', '网络19.1', '/system/jiuye/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"7\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-29 21:39:39', 38);
INSERT INTO `sys_oper_log` VALUES (281, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"104\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"岗位管理\"],\"url\":[\"/system/post\"],\"target\":[\"menuItem\"],\"perms\":[\"system:post:view\"],\"orderNum\":[\"5\"],\"icon\":[\"fa fa-address-card-o\"],\"visible\":[\"1\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-29 21:41:08', 38);
INSERT INTO `sys_oper_log` VALUES (282, '岗位管理', 1, 'com.ruoyi.web.controller.system.JiuyeController.addSave()', 'POST', 1, 'admin', '网络19.1', '/system/jiuye/add', '127.0.0.1', '内网IP', '{\"postName\":[\"北京\"],\"postCode\":[\"python\"],\"postSort\":[\"7\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-29 21:45:36', 228);
INSERT INTO `sys_oper_log` VALUES (283, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"104\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"岗位管理\"],\"url\":[\"/system/post\"],\"target\":[\"menuItem\"],\"perms\":[\"system:post:view\"],\"orderNum\":[\"5\"],\"icon\":[\"fa fa-address-card-o\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-29 21:59:24', 232);
INSERT INTO `sys_oper_log` VALUES (284, '岗位管理', 5, 'com.ruoyi.web.controller.system.JiuyeController.export()', 'POST', 1, 'admin', '网络19.1', '/system/jiuye/export', '127.0.0.1', '内网IP', '{\"postCode\":[\"\"],\"postName\":[\"\"],\"status\":[\"\"],\"orderByColumn\":[\"postSort\"],\"isAsc\":[\"asc\"]}', '{\"msg\":\"3fd8bf1e-4f94-4b6c-aedf-6e5fa3e4bc75_岗位数据.xlsx\",\"code\":0}', 0, NULL, '2023-03-29 21:59:48', 1203);
INSERT INTO `sys_oper_log` VALUES (285, '岗位管理', 2, 'com.ruoyi.web.controller.system.SysPostController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/post/edit', '127.0.0.1', '内网IP', '{\"postId\":[\"8\"],\"postName\":[\"北京\"],\"postCode\":[\"pythom\"],\"postSort\":[\"7\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-29 22:31:17', 186);
INSERT INTO `sys_oper_log` VALUES (286, '岗位管理', 2, 'com.ruoyi.web.controller.system.SysPostController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/post/edit', '127.0.0.1', '内网IP', '{\"postId\":[\"8\"],\"postName\":[\"北京\"],\"postCode\":[\"python\"],\"postSort\":[\"7\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-29 22:41:55', 139);
INSERT INTO `sys_oper_log` VALUES (287, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"104\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"岗位管理\"],\"url\":[\"/system/post\"],\"target\":[\"menuItem\"],\"perms\":[\"system:post:view\"],\"orderNum\":[\"5\"],\"icon\":[\"fa fa-address-card-o\"],\"visible\":[\"1\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-30 17:32:03', 189);
INSERT INTO `sys_oper_log` VALUES (288, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2008\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"通知与公告\"],\"url\":[\"/system/tongzhi\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"8\"],\"icon\":[\"fa fa-bullhorn\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-30 17:33:03', 17);
INSERT INTO `sys_oper_log` VALUES (289, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2008\"],\"menuType\":[\"F\"],\"menuName\":[\"公告查询\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"system:tongzhi:list\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-30 17:33:30', 13);
INSERT INTO `sys_oper_log` VALUES (290, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2008\"],\"menuType\":[\"F\"],\"menuName\":[\"公告新增\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"system:tongzhi:add\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-30 17:34:13', 15);
INSERT INTO `sys_oper_log` VALUES (291, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2008\"],\"menuType\":[\"F\"],\"menuName\":[\"公告修改\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"system:tongzhi:edit\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-30 17:35:58', 40);
INSERT INTO `sys_oper_log` VALUES (292, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2008\"],\"menuType\":[\"F\"],\"menuName\":[\"公告删除\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"system:tongzhi:\"],\"orderNum\":[\"4\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-30 17:37:19', 22);
INSERT INTO `sys_oper_log` VALUES (293, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2019\"],\"parentId\":[\"2008\"],\"menuType\":[\"F\"],\"menuName\":[\"公告删除\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"system:tongzhi:remove\"],\"orderNum\":[\"4\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-30 17:37:38', 17);
INSERT INTO `sys_oper_log` VALUES (294, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"107\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"通知公告\"],\"url\":[\"/system/notice\"],\"target\":[\"menuItem\"],\"perms\":[\"system:notice:view\"],\"orderNum\":[\"8\"],\"icon\":[\"fa fa-bullhorn\"],\"visible\":[\"1\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-30 17:37:52', 13);
INSERT INTO `sys_oper_log` VALUES (295, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"101\"],\"roleName\":[\"学生\"],\"roleKey\":[\"senior\"],\"roleSort\":[\"4\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"2005,2008,2016,2007,2011,2015,2006,2010,2009\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-30 17:38:26', 42);
INSERT INTO `sys_oper_log` VALUES (296, '通知公告', 1, 'com.ruoyi.web.controller.system.SysNoticeController.addSave()', 'POST', 1, 'admin', '网络19.1', '/system/notice/add', '127.0.0.1', '内网IP', '{\"noticeTitle\":[\"1\"],\"noticeType\":[\"1\"],\"noticeContent\":[\"<p>1</p>\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-30 17:48:06', 129);
INSERT INTO `sys_oper_log` VALUES (297, '通知公告', 2, 'com.ruoyi.web.controller.system.SysNoticeController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/notice/edit', '127.0.0.1', '内网IP', '{\"noticeId\":[\"12\"],\"noticeTitle\":[\"12\"],\"noticeType\":[\"1\"],\"noticeContent\":[\"<p>12</p>\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-30 17:49:09', 8);
INSERT INTO `sys_oper_log` VALUES (298, '通知公告', 3, 'com.ruoyi.web.controller.system.SysNoticeController.remove()', 'POST', 1, 'admin', '网络19.1', '/system/notice/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"12\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-30 17:49:13', 8);
INSERT INTO `sys_oper_log` VALUES (299, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2008\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"通知与公告\"],\"url\":[\"/system/tongzhi\"],\"target\":[\"menuItem\"],\"perms\":[\"system:tongzhi:view\"],\"orderNum\":[\"8\"],\"icon\":[\"fa fa-bullhorn\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-30 17:49:51', 23);
INSERT INTO `sys_oper_log` VALUES (300, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2011\"],\"parentId\":[\"2007\"],\"menuType\":[\"F\"],\"menuName\":[\"信息查询\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"system:zhaopin:list\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-30 19:40:18', 13);
INSERT INTO `sys_oper_log` VALUES (301, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2016\"],\"parentId\":[\"2008\"],\"menuType\":[\"F\"],\"menuName\":[\"公告查询\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"system:zhaopin:list\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-30 19:40:56', 15);
INSERT INTO `sys_oper_log` VALUES (302, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2016\"],\"parentId\":[\"2008\"],\"menuType\":[\"F\"],\"menuName\":[\"公告查询\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"system:tongzhi:list\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-30 19:42:13', 26);
INSERT INTO `sys_oper_log` VALUES (303, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2011\"],\"parentId\":[\"2007\"],\"menuType\":[\"F\"],\"menuName\":[\"信息查询\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"system::list\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-30 19:42:38', 13);
INSERT INTO `sys_oper_log` VALUES (304, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2011\"],\"parentId\":[\"2007\"],\"menuType\":[\"F\"],\"menuName\":[\"信息查询\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"system:dept:list\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-30 19:42:58', 13);
INSERT INTO `sys_oper_log` VALUES (305, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"101\"],\"roleName\":[\"学生\"],\"roleKey\":[\"senior\"],\"roleSort\":[\"4\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"2005,1,103,1016,1017,1018,1019,2008,2016,2007,2011,2015,2006,2010,2009\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-30 19:43:15', 42);
INSERT INTO `sys_oper_log` VALUES (306, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2007\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"本地招聘信息\"],\"url\":[\"/system/zhaopin\"],\"target\":[\"menuItem\"],\"perms\":[\"system:jiuye:view\"],\"orderNum\":[\"9\"],\"icon\":[\"fa fa-briefcase\"],\"visible\":[\"0\"],\"isRefresh\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-30 19:45:41', 14);
INSERT INTO `sys_oper_log` VALUES (307, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2011\"],\"parentId\":[\"2007\"],\"menuType\":[\"F\"],\"menuName\":[\"信息查询\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"system:zhaopin:list\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-30 19:45:58', 32);
INSERT INTO `sys_oper_log` VALUES (308, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2007\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"本地招聘信息\"],\"url\":[\"/system/zhaopin\"],\"target\":[\"menuItem\"],\"perms\":[\"system:zhaopin:view\"],\"orderNum\":[\"9\"],\"icon\":[\"fa fa-briefcase\"],\"visible\":[\"0\"],\"isRefresh\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-30 19:47:19', 12);
INSERT INTO `sys_oper_log` VALUES (309, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"104\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"岗位管理\"],\"url\":[\"/system/jiuye\"],\"target\":[\"menuItem\"],\"perms\":[\"system:jiuye:view\"],\"orderNum\":[\"5\"],\"icon\":[\"fa fa-address-card-o\"],\"visible\":[\"1\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-30 20:08:14', 20);
INSERT INTO `sys_oper_log` VALUES (310, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1020\"],\"parentId\":[\"104\"],\"menuType\":[\"F\"],\"menuName\":[\"岗位查询\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"system:jiuye:list\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-30 20:08:40', 19);
INSERT INTO `sys_oper_log` VALUES (311, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1021\"],\"parentId\":[\"104\"],\"menuType\":[\"F\"],\"menuName\":[\"岗位新增\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"system:jiuye:add\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-30 20:08:56', 21);
INSERT INTO `sys_oper_log` VALUES (312, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1022\"],\"parentId\":[\"104\"],\"menuType\":[\"F\"],\"menuName\":[\"岗位修改\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"system:jiuye:edit\"],\"orderNum\":[\"3\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-30 20:09:11', 13);
INSERT INTO `sys_oper_log` VALUES (313, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1023\"],\"parentId\":[\"104\"],\"menuType\":[\"F\"],\"menuName\":[\"岗位删除\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"system:jiuye:remove\"],\"orderNum\":[\"4\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-30 20:09:27', 24);
INSERT INTO `sys_oper_log` VALUES (314, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1024\"],\"parentId\":[\"104\"],\"menuType\":[\"F\"],\"menuName\":[\"岗位导出\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"system:jiuye:export\"],\"orderNum\":[\"5\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-30 20:09:41', 28);
INSERT INTO `sys_oper_log` VALUES (315, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"107\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"通知公告\"],\"url\":[\"/system/tongzhi\"],\"target\":[\"menuItem\"],\"perms\":[\"system:tongzhi:view\"],\"orderNum\":[\"8\"],\"icon\":[\"fa fa-bullhorn\"],\"visible\":[\"1\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-30 20:10:15', 11);
INSERT INTO `sys_oper_log` VALUES (316, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1035\"],\"parentId\":[\"107\"],\"menuType\":[\"F\"],\"menuName\":[\"公告查询\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"system:tongzhi:list\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-30 20:10:31', 13);
INSERT INTO `sys_oper_log` VALUES (317, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1036\"],\"parentId\":[\"107\"],\"menuType\":[\"F\"],\"menuName\":[\"公告新增\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"system:tongzhi:add\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-30 20:10:47', 13);
INSERT INTO `sys_oper_log` VALUES (318, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1037\"],\"parentId\":[\"107\"],\"menuType\":[\"F\"],\"menuName\":[\"公告修改\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"system:tongzhi:edit\"],\"orderNum\":[\"3\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-30 20:11:07', 20);
INSERT INTO `sys_oper_log` VALUES (319, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1038\"],\"parentId\":[\"107\"],\"menuType\":[\"F\"],\"menuName\":[\"公告删除\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"system:tongzhi:remove\"],\"orderNum\":[\"4\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-30 20:11:23', 11);
INSERT INTO `sys_oper_log` VALUES (320, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2008\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"通知与公告\"],\"url\":[\"/system/notice\"],\"target\":[\"menuItem\"],\"perms\":[\"system:notice:view\"],\"orderNum\":[\"8\"],\"icon\":[\"fa fa-bullhorn\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-30 20:12:49', 9);
INSERT INTO `sys_oper_log` VALUES (321, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2016\"],\"parentId\":[\"2008\"],\"menuType\":[\"F\"],\"menuName\":[\"公告查询\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"system:notice:list\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-30 20:13:16', 21);
INSERT INTO `sys_oper_log` VALUES (322, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2017\"],\"parentId\":[\"2008\"],\"menuType\":[\"F\"],\"menuName\":[\"公告新增\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"system:notice:add\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-30 20:13:27', 25);
INSERT INTO `sys_oper_log` VALUES (323, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2018\"],\"parentId\":[\"2008\"],\"menuType\":[\"F\"],\"menuName\":[\"公告修改\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"system:notice:edit\"],\"orderNum\":[\"3\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-30 20:13:38', 25);
INSERT INTO `sys_oper_log` VALUES (324, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2019\"],\"parentId\":[\"2008\"],\"menuType\":[\"F\"],\"menuName\":[\"公告删除\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"system:notice:remove\"],\"orderNum\":[\"4\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-30 20:13:49', 24);
INSERT INTO `sys_oper_log` VALUES (325, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2007\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"本地招聘信息\"],\"url\":[\"/system/post\"],\"target\":[\"menuItem\"],\"perms\":[\"system:post:view\"],\"orderNum\":[\"9\"],\"icon\":[\"fa fa-briefcase\"],\"visible\":[\"0\"],\"isRefresh\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-30 20:14:32', 11);
INSERT INTO `sys_oper_log` VALUES (326, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2011\"],\"parentId\":[\"2007\"],\"menuType\":[\"F\"],\"menuName\":[\"信息查询\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"system:post:list\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-30 20:14:45', 10);
INSERT INTO `sys_oper_log` VALUES (327, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2012\"],\"parentId\":[\"2007\"],\"menuType\":[\"F\"],\"menuName\":[\"信息新增\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"system:post:add\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-30 20:15:18', 19);
INSERT INTO `sys_oper_log` VALUES (328, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2013\"],\"parentId\":[\"2007\"],\"menuType\":[\"F\"],\"menuName\":[\"信息修改\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"system:post:edit\"],\"orderNum\":[\"3\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-30 20:15:52', 19);
INSERT INTO `sys_oper_log` VALUES (329, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2014\"],\"parentId\":[\"2007\"],\"menuType\":[\"F\"],\"menuName\":[\"信息删除\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"system:post:remove\"],\"orderNum\":[\"4\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-30 20:16:04', 14);
INSERT INTO `sys_oper_log` VALUES (330, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2015\"],\"parentId\":[\"2007\"],\"menuType\":[\"F\"],\"menuName\":[\"信息导出\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"system:post:export\"],\"orderNum\":[\"5\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-30 20:18:03', 11);
INSERT INTO `sys_oper_log` VALUES (331, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"101\"],\"roleName\":[\"学生\"],\"roleKey\":[\"senior\"],\"roleSort\":[\"4\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"2005,2008,2016,2007,2011,2015,2006,2010,2009\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-30 22:58:28', 148);
INSERT INTO `sys_oper_log` VALUES (332, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"101\"],\"roleName\":[\"学生\"],\"roleKey\":[\"senior\"],\"roleSort\":[\"4\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"2005,2008,2016,2007,2011,2015,2006,2010,2009\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-30 22:58:41', 27);
INSERT INTO `sys_oper_log` VALUES (333, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"100\"],\"deptId\":[\"\"],\"userName\":[\"开发人员\"],\"dept.deptName\":[\"\"],\"phonenumber\":[\"\"],\"email\":[\"\"],\"loginName\":[\"2019150001\"],\"sex\":[\"0\"],\"role\":[\"102\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"102\"],\"postIds\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-04-01 11:21:22', 240);
INSERT INTO `sys_oper_log` VALUES (334, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"100\"],\"deptId\":[\"103\"],\"userName\":[\"开发人员\"],\"dept.deptName\":[\"网络19.1\"],\"phonenumber\":[\"\"],\"email\":[\"\"],\"loginName\":[\"201915030116\"],\"sex\":[\"0\"],\"role\":[\"102\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"102\"],\"postIds\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-04-01 11:31:54', 251);
INSERT INTO `sys_oper_log` VALUES (335, '重置密码', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwdSave()', 'POST', 1, 'admin', '网络19.1', '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"userId\":[\"2\"],\"loginName\":[\"SQT\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-04-01 11:36:07', 13);
INSERT INTO `sys_oper_log` VALUES (336, '重置密码', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwdSave()', 'POST', 1, 'admin', '网络19.1', '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"userId\":[\"102\"],\"loginName\":[\"20191503\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-04-01 11:47:56', 164);
INSERT INTO `sys_oper_log` VALUES (337, '重置密码', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwdSave()', 'POST', 1, 'admin', '网络19.1', '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"userId\":[\"100\"],\"loginName\":[\"20191501\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-04-01 11:48:08', 9);
INSERT INTO `sys_oper_log` VALUES (338, '重置密码', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwdSave()', 'POST', 1, 'admin', '网络19.1', '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"userId\":[\"2\"],\"loginName\":[\"SQT\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-04-01 11:48:16', 5);
INSERT INTO `sys_oper_log` VALUES (339, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'POST', 1, 'admin', '网络19.1', '/system/user/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-04-01 11:50:11', 68);
INSERT INTO `sys_oper_log` VALUES (340, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'POST', 1, 'admin', '网络19.1', '/system/user/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"100\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-04-01 11:50:16', 15);
INSERT INTO `sys_oper_log` VALUES (341, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'POST', 1, 'admin', '网络19.1', '/system/user/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"102\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-04-01 11:50:20', 21);
INSERT INTO `sys_oper_log` VALUES (342, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.addSave()', 'POST', 1, 'admin', '网络19.1', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"103\"],\"userName\":[\"开发人员\"],\"deptName\":[\"网络19.1\"],\"phonenumber\":[\"\"],\"email\":[\"\"],\"loginName\":[\"201915030116\"],\"sex\":[\"0\"],\"role\":[\"102\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"102\"],\"postIds\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-04-01 11:51:22', 21);
INSERT INTO `sys_oper_log` VALUES (343, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.addSave()', 'POST', 1, 'admin', '网络19.1', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"103\"],\"userName\":[\"小强\"],\"deptName\":[\"网络19.1\"],\"phonenumber\":[\"\"],\"email\":[\"\"],\"loginName\":[\"201915030101\"],\"sex\":[\"0\"],\"role\":[\"101\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"101\"],\"postIds\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-04-01 11:52:17', 29);
INSERT INTO `sys_oper_log` VALUES (344, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.addSave()', 'POST', 1, 'admin', '网络19.1', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"103\"],\"userName\":[\"小明\"],\"deptName\":[\"网络19.1\"],\"phonenumber\":[\"\"],\"email\":[\"\"],\"loginName\":[\"201915030102\"],\"sex\":[\"0\"],\"role\":[\"101\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"101\"],\"postIds\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-04-01 11:52:57', 22);
INSERT INTO `sys_oper_log` VALUES (345, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"103\"],\"deptId\":[\"103\"],\"userName\":[\"小天\"],\"dept.deptName\":[\"网络19.1\"],\"phonenumber\":[\"\"],\"email\":[\"\"],\"loginName\":[\"201915030116\"],\"sex\":[\"0\"],\"role\":[\"102\"],\"remark\":[\"开发人员\"],\"status\":[\"0\"],\"roleIds\":[\"102\"],\"postIds\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-04-01 12:01:24', 57);
INSERT INTO `sys_oper_log` VALUES (346, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"高校毕业生就业服务\"],\"url\":[\"http://job.mohrss.gov.cn/202008gx/index.jhtml\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"13\"],\"icon\":[\"fa fa-asl-interpreting\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-04-03 17:16:39', 131);
INSERT INTO `sys_oper_log` VALUES (347, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2020\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"高校毕业生就业服务\"],\"url\":[\"http://job.mohrss.gov.cn/202008gx/index.jhtml\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"13\"],\"icon\":[\"fa fa-users\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-04-03 17:18:46', 15);
INSERT INTO `sys_oper_log` VALUES (348, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"103\"],\"roleName\":[\"学生就业处\"],\"roleKey\":[\"employment department\"],\"roleSort\":[\"5\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"2005,2008,2016,2017,2018,2019,2007,2009\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-04-03 17:36:25', 51);
INSERT INTO `sys_oper_log` VALUES (349, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"104\"],\"deptId\":[\"103\"],\"userName\":[\"小强\"],\"dept.deptName\":[\"网络19.1\"],\"phonenumber\":[\"\"],\"email\":[\"\"],\"loginName\":[\"201915030101\"],\"sex\":[\"0\"],\"role\":[\"103\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"103\"],\"postIds\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-04-03 17:37:15', 20);
INSERT INTO `sys_oper_log` VALUES (350, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"去招聘网站瞅瞅\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"14\"],\"icon\":[\"fa fa-handshake-o\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-04-03 21:41:37', 7);
INSERT INTO `sys_oper_log` VALUES (351, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2021\"],\"menuType\":[\"C\"],\"menuName\":[\"前程无忧\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-04-03 21:47:36', 19);
INSERT INTO `sys_oper_log` VALUES (352, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2022\"],\"parentId\":[\"2021\"],\"menuType\":[\"C\"],\"menuName\":[\"前程无忧\"],\"url\":[\"https://we.51job.com/pc/search\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-04-03 21:47:59', 19);
INSERT INTO `sys_oper_log` VALUES (353, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2021\"],\"menuType\":[\"C\"],\"menuName\":[\"24365校园招聘\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-04-03 21:49:03', 15);
INSERT INTO `sys_oper_log` VALUES (354, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2023\"],\"parentId\":[\"2021\"],\"menuType\":[\"C\"],\"menuName\":[\"24365校园招聘\"],\"url\":[\"https://www.ncss.cn/student/24365\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-04-03 21:49:22', 18);
INSERT INTO `sys_oper_log` VALUES (355, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2021\"],\"menuType\":[\"C\"],\"menuName\":[\"高校毕业生就业服务\"],\"url\":[\"http://job.mohrss.gov.cn/202008gx/index.jhtml\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-04-03 21:50:46', 9);
INSERT INTO `sys_oper_log` VALUES (356, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2021\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"去招聘网站瞅瞅\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"14\"],\"icon\":[\"fa fa-globe\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-04-03 21:52:49', 15);
INSERT INTO `sys_oper_log` VALUES (357, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '网络19.1', '/system/menu/remove/2006', '127.0.0.1', '内网IP', '2006', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":301}', 0, NULL, '2023-04-03 22:05:34', 33);
INSERT INTO `sys_oper_log` VALUES (358, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"102\"],\"roleName\":[\"管理员\"],\"roleKey\":[\"admin1\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"2005,1,100,1000,1001,1002,1003,1004,1005,1006,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,107,1035,1036,1037,1038,108,501,1043,1044,1045,2,109,1047,1048,1049,111,112,113,2008,2007,2009\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-04-03 22:06:10', 30);
INSERT INTO `sys_oper_log` VALUES (359, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"101\"],\"roleName\":[\"学生\"],\"roleKey\":[\"senior\"],\"roleSort\":[\"4\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"2005,2008,2016,2007,2011,2015,2009\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-04-03 22:07:58', 26);
INSERT INTO `sys_oper_log` VALUES (360, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '网络19.1', '/system/menu/remove/2006', '127.0.0.1', '内网IP', '2006', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-04-03 22:08:47', 32);
INSERT INTO `sys_oper_log` VALUES (361, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '网络19.1', '/system/menu/remove/2010', '127.0.0.1', '内网IP', '2010', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-04-03 22:08:53', 9);
INSERT INTO `sys_oper_log` VALUES (362, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '网络19.1', '/system/menu/remove/2020', '127.0.0.1', '内网IP', '2020', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-04-03 22:09:03', 14);
INSERT INTO `sys_oper_log` VALUES (363, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2023\"],\"parentId\":[\"2021\"],\"menuType\":[\"C\"],\"menuName\":[\"24365校园招聘\"],\"url\":[\"https://www.ncss.cn/student/24365\"],\"target\":[\"menuBlank\"],\"perms\":[\"\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-04-03 22:16:44', 29);
INSERT INTO `sys_oper_log` VALUES (364, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"102\"],\"roleName\":[\"管理员\"],\"roleKey\":[\"admin1\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"2005,1,100,1000,1001,1002,1003,1004,1005,1006,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,107,1035,1036,1037,1038,108,501,1043,1044,1045,2,109,1047,1048,1049,111,112,113,2008,2007,2011,2012,2013,2014,2015,2009,2021,2022,2023,2024\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-04-19 20:30:01', 263);
INSERT INTO `sys_oper_log` VALUES (365, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"101\"],\"roleName\":[\"学生\"],\"roleKey\":[\"senior\"],\"roleSort\":[\"4\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"2005,2008,2016,2007,2011,2015,2009,2021,2022,2023,2024\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-04-19 20:33:17', 59);
INSERT INTO `sys_oper_log` VALUES (366, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"103\"],\"roleName\":[\"学生就业处\"],\"roleKey\":[\"employment department\"],\"roleSort\":[\"5\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"2005,2008,2016,2017,2018,2019,2007,2011,2012,2013,2014,2015,2009,2021,2022,2023,2024\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-04-19 20:33:44', 26);
INSERT INTO `sys_oper_log` VALUES (367, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"102\"],\"roleName\":[\"管理员\"],\"roleKey\":[\"admin1\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"2005,1,100,1000,1001,1002,1003,1004,1005,1006,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,107,1035,1036,1037,1038,108,501,1043,1044,1045,2,109,1047,1048,1049,111,112,113,2008,2016,2017,2018,2019,2007,2011,2012,2013,2014,2015,2009,2021,2022,2023,2024\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-04-19 20:35:38', 62);
INSERT INTO `sys_oper_log` VALUES (368, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"系统管理\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"4\"],\"icon\":[\"fa fa-gear\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-04-24 13:19:05', 286);
INSERT INTO `sys_oper_log` VALUES (369, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"系统监控\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"5\"],\"icon\":[\"fa fa-video-camera\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-04-24 13:19:15', 16);
INSERT INTO `sys_oper_log` VALUES (370, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"城市需求分布\"],\"url\":[\"大数据城市需求分布图.html\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-asl-interpreting\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-04-24 13:21:38', 54);
INSERT INTO `sys_oper_log` VALUES (371, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2025\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"城市需求分布\"],\"url\":[\"/system/city\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-asl-interpreting\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-04-24 14:43:55', 395);
INSERT INTO `sys_oper_log` VALUES (372, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2005\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"个人中心\"],\"url\":[\"/system/user/profile\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"0\"],\"icon\":[\"fa fa-vcard\"],\"visible\":[\"1\"],\"isRefresh\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-04-24 19:26:28', 336);
INSERT INTO `sys_oper_log` VALUES (373, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2025\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"城市需求分布\"],\"url\":[\"/system/city\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-asl-interpreting\"],\"visible\":[\"1\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-04-24 19:26:36', 20);
INSERT INTO `sys_oper_log` VALUES (374, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2005\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"个人中心\"],\"url\":[\"/system/user/profile\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"0\"],\"icon\":[\"fa fa-vcard\"],\"visible\":[\"0\"],\"isRefresh\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-04-26 16:11:34', 161);
INSERT INTO `sys_oper_log` VALUES (375, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2025\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"城市需求分布\"],\"url\":[\"/system/city\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-asl-interpreting\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-04-26 16:11:41', 17);
INSERT INTO `sys_oper_log` VALUES (376, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2025\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"城市需求分布\"],\"url\":[\"/system/city/city.html\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-asl-interpreting\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-04-26 16:45:58', 308);
INSERT INTO `sys_oper_log` VALUES (377, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"可视化分析\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"2\"],\"icon\":[\"fa fa-pie-chart\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-04-26 16:49:03', 47);
INSERT INTO `sys_oper_log` VALUES (378, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2026\"],\"menuType\":[\"C\"],\"menuName\":[\"城市需求分析\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-pie-chart\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-04-26 16:51:12', 73);
INSERT INTO `sys_oper_log` VALUES (379, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '网络19.1', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2025\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"城市需求分布\"],\"url\":[\"/system/city\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-asl-interpreting\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-04-26 16:51:30', 19);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(0) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, '岗位', '城市', 5000, '1', 'admin', '2023-03-25 20:19:41', '', NULL, NULL);
INSERT INTO `sys_post` VALUES (2, 'java初级开发工程师', '北京', 10000, '0', 'admin', '2023-03-24 08:36:57', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'java开发', '上海', 13000, '0', 'admin', '2023-03-24 08:36:57', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, '运维工程师', '广州', 10000, '0', 'admin', '2023-03-24 08:36:57', '', NULL, '');
INSERT INTO `sys_post` VALUES (6, 'java开发', '西安', 8000, '0', 'admin', '2023-03-25 20:19:41', '', NULL, NULL);
INSERT INTO `sys_post` VALUES (8, 'python', '北京', 10000, '0', 'admin', '2023-03-29 21:45:35', 'admin', '2023-03-29 22:41:55', '');
INSERT INTO `sys_post` VALUES (9, 'C/C++', '深圳', 9000, '0', 'admin', '2023-03-24 08:36:57', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(0) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 104 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', '0', '0', 'admin', '2023-03-24 08:36:57', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', '0', '0', 'admin', '2023-03-24 08:36:57', '', NULL, '普通角色');
INSERT INTO `sys_role` VALUES (101, '学生', 'senior', 4, '1', '0', '0', 'admin', '2023-03-25 17:10:03', 'admin', '2023-04-19 20:33:17', '');
INSERT INTO `sys_role` VALUES (102, '管理员', 'admin1', 3, '1', '0', '0', 'admin', '2023-03-26 09:57:11', 'admin', '2023-04-19 20:35:38', '');
INSERT INTO `sys_role` VALUES (103, '学生就业处', 'employment department', 5, '1', '0', '0', 'admin', '2023-03-27 16:33:40', 'admin', '2023-04-19 20:33:44', '');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(0) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(0) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);
INSERT INTO `sys_role_menu` VALUES (2, 1061);
INSERT INTO `sys_role_menu` VALUES (100, 1);
INSERT INTO `sys_role_menu` VALUES (100, 2);
INSERT INTO `sys_role_menu` VALUES (100, 3);
INSERT INTO `sys_role_menu` VALUES (100, 4);
INSERT INTO `sys_role_menu` VALUES (100, 100);
INSERT INTO `sys_role_menu` VALUES (100, 101);
INSERT INTO `sys_role_menu` VALUES (100, 102);
INSERT INTO `sys_role_menu` VALUES (100, 103);
INSERT INTO `sys_role_menu` VALUES (100, 104);
INSERT INTO `sys_role_menu` VALUES (100, 105);
INSERT INTO `sys_role_menu` VALUES (100, 106);
INSERT INTO `sys_role_menu` VALUES (100, 107);
INSERT INTO `sys_role_menu` VALUES (100, 108);
INSERT INTO `sys_role_menu` VALUES (100, 109);
INSERT INTO `sys_role_menu` VALUES (100, 110);
INSERT INTO `sys_role_menu` VALUES (100, 111);
INSERT INTO `sys_role_menu` VALUES (100, 112);
INSERT INTO `sys_role_menu` VALUES (100, 113);
INSERT INTO `sys_role_menu` VALUES (100, 114);
INSERT INTO `sys_role_menu` VALUES (100, 115);
INSERT INTO `sys_role_menu` VALUES (100, 116);
INSERT INTO `sys_role_menu` VALUES (100, 500);
INSERT INTO `sys_role_menu` VALUES (100, 501);
INSERT INTO `sys_role_menu` VALUES (100, 1000);
INSERT INTO `sys_role_menu` VALUES (100, 1001);
INSERT INTO `sys_role_menu` VALUES (100, 1002);
INSERT INTO `sys_role_menu` VALUES (100, 1003);
INSERT INTO `sys_role_menu` VALUES (100, 1004);
INSERT INTO `sys_role_menu` VALUES (100, 1005);
INSERT INTO `sys_role_menu` VALUES (100, 1006);
INSERT INTO `sys_role_menu` VALUES (100, 1007);
INSERT INTO `sys_role_menu` VALUES (100, 1008);
INSERT INTO `sys_role_menu` VALUES (100, 1009);
INSERT INTO `sys_role_menu` VALUES (100, 1010);
INSERT INTO `sys_role_menu` VALUES (100, 1011);
INSERT INTO `sys_role_menu` VALUES (100, 1012);
INSERT INTO `sys_role_menu` VALUES (100, 1013);
INSERT INTO `sys_role_menu` VALUES (100, 1014);
INSERT INTO `sys_role_menu` VALUES (100, 1015);
INSERT INTO `sys_role_menu` VALUES (100, 1016);
INSERT INTO `sys_role_menu` VALUES (100, 1017);
INSERT INTO `sys_role_menu` VALUES (100, 1018);
INSERT INTO `sys_role_menu` VALUES (100, 1019);
INSERT INTO `sys_role_menu` VALUES (100, 1020);
INSERT INTO `sys_role_menu` VALUES (100, 1021);
INSERT INTO `sys_role_menu` VALUES (100, 1022);
INSERT INTO `sys_role_menu` VALUES (100, 1023);
INSERT INTO `sys_role_menu` VALUES (100, 1024);
INSERT INTO `sys_role_menu` VALUES (100, 1025);
INSERT INTO `sys_role_menu` VALUES (100, 1026);
INSERT INTO `sys_role_menu` VALUES (100, 1027);
INSERT INTO `sys_role_menu` VALUES (100, 1028);
INSERT INTO `sys_role_menu` VALUES (100, 1029);
INSERT INTO `sys_role_menu` VALUES (100, 1030);
INSERT INTO `sys_role_menu` VALUES (100, 1031);
INSERT INTO `sys_role_menu` VALUES (100, 1032);
INSERT INTO `sys_role_menu` VALUES (100, 1033);
INSERT INTO `sys_role_menu` VALUES (100, 1034);
INSERT INTO `sys_role_menu` VALUES (100, 1035);
INSERT INTO `sys_role_menu` VALUES (100, 1036);
INSERT INTO `sys_role_menu` VALUES (100, 1037);
INSERT INTO `sys_role_menu` VALUES (100, 1038);
INSERT INTO `sys_role_menu` VALUES (100, 1039);
INSERT INTO `sys_role_menu` VALUES (100, 1040);
INSERT INTO `sys_role_menu` VALUES (100, 1041);
INSERT INTO `sys_role_menu` VALUES (100, 1042);
INSERT INTO `sys_role_menu` VALUES (100, 1043);
INSERT INTO `sys_role_menu` VALUES (100, 1044);
INSERT INTO `sys_role_menu` VALUES (100, 1045);
INSERT INTO `sys_role_menu` VALUES (100, 1046);
INSERT INTO `sys_role_menu` VALUES (100, 1047);
INSERT INTO `sys_role_menu` VALUES (100, 1048);
INSERT INTO `sys_role_menu` VALUES (100, 1049);
INSERT INTO `sys_role_menu` VALUES (100, 1050);
INSERT INTO `sys_role_menu` VALUES (100, 1051);
INSERT INTO `sys_role_menu` VALUES (100, 1052);
INSERT INTO `sys_role_menu` VALUES (100, 1053);
INSERT INTO `sys_role_menu` VALUES (100, 1054);
INSERT INTO `sys_role_menu` VALUES (100, 1055);
INSERT INTO `sys_role_menu` VALUES (100, 1056);
INSERT INTO `sys_role_menu` VALUES (100, 1057);
INSERT INTO `sys_role_menu` VALUES (100, 1058);
INSERT INTO `sys_role_menu` VALUES (100, 1059);
INSERT INTO `sys_role_menu` VALUES (100, 1060);
INSERT INTO `sys_role_menu` VALUES (100, 1061);
INSERT INTO `sys_role_menu` VALUES (100, 2000);
INSERT INTO `sys_role_menu` VALUES (100, 2001);
INSERT INTO `sys_role_menu` VALUES (100, 2002);
INSERT INTO `sys_role_menu` VALUES (101, 2005);
INSERT INTO `sys_role_menu` VALUES (101, 2007);
INSERT INTO `sys_role_menu` VALUES (101, 2008);
INSERT INTO `sys_role_menu` VALUES (101, 2009);
INSERT INTO `sys_role_menu` VALUES (101, 2011);
INSERT INTO `sys_role_menu` VALUES (101, 2015);
INSERT INTO `sys_role_menu` VALUES (101, 2016);
INSERT INTO `sys_role_menu` VALUES (101, 2021);
INSERT INTO `sys_role_menu` VALUES (101, 2022);
INSERT INTO `sys_role_menu` VALUES (101, 2023);
INSERT INTO `sys_role_menu` VALUES (101, 2024);
INSERT INTO `sys_role_menu` VALUES (102, 1);
INSERT INTO `sys_role_menu` VALUES (102, 2);
INSERT INTO `sys_role_menu` VALUES (102, 100);
INSERT INTO `sys_role_menu` VALUES (102, 103);
INSERT INTO `sys_role_menu` VALUES (102, 104);
INSERT INTO `sys_role_menu` VALUES (102, 107);
INSERT INTO `sys_role_menu` VALUES (102, 108);
INSERT INTO `sys_role_menu` VALUES (102, 109);
INSERT INTO `sys_role_menu` VALUES (102, 111);
INSERT INTO `sys_role_menu` VALUES (102, 112);
INSERT INTO `sys_role_menu` VALUES (102, 113);
INSERT INTO `sys_role_menu` VALUES (102, 501);
INSERT INTO `sys_role_menu` VALUES (102, 1000);
INSERT INTO `sys_role_menu` VALUES (102, 1001);
INSERT INTO `sys_role_menu` VALUES (102, 1002);
INSERT INTO `sys_role_menu` VALUES (102, 1003);
INSERT INTO `sys_role_menu` VALUES (102, 1004);
INSERT INTO `sys_role_menu` VALUES (102, 1005);
INSERT INTO `sys_role_menu` VALUES (102, 1006);
INSERT INTO `sys_role_menu` VALUES (102, 1016);
INSERT INTO `sys_role_menu` VALUES (102, 1017);
INSERT INTO `sys_role_menu` VALUES (102, 1018);
INSERT INTO `sys_role_menu` VALUES (102, 1019);
INSERT INTO `sys_role_menu` VALUES (102, 1020);
INSERT INTO `sys_role_menu` VALUES (102, 1021);
INSERT INTO `sys_role_menu` VALUES (102, 1022);
INSERT INTO `sys_role_menu` VALUES (102, 1023);
INSERT INTO `sys_role_menu` VALUES (102, 1024);
INSERT INTO `sys_role_menu` VALUES (102, 1035);
INSERT INTO `sys_role_menu` VALUES (102, 1036);
INSERT INTO `sys_role_menu` VALUES (102, 1037);
INSERT INTO `sys_role_menu` VALUES (102, 1038);
INSERT INTO `sys_role_menu` VALUES (102, 1043);
INSERT INTO `sys_role_menu` VALUES (102, 1044);
INSERT INTO `sys_role_menu` VALUES (102, 1045);
INSERT INTO `sys_role_menu` VALUES (102, 1047);
INSERT INTO `sys_role_menu` VALUES (102, 1048);
INSERT INTO `sys_role_menu` VALUES (102, 1049);
INSERT INTO `sys_role_menu` VALUES (102, 2005);
INSERT INTO `sys_role_menu` VALUES (102, 2007);
INSERT INTO `sys_role_menu` VALUES (102, 2008);
INSERT INTO `sys_role_menu` VALUES (102, 2009);
INSERT INTO `sys_role_menu` VALUES (102, 2011);
INSERT INTO `sys_role_menu` VALUES (102, 2012);
INSERT INTO `sys_role_menu` VALUES (102, 2013);
INSERT INTO `sys_role_menu` VALUES (102, 2014);
INSERT INTO `sys_role_menu` VALUES (102, 2015);
INSERT INTO `sys_role_menu` VALUES (102, 2016);
INSERT INTO `sys_role_menu` VALUES (102, 2017);
INSERT INTO `sys_role_menu` VALUES (102, 2018);
INSERT INTO `sys_role_menu` VALUES (102, 2019);
INSERT INTO `sys_role_menu` VALUES (102, 2021);
INSERT INTO `sys_role_menu` VALUES (102, 2022);
INSERT INTO `sys_role_menu` VALUES (102, 2023);
INSERT INTO `sys_role_menu` VALUES (102, 2024);
INSERT INTO `sys_role_menu` VALUES (103, 2005);
INSERT INTO `sys_role_menu` VALUES (103, 2007);
INSERT INTO `sys_role_menu` VALUES (103, 2008);
INSERT INTO `sys_role_menu` VALUES (103, 2009);
INSERT INTO `sys_role_menu` VALUES (103, 2011);
INSERT INTO `sys_role_menu` VALUES (103, 2012);
INSERT INTO `sys_role_menu` VALUES (103, 2013);
INSERT INTO `sys_role_menu` VALUES (103, 2014);
INSERT INTO `sys_role_menu` VALUES (103, 2015);
INSERT INTO `sys_role_menu` VALUES (103, 2016);
INSERT INTO `sys_role_menu` VALUES (103, 2017);
INSERT INTO `sys_role_menu` VALUES (103, 2018);
INSERT INTO `sys_role_menu` VALUES (103, 2019);
INSERT INTO `sys_role_menu` VALUES (103, 2021);
INSERT INTO `sys_role_menu` VALUES (103, 2022);
INSERT INTO `sys_role_menu` VALUES (103, 2023);
INSERT INTO `sys_role_menu` VALUES (103, 2024);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(0) NULL DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户 01注册用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '盐加密',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `pwd_update_date` datetime(0) NULL DEFAULT NULL COMMENT '密码最后更新时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 106 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '拾柒', '00', 'admin@sqt.com', '15888888888', '0', '', 'a2ff45c2c1d57a18fce219649a63bfb1', '5c2811', '0', '0', '127.0.0.1', '2023-05-04 21:28:07', '2023-03-29 20:14:42', 'admin', '2023-03-24 08:36:57', '', '2023-05-04 21:28:07', '管理员');
INSERT INTO `sys_user` VALUES (2, 103, 'SQT', '拾柒', '00', 'ry@qq.com', '15666666666', '1', '', '5dedd5ec9820c439f70dbb27274d2572', '0dc755', '0', '2', '127.0.0.1', '2023-03-26 08:51:04', '2023-03-24 08:36:57', 'admin', '2023-03-24 08:36:57', '2019150001', '2023-04-01 11:48:16', '测试员');
INSERT INTO `sys_user` VALUES (100, 103, '20191501', '开发人员', '00', '', '', '0', '', '5afe1b4afbe656603c3e2e94b991d54a', 'fff45a', '0', '2', '127.0.0.1', '2023-03-26 10:23:15', NULL, 'admin', '2023-03-24 11:10:58', 'admin', '2023-04-01 11:48:08', '');
INSERT INTO `sys_user` VALUES (102, 103, '20191503', '小强', '00', '', '', '0', '', '86eef6a0fda9c94675e4b9108b91535d', '9e4867', '0', '2', '127.0.0.1', '2023-04-01 11:25:27', NULL, 'admin', '2023-03-25 17:14:28', '2019150001', '2023-04-01 11:47:56', '');
INSERT INTO `sys_user` VALUES (103, 103, '201915030116', '小天', '00', '', '', '0', '', 'd9f82beba4228927d61b6c4e2b3890df', 'c01aba', '0', '0', '127.0.0.1', '2023-04-19 20:35:57', NULL, 'admin', '2023-04-01 11:51:22', 'admin', '2023-04-19 20:35:57', '开发人员');
INSERT INTO `sys_user` VALUES (104, 103, '201915030101', '小强', '00', '', '', '0', '', 'f69761c1cabd75a911dbfdef0b8dea36', '83a8f0', '0', '0', '127.0.0.1', '2023-04-22 22:27:01', NULL, 'admin', '2023-04-01 11:52:17', 'admin', '2023-04-22 22:27:01', '');
INSERT INTO `sys_user` VALUES (105, 103, '201915030102', '小明', '00', '', '', '0', '', '1107d94ab7b927ae27561f003a7ba150', '99650b', '0', '0', '', NULL, NULL, 'admin', '2023-04-01 11:52:57', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online`  (
  `sessionId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime(0) NULL DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime(0) NULL DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int(0) NULL DEFAULT 0 COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '在线用户记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_online
-- ----------------------------
INSERT INTO `sys_user_online` VALUES ('35c20fe9-c615-4b4e-bb32-164ea4dbf1a4', 'admin', '网络19.1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', 'on_line', '2023-05-04 21:05:04', '2023-05-04 21:05:14', 1800000);
INSERT INTO `sys_user_online` VALUES ('bc3ddccb-0772-4eda-9ea1-dc26bd16fc54', 'admin', '网络19.1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', 'on_line', '2023-05-04 21:27:59', '2023-05-04 21:28:07', 1800000);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(0) NOT NULL COMMENT '用户ID',
  `post_id` bigint(0) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(0) NOT NULL COMMENT '用户ID',
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (103, 102);
INSERT INTO `sys_user_role` VALUES (104, 103);
INSERT INTO `sys_user_role` VALUES (105, 101);

-- ----------------------------
-- Table structure for zhaopin
-- ----------------------------
DROP TABLE IF EXISTS `zhaopin`;
CREATE TABLE `zhaopin`  (
  `job_id` int(0) NOT NULL COMMENT '岗位id',
  `job_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位名',
  `job_salary` int(0) NULL DEFAULT NULL COMMENT '薪资水平(高减低)',
  `status` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '目前状态',
  `job_company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '所属公司',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`job_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of zhaopin
-- ----------------------------
INSERT INTO `zhaopin` VALUES (1, 'java开发工程师', 7000, '0', '华为', NULL, 'https://jobs.51job.com/linyi/146733605.html?s=sou_sou_soulb&t=0_0&req=f9966f5853cad612724f436457658a38');

SET FOREIGN_KEY_CHECKS = 1;
