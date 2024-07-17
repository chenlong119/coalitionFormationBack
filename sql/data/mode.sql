create table mode
(
    mode            int         null comment '多模式id',
    mode_name       varchar(50) null comment '多模式名称',
    competition_num int         null comment '成功任务数',
    failure_num     int         null comment '失败任务数'
)
    comment '多模式协同表';

INSERT INTO `ry-vue`.mode (mode, mode_name, competition_num, failure_num) VALUES (0, '跨群', 10, 5);
INSERT INTO `ry-vue`.mode (mode, mode_name, competition_num, failure_num) VALUES (1, '跨企业跨链跨群', 11, 1);
INSERT INTO `ry-vue`.mode (mode, mode_name, competition_num, failure_num) VALUES (2, '跨企业', 29, 2);
INSERT INTO `ry-vue`.mode (mode, mode_name, competition_num, failure_num) VALUES (3, '跨链', 10, 4);
INSERT INTO `ry-vue`.mode (mode, mode_name, competition_num, failure_num) VALUES (4, '跨企业跨链', 10, 3);
INSERT INTO `ry-vue`.mode (mode, mode_name, competition_num, failure_num) VALUES (5, '跨企业跨群', 10, 2);
INSERT INTO `ry-vue`.mode (mode, mode_name, competition_num, failure_num) VALUES (6, '跨链跨群', 10, 4);
