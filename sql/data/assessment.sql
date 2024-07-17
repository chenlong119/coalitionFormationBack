create table assessment
(
    id           int auto_increment comment '主键'
        primary key,
    name         varchar(20)  not null comment '企业名称',
    assessment1  int          not null comment '评价1',
    assessment2  int          not null comment '评价2',
    assessment3  int          not null comment '评价3',
    assessment   int          not null comment '总评',
    comment      varchar(100) not null comment '评价内容',
    comment_time datetime     not null comment '评价时间'
)
    comment '群智汇聚评价表';

