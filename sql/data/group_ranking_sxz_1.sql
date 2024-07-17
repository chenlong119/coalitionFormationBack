create table group_ranking_sxz
(
    id         int            null,
    group_name varchar(255)   null comment '企业群名称',
    score      decimal(10, 2) null comment '得分',
    ranking    int            null comment '排名',
    time_frame varchar(50)    null comment '时间段'
)
    comment '企业群排行表';

INSERT INTO `ry-vue`.group_ranking_sxz (id, group_name, score, ranking, time_frame) VALUES (1, '橡胶企业群', 88.56, 1, 'HALF_YEAR');
INSERT INTO `ry-vue`.group_ranking_sxz (id, group_name, score, ranking, time_frame) VALUES (2, '塑料产品企业群', 87.77, 2, 'HALF_YEAR');
INSERT INTO `ry-vue`.group_ranking_sxz (id, group_name, score, ranking, time_frame) VALUES (3, '半导体企业群', 86.96, 3, 'HALF_YEAR');
INSERT INTO `ry-vue`.group_ranking_sxz (id, group_name, score, ranking, time_frame) VALUES (4, '功能涂料企业群', 86.75, 4, 'HALF_YEAR');
INSERT INTO `ry-vue`.group_ranking_sxz (id, group_name, score, ranking, time_frame) VALUES (5, '金属冶炼企业群', 85.87, 5, 'HALF_YEAR');
INSERT INTO `ry-vue`.group_ranking_sxz (id, group_name, score, ranking, time_frame) VALUES (6, '热镀铝锌企业群', 85.56, 6, 'HALF_YEAR');
INSERT INTO `ry-vue`.group_ranking_sxz (id, group_name, score, ranking, time_frame) VALUES (7, '电刷材料企业群', 85.22, 7, 'HALF_YEAR');
INSERT INTO `ry-vue`.group_ranking_sxz (id, group_name, score, ranking, time_frame) VALUES (8, '磁性材料企业群', 84.88, 8, 'HALF_YEAR');
INSERT INTO `ry-vue`.group_ranking_sxz (id, group_name, score, ranking, time_frame) VALUES (9, '传动材料企业群', 84.36, 9, 'HALF_YEAR');
INSERT INTO `ry-vue`.group_ranking_sxz (id, group_name, score, ranking, time_frame) VALUES (10, '脱水桶企业群', 84.32, 10, 'HALF_YEAR');
INSERT INTO `ry-vue`.group_ranking_sxz (id, group_name, score, ranking, time_frame) VALUES (11, '金属冶炼企业群', 88.66, 1, 'MONTH');
INSERT INTO `ry-vue`.group_ranking_sxz (id, group_name, score, ranking, time_frame) VALUES (12, '塑料产品企业群', 87.52, 2, 'MONTH');
INSERT INTO `ry-vue`.group_ranking_sxz (id, group_name, score, ranking, time_frame) VALUES (13, '橡胶企业群', 86.55, 3, 'MONTH');
INSERT INTO `ry-vue`.group_ranking_sxz (id, group_name, score, ranking, time_frame) VALUES (14, '功能涂料企业群', 86.32, 4, 'MONTH');
INSERT INTO `ry-vue`.group_ranking_sxz (id, group_name, score, ranking, time_frame) VALUES (15, '半导体企业群', 85.43, 5, 'MONTH');
INSERT INTO `ry-vue`.group_ranking_sxz (id, group_name, score, ranking, time_frame) VALUES (16, '热镀铝锌企业群', 85.63, 6, 'MONTH');
INSERT INTO `ry-vue`.group_ranking_sxz (id, group_name, score, ranking, time_frame) VALUES (17, '脱水桶企业群', 85.67, 7, 'MONTH');
INSERT INTO `ry-vue`.group_ranking_sxz (id, group_name, score, ranking, time_frame) VALUES (18, '传动材料企业群', 84.39, 8, 'MONTH');
INSERT INTO `ry-vue`.group_ranking_sxz (id, group_name, score, ranking, time_frame) VALUES (19, '磁性材料企业群', 84.38, 9, 'MONTH');
INSERT INTO `ry-vue`.group_ranking_sxz (id, group_name, score, ranking, time_frame) VALUES (20, '电刷材料企业群', 84.21, 10, 'MONTH');
