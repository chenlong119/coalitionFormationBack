create table sys_role_dept
(
    role_id bigint not null comment '角色ID',
    dept_id bigint not null comment '部门ID',
    primary key (role_id, dept_id)
)
    comment '角色和部门关联表';

INSERT INTO `ry-vue`.sys_role_dept (role_id, dept_id) VALUES (2, 100);
INSERT INTO `ry-vue`.sys_role_dept (role_id, dept_id) VALUES (2, 101);
INSERT INTO `ry-vue`.sys_role_dept (role_id, dept_id) VALUES (2, 102);
INSERT INTO `ry-vue`.sys_role_dept (role_id, dept_id) VALUES (2, 103);
INSERT INTO `ry-vue`.sys_role_dept (role_id, dept_id) VALUES (2, 104);
INSERT INTO `ry-vue`.sys_role_dept (role_id, dept_id) VALUES (2, 105);
INSERT INTO `ry-vue`.sys_role_dept (role_id, dept_id) VALUES (2, 106);
INSERT INTO `ry-vue`.sys_role_dept (role_id, dept_id) VALUES (2, 107);
INSERT INTO `ry-vue`.sys_role_dept (role_id, dept_id) VALUES (2, 108);
INSERT INTO `ry-vue`.sys_role_dept (role_id, dept_id) VALUES (2, 109);
