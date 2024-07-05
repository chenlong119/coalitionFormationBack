create table sys_dict_type
(
    dict_id     bigint auto_increment comment '字典主键'
        primary key,
    dict_name   varchar(100) default ''  null comment '字典名称',
    dict_type   varchar(100) default ''  null comment '字典类型',
    status      char         default '0' null comment '状态（0正常 1停用）',
    create_by   varchar(64)  default ''  null comment '创建者',
    create_time datetime                 null comment '创建时间',
    update_by   varchar(64)  default ''  null comment '更新者',
    update_time datetime                 null comment '更新时间',
    remark      varchar(500)             null comment '备注',
    constraint dict_type
        unique (dict_type)
)
    comment '字典类型表';

INSERT INTO `ry-vue`.sys_dict_type (dict_id, dict_name, dict_type, status, create_by, create_time, update_by, update_time, remark) VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2024-04-01 01:30:03', '', null, '用户性别列表');
INSERT INTO `ry-vue`.sys_dict_type (dict_id, dict_name, dict_type, status, create_by, create_time, update_by, update_time, remark) VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2024-04-01 01:30:03', '', null, '菜单状态列表');
INSERT INTO `ry-vue`.sys_dict_type (dict_id, dict_name, dict_type, status, create_by, create_time, update_by, update_time, remark) VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2024-04-01 01:30:03', '', null, '系统开关列表');
INSERT INTO `ry-vue`.sys_dict_type (dict_id, dict_name, dict_type, status, create_by, create_time, update_by, update_time, remark) VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2024-04-01 01:30:03', '', null, '任务状态列表');
INSERT INTO `ry-vue`.sys_dict_type (dict_id, dict_name, dict_type, status, create_by, create_time, update_by, update_time, remark) VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2024-04-01 01:30:03', '', null, '任务分组列表');
INSERT INTO `ry-vue`.sys_dict_type (dict_id, dict_name, dict_type, status, create_by, create_time, update_by, update_time, remark) VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2024-04-01 01:30:04', '', null, '系统是否列表');
INSERT INTO `ry-vue`.sys_dict_type (dict_id, dict_name, dict_type, status, create_by, create_time, update_by, update_time, remark) VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2024-04-01 01:30:04', '', null, '通知类型列表');
INSERT INTO `ry-vue`.sys_dict_type (dict_id, dict_name, dict_type, status, create_by, create_time, update_by, update_time, remark) VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2024-04-01 01:30:04', '', null, '通知状态列表');
INSERT INTO `ry-vue`.sys_dict_type (dict_id, dict_name, dict_type, status, create_by, create_time, update_by, update_time, remark) VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2024-04-01 01:30:04', '', null, '操作类型列表');
INSERT INTO `ry-vue`.sys_dict_type (dict_id, dict_name, dict_type, status, create_by, create_time, update_by, update_time, remark) VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2024-04-01 01:30:04', '', null, '登录状态列表');
INSERT INTO `ry-vue`.sys_dict_type (dict_id, dict_name, dict_type, status, create_by, create_time, update_by, update_time, remark) VALUES (100, '企业状态', 'company_status', '0', 'admin', '2024-04-02 11:21:35', '', null, null);
INSERT INTO `ry-vue`.sys_dict_type (dict_id, dict_name, dict_type, status, create_by, create_time, update_by, update_time, remark) VALUES (101, '任务状态', 'task_state', '0', 'admin', '2024-04-10 08:32:36', '', null, null);
INSERT INTO `ry-vue`.sys_dict_type (dict_id, dict_name, dict_type, status, create_by, create_time, update_by, update_time, remark) VALUES (102, '联盟状态', 'coalition_state', '0', 'admin', '2024-04-10 08:33:58', '', null, null);
INSERT INTO `ry-vue`.sys_dict_type (dict_id, dict_name, dict_type, status, create_by, create_time, update_by, update_time, remark) VALUES (103, '产业链阶段', 'chain_stage', '0', 'admin', '2024-04-25 06:57:55', '', null, null);
INSERT INTO `ry-vue`.sys_dict_type (dict_id, dict_name, dict_type, status, create_by, create_time, update_by, update_time, remark) VALUES (104, '产业链名称', 'chain', '0', 'admin', '2024-04-27 02:01:30', '', null, null);
