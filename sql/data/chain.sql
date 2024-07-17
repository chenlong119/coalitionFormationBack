create table chain
(
    id   int auto_increment comment '产业链编号'
        primary key,
    name varchar(20) null comment '产业链名称'
)
    comment '产业链';

INSERT INTO `ry-vue`.chain (id, name) VALUES (1, '洗衣机产业链');
INSERT INTO `ry-vue`.chain (id, name) VALUES (2, '空调产业链');
INSERT INTO `ry-vue`.chain (id, name) VALUES (3, '汽车产业链');
INSERT INTO `ry-vue`.chain (id, name) VALUES (4, '冰箱产业链');
