create table tasks
(
    id                             int auto_increment comment '拍卖编号'
        primary key,
    taskName                       varchar(255) null comment '拍卖名称',
    taskReleaser                   varchar(255) null comment '任务发布方',
    profit                         int          null comment '利润',
    dataRelease                    date         null comment '发布日期',
    dataFinish                     date         null comment '结束日期',
    taskState                      varchar(20)  null comment '任务状态',
    dataProviders                  text         null comment '数据提供方',
    dataProviderValues             text         null comment '数据提供方价值',
    dataProviderRates              text         null comment '数据提供方比例',
    accepter                       varchar(255) null comment '数据接收方',
    chain                          varchar(255) null comment '所处产业链',
    commentScore                   int          null comment '评分',
    comment                        text         null comment '评论',
    enterpriseRelationshipStrength int          null comment '企业关系强度',
    sharedPointsGain               int          null comment '共享收益',
    continuousSharingRewards       int          null comment '长期共享收益',
    afterSalesEvaluationGain       int          null comment '收益评估',
    dataNames                      text         null comment '数据名称'
)
    comment '我的共享拍卖数据表' row_format = DYNAMIC;

INSERT INTO `ry-vue`.tasks (id, taskName, taskReleaser, profit, dataRelease, dataFinish, taskState, dataProviders, dataProviderValues, dataProviderRates, accepter, chain, commentScore, comment, enterpriseRelationshipStrength, sharedPointsGain, continuousSharingRewards, afterSalesEvaluationGain, dataNames) VALUES (1, '四月电机生产数据', '小鸭集团', 10, '2023-05-01', '2023-06-01', '已完成', '置信电机,Monenta', '20,15', '87,13', '置信电机', '洗衣机产业链', 3, '符合要求', 8, 20, 15, 5, '置信电机4月电机销量,Momenta4月最新发动机数据');
INSERT INTO `ry-vue`.tasks (id, taskName, taskReleaser, profit, dataRelease, dataFinish, taskState, dataProviders, dataProviderValues, dataProviderRates, accepter, chain, commentScore, comment, enterpriseRelationshipStrength, sharedPointsGain, continuousSharingRewards, afterSalesEvaluationGain, dataNames) VALUES (2, '五月A型芯片计划产量', '小鸭集团', 50, '2023-04-12', '2022-04-13', '已完成', '中兴公司,台积电', '85,15', '68,32', '台积电', '洗衣机产业链', 1, '数据量偏小，不推荐', 8, 20, 15, 5, '中兴公司4月A芯片销量,台积电4月A芯片销量');
INSERT INTO `ry-vue`.tasks (id, taskName, taskReleaser, profit, dataRelease, dataFinish, taskState, dataProviders, dataProviderValues, dataProviderRates, accepter, chain, commentScore, comment, enterpriseRelationshipStrength, sharedPointsGain, continuousSharingRewards, afterSalesEvaluationGain, dataNames) VALUES (3, '618空调类销售综合数据', '小鸭集团', 100, '2023-02-01', '2022-02-12', '已完成', '淘宝,京东,拼多多', '20,15,42', '21,25,54', '京东', '空调产业链', 3, '/', 8, 20, 15, 5, '淘宝双十一空调销量,京东双十一大宗空调销售数据,拼多多双十一中低端空调销售数据');
INSERT INTO `ry-vue`.tasks (id, taskName, taskReleaser, profit, dataRelease, dataFinish, taskState, dataProviders, dataProviderValues, dataProviderRates, accepter, chain, commentScore, comment, enterpriseRelationshipStrength, sharedPointsGain, continuousSharingRewards, afterSalesEvaluationGain, dataNames) VALUES (5, '双十一冰箱销售数据', '京东', 100, '2022-05-01', '2022-06-01', '已完成', '小鸭家电,苏宁家电,国美家电', '20,15,23', '56,13,31', '小鸭家电', '冰箱产业链', 3, '/', 8, 20, 15, 5, '小鸭家电双十一小型冰箱销售详情,苏宁家电双十一当天一级能耗冰箱销售数据,国美家电双十一高于5000元单件冰箱销售数据');
INSERT INTO `ry-vue`.tasks (id, taskName, taskReleaser, profit, dataRelease, dataFinish, taskState, dataProviders, dataProviderValues, dataProviderRates, accepter, chain, commentScore, comment, enterpriseRelationshipStrength, sharedPointsGain, continuousSharingRewards, afterSalesEvaluationGain, dataNames) VALUES (15, '618洗衣机类类销售综合数据', '小鸭集团', 100, '2023-02-01', '2022-02-12', '已完成', '淘宝,京东,唯品会', '20,15,42', '21,25,54', '京东', '洗衣机产业链', 3, '/', 8, 20, 15, 5, '淘宝618挂壁式洗衣机销售数据,京东双618大宗洗衣机销售数据,唯品会618不同能耗等级洗衣机销售数据');
INSERT INTO `ry-vue`.tasks (id, taskName, taskReleaser, profit, dataRelease, dataFinish, taskState, dataProviders, dataProviderValues, dataProviderRates, accepter, chain, commentScore, comment, enterpriseRelationshipStrength, sharedPointsGain, continuousSharingRewards, afterSalesEvaluationGain, dataNames) VALUES (20, '六月橡胶销量', '小鸭集团', 10, '2023-05-01', '2023-06-01', '进行中', '三维股份,震安科技', '19,21', '46,54', '南孚电池', '家电产业链', 0, '', 8, 20, 15, 5, '南孚电池4月电池销量,超威电池4月电池销量17');
INSERT INTO `ry-vue`.tasks (id, taskName, taskReleaser, profit, dataRelease, dataFinish, taskState, dataProviders, dataProviderValues, dataProviderRates, accepter, chain, commentScore, comment, enterpriseRelationshipStrength, sharedPointsGain, continuousSharingRewards, afterSalesEvaluationGain, dataNames) VALUES (57, '六月金属数据', '小鸭集团', 12, '2023-05-01', '2023-06-01', '待交付', '厦门钨业,南山铝业', '19,21', '46,54', '厦门钨业', '家电产业链', 0, '', 8, 20, 15, 5, '厦门钨业6月钨钢销量,南山铝业6月铝矿销量');
INSERT INTO `ry-vue`.tasks (id, taskName, taskReleaser, profit, dataRelease, dataFinish, taskState, dataProviders, dataProviderValues, dataProviderRates, accepter, chain, commentScore, comment, enterpriseRelationshipStrength, sharedPointsGain, continuousSharingRewards, afterSalesEvaluationGain, dataNames) VALUES (58, '六月电机销量', '小鸭集团', 10, '2023-05-01', '2023-06-01', '进行中', '置信电机,众绅机械制造有限公司', '19,21', '46,54', '众绅机械制造有限公司', '家电产业链', 0, '', 8, 20, 15, 5, '置信电机6月电池销量,众绅机械制造有限公司6月电池销量17');
INSERT INTO `ry-vue`.tasks (id, taskName, taskReleaser, profit, dataRelease, dataFinish, taskState, dataProviders, dataProviderValues, dataProviderRates, accepter, chain, commentScore, comment, enterpriseRelationshipStrength, sharedPointsGain, continuousSharingRewards, afterSalesEvaluationGain, dataNames) VALUES (59, '动力系统介绍参数', '小鸭集团', 12, '2023-05-01', '2023-06-01', '待交付', '山东安耐传动系统有限公司', '19', '46', '厦门钨业', '家电产业链', 0, '', 8, 20, 15, 5, '厦门钨业6月钨钢销量');
