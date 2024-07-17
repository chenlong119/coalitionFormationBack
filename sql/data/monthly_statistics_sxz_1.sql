create table monthly_statistics_sxz
(
    id               int auto_increment
        primary key,
    month            varchar(7) not null comment '月份',
    high_score_count int        not null comment '>80分数量',
    layer_id         int        not null comment '产业链网络层编号',
    constraint month
        unique (month, layer_id)
)
    comment '每月每条链中大于80分的记录';

create index monthly_statistics_sxz_company_all_layer_id_fk
    on monthly_statistics_sxz (layer_id);

INSERT INTO `ry-vue`.monthly_statistics_sxz (id, month, high_score_count, layer_id) VALUES (1, '2023-12', 4, 1);
INSERT INTO `ry-vue`.monthly_statistics_sxz (id, month, high_score_count, layer_id) VALUES (2, '2023-12', 3, 2);
INSERT INTO `ry-vue`.monthly_statistics_sxz (id, month, high_score_count, layer_id) VALUES (3, '2023-12', 5, 3);
INSERT INTO `ry-vue`.monthly_statistics_sxz (id, month, high_score_count, layer_id) VALUES (4, '2024-1', 4, 1);
INSERT INTO `ry-vue`.monthly_statistics_sxz (id, month, high_score_count, layer_id) VALUES (5, '2024-1', 5, 2);
INSERT INTO `ry-vue`.monthly_statistics_sxz (id, month, high_score_count, layer_id) VALUES (6, '2024-1', 6, 3);
INSERT INTO `ry-vue`.monthly_statistics_sxz (id, month, high_score_count, layer_id) VALUES (7, '2024-2', 5, 1);
INSERT INTO `ry-vue`.monthly_statistics_sxz (id, month, high_score_count, layer_id) VALUES (8, '2024-2', 7, 2);
INSERT INTO `ry-vue`.monthly_statistics_sxz (id, month, high_score_count, layer_id) VALUES (9, '2024-2', 9, 3);
INSERT INTO `ry-vue`.monthly_statistics_sxz (id, month, high_score_count, layer_id) VALUES (10, '2024-3', 7, 1);
INSERT INTO `ry-vue`.monthly_statistics_sxz (id, month, high_score_count, layer_id) VALUES (11, '2024-3', 7, 2);
INSERT INTO `ry-vue`.monthly_statistics_sxz (id, month, high_score_count, layer_id) VALUES (12, '2024-3', 8, 3);
INSERT INTO `ry-vue`.monthly_statistics_sxz (id, month, high_score_count, layer_id) VALUES (13, '2024-4', 8, 1);
INSERT INTO `ry-vue`.monthly_statistics_sxz (id, month, high_score_count, layer_id) VALUES (14, '2024-4', 8, 2);
INSERT INTO `ry-vue`.monthly_statistics_sxz (id, month, high_score_count, layer_id) VALUES (15, '2024-4', 10, 3);
INSERT INTO `ry-vue`.monthly_statistics_sxz (id, month, high_score_count, layer_id) VALUES (16, '2024-5', 10, 1);
INSERT INTO `ry-vue`.monthly_statistics_sxz (id, month, high_score_count, layer_id) VALUES (17, '2024-5', 12, 2);
INSERT INTO `ry-vue`.monthly_statistics_sxz (id, month, high_score_count, layer_id) VALUES (18, '2024-5', 14, 3);
