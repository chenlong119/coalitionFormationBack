create table bid_company_group
(
    BidId        int auto_increment comment '出价编号'
        primary key,
    UserName     varchar(255)             null comment '用户姓名',
    AuctionId    int                      null comment '拍卖编号',
    BidTime      datetime                 null comment '出价时间',
    BidAmount    varchar(255)             null comment '出价金额',
    selected     varchar(255) default '0' not null comment '是否被选中',
    selectedDate datetime                 null comment '选中日期',
    UserId       int                      null comment '用户编号'
)
    comment '企业群形成出价表' row_format = DYNAMIC;

INSERT INTO `ry-vue`.bid_company_group (BidId, UserName, AuctionId, BidTime, BidAmount, selected, selectedDate, UserId) VALUES (1, '小鸭集团', 1, '2024-01-09 13:55:43', '34', '1', '2024-04-18 02:49:25', null);
INSERT INTO `ry-vue`.bid_company_group (BidId, UserName, AuctionId, BidTime, BidAmount, selected, selectedDate, UserId) VALUES (2, '比亚迪汽车', 2, '2024-01-10 16:56:12', '23', '1', '2024-04-18 02:50:20', null);
INSERT INTO `ry-vue`.bid_company_group (BidId, UserName, AuctionId, BidTime, BidAmount, selected, selectedDate, UserId) VALUES (3, '南孚电池', 4, '2024-01-06 13:56:37', '31', '1', '2024-01-12 11:13:32', null);
INSERT INTO `ry-vue`.bid_company_group (BidId, UserName, AuctionId, BidTime, BidAmount, selected, selectedDate, UserId) VALUES (4, '玲珑轮胎', 5, '2024-01-27 14:37:55', '12', '0', '2024-01-10 13:07:33', null);
INSERT INTO `ry-vue`.bid_company_group (BidId, UserName, AuctionId, BidTime, BidAmount, selected, selectedDate, UserId) VALUES (22, '格力集团', 2, '2024-01-10 09:54:25', '32', '1', '2024-01-10 11:07:42', null);
INSERT INTO `ry-vue`.bid_company_group (BidId, UserName, AuctionId, BidTime, BidAmount, selected, selectedDate, UserId) VALUES (23, '创新设计公司', 6, '2024-01-10 10:16:12', '23', '1', '2024-01-10 12:47:35', null);
INSERT INTO `ry-vue`.bid_company_group (BidId, UserName, AuctionId, BidTime, BidAmount, selected, selectedDate, UserId) VALUES (24, '宁德时代', 2, '2024-01-10 11:32:24', '10', '1', '2024-05-14 07:28:26', null);
INSERT INTO `ry-vue`.bid_company_group (BidId, UserName, AuctionId, BidTime, BidAmount, selected, selectedDate, UserId) VALUES (25, '首都钢铁公司', 7, '2024-01-10 12:38:33', '24', '0', '2024-01-10 13:07:35', null);
INSERT INTO `ry-vue`.bid_company_group (BidId, UserName, AuctionId, BidTime, BidAmount, selected, selectedDate, UserId) VALUES (26, '小鸭集团', 1, '2024-01-10 19:14:55', '25', '0', null, null);
INSERT INTO `ry-vue`.bid_company_group (BidId, UserName, AuctionId, BidTime, BidAmount, selected, selectedDate, UserId) VALUES (27, '小鸭集团', 1, '2024-01-10 19:15:39', '24', '0', null, null);
INSERT INTO `ry-vue`.bid_company_group (BidId, UserName, AuctionId, BidTime, BidAmount, selected, selectedDate, UserId) VALUES (28, '小鸭集团', 1, '2024-01-10 20:20:12', '13', '0', null, null);
INSERT INTO `ry-vue`.bid_company_group (BidId, UserName, AuctionId, BidTime, BidAmount, selected, selectedDate, UserId) VALUES (29, '小鸭集团', 1, '2024-01-11 14:34:53', '12', '0', null, null);
INSERT INTO `ry-vue`.bid_company_group (BidId, UserName, AuctionId, BidTime, BidAmount, selected, selectedDate, UserId) VALUES (30, '小鸭集团', 1, '2024-01-11 16:32:01', '15', '0', null, null);
INSERT INTO `ry-vue`.bid_company_group (BidId, UserName, AuctionId, BidTime, BidAmount, selected, selectedDate, UserId) VALUES (31, '小鸭集团', 1, '2024-01-12 11:16:20', '12', '0', null, null);
INSERT INTO `ry-vue`.bid_company_group (BidId, UserName, AuctionId, BidTime, BidAmount, selected, selectedDate, UserId) VALUES (32, '小鸭集团', 1, '2024-01-12 14:17:07', '12', '0', null, null);
INSERT INTO `ry-vue`.bid_company_group (BidId, UserName, AuctionId, BidTime, BidAmount, selected, selectedDate, UserId) VALUES (33, '小鸭集团', 1, '2024-04-16 20:28:42', '1', '0', null, null);
INSERT INTO `ry-vue`.bid_company_group (BidId, UserName, AuctionId, BidTime, BidAmount, selected, selectedDate, UserId) VALUES (34, '小鸭集团', 1, '2024-04-18 16:20:25', '77', '0', null, null);
INSERT INTO `ry-vue`.bid_company_group (BidId, UserName, AuctionId, BidTime, BidAmount, selected, selectedDate, UserId) VALUES (35, '小鸭集团', 1, '2024-05-10 10:24:00', '0', '0', null, null);
INSERT INTO `ry-vue`.bid_company_group (BidId, UserName, AuctionId, BidTime, BidAmount, selected, selectedDate, UserId) VALUES (36, '小鸭集团', 1, '2024-05-10 10:24:10', '0', '0', null, null);
INSERT INTO `ry-vue`.bid_company_group (BidId, UserName, AuctionId, BidTime, BidAmount, selected, selectedDate, UserId) VALUES (37, '小鸭集团', 1, '2024-05-13 15:40:52', '30', '0', null, null);
INSERT INTO `ry-vue`.bid_company_group (BidId, UserName, AuctionId, BidTime, BidAmount, selected, selectedDate, UserId) VALUES (38, '小鸭集团', 1, '2024-05-13 16:25:43', '0', '0', null, null);
