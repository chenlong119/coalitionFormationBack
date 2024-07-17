create table gen_table_column
(
    column_id      bigint auto_increment comment '编号'
        primary key,
    table_id       bigint                    null comment '归属表编号',
    column_name    varchar(200)              null comment '列名称',
    column_comment varchar(500)              null comment '列描述',
    column_type    varchar(100)              null comment '列类型',
    java_type      varchar(500)              null comment 'JAVA类型',
    java_field     varchar(200)              null comment 'JAVA字段名',
    is_pk          char                      null comment '是否主键（1是）',
    is_increment   char                      null comment '是否自增（1是）',
    is_required    char                      null comment '是否必填（1是）',
    is_insert      char                      null comment '是否为插入字段（1是）',
    is_edit        char                      null comment '是否编辑字段（1是）',
    is_list        char                      null comment '是否列表字段（1是）',
    is_query       char                      null comment '是否查询字段（1是）',
    query_type     varchar(200) default 'EQ' null comment '查询方式（等于、不等于、大于、小于、范围）',
    html_type      varchar(200)              null comment '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
    dict_type      varchar(200) default ''   null comment '字典类型',
    sort           int                       null comment '排序',
    create_by      varchar(64)  default ''   null comment '创建者',
    create_time    datetime                  null comment '创建时间',
    update_by      varchar(64)  default ''   null comment '更新者',
    update_time    datetime                  null comment '更新时间'
)
    comment '代码生成业务表字段';

INSERT INTO `ry-vue`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (11, 2, 'id', '企业编号', 'int', 'Long', 'id', '1', '1', '0', '1', null, null, null, 'EQ', 'input', '', 1, 'admin', '2024-04-02 11:51:07', '', '2024-04-25 07:02:43');
INSERT INTO `ry-vue`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (12, 2, 'name', '企业名称', 'varchar(20)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2024-04-02 11:51:07', '', '2024-04-25 07:02:43');
INSERT INTO `ry-vue`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (13, 2, 'layer_id', '产业链网络层编号', 'int', 'Long', 'layerId', '1', '0', '0', '1', null, '1', null, 'EQ', 'input', '', 2, 'admin', '2024-04-02 11:51:07', '', '2024-04-25 07:02:43');
INSERT INTO `ry-vue`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (14, 2, 'address', '企业地址', 'varchar(20)', 'String', 'address', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 5, 'admin', '2024-04-02 11:51:07', '', '2024-04-25 07:02:43');
INSERT INTO `ry-vue`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (15, 2, 'company_type', '企业在产业链所在阶段（原料供应，零件生产，整机组装，销售和回收）', 'varchar(20)', 'Long', 'companyType', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', 'chain_stage', 3, 'admin', '2024-04-02 11:51:07', '', '2024-04-25 07:02:43');
INSERT INTO `ry-vue`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (17, 2, 'group_id', '所属企业群id', 'int', 'Long', 'groupId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2024-04-02 11:51:07', '', '2024-04-25 07:02:43');
INSERT INTO `ry-vue`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (18, 2, 'process_rate', '任务完成速率', 'int', 'Long', 'processRate', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2024-04-02 11:51:07', '', '2024-04-25 07:02:43');
INSERT INTO `ry-vue`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (19, 2, 'rep', '企业信誉', 'double', 'Long', 'rep', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2024-04-02 11:51:07', '', '2024-04-25 07:02:43');
INSERT INTO `ry-vue`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (20, 2, 'status', '企业状态（0异常，1空闲，2工作）', 'int', 'Long', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', 'company_status', 10, 'admin', '2024-04-02 11:51:07', '', '2024-04-25 07:02:43');
INSERT INTO `ry-vue`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (21, 3, 'id', '任务编号', 'int', 'Long', 'id', '1', '0', '0', '1', null, null, '1', 'EQ', 'input', '', 1, 'admin', '2024-04-10 08:29:55', '', '2024-04-26 06:21:19');
INSERT INTO `ry-vue`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (22, 3, 'name', '任务名称', 'varchar(20)', 'String', 'name', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2024-04-10 08:29:55', '', '2024-04-26 06:21:19');
INSERT INTO `ry-vue`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (23, 3, 'val', '任务价值', 'int', 'Long', 'val', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-04-10 08:29:55', '', '2024-04-26 06:21:19');
INSERT INTO `ry-vue`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (24, 3, 'arrival_time', '任务到达时间', 'datetime', 'Date', 'arrivalTime', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 5, 'admin', '2024-04-10 08:29:55', '', '2024-04-26 06:21:19');
INSERT INTO `ry-vue`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (25, 3, 'coalition_time', '联盟形成时间', 'datetime', 'Date', 'coalitionTime', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 6, 'admin', '2024-04-10 08:29:55', '', '2024-04-26 06:21:19');
INSERT INTO `ry-vue`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (26, 3, 'finish_time', '任务完成时间', 'datetime', 'Date', 'finishTime', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 7, 'admin', '2024-04-10 08:29:55', '', '2024-04-26 06:21:19');
INSERT INTO `ry-vue`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (27, 3, 'task_status', '任务状态（0 等待分配，1 已分配，2已完成,3执行失败）', 'int', 'Long', 'taskStatus', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', 'task_state', 8, 'admin', '2024-04-10 08:29:55', '', '2024-04-26 06:21:19');
INSERT INTO `ry-vue`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (28, 3, 'duration', '任务持续时长', 'int', 'Long', 'duration', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2024-04-10 08:29:55', '', '2024-04-26 06:21:20');
INSERT INTO `ry-vue`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (29, 3, 'product_id', '产品编号', 'int', 'Long', 'productId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2024-04-10 08:29:55', '', '2024-04-26 06:21:20');
INSERT INTO `ry-vue`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (30, 3, 'coalition_id', '联盟编号', 'int', 'Long', 'coalitionId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2024-04-10 08:29:55', '', '2024-04-26 06:21:20');
INSERT INTO `ry-vue`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (31, 3, 'chain_id', '所属产业链编号', 'int', 'Long', 'chainId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2024-04-10 08:29:55', '', '2024-04-26 06:21:20');
INSERT INTO `ry-vue`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (32, 3, 'company_id', '任务所属企业编号', 'int', 'Long', 'companyId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 13, '', '2024-04-10 08:55:07', '', '2024-04-26 06:21:20');
INSERT INTO `ry-vue`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (33, 4, 'id', '联盟编号', 'int', 'Long', 'id', '1', '1', null, '1', null, null, null, 'EQ', 'input', '', 1, 'admin', '2024-04-15 10:07:12', '', '2024-04-15 10:16:10');
INSERT INTO `ry-vue`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (34, 4, 'name', '联盟名称', 'varchar(20)', 'String', 'name', '0', '0', null, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2024-04-15 10:07:12', '', '2024-04-15 10:16:10');
INSERT INTO `ry-vue`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (35, 4, 'task_id', '联盟任务编号', 'int', 'Long', 'taskId', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-04-15 10:07:12', '', '2024-04-15 10:16:10');
INSERT INTO `ry-vue`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (36, 4, 'create_time', '联盟创建时间', 'datetime', 'Date', 'createTime', '0', '0', null, '1', null, null, null, 'EQ', 'datetime', '', 4, 'admin', '2024-04-15 10:07:12', '', '2024-04-15 10:16:10');
INSERT INTO `ry-vue`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (37, 4, 'coalition_status', '联盟状态（0异常，1工作，2空闲）', 'int', 'Long', 'coalitionStatus', '0', '0', null, '1', '1', '1', '1', 'EQ', 'radio', 'coalition_state', 5, 'admin', '2024-04-15 10:07:12', '', '2024-04-15 10:16:10');
INSERT INTO `ry-vue`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (38, 4, 'mode', '联盟模式', 'int', 'Long', 'mode', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2024-04-15 10:07:12', '', '2024-04-15 10:16:10');
INSERT INTO `ry-vue`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (39, 2, 'coalition_id', null, 'int', 'Long', 'coalitionId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 7, '', '2024-04-25 07:02:05', '', '2024-04-25 07:02:43');
INSERT INTO `ry-vue`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (40, 2, 'score', null, 'double', 'Long', 'score', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 11, '', '2024-04-25 07:02:05', '', '2024-04-25 07:02:43');
INSERT INTO `ry-vue`.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) VALUES (41, 3, 'task_type', '任务类型(原料供应，零件生产，整机组装，销售和回收)', 'int', 'Long', 'taskType', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', 'chain_stage', 3, '', '2024-04-26 06:20:59', '', '2024-04-26 06:21:19');