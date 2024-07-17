create table sys_user
(
    user_id     bigint auto_increment comment '用户ID'
        primary key,
    dept_id     bigint                    null comment '部门ID',
    user_name   varchar(30)               not null comment '用户账号',
    nick_name   varchar(30)               not null comment '用户昵称',
    user_type   varchar(2)   default '00' null comment '用户类型（00系统用户）',
    email       varchar(50)  default ''   null comment '用户邮箱',
    phonenumber varchar(11)  default ''   null comment '手机号码',
    sex         char         default '0'  null comment '用户性别（0男 1女 2未知）',
    avatar      varchar(100) default ''   null comment '头像地址',
    password    varchar(100) default ''   null comment '密码',
    status      char         default '0'  null comment '帐号状态（0正常 1停用）',
    del_flag    char         default '0'  null comment '删除标志（0代表存在 2代表删除）',
    login_ip    varchar(128) default ''   null comment '最后登录IP',
    login_date  datetime                  null comment '最后登录时间',
    create_by   varchar(64)  default ''   null comment '创建者',
    create_time datetime                  null comment '创建时间',
    update_by   varchar(64)  default ''   null comment '更新者',
    update_time datetime                  null comment '更新时间',
    remark      varchar(500)              null comment '备注'
)
    comment '用户信息表';

INSERT INTO `ry-vue`.sys_user (user_id, dept_id, user_name, nick_name, user_type, email, phonenumber, sex, avatar, password, status, del_flag, login_ip, login_date, create_by, create_time, update_by, update_time, remark) VALUES (1, 103, 'admin', '若依科技', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '172.31.250.37', '2024-07-03 11:06:25', 'admin', '2024-04-01 01:29:58', '', '2024-07-03 03:06:24', '管理员');
INSERT INTO `ry-vue`.sys_user (user_id, dept_id, user_name, nick_name, user_type, email, phonenumber, sex, avatar, password, status, del_flag, login_ip, login_date, create_by, create_time, update_by, update_time, remark) VALUES (3, 100, 'xyjd', '小鸭家电', '00', '', '', '0', '', '$2a$10$zEtz9lMARE2Pum9ULTDVC.Tags45FOtA/FIBTpo.Ek5OeRe22f1H6', '0', '0', '127.0.0.1', '2024-06-24 20:15:29', 'admin', '2024-04-02 06:54:07', 'admin', '2024-06-24 20:15:24', null);
INSERT INTO `ry-vue`.sys_user (user_id, dept_id, user_name, nick_name, user_type, email, phonenumber, sex, avatar, password, status, del_flag, login_ip, login_date, create_by, create_time, update_by, update_time, remark) VALUES (4, 100, 'rbkj', '荣百科技', '00', '', '', '0', '', '$2a$10$/Sl7NGpB1uHL4e6WtMGjiuqEIJCV1AdXJl.hHVrEAB3Fa49C44ufC', '0', '0', '127.0.0.1', '2024-04-11 19:35:28', 'xyjd', '2024-04-10 06:30:38', 'xyjd', '2024-04-11 11:35:28', null);
INSERT INTO `ry-vue`.sys_user (user_id, dept_id, user_name, nick_name, user_type, email, phonenumber, sex, avatar, password, status, del_flag, login_ip, login_date, create_by, create_time, update_by, update_time, remark) VALUES (5, 100, 'szjl', '苏州捷力', '00', '', '', '0', '', '$2a$10$JMQ8dW8Ij2okz9ELWnQ09.SqqGQU95A06rEeINvqpukaG3twF0nmC', '0', '0', '127.0.0.1', '2024-04-11 19:24:30', 'xyjd', '2024-04-10 06:30:58', 'xyjd', '2024-04-11 11:24:30', null);
INSERT INTO `ry-vue`.sys_user (user_id, dept_id, user_name, nick_name, user_type, email, phonenumber, sex, avatar, password, status, del_flag, login_ip, login_date, create_by, create_time, update_by, update_time, remark) VALUES (8, 100, 'ry', '宁德时代', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$..8/fVwft9/ZbzEK.9nNruJSDHli/vVmiAeOZ3yABbk.bd4bmPBS6', '0', '0', '127.0.0.1', '2024-05-15 11:13:24', 'admin', '2024-04-01 01:29:58', 'xyjd', '2024-05-15 03:13:23', '测试员');
INSERT INTO `ry-vue`.sys_user (user_id, dept_id, user_name, nick_name, user_type, email, phonenumber, sex, avatar, password, status, del_flag, login_ip, login_date, create_by, create_time, update_by, update_time, remark) VALUES (9, 100, 'clchy', '龙盛集团', '00', '', '', '0', '', '$2a$10$.NrY4twn/dKtPPXgBsMDv.xXecqr.nCjilqTjvfhej60A2IBfgVkm', '0', '0', '127.0.0.1', '2024-05-26 12:16:17', 'admin', '2024-05-15 03:17:39', '', '2024-05-26 04:16:17', null);
INSERT INTO `ry-vue`.sys_user (user_id, dept_id, user_name, nick_name, user_type, email, phonenumber, sex, avatar, password, status, del_flag, login_ip, login_date, create_by, create_time, update_by, update_time, remark) VALUES (10, null, 'clc', 'clc', '00', '', '', '0', '', '$2a$10$8fHB72CT4i8WlSGpYITlNuWmdhZYjEQyh46p/QiJ5tvpxHEitR6B2', '0', '0', '127.0.0.1', '2024-05-26 13:00:18', '', '2024-05-26 05:00:00', '', '2024-05-26 05:00:18', null);
