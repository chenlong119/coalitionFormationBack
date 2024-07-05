create table data_sharing_requests
(
    request_id       int auto_increment
        primary key,
    request_name     varchar(255) null,
    description      varchar(255) null,
    industry_chain   varchar(255) null,
    data_type        varchar(255) null,
    target_companies varchar(255) null,
    deadline         varchar(255) null,
    status           varchar(255) null
)
    charset = utf8mb4
    row_format = DYNAMIC;

INSERT INTO `ry-vue`.data_sharing_requests (request_id, request_name, description, industry_chain, data_type, target_companies, deadline, status) VALUES (1, '2023年年度营业额', '精确到万，2023年年度营业额', '洗衣机产业链', '销售数据', '小鸭家电', '2024-06-29', '待响应');
INSERT INTO `ry-vue`.data_sharing_requests (request_id, request_name, description, industry_chain, data_type, target_companies, deadline, status) VALUES (2, '2023年度订单准时交付率', '精确到小数点后两位，2023年的数据', '洗衣机产业链', '销售数据', '小鸭家电', '2024-06-30', '待响应');
INSERT INTO `ry-vue`.data_sharing_requests (request_id, request_name, description, industry_chain, data_type, target_companies, deadline, status) VALUES (3, '生产线故障率', '2024年4月济南生产线的故障率，给出生产数和故障数目，故障率精确到小数点后2位', '洗衣机产业链', '生产数据', '小鸭家电', '2024-06-26', '待响应');
INSERT INTO `ry-vue`.data_sharing_requests (request_id, request_name, description, industry_chain, data_type, target_companies, deadline, status) VALUES (4, '5月滚筒式洗衣机济南销售分布数据', '精确到每个县的分管门店', '洗衣机产业链', '销售数据', '小鸭家电', '2024-06-26', '待响应');
