create table bid
(
    BidID     int          null comment '出价编号',
    UserID    int          null comment '用户编号',
    DataID    int          null comment '数据编号',
    BidTime   datetime     null comment '出价时间',
    BidAmount varchar(255) null comment '出价价格'
)
    comment '出价';

INSERT INTO `ry-vue`.bid (BidID, UserID, DataID, BidTime, BidAmount) VALUES (1, 1, 102, '2023-12-07 17:39:03', '6');
INSERT INTO `ry-vue`.bid (BidID, UserID, DataID, BidTime, BidAmount) VALUES (2, 2, 102, '2023-12-07 18:39:32', '7');
INSERT INTO `ry-vue`.bid (BidID, UserID, DataID, BidTime, BidAmount) VALUES (3, 3, 103, '2023-12-08 17:40:22', '15');
INSERT INTO `ry-vue`.bid (BidID, UserID, DataID, BidTime, BidAmount) VALUES (4, 3, 104, '2023-12-08 17:40:22', '15');
