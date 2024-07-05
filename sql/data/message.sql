create table message
(
    from_id      varchar(10) null comment '消息发送者编号',
    type         int         null comment '消息类型',
    to_id        varchar(10) null comment '消息接收者编号',
    arrival_time datetime    null
);

