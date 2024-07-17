create table coalition
(
    id               int auto_increment comment '联盟编号'
        primary key,
    name             varchar(20)   null comment '联盟名称',
    task_id          int           null comment '联盟任务编号',
    create_time      datetime      null comment '联盟创建时间',
    coalition_status int default 1 null comment '联盟状态（0异常，1工作，2空闲）',
    mode             int default 0 null comment '联盟模式'
)
    comment '企业联盟表';

INSERT INTO `ry-vue`.coalition (id, name, task_id, create_time, coalition_status, mode) VALUES (1, '联盟1', 17, null, 2, 0);
INSERT INTO `ry-vue`.coalition (id, name, task_id, create_time, coalition_status, mode) VALUES (2, '联盟2', 11, null, 2, 1);
INSERT INTO `ry-vue`.coalition (id, name, task_id, create_time, coalition_status, mode) VALUES (3, '联盟3', 8, null, 2, 1);
INSERT INTO `ry-vue`.coalition (id, name, task_id, create_time, coalition_status, mode) VALUES (4, '联盟4', 13, null, 2, 0);
INSERT INTO `ry-vue`.coalition (id, name, task_id, create_time, coalition_status, mode) VALUES (48, '联盟48', 34, '2024-04-28 21:17:17', 0, 4);
INSERT INTO `ry-vue`.coalition (id, name, task_id, create_time, coalition_status, mode) VALUES (60, '联盟60', 18, '2024-05-07 10:02:46', 2, 3);
INSERT INTO `ry-vue`.coalition (id, name, task_id, create_time, coalition_status, mode) VALUES (61, '联盟61', 24, '2024-05-07 10:02:52', 2, 6);
INSERT INTO `ry-vue`.coalition (id, name, task_id, create_time, coalition_status, mode) VALUES (63, '联盟63', 61, '2024-05-07 10:03:56', 2, 0);
INSERT INTO `ry-vue`.coalition (id, name, task_id, create_time, coalition_status, mode) VALUES (64, '新联盟18', 18, '2024-05-07 06:40:50', 2, 1);
INSERT INTO `ry-vue`.coalition (id, name, task_id, create_time, coalition_status, mode) VALUES (67, '新联盟18', 18, '2024-05-08 01:09:01', 2, 1);
INSERT INTO `ry-vue`.coalition (id, name, task_id, create_time, coalition_status, mode) VALUES (68, '新联盟18', 18, '2024-05-08 01:11:12', 2, 1);
INSERT INTO `ry-vue`.coalition (id, name, task_id, create_time, coalition_status, mode) VALUES (69, '新联盟18', 18, '2024-05-08 01:11:17', 2, 1);
INSERT INTO `ry-vue`.coalition (id, name, task_id, create_time, coalition_status, mode) VALUES (75, '联盟75', 2, '2024-05-10 07:39:34', 0, 0);
INSERT INTO `ry-vue`.coalition (id, name, task_id, create_time, coalition_status, mode) VALUES (76, '联盟76', 10, '2024-05-10 07:39:40', 0, 0);
INSERT INTO `ry-vue`.coalition (id, name, task_id, create_time, coalition_status, mode) VALUES (83, '新联盟2', 2, '2024-05-13 02:59:08', 0, 1);
INSERT INTO `ry-vue`.coalition (id, name, task_id, create_time, coalition_status, mode) VALUES (85, '新联盟2', 2, '2024-05-14 02:53:07', 0, 1);
INSERT INTO `ry-vue`.coalition (id, name, task_id, create_time, coalition_status, mode) VALUES (92, '新联盟10', 10, '2024-05-14 07:21:43', 0, 1);
INSERT INTO `ry-vue`.coalition (id, name, task_id, create_time, coalition_status, mode) VALUES (107, '联盟107', 21, '2024-05-16 14:32:15', 0, 0);
INSERT INTO `ry-vue`.coalition (id, name, task_id, create_time, coalition_status, mode) VALUES (112, '联盟112', 15, '2024-05-16 14:33:09', 0, 0);
INSERT INTO `ry-vue`.coalition (id, name, task_id, create_time, coalition_status, mode) VALUES (116, '联盟116', 73, '2024-05-16 14:35:21', 2, 0);
INSERT INTO `ry-vue`.coalition (id, name, task_id, create_time, coalition_status, mode) VALUES (117, '新联盟21', 21, '2024-05-16 14:38:11', 0, 1);
INSERT INTO `ry-vue`.coalition (id, name, task_id, create_time, coalition_status, mode) VALUES (123, '联盟123', 21, '2024-05-17 19:59:18', 0, 0);
INSERT INTO `ry-vue`.coalition (id, name, task_id, create_time, coalition_status, mode) VALUES (139, '联盟139', 21, '2024-05-17 20:49:14', 0, 0);
INSERT INTO `ry-vue`.coalition (id, name, task_id, create_time, coalition_status, mode) VALUES (159, '联盟159', 15, '2024-05-17 21:10:01', 0, 0);
INSERT INTO `ry-vue`.coalition (id, name, task_id, create_time, coalition_status, mode) VALUES (175, '联盟175', 76, '2024-06-14 11:25:55', 2, 0);
INSERT INTO `ry-vue`.coalition (id, name, task_id, create_time, coalition_status, mode) VALUES (178, '联盟178', 9, '2024-06-17 01:24:55', 0, 0);
INSERT INTO `ry-vue`.coalition (id, name, task_id, create_time, coalition_status, mode) VALUES (185, '联盟185', 2, '2024-06-25 15:17:05', 1, 0);
INSERT INTO `ry-vue`.coalition (id, name, task_id, create_time, coalition_status, mode) VALUES (186, '联盟186', 1, '2024-06-25 15:17:54', 1, 0);
INSERT INTO `ry-vue`.coalition (id, name, task_id, create_time, coalition_status, mode) VALUES (187, '联盟187', 3, '2024-06-25 15:21:39', 1, 0);
INSERT INTO `ry-vue`.coalition (id, name, task_id, create_time, coalition_status, mode) VALUES (188, '联盟188', 4, '2024-06-25 15:21:52', 1, 0);
INSERT INTO `ry-vue`.coalition (id, name, task_id, create_time, coalition_status, mode) VALUES (189, '联盟189', 15, '2024-06-25 15:34:04', 1, 0);
INSERT INTO `ry-vue`.coalition (id, name, task_id, create_time, coalition_status, mode) VALUES (190, '联盟190', 19, '2024-06-25 15:34:07', 1, 0);
INSERT INTO `ry-vue`.coalition (id, name, task_id, create_time, coalition_status, mode) VALUES (191, '联盟191', 9, '2024-06-26 19:57:49', 1, 0);
INSERT INTO `ry-vue`.coalition (id, name, task_id, create_time, coalition_status, mode) VALUES (192, '联盟192', 10, '2024-07-03 02:51:02', 1, 0);
