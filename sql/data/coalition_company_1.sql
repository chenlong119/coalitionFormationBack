create table coalition_company
(
    coalition_id  int      null comment '联盟id',
    company_id    int      null comment '企业id',
    layer_id      int      null comment '企业所属网络层',
    date_number   int      null comment '约定数目',
    actual_number int      null comment '实际数目',
    date_time     datetime null comment '约定时间',
    actual_time   datetime null comment '实际时间'
)
    comment '联盟企业表';

INSERT INTO `ry-vue`.coalition_company (coalition_id, company_id, layer_id, date_number, actual_number, date_time, actual_time) VALUES (1, 1, 1, 2800, null, '2024-05-17 00:00:00', null);
INSERT INTO `ry-vue`.coalition_company (coalition_id, company_id, layer_id, date_number, actual_number, date_time, actual_time) VALUES (1, 2, 1, 2900, null, '2024-05-29 00:00:00', null);
INSERT INTO `ry-vue`.coalition_company (coalition_id, company_id, layer_id, date_number, actual_number, date_time, actual_time) VALUES (1, 3, 1, 3000, null, '2024-05-22 00:00:00', null);
INSERT INTO `ry-vue`.coalition_company (coalition_id, company_id, layer_id, date_number, actual_number, date_time, actual_time) VALUES (1, 10, 2, 2300, null, '2024-05-23 00:00:00', null);
INSERT INTO `ry-vue`.coalition_company (coalition_id, company_id, layer_id, date_number, actual_number, date_time, actual_time) VALUES (1, 11, 2, 2000, null, '2024-05-30 00:00:00', null);
INSERT INTO `ry-vue`.coalition_company (coalition_id, company_id, layer_id, date_number, actual_number, date_time, actual_time) VALUES (2, 24, 2, 1500, null, '2024-01-27 00:00:00', null);
INSERT INTO `ry-vue`.coalition_company (coalition_id, company_id, layer_id, date_number, actual_number, date_time, actual_time) VALUES (2, 27, 2, 1200, null, '2024-01-27 00:00:00', null);
INSERT INTO `ry-vue`.coalition_company (coalition_id, company_id, layer_id, date_number, actual_number, date_time, actual_time) VALUES (2, 2, 3, 900, null, '2024-01-27 00:00:00', null);
INSERT INTO `ry-vue`.coalition_company (coalition_id, company_id, layer_id, date_number, actual_number, date_time, actual_time) VALUES (2, 1, 3, 789, null, '2024-01-27 00:00:00', null);
INSERT INTO `ry-vue`.coalition_company (coalition_id, company_id, layer_id, date_number, actual_number, date_time, actual_time) VALUES (3, 10, 1, 1566, null, '2024-01-27 00:00:00', null);
INSERT INTO `ry-vue`.coalition_company (coalition_id, company_id, layer_id, date_number, actual_number, date_time, actual_time) VALUES (3, 12, 1, 1500, null, '2024-01-27 00:00:00', null);
INSERT INTO `ry-vue`.coalition_company (coalition_id, company_id, layer_id, date_number, actual_number, date_time, actual_time) VALUES (3, 40, 2, 2800, null, '2024-05-08 10:12:56', null);
INSERT INTO `ry-vue`.coalition_company (coalition_id, company_id, layer_id, date_number, actual_number, date_time, actual_time) VALUES (4, 39, 2, 2900, null, '2024-05-08 10:12:58', null);
INSERT INTO `ry-vue`.coalition_company (coalition_id, company_id, layer_id, date_number, actual_number, date_time, actual_time) VALUES (4, 46, 2, 3000, null, '2024-05-08 10:12:58', null);
INSERT INTO `ry-vue`.coalition_company (coalition_id, company_id, layer_id, date_number, actual_number, date_time, actual_time) VALUES (4, 1, 3, 2300, null, '2024-05-08 10:12:58', null);
INSERT INTO `ry-vue`.coalition_company (coalition_id, company_id, layer_id, date_number, actual_number, date_time, actual_time) VALUES (4, 4, 3, 2000, null, '2024-05-08 10:12:58', null);
INSERT INTO `ry-vue`.coalition_company (coalition_id, company_id, layer_id, date_number, actual_number, date_time, actual_time) VALUES (48, 39, 2, 1500, null, '2024-05-08 10:12:59', null);
INSERT INTO `ry-vue`.coalition_company (coalition_id, company_id, layer_id, date_number, actual_number, date_time, actual_time) VALUES (48, 41, 2, 1200, null, '2024-05-08 10:12:59', null);
INSERT INTO `ry-vue`.coalition_company (coalition_id, company_id, layer_id, date_number, actual_number, date_time, actual_time) VALUES (48, 37, 2, 900, null, '2024-05-08 10:13:27', null);
INSERT INTO `ry-vue`.coalition_company (coalition_id, company_id, layer_id, date_number, actual_number, date_time, actual_time) VALUES (48, 38, 1, 789, null, '2024-05-08 10:13:00', null);
INSERT INTO `ry-vue`.coalition_company (coalition_id, company_id, layer_id, date_number, actual_number, date_time, actual_time) VALUES (48, 40, 1, 1566, null, '2024-05-08 10:13:00', null);
INSERT INTO `ry-vue`.coalition_company (coalition_id, company_id, layer_id, date_number, actual_number, date_time, actual_time) VALUES (48, 41, 1, 1500, null, '2024-05-08 10:13:00', null);
INSERT INTO `ry-vue`.coalition_company (coalition_id, company_id, layer_id, date_number, actual_number, date_time, actual_time) VALUES (48, 39, 1, 2800, null, '2024-05-08 10:13:00', null);
INSERT INTO `ry-vue`.coalition_company (coalition_id, company_id, layer_id, date_number, actual_number, date_time, actual_time) VALUES (56, 17, 1, 2900, null, '2024-05-08 10:13:26', null);
INSERT INTO `ry-vue`.coalition_company (coalition_id, company_id, layer_id, date_number, actual_number, date_time, actual_time) VALUES (56, 14, 1, 3000, null, '2024-05-08 10:13:01', null);
INSERT INTO `ry-vue`.coalition_company (coalition_id, company_id, layer_id, date_number, actual_number, date_time, actual_time) VALUES (57, 11, 1, 2300, null, '2024-05-08 10:13:01', null);
INSERT INTO `ry-vue`.coalition_company (coalition_id, company_id, layer_id, date_number, actual_number, date_time, actual_time) VALUES (57, 8, 1, 2000, null, '2024-05-08 10:13:01', null);
INSERT INTO `ry-vue`.coalition_company (coalition_id, company_id, layer_id, date_number, actual_number, date_time, actual_time) VALUES (57, 5, 1, 1500, null, '2024-05-08 10:13:01', null);
INSERT INTO `ry-vue`.coalition_company (coalition_id, company_id, layer_id, date_number, actual_number, date_time, actual_time) VALUES (57, 7, 1, 1200, null, '2024-05-08 10:13:02', null);
INSERT INTO `ry-vue`.coalition_company (coalition_id, company_id, layer_id, date_number, actual_number, date_time, actual_time) VALUES (57, 1, 2, 900, null, '2024-05-08 10:13:02', null);
INSERT INTO `ry-vue`.coalition_company (coalition_id, company_id, layer_id, date_number, actual_number, date_time, actual_time) VALUES (57, 10, 2, 789, null, '2024-05-08 10:13:02', null);
INSERT INTO `ry-vue`.coalition_company (coalition_id, company_id, layer_id, date_number, actual_number, date_time, actual_time) VALUES (57, 44, 2, 1566, null, '2024-05-08 10:13:02', null);
INSERT INTO `ry-vue`.coalition_company (coalition_id, company_id, layer_id, date_number, actual_number, date_time, actual_time) VALUES (58, 10, 1, 1500, null, '2024-05-08 10:13:02', null);
INSERT INTO `ry-vue`.coalition_company (coalition_id, company_id, layer_id, date_number, actual_number, date_time, actual_time) VALUES (58, 4, 1, 2800, null, '2024-05-08 10:13:02', null);
INSERT INTO `ry-vue`.coalition_company (coalition_id, company_id, layer_id, date_number, actual_number, date_time, actual_time) VALUES (58, 12, 1, 2900, null, '2024-05-08 10:13:03', null);
INSERT INTO `ry-vue`.coalition_company (coalition_id, company_id, layer_id, date_number, actual_number, date_time, actual_time) VALUES (58, 1, 1, 3000, null, '2024-05-08 10:13:03', null);
INSERT INTO `ry-vue`.coalition_company (coalition_id, company_id, layer_id, date_number, actual_number, date_time, actual_time) VALUES (58, 43, 2, 2300, null, '2024-05-08 10:13:03', null);
INSERT INTO `ry-vue`.coalition_company (coalition_id, company_id, layer_id, date_number, actual_number, date_time, actual_time) VALUES (58, 45, 2, 2000, null, '2024-05-08 10:13:04', null);
INSERT INTO `ry-vue`.coalition_company (coalition_id, company_id, layer_id, date_number, actual_number, date_time, actual_time) VALUES (58, 46, 2, 1500, null, '2024-05-08 10:13:04', null);
INSERT INTO `ry-vue`.coalition_company (coalition_id, company_id, layer_id, date_number, actual_number, date_time, actual_time) VALUES (59, 20, 1, 1200, null, '2024-05-08 10:13:04', null);
INSERT INTO `ry-vue`.coalition_company (coalition_id, company_id, layer_id, date_number, actual_number, date_time, actual_time) VALUES (59, 25, 1, 900, null, '2024-05-08 10:13:04', null);
INSERT INTO `ry-vue`.coalition_company (coalition_id, company_id, layer_id, date_number, actual_number, date_time, actual_time) VALUES (59, 30, 2, 789, null, '2024-05-08 10:13:04', null);
INSERT INTO `ry-vue`.coalition_company (coalition_id, company_id, layer_id, date_number, actual_number, date_time, actual_time) VALUES (59, 24, 2, 1566, null, '2024-05-08 10:13:23', null);
INSERT INTO `ry-vue`.coalition_company (coalition_id, company_id, layer_id, date_number, actual_number, date_time, actual_time) VALUES (59, 32, 1, 1500, null, '2024-05-08 10:13:05', null);
INSERT INTO `ry-vue`.coalition_company (coalition_id, company_id, layer_id, date_number, actual_number, date_time, actual_time) VALUES (60, 37, 1, 2800, null, '2024-05-08 10:13:05', null);
INSERT INTO `ry-vue`.coalition_company (coalition_id, company_id, layer_id, date_number, actual_number, date_time, actual_time) VALUES (60, 34, 1, 2900, null, '2024-05-08 10:13:05', null);
INSERT INTO `ry-vue`.coalition_company (coalition_id, company_id, layer_id, date_number, actual_number, date_time, actual_time) VALUES (60, 36, 2, 3000, null, '2024-05-08 10:13:05', null);
INSERT INTO `ry-vue`.coalition_company (coalition_id, company_id, layer_id, date_number, actual_number, date_time, actual_time) VALUES (60, 34, 2, 2300, null, '2024-05-08 10:13:05', null);
INSERT INTO `ry-vue`.coalition_company (coalition_id, company_id, layer_id, date_number, actual_number, date_time, actual_time) VALUES (61, 22, 1, 2000, null, '2024-05-08 10:13:05', null);
INSERT INTO `ry-vue`.coalition_company (coalition_id, company_id, layer_id, date_number, actual_number, date_time, actual_time) VALUES (61, 19, 1, 1500, null, '2024-05-08 10:13:22', null);
INSERT INTO `ry-vue`.coalition_company (coalition_id, company_id, layer_id, date_number, actual_number, date_time, actual_time) VALUES (61, 21, 1, 1200, null, '2024-05-08 10:13:22', null);
INSERT INTO `ry-vue`.coalition_company (coalition_id, company_id, layer_id, date_number, actual_number, date_time, actual_time) VALUES (61, 54, 2, 900, null, '2024-05-08 10:13:06', null);
INSERT INTO `ry-vue`.coalition_company (coalition_id, company_id, layer_id, date_number, actual_number, date_time, actual_time) VALUES (61, 55, 2, 789, null, '2024-05-08 10:13:06', null);
INSERT INTO `ry-vue`.coalition_company (coalition_id, company_id, layer_id, date_number, actual_number, date_time, actual_time) VALUES (61, 48, 2, 1566, null, '2024-05-08 10:13:07', null);
INSERT INTO `ry-vue`.coalition_company (coalition_id, company_id, layer_id, date_number, actual_number, date_time, actual_time) VALUES (62, 40, 1, 1500, null, '2024-05-08 10:13:07', null);
INSERT INTO `ry-vue`.coalition_company (coalition_id, company_id, layer_id, date_number, actual_number, date_time, actual_time) VALUES (62, 38, 1, 2800, null, '2024-05-08 10:13:20', null);
INSERT INTO `ry-vue`.coalition_company (coalition_id, company_id, layer_id, date_number, actual_number, date_time, actual_time) VALUES (63, 6, 1, 2900, null, '2024-05-08 10:13:07', null);
INSERT INTO `ry-vue`.coalition_company (coalition_id, company_id, layer_id, date_number, actual_number, date_time, actual_time) VALUES (63, 13, 1, 3000, null, '2024-05-08 10:13:07', null);
INSERT INTO `ry-vue`.coalition_company (coalition_id, company_id, layer_id, date_number, actual_number, date_time, actual_time) VALUES (63, 2, 1, 2300, null, '2024-05-08 10:13:07', null);
INSERT INTO `ry-vue`.coalition_company (coalition_id, company_id, layer_id, date_number, actual_number, date_time, actual_time) VALUES (65, 23, 1, 2000, null, '2024-05-08 10:13:07', null);
INSERT INTO `ry-vue`.coalition_company (coalition_id, company_id, layer_id, date_number, actual_number, date_time, actual_time) VALUES (65, 15, 1, 1500, null, '2024-05-08 10:13:08', null);
INSERT INTO `ry-vue`.coalition_company (coalition_id, company_id, layer_id, date_number, actual_number, date_time, actual_time) VALUES (65, 18, 1, 1200, null, '2024-05-08 10:13:08', null);
INSERT INTO `ry-vue`.coalition_company (coalition_id, company_id, layer_id, date_number, actual_number, date_time, actual_time) VALUES (66, 29, 1, 900, null, '2024-05-08 10:13:08', null);
INSERT INTO `ry-vue`.coalition_company (coalition_id, company_id, layer_id, date_number, actual_number, date_time, actual_time) VALUES (66, 31, 1, 789, null, '2024-05-08 10:13:09', null);
INSERT INTO `ry-vue`.coalition_company (coalition_id, company_id, layer_id, date_number, actual_number, date_time, actual_time) VALUES (66, 30, 1, 1566, null, '2024-05-08 10:13:09', null);
INSERT INTO `ry-vue`.coalition_company (coalition_id, company_id, layer_id, date_number, actual_number, date_time, actual_time) VALUES (66, 24, 1, 1500, null, '2024-05-08 10:13:09', null);
INSERT INTO `ry-vue`.coalition_company (coalition_id, company_id, layer_id, date_number, actual_number, date_time, actual_time) VALUES (66, 76, 3, 2800, null, '2024-05-08 10:13:10', null);
INSERT INTO `ry-vue`.coalition_company (coalition_id, company_id, layer_id, date_number, actual_number, date_time, actual_time) VALUES (66, 79, 3, 2900, null, '2024-05-08 10:13:10', null);
INSERT INTO `ry-vue`.coalition_company (coalition_id, company_id, layer_id, date_number, actual_number, date_time, actual_time) VALUES (66, 78, 3, 3000, null, '2024-05-08 10:13:10', null);
INSERT INTO `ry-vue`.coalition_company (coalition_id, company_id, layer_id, date_number, actual_number, date_time, actual_time) VALUES (66, 27, 2, 2300, null, '2024-05-08 10:13:11', null);
INSERT INTO `ry-vue`.coalition_company (coalition_id, company_id, layer_id, date_number, actual_number, date_time, actual_time) VALUES (73, 48, null, null, null, '2024-05-10 07:20:50', null);
INSERT INTO `ry-vue`.coalition_company (coalition_id, company_id, layer_id, date_number, actual_number, date_time, actual_time) VALUES (83, 9, null, null, null, '2024-05-13 02:59:08', null);
INSERT INTO `ry-vue`.coalition_company (coalition_id, company_id, layer_id, date_number, actual_number, date_time, actual_time) VALUES (85, 6, null, null, null, '2024-05-14 02:53:07', null);
INSERT INTO `ry-vue`.coalition_company (coalition_id, company_id, layer_id, date_number, actual_number, date_time, actual_time) VALUES (88, 6, null, null, null, '2024-05-14 06:34:24', null);
INSERT INTO `ry-vue`.coalition_company (coalition_id, company_id, layer_id, date_number, actual_number, date_time, actual_time) VALUES (92, 21, null, null, null, '2024-05-14 07:21:43', null);
INSERT INTO `ry-vue`.coalition_company (coalition_id, company_id, layer_id, date_number, actual_number, date_time, actual_time) VALUES (93, 21, null, null, null, '2024-05-14 07:44:15', null);
INSERT INTO `ry-vue`.coalition_company (coalition_id, company_id, layer_id, date_number, actual_number, date_time, actual_time) VALUES (117, 47, null, null, null, '2024-05-16 14:38:11', null);
INSERT INTO `ry-vue`.coalition_company (coalition_id, company_id, layer_id, date_number, actual_number, date_time, actual_time) VALUES (119, 47, null, null, null, '2024-05-16 21:26:21', null);
INSERT INTO `ry-vue`.coalition_company (coalition_id, company_id, layer_id, date_number, actual_number, date_time, actual_time) VALUES (121, 24, null, null, null, '2024-05-17 07:14:00', null);
INSERT INTO `ry-vue`.coalition_company (coalition_id, company_id, layer_id, date_number, actual_number, date_time, actual_time) VALUES (134, 47, null, null, null, '2024-05-17 20:28:12', null);
INSERT INTO `ry-vue`.coalition_company (coalition_id, company_id, layer_id, date_number, actual_number, date_time, actual_time) VALUES (149, 47, null, null, null, '2024-05-17 21:01:31', null);
INSERT INTO `ry-vue`.coalition_company (coalition_id, company_id, layer_id, date_number, actual_number, date_time, actual_time) VALUES (164, 7, null, null, null, '2024-05-18 11:59:54', null);
INSERT INTO `ry-vue`.coalition_company (coalition_id, company_id, layer_id, date_number, actual_number, date_time, actual_time) VALUES (165, 7, null, null, null, '2024-05-18 12:49:28', null);
INSERT INTO `ry-vue`.coalition_company (coalition_id, company_id, layer_id, date_number, actual_number, date_time, actual_time) VALUES (167, 24, null, null, null, '2024-05-20 02:53:52', null);
INSERT INTO `ry-vue`.coalition_company (coalition_id, company_id, layer_id, date_number, actual_number, date_time, actual_time) VALUES (184, 18, null, null, null, '2024-06-18 11:55:41', null);
