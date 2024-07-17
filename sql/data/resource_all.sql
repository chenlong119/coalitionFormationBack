create table resource_all
(
    id            int         not null comment '资源编号'
        primary key,
    resource_type int         not null comment '企业在产业链所在阶段（原料供应，零件生产，整机组装，销售和回收）',
    name          varchar(20) null comment '资源名称'
)
    comment '资源表';

INSERT INTO `ry-vue`.resource_all (id, resource_type, name) VALUES (1, 1, '钢材');
INSERT INTO `ry-vue`.resource_all (id, resource_type, name) VALUES (2, 1, '电机');
INSERT INTO `ry-vue`.resource_all (id, resource_type, name) VALUES (3, 1, '进水管');
INSERT INTO `ry-vue`.resource_all (id, resource_type, name) VALUES (4, 1, '零售店');
INSERT INTO `ry-vue`.resource_all (id, resource_type, name) VALUES (5, 1, '塑料');
INSERT INTO `ry-vue`.resource_all (id, resource_type, name) VALUES (6, 1, '排水泵');
INSERT INTO `ry-vue`.resource_all (id, resource_type, name) VALUES (7, 1, '排水管');
INSERT INTO `ry-vue`.resource_all (id, resource_type, name) VALUES (8, 1, '在线电商平台');
INSERT INTO `ry-vue`.resource_all (id, resource_type, name) VALUES (9, 1, '电子元件');
INSERT INTO `ry-vue`.resource_all (id, resource_type, name) VALUES (10, 1, '传动系统');
INSERT INTO `ry-vue`.resource_all (id, resource_type, name) VALUES (11, 1, '内桶');
INSERT INTO `ry-vue`.resource_all (id, resource_type, name) VALUES (12, 1, '配送服务');
INSERT INTO `ry-vue`.resource_all (id, resource_type, name) VALUES (13, 1, '橡胶');
INSERT INTO `ry-vue`.resource_all (id, resource_type, name) VALUES (14, 1, '显示屏');
INSERT INTO `ry-vue`.resource_all (id, resource_type, name) VALUES (15, 1, '外壳');
INSERT INTO `ry-vue`.resource_all (id, resource_type, name) VALUES (16, 2, '零部件维修中心');
INSERT INTO `ry-vue`.resource_all (id, resource_type, name) VALUES (17, 2, '玻璃');
INSERT INTO `ry-vue`.resource_all (id, resource_type, name) VALUES (18, 2, '振动减震器');
INSERT INTO `ry-vue`.resource_all (id, resource_type, name) VALUES (19, 2, '过滤网');
INSERT INTO `ry-vue`.resource_all (id, resource_type, name) VALUES (20, 2, '电机回收');
INSERT INTO `ry-vue`.resource_all (id, resource_type, name) VALUES (21, 2, '硅胶');
INSERT INTO `ry-vue`.resource_all (id, resource_type, name) VALUES (22, 2, '功率控制器');
INSERT INTO `ry-vue`.resource_all (id, resource_type, name) VALUES (23, 2, '绝缘材料');
INSERT INTO `ry-vue`.resource_all (id, resource_type, name) VALUES (24, 2, '回收和拆卸服务部门');
INSERT INTO `ry-vue`.resource_all (id, resource_type, name) VALUES (25, 2, '铝材');
INSERT INTO `ry-vue`.resource_all (id, resource_type, name) VALUES (26, 2, '压缩机');
INSERT INTO `ry-vue`.resource_all (id, resource_type, name) VALUES (27, 2, '电线束');
INSERT INTO `ry-vue`.resource_all (id, resource_type, name) VALUES (28, 2, '销售数据分析中心');
INSERT INTO `ry-vue`.resource_all (id, resource_type, name) VALUES (29, 2, '润滑油');
INSERT INTO `ry-vue`.resource_all (id, resource_type, name) VALUES (30, 2, '蒸发器');
INSERT INTO `ry-vue`.resource_all (id, resource_type, name) VALUES (31, 3, '金属螺丝和紧固件');
INSERT INTO `ry-vue`.resource_all (id, resource_type, name) VALUES (32, 3, '经销商网络');
INSERT INTO `ry-vue`.resource_all (id, resource_type, name) VALUES (33, 3, '制冷剂');
INSERT INTO `ry-vue`.resource_all (id, resource_type, name) VALUES (34, 3, '冷凝器');
INSERT INTO `ry-vue`.resource_all (id, resource_type, name) VALUES (35, 3, '制冷管道连接件');
INSERT INTO `ry-vue`.resource_all (id, resource_type, name) VALUES (36, 3, '安装服务');
INSERT INTO `ry-vue`.resource_all (id, resource_type, name) VALUES (37, 3, '锂');
INSERT INTO `ry-vue`.resource_all (id, resource_type, name) VALUES (38, 3, '扩张阀');
INSERT INTO `ry-vue`.resource_all (id, resource_type, name) VALUES (39, 3, '防震垫');
INSERT INTO `ry-vue`.resource_all (id, resource_type, name) VALUES (40, 3, '线下销售网');
INSERT INTO `ry-vue`.resource_all (id, resource_type, name) VALUES (41, 3, '镍');
INSERT INTO `ry-vue`.resource_all (id, resource_type, name) VALUES (42, 3, '电控系统');
INSERT INTO `ry-vue`.resource_all (id, resource_type, name) VALUES (43, 3, '机身组件');
INSERT INTO `ry-vue`.resource_all (id, resource_type, name) VALUES (44, 3, '客户体验中心');
INSERT INTO `ry-vue`.resource_all (id, resource_type, name) VALUES (45, 3, '碳纤维');
INSERT INTO `ry-vue`.resource_all (id, resource_type, name) VALUES (46, 4, '遥控器');
INSERT INTO `ry-vue`.resource_all (id, resource_type, name) VALUES (47, 4, '内饰件');
INSERT INTO `ry-vue`.resource_all (id, resource_type, name) VALUES (48, 4, '充电网络站点');
INSERT INTO `ry-vue`.resource_all (id, resource_type, name) VALUES (49, 4, '涂料');
INSERT INTO `ry-vue`.resource_all (id, resource_type, name) VALUES (50, 4, '电池单元');
INSERT INTO `ry-vue`.resource_all (id, resource_type, name) VALUES (51, 4, '安全系统');
INSERT INTO `ry-vue`.resource_all (id, resource_type, name) VALUES (52, 4, '铜线');
INSERT INTO `ry-vue`.resource_all (id, resource_type, name) VALUES (53, 4, '电动机');
INSERT INTO `ry-vue`.resource_all (id, resource_type, name) VALUES (54, 4, '轮胎');
INSERT INTO `ry-vue`.resource_all (id, resource_type, name) VALUES (55, 4, '铜管');
INSERT INTO `ry-vue`.resource_all (id, resource_type, name) VALUES (56, 4, '车载信息配置');
INSERT INTO `ry-vue`.resource_all (id, resource_type, name) VALUES (57, 4, '全车载软件系统');
