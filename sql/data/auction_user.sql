create table auction_user
(
    UserID   varchar(255) null comment '用户编号',
    UserName varchar(255) null comment '用户名称',
    Password varchar(255) null comment '密码',
    Email    varchar(255) null comment '邮箱',
    Balance  varchar(255) null comment '余额'
)
    comment '拍卖用户';

INSERT INTO `ry-vue`.auction_user (UserID, UserName, Password, Email, Balance) VALUES ('1', '小鸭家电', '123', '123@123', '10');
INSERT INTO `ry-vue`.auction_user (UserID, UserName, Password, Email, Balance) VALUES ('2', '比亚迪', '123', '123@123', '10');
INSERT INTO `ry-vue`.auction_user (UserID, UserName, Password, Email, Balance) VALUES ('3', '超威电池', '123', '123@123', '12');
