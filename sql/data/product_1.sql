create table product
(
    id   int auto_increment comment '产品id'
        primary key,
    name varchar(20) null comment '产品名称'
)
    comment '产品表';

INSERT INTO `ry-vue`.product (id, name) VALUES (1, '工业橡胶');
INSERT INTO `ry-vue`.product (id, name) VALUES (2, '工业塑料');
INSERT INTO `ry-vue`.product (id, name) VALUES (3, '电刷材料');
INSERT INTO `ry-vue`.product (id, name) VALUES (4, '电机');
INSERT INTO `ry-vue`.product (id, name) VALUES (5, '洗衣机');
INSERT INTO `ry-vue`.product (id, name) VALUES (6, '金属机箱');
INSERT INTO `ry-vue`.product (id, name) VALUES (7, '电子元器件');
INSERT INTO `ry-vue`.product (id, name) VALUES (8, '脱水桶');
INSERT INTO `ry-vue`.product (id, name) VALUES (9, '传动带');
