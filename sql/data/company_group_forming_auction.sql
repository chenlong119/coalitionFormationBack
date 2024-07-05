create table company_group_forming_auction
(
    id                   int          not null comment '企业群形成拍卖编号'
        primary key,
    motivationTask       varchar(255) null comment '驱动任务',
    groupAuctionReleaser varchar(255) null comment '企业群拍卖发布方',
    requestDescription   varchar(255) null comment '需求描述',
    companyAuctionLeft   varchar(255) null comment '剩余企业名额',
    profitAuctionStart   varchar(255) null comment '起拍价',
    dateRelease          datetime     null comment '开始时间',
    dateFinish           datetime     null comment '结束时间',
    auctionState         varchar(255) null comment '拍卖状态',
    chain                varchar(255) null comment '所属产业链'
)
    comment '企业群形成拍卖' row_format = DYNAMIC;

INSERT INTO `ry-vue`.company_group_forming_auction (id, motivationTask, groupAuctionReleaser, requestDescription, companyAuctionLeft, profitAuctionStart, dateRelease, dateFinish, auctionState, chain) VALUES (1, '低能耗电池电池，汽车智能出行服务', '超威电池科技', '有磷酸锂电池研发数据的企业优先，需要废液二次处理数据', '2', '47', '2024-05-11 09:40:23', '2024-06-01 23:59:59', '进行中', '汽车产业链');
INSERT INTO `ry-vue`.company_group_forming_auction (id, motivationTask, groupAuctionReleaser, requestDescription, companyAuctionLeft, profitAuctionStart, dateRelease, dateFinish, auctionState, chain) VALUES (2, '挂壁洗衣机动力系统优化研发', '小鸭集团', '寻找电子元件供应商和生产厂家，有挂壁式动力发动机经验的的优先', '5', '30', '2023-04-15 01:00:00', '2023-05-30 00:00:00', '进行中', '洗衣机产业链');
INSERT INTO `ry-vue`.company_group_forming_auction (id, motivationTask, groupAuctionReleaser, requestDescription, companyAuctionLeft, profitAuctionStart, dateRelease, dateFinish, auctionState, chain) VALUES (3, '汽车智能驾驶技术二代系统研发和推广', '小米智能汽车科技', '需要合作伙伴推广汽车智能驾驶技术，共同开发智能汽车产品', '6', '32', '2023-05-15 00:00:00', '2023-06-25 00:00:00', '进行中', '汽车产业链');
INSERT INTO `ry-vue`.company_group_forming_auction (id, motivationTask, groupAuctionReleaser, requestDescription, companyAuctionLeft, profitAuctionStart, dateRelease, dateFinish, auctionState, chain) VALUES (4, '节能空调研发，空调环保制冷剂研发', '格力集团', '有历史研发经验的优先，需要提供制冷剂的实验信息', '3', '52', '2024-05-03 11:41:52', '2024-05-13 14:39:51', '进行中', '空调产业链');
INSERT INTO `ry-vue`.company_group_forming_auction (id, motivationTask, groupAuctionReleaser, requestDescription, companyAuctionLeft, profitAuctionStart, dateRelease, dateFinish, auctionState, chain) VALUES (5, '废弃家电回收处理技术研发，生产高效节能洗衣机产品', '海尔集团', '有铁制品，铝合金等相关的金属的回收再处理经验数据的优先', '2', '36', '2024-05-05 14:40:14', '2024-06-16 23:59:59', '进行中', '洗衣机产业链');
INSERT INTO `ry-vue`.company_group_forming_auction (id, motivationTask, groupAuctionReleaser, requestDescription, companyAuctionLeft, profitAuctionStart, dateRelease, dateFinish, auctionState, chain) VALUES (7, '硅负极材料电池研发', '超威电池科技', '需要合作伙伴提供优质电池原材料和制造技术，共同生产电动汽车电池', '8', '25', '2023-05-20 00:00:00', '2023-06-30 00:00:00', '进行中', '汽车产业链');
