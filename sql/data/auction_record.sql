create table auction_record
(
    RecordID     int            null comment '拍卖编号',
    UserID       int            null comment '用户编号',
    DataID       varchar(255)   null comment '历史记录编号',
    AuctionTime  datetime       null comment '拍卖时间',
    WinningPrice decimal(10, 2) null comment '成交价格',
    Status       varchar(255)   null comment '拍卖状态'
)
    comment '拍卖纪录';

INSERT INTO `ry-vue`.auction_record (RecordID, UserID, DataID, AuctionTime, WinningPrice, Status) VALUES (1, 3, '103', '2023-12-08 17:40:22', 15.00, '成功');
INSERT INTO `ry-vue`.auction_record (RecordID, UserID, DataID, AuctionTime, WinningPrice, Status) VALUES (2, 3, '104', '2023-12-14 16:28:47', 15.00, '成功');
