create table company_all
(
    id           int                        not null comment '企业编号',
    layer_id     int                        not null comment '产业链网络层编号',
    company_type int                        null comment '企业在产业链所在阶段（原料供应，零件生产，整机组装，销售和回收）',
    name         varchar(20)                null comment '企业名称',
    address      varchar(20) default '济南' null comment '企业地址',
    group_id     int         default 0      null comment '所属企业群id',
    coalition_id int         default 0      null,
    process_rate int                        null comment '任务完成速率',
    rep          double      default 1      null comment '企业信誉',
    status       int         default 1      null comment '企业状态（0异常，1空闲，2工作）',
    score        double                     null,
    primary key (layer_id, id)
)
    comment '企业表';

INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (1, 1, 1, '云南天然橡胶产业股份有限公司', '济南', 0, 0, null, 1, 1, 87.72);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (2, 1, 1, '云南瑞华能源', '济南', 0, 188, null, 1, 2, 77.69);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (3, 1, 1, '诺博橡胶制品', '济南', 0, 0, null, 1, 1, 81.56);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (4, 1, 1, '金发科技', '济南', 0, 187, null, 1, 2, 82.98);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (5, 1, 1, '佛山佛塑科技集团股份有限公司', '济南', 0, 185, null, 1, 2, 77.58);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (6, 1, 1, '武汉新芯继承电路制造有限公司', '济南', 0, 188, null, 1, 2, 79.79);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (7, 1, 1, '厦门钨业', '济南', 0, 187, null, 1, 2, 84.42);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (8, 1, 1, '青岛爱尔家佳新材料股份有限公司', '济南', 0, 186, null, 1, 2, 87.72);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (9, 1, 1, '南京凯乐涂料有限公司', '济南', 0, 185, null, 1, 2, 81.63);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (10, 1, 1, '宝山钢铁股份有限公司', '济南', 0, 188, null, 1, 2, 90.51);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (11, 1, 1, '中国鞍钢集团公司', '济南', 0, 186, null, 1, 2, 85.96);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (12, 1, 1, '南山铝业', '济南', 0, 0, null, 1, 1, 81.57);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (13, 1, 1, '金川集团', '济南', 0, 188, null, 1, 2, 82.36);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (14, 1, 2, '江苏宏亿精工股份有限公司', '济南', 0, 0, null, 1, 1, 79.78);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (15, 1, 2, '山东安耐传动系统有限公司', '济南', 0, 191, null, 1, 2, 84.82);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (16, 1, 2, '山东大成塑业有限公司', '济南', 0, 0, null, 1, 1, 76.61);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (17, 1, 2, '置信电机', '济南', 0, 191, null, 1, 2, 75.69);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (18, 1, 2, '敦泰科技有限公司', '济南', 0, 0, null, 1, 1, 83.34);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (19, 1, 2, '江苏昌伟业科技集团有限公司', '济南', 0, 0, null, 1, 1, 82.11);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (20, 1, 3, '宁波中威壳体有限公司', '济南', 0, 189, null, 1, 2, 83.91);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (21, 1, 2, '众绅机械制造有限公司', '济南', 0, 0, null, 1, 1, 82.89);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (22, 1, 2, '宁德时代', '济南', 0, 0, null, 1, 1, 86.41);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (23, 1, 2, '常州市永安电机有限公司', '济南', 0, 0, null, 1, 1, 82.27);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (24, 1, 3, '山东小鸭集团家电有限公司', '济南', 0, 0, null, 1, 1, 92.52);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (25, 1, 3, '美的集团股份有限公司', '济南', 0, 0, null, 1, 1, 84.07);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (26, 1, 3, '小天鹅集团', '济南', 0, 0, null, 1, 1, 76.82);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (27, 1, 3, '西门子股份公司', '济南', 0, 0, null, 1, 1, 80.86);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (28, 1, 3, '格力电器', '济南', 0, 0, null, 1, 1, 88.45);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (29, 1, 3, '海尔智家', '济南', 0, 0, null, 1, 1, 86.28);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (30, 1, 3, '苏宁电器股份有限公司', '济南', 0, 0, null, 1, 1, 88.91);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (31, 1, 3, '国美电器有限公司', '济南', 0, 0, null, 1, 1, 64.51);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (32, 1, 3, '京东五星电器集团有限公司', '济南', 0, 189, null, 1, 2, 86.73);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (33, 1, 3, '青岛方格智能家居有限公司', '济南', 0, 94, null, 1, 1, 85.03);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (34, 1, 4, '青岛中车四方车辆物流有限公司', '济南', 0, 0, null, 1, 1, 84.83);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (35, 1, 4, '京东物流运输有限公司', '济南', 0, 190, null, 1, 2, 91.67);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (36, 1, 4, '顺丰控股股份有限公司', '济南', 0, 0, null, 1, 1, 90.27);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (37, 1, 4, '山东佳诚电器维修有限公司', '济南', 0, 0, null, 1, 1, 87.39);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (38, 1, 4, '青岛康捷家电维修有限公司', '济南', 0, 80, null, 1, 1, 83.12);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (39, 1, 4, '济南山和海环保科技有限公司', '济南', 0, 0, null, 1, 1, 81.54);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (40, 1, 4, '山东惠宇环保科技有限公司', '济南', 0, 190, null, 1, 2, 83.84);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (41, 1, 4, '汨罗万容电子废弃物处理有限公司', '济南', 0, 0, null, 1, 1, 78.08);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (1, 2, 1, '云南天然橡胶产业股份有限公司', '济南', 0, 0, null, 1, 1, 87.72);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (10, 2, 1, '宝山钢铁股份有限公司', '济南', 0, 0, null, 1, 1, 90.51);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (11, 2, 1, '中国鞍钢集团公司', '济南', 0, 188, null, 1, 2, 85.96);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (24, 2, 3, '山东小鸭集团家电有限公司', '济南', 0, 189, null, 1, 2, 92.52);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (25, 2, 3, '美的集团股份有限公司', '济南', 0, 0, null, 1, 1, 84.07);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (27, 2, 3, '西门子股份公司', '济南', 0, 0, null, 1, 1, 80.86);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (28, 2, 3, '格力电器', '济南', 0, 0, null, 1, 1, 88.45);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (29, 2, 3, '海尔智家', '济南', 0, 189, null, 1, 2, 86.28);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (30, 2, 3, '苏宁电器股份有限公司', '济南', 0, 0, null, 1, 1, 88.91);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (31, 2, 3, '国美电器有限公司', '济南', 0, 0, null, 1, 1, 64.51);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (34, 2, 4, '青岛中车四方车辆物流有限公司', '济南', 0, 190, null, 1, 2, 84.83);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (35, 2, 4, '京东物流运输有限公司', '济南', 0, 0, null, 1, 1, 91.67);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (36, 2, 4, '顺丰控股股份有限公司', '济南', 0, 0, null, 1, 1, 90.27);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (37, 2, 4, '山东佳诚电器维修有限公司', '济南', 0, 190, null, 1, 2, 87.39);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (38, 2, 4, '青岛康捷家电维修有限公司', '济南', 0, 0, null, 1, 1, 83.12);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (39, 2, 4, '济南山和海环保科技有限公司', '济南', 0, 190, null, 1, 2, 81.54);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (40, 2, 4, '山东惠宇环保科技有限公司', '济南', 0, 190, null, 1, 2, 83.84);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (41, 2, 4, '汨罗万容电子废弃物处理有限公司', '济南', 0, 0, null, 1, 1, 78.08);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (43, 2, 1, '西部玻璃工业集团有限公司', '济南', 0, 186, null, 1, 2, 82.48);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (44, 2, 1, '中国玻璃控股有限公司', '济南', 0, 186, null, 1, 2, 87.15);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (45, 2, 1, '三星电子', '济南', 0, 0, null, 1, 1, 69.37);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (46, 2, 1, '富士康科技集团', '济南', 0, 0, null, 1, 1, 77.89);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (47, 2, 1, '菲利普斯', '济南', 0, 188, null, 1, 2, 88.39);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (48, 2, 2, '德固赛', '济南', 0, 191, null, 1, 2, 90.46);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (49, 2, 2, '中国中化集团', '济南', 0, 0, null, 1, 1, 76.89);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (50, 2, 2, '陶氏化学公司', '济南', 0, 0, null, 1, 1, 84.32);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (51, 2, 2, '普利司通公司', '济南', 0, 0, null, 1, 1, 83.29);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (52, 2, 2, '杜邦公司', '济南', 0, 0, null, 1, 1, 88.07);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (53, 2, 2, '3M公司', '济南', 0, 0, null, 1, 1, 79.76);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (54, 2, 2, '斯伯丁公司', '济南', 0, 0, null, 1, 1, 59.92);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (55, 2, 2, '阿尔斯通', '济南', 0, 0, null, 1, 1, 78.23);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (56, 2, 3, '长虹', '济南', 0, 189, null, 1, 2, 86.91);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (1, 3, 1, '云南天然橡胶产业股份有限公司', '济南', 0, 0, null, 1, 1, 87.72);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (2, 3, 1, '云南瑞华能源', '济南', 0, 91, null, 1, 1, 77.69);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (4, 3, 1, '金发科技', '济南', 0, 116, null, 1, 1, 82.98);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (7, 3, 1, '厦门钨业', '济南', 0, 0, null, 1, 1, 84.42);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (11, 3, 1, '中国鞍钢集团公司', '济南', 0, 0, null, 1, 1, 85.96);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (13, 3, 1, '金川集团', '济南', 0, 188, null, 1, 2, 82.36);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (34, 3, 4, '青岛中车四方车辆物流有限公司', '济南', 0, 0, null, 1, 1, 84.83);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (35, 3, 4, '京东物流运输有限公司', '济南', 0, 0, null, 1, 1, 91.67);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (57, 3, 1, '欧金矿业', '济南', 0, 0, null, 1, 1, 91.98);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (58, 3, 1, '山东鲁得贝车灯', '济南', 0, 188, null, 1, 2, 91.58);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (59, 3, 1, '中信国安', '济南', 0, 0, null, 1, 1, 85.46);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (60, 3, 1, '西藏矿业', '济南', 0, 0, null, 1, 1, 78.86);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (61, 3, 2, '博世汽车部件有限公司', '济南', 0, 0, null, 1, 1, 83.63);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (62, 3, 2, '常州赛达电气有限公司', '济南', 0, 0, null, 1, 1, 77.62);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (63, 3, 2, '容百科技', '济南', 0, 192, null, 1, 2, 76.89);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (64, 3, 2, '当升科技', '济南', 0, 0, null, 1, 1, 85.85);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (65, 3, 2, '贝特瑞', '济南', 0, 0, null, 1, 1, 79.92);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (66, 3, 2, '杉杉股份', '济南', 0, 192, null, 1, 2, 58.41);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (67, 3, 2, '苏州捷力', '济南', 0, 192, null, 1, 2, 77.74);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (68, 3, 2, '湖南中锂', '济南', 0, 0, null, 1, 1, 87.11);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (69, 3, 2, '天赐材料', '济南', 0, 0, null, 1, 1, 81.73);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (70, 3, 2, '国泰华容', '济南', 0, 0, null, 1, 1, 89.62);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (71, 3, 3, '济南华昊精密机械制造有限公司', '济南', 0, 0, null, 1, 1, 85.69);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (72, 3, 3, '山东鲁信装饰', '济南', 0, 0, null, 1, 1, 91.08);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (73, 3, 2, '大连奥拓机电设备', '济南', 0, 0, null, 1, 1, 91.81);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (74, 3, 2, '安徽巨一科技股份有限公司', '济南', 0, 0, null, 1, 1, 90.84);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (75, 3, 3, '长城汽车', '济南', 0, 0, null, 1, 1, 90.46);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (76, 3, 3, '比亚迪汽车', '济南', 0, 0, null, 1, 1, 79.24);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (77, 3, 3, '长安汽车', '济南', 0, 0, null, 1, 1, 83.37);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (78, 3, 3, '广汽传祺', '济南', 0, 0, null, 1, 1, 84.77);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (79, 3, 3, '蔚来汽车', '济南', 0, 0, null, 1, 1, 78.79);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (80, 3, 3, '理想汽车', '济南', 0, 0, null, 1, 1, 90.19);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (81, 3, 3, '小鹏汽车', '济南', 0, 0, null, 1, 1, 88.82);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (82, 3, 4, '济南中集车辆物流装备', '济南', 0, 0, null, 1, 1, 90.97);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (83, 3, 4, '威尔森信息科技', '济南', 0, 0, null, 1, 1, 87.86);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (84, 3, 4, '小马达信息科技', '济南', 0, 0, null, 1, 1, 77.28);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (85, 3, 4, '奇瑞徽银汽车金融', '济南', 0, 0, null, 1, 1, 89.38);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (86, 3, 4, '瓜子二手车', '济南', 0, 0, null, 1, 1, 87.47);
INSERT INTO `ry-vue`.company_all (id, layer_id, company_type, name, address, group_id, coalition_id, process_rate, rep, status, score) VALUES (87, 3, 4, '途虎二手车', '济南', 0, 0, null, 1, 1, 79.52);
