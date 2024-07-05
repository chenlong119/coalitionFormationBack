create table sys_user_role
(
    user_id bigint not null comment '用户ID',
    role_id bigint not null comment '角色ID',
    primary key (user_id, role_id)
)
    comment '用户和角色关联表';

INSERT INTO `ry-vue`.sys_user_role (user_id, role_id) VALUES (1, 1);
INSERT INTO `ry-vue`.sys_user_role (user_id, role_id) VALUES (2, 2);
INSERT INTO `ry-vue`.sys_user_role (user_id, role_id) VALUES (3, 100);
INSERT INTO `ry-vue`.sys_user_role (user_id, role_id) VALUES (4, 2);
INSERT INTO `ry-vue`.sys_user_role (user_id, role_id) VALUES (5, 2);
INSERT INTO `ry-vue`.sys_user_role (user_id, role_id) VALUES (6, 2);
INSERT INTO `ry-vue`.sys_user_role (user_id, role_id) VALUES (9, 2);
