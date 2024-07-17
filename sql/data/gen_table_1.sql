create table gen_table
(
    table_id          bigint auto_increment comment '编号'
        primary key,
    table_name        varchar(200) default ''     null comment '表名称',
    table_comment     varchar(500) default ''     null comment '表描述',
    sub_table_name    varchar(64)                 null comment '关联子表的表名',
    sub_table_fk_name varchar(64)                 null comment '子表关联的外键名',
    class_name        varchar(100) default ''     null comment '实体类名称',
    tpl_category      varchar(200) default 'crud' null comment '使用的模板（crud单表操作 tree树表操作）',
    tpl_web_type      varchar(30)  default ''     null comment '前端模板类型（element-ui模版 element-plus模版）',
    package_name      varchar(100)                null comment '生成包路径',
    module_name       varchar(30)                 null comment '生成模块名',
    business_name     varchar(30)                 null comment '生成业务名',
    function_name     varchar(50)                 null comment '生成功能名',
    function_author   varchar(50)                 null comment '生成功能作者',
    gen_type          char         default '0'    null comment '生成代码方式（0zip压缩包 1自定义路径）',
    gen_path          varchar(200) default '/'    null comment '生成路径（不填默认项目路径）',
    options           varchar(1000)               null comment '其它生成选项',
    create_by         varchar(64)  default ''     null comment '创建者',
    create_time       datetime                    null comment '创建时间',
    update_by         varchar(64)  default ''     null comment '更新者',
    update_time       datetime                    null comment '更新时间',
    remark            varchar(500)                null comment '备注'
)
    comment '代码生成业务表';

INSERT INTO `ry-vue`.gen_table (table_id, table_name, table_comment, sub_table_name, sub_table_fk_name, class_name, tpl_category, tpl_web_type, package_name, module_name, business_name, function_name, function_author, gen_type, gen_path, options, create_by, create_time, update_by, update_time, remark) VALUES (2, 'company_all', '企业信息表', null, null, 'CompanyAll', 'crud', 'element-plus', 'com.ruoyi.project.generate.company', 'company', 'show', '企业信息', 'cl', '0', '/', '{"parentMenuId":"2042"}', 'admin', '2024-04-02 11:51:07', '', '2024-04-25 07:02:43', null);
INSERT INTO `ry-vue`.gen_table (table_id, table_name, table_comment, sub_table_name, sub_table_fk_name, class_name, tpl_category, tpl_web_type, package_name, module_name, business_name, function_name, function_author, gen_type, gen_path, options, create_by, create_time, update_by, update_time, remark) VALUES (3, 'task_all', '任务表', null, null, 'TaskAll', 'crud', 'element-plus', 'com.ruoyi.project.generate', 'coalition', 'formation', '任务信息', 'cl', '0', '/', '{"parentMenuId":"2042"}', 'admin', '2024-04-10 08:29:55', '', '2024-04-26 06:21:19', null);
INSERT INTO `ry-vue`.gen_table (table_id, table_name, table_comment, sub_table_name, sub_table_fk_name, class_name, tpl_category, tpl_web_type, package_name, module_name, business_name, function_name, function_author, gen_type, gen_path, options, create_by, create_time, update_by, update_time, remark) VALUES (4, 'coalition', '企业联盟表', null, null, 'CoalitionEnterprise', 'crud', '', 'com.ruoyi.project.generate.coalition', 'coalition', 'enterprise', '企业联盟', 'cl', '0', '/', '{"parentMenuId":"2042"}', 'admin', '2024-04-15 10:07:12', '', '2024-04-15 10:16:10', null);
