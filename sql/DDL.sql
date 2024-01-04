create table auction_record
(
    RecordID     int            null,
    UserID       int            null,
    DataID       varchar(255)   null,
    AuctionTime  datetime       null,
    WinningPrice decimal(10, 2) null,
    Status       varchar(255)   null
);

create table auction_user
(
    UserID   varchar(255) null,
    UserName varchar(255) null,
    Password varchar(255) null,
    Email    varchar(255) null,
    Balance  varchar(255) null
);

-- auto-generated definition
create table bid
(
    BidID     int          null,
    UserID    int          null,
    DataID    int          null,
    BidTime   datetime     null,
    BidAmount varchar(255) null
);

create table business
(
    id        int auto_increment comment '企业编号'
        primary key,
    name      varchar(20)   null comment '企业名称',
    neighbor  varchar(50)   null comment '企业邻居节点',
    skill_num int           null comment '具有技能种类数量',
    address   varchar(50)   null comment '企业地址',
    chain     varchar(50)   null comment '所属产业链',
    park      varchar(50)   null comment '所属园区',
    state     int default 1 not null comment '当前状态',
    task      int default 0 not null comment '任务编号',
    ispublish int default 0 not null comment '当前是否有任务发布',
    layer     int           not null comment '所属网络层',
    latitude  float         null comment '维度',
    longitude float         null comment '经度'
)
    comment '企业表';

-- auto-generated definition
create table business_direction
(
    source_id   varchar(50) null,
    goal_id     varchar(50) null,
    history_id  varchar(50) null,
    task_id     varchar(50) null,
    mode        varchar(50) null,
    location_id varchar(50) null,
    mode_id     varchar(50) null
);

-- auto-generated definition
create table business_group
(
    business_group_no          varchar(50) null,
    business_group_businessnum int         null,
    business_group_name        varchar(50) null,
    business_group_task        varchar(50) null,
    business_group_mode        varchar(50) null,
    business_group_id          varchar(50) null
);
-- auto-generated definition
create table business_history
(
    history_id          varchar(50) null,
    task_id             varchar(50) null,
    task_name           varchar(50) null,
    delivery_date       varchar(50) null,
    delivery_experience varchar(50) null
);

-- auto-generated definition
create table business_history
(
    history_id          varchar(50) null,
    task_id             varchar(50) null,
    task_name           varchar(50) null,
    delivery_date       varchar(50) null,
    delivery_experience varchar(50) null
);

-- auto-generated definition
create table business_jrx
(
    business_id         varchar(50) null,
    business_name       varchar(50) null,
    business_group_id   varchar(50) null,
    business_group_name varchar(50) null,
    task_id             varchar(50) null,
    business_link_id    varchar(50) null,
    business_link_name  varchar(50) null
);

-- auto-generated definition
create table business_location
(
    business_id         varchar(50) null,
    x                   varchar(50) null,
    y                   varchar(50) null,
    business_name       varchar(50) null,
    business_group_name varchar(50) null,
    business_group_id   varchar(50) null
);
-- auto-generated definition
create table business_resource
(
    resource_id int null comment '资源编号',
    number      int not null comment '资源数量',
    bus_id      int not null comment '企业编号'
)
    comment '企业资源表';

-- auto-generated definition
create table business_timetable
(
    business_timetable_id varchar(50) null,
    business_id           varchar(50) null,
    business_name         varchar(50) null,
    subtask_id            varchar(50) null,
    time                  varchar(50) null,
    task_id               varchar(50) null,
    cost                  varchar(50) null
);

-- auto-generated definition
create table company_cj
(
    id                      int         null,
    name                    varchar(25) null,
    chain                   varchar(25) null,
    category                int         null,
    market_share            double      null,
    market_increase         double      null,
    profitability           double      null,
    invest_ratio            double      null,
    product_width           int         null,
    product_depth           int         null,
    brand_awareness         double      null,
    cooperation_willingness double      null,
    reputation              double      null,
    cooperation_num         int         null,
    cooperation_success     double      null,
    average_roi             double      null,
    suppliers_num           int         null,
    turnover                double      null,
    delivery_rate           double      null,
    trade_level             double      null
);


-- auto-generated definition
create table company_competition_relation_cj
(
    id                   int    null,
    source_location      int    null,
    target_location      int    null,
    competition_relation double null
);

-- auto-generated definition
create table company_competition_relation_lh
(
    id                   int    null,
    source_location      int    null,
    target_location      int    null,
    competition_relation double null
);

-- auto-generated definition
create table company_cooperation_relation_cj
(
    id                   int         null,
    source_location      int         null,
    target_location      int         null,
    cooperation_relation double      null,
    cooperation_num      int         null,
    cooperation_detail   varchar(25) null
);

-- auto-generated definition
create table company_cooperation_relation_lh
(
    id                   int         null,
    source_location      int         null,
    target_location      int         null,
    cooperation_relation double      null,
    cooperation_num      int         null,
    cooperation_detail   varchar(25) null
);

-- auto-generated definition
create table message
(
    from_id      varchar(10) null comment '消息发送者编号',
    type         int         null comment '消息类型',
    to_id        varchar(10) null comment '消息接收者编号',
    arrival_time datetime    null
);

-- auto-generated definition
create table group_ranking_sxz
(
    id         int            null,
    group_name varchar(255)   null,
    score      decimal(10, 2) null,
    ranking    int            null,
    time_frame varchar(50)    null
);




-- auto-generated definition
create table company_overall_location_cj
(
    id         int    null,
    location_x double null,
    location_y double null,
    company_id int    null
);

-- auto-generated definition
create table company_income_lh
(
    company_id      int         null,
    name            varchar(25) null,
    field           varchar(25) null,
    category        varchar(25) null,
    market_share    double      null,
    market_increase double      null,
    turnover        double      null,
    delivery_rate   double      null,
    earnings_rate   double      null,
    average_roi     double      null,
    liability       decimal     null,
    owner_equity    decimal     null
);

-- auto-generated definition
create table company_income_lh
(
    company_id      int         null,
    name            varchar(25) null,
    field           varchar(25) null,
    category        varchar(25) null,
    market_share    double      null,
    market_increase double      null,
    turnover        double      null,
    delivery_rate   double      null,
    earnings_rate   double      null,
    average_roi     double      null,
    liability       decimal     null,
    owner_equity    decimal     null
);

-- auto-generated definition
create table company_location_cj
(
    location_id int    null,
    location_x  double null,
    location_y  double null,
    company_id  int    null,
    layer       int    null
);

-- auto-generated definition
create table company_location_lh
(
    location_id int    null,
    layer       int    null,
    company_id  int    null,
    location_x  double null,
    location_y  double null
);

-- auto-generated definition
create table company_group_cj
(
    group_id   int         null,
    `describe` varchar(50) null
);

-- auto-generated definition
create table company_name_sxz
(
    company_name varchar(64) null,
    company_id   bigint      null
);

-- auto-generated definition
create table company_supply_relation_lh
(
    id              int    null,
    source_location int    null,
    target_location int    null,
    supply_relation double null
);

-- auto-generated definition
create table company_supply_relation_cj
(
    id              int    null,
    source_location int    null,
    target_location int    null,
    supply_relation double null
);

-- auto-generated definition
create table company_ranking_sxz
(
    id           int            null,
    company_name varchar(255)   null,
    score        decimal(10, 2) null,
    ranking      int            null
);

-- auto-generated definition
create table company_relation_cj
(
    id             int         null,
    source_id      int         null,
    target_id      int         null,
    is_supply      tinyint     null,
    is_cooperation tinyint     null,
    is_competition tinyint     null,
    total_relation double      null,
    analysis       varchar(25) null
);

-- auto-generated definition
create table company_show_sxz
(
    id                varchar(255)   null,
    name              varchar(255)   null,
    type              varchar(100)   null,
    cooperation_count int            null,
    score             decimal(10, 2) null,
    company_group     varchar(255)   null
);

-- auto-generated definition
create table company_relation_lh
(
    id             int         null,
    source_id      int         null,
    target_id      int         null,
    is_supply      int         null,
    is_cooperation int         null,
    is_competition int         null,
    total_relation double      null,
    analysis       varchar(25) null
);

-- auto-generated definition
create table data
(
    DataID        int            null,
    DataName      varchar(255)   null,
    Discription   varchar(255)   null,
    StartingPrice decimal(10, 2) null,
    CurrentPrice  decimal(10, 2) null,
    StartTime     datetime       null,
    EndTime       datetime       null,
    Status        varchar(255)   null
);

-- auto-generated definition
create table evaluate_info_sxz
(
    task_info     bigint   null,
    id            bigint   null,
    company_info  bigint   null,
    date_number   int      null,
    actual_number int      null,
    date_time     datetime null,
    actual_time   datetime null,
    good_number   int      null
);

-- auto-generated definition
create table mode_evaluate
(
    mode_name       varchar(50) null,
    completion_rate varchar(50) null,
    failure_rate    varchar(50) null
);

-- auto-generated definition
create table monthly_statistics_sxz
(
    id               bigint     null,
    month            varchar(7) null,
    high_score_count int        null
);

-- auto-generated definition
create table subtasklist
(
    subtask_id   varchar(50) null,
    task_id      varchar(50) null,
    subtask_name varchar(50) null
);

-- auto-generated definition
create table score_records_sxz
(
    id                   int           null,
    task_id              int           null,
    evaluated_company_id int           null,
    score                decimal(5, 2) null,
    timestamp            timestamp     null
);

-- auto-generated definition
create table rev_add_record
(
    bus_id      varchar(10) null comment '企业编号',
    oldtask_id  int         null comment '原有任务编号',
    new_task_id int         null comment '新任务标号',
    state       int         null comment '接受与否',
    skill_id    int         null comment '技能编号',
    old_price   int         null comment '原有价格',
    new_price   int         null comment '现有价格'
)
    comment '企业增薪请求记录';

-- auto-generated definition
create table resource
(
    id   int auto_increment comment '资源编号'
        primary key,
    name varchar(20) null comment '资源名称'
)
    comment '资源详情表';

-- auto-generated definition
create table sys_menu
(
    menu_id     bigint auto_increment comment '菜单ID'
        primary key,
    menu_name   varchar(50)              not null comment '菜单名称',
    parent_id   bigint       default 0   null comment '父菜单ID',
    order_num   int          default 0   null comment '显示顺序',
    path        varchar(200) default ''  null comment '路由地址',
    component   varchar(255)             null comment '组件路径',
    query       varchar(255)             null comment '路由参数',
    is_frame    int          default 1   null comment '是否为外链（0是 1否）',
    is_cache    int          default 0   null comment '是否缓存（0缓存 1不缓存）',
    menu_type   char         default ''  null comment '菜单类型（M目录 C菜单 F按钮）',
    visible     char         default '0' null comment '菜单状态（0显示 1隐藏）',
    status      char         default '0' null comment '菜单状态（0正常 1停用）',
    perms       varchar(100)             null comment '权限标识',
    icon        varchar(100) default '#' null comment '菜单图标',
    create_by   varchar(64)  default ''  null comment '创建者',
    create_time datetime                 null comment '创建时间',
    update_by   varchar(64)  default ''  null comment '更新者',
    update_time datetime                 null comment '更新时间',
    remark      varchar(500) default ''  null comment '备注'
)
    comment '菜单权限表';

-- auto-generated definition
create table tasks
(
    id                             int          null,
    taskName                       varchar(255) null,
    taskReleaser                   varchar(255) null,
    profit                         int          null,
    dataRelease                    date         null,
    dataFinish                     date         null,
    taskState                      varchar(20)  null,
    dataProviders                  text         null,
    dataProviderValues             text         null,
    dataProviderRates              text         null,
    accepter                       varchar(255) null,
    chain                          varchar(255) null,
    commentScore                   int          null,
    comment                        text         null,
    enterpriseRelationshipStrength int          null,
    sharedPointsGain               int          null,
    continuousSharingRewards       int          null,
    afterSalesEvaluationGain       int          null,
    dataNames                      text         null
);

-- auto-generated definition
create table task_name_sxz
(
    task_id   bigint      null,
    task_name varchar(64) null
);

-- auto-generated definition
create table task_resource
(
    task_id     int null comment '任务编号',
    resource_id int null comment '技能编号',
    number      int null comment '资源需求量'
)
    comment '任务技能表';

-- auto-generated definition
create table tasklist
(
    task_id   varchar(50) null,
    task_name varchar(50) null
);

-- auto-generated definition
create table task
(
    id            int auto_increment comment '任务编号'
        primary key,
    name          varchar(10)                null comment '任务名称',
    resource_num  int                        null comment '任务所需资源数量',
    value         int                        null comment '任务价值',
    ddl           datetime                   null comment '截止日期',
    duration      int                        null comment '持续时长',
    state         int         default 0      null comment '任务状态',
    arrival_time  datetime                   null comment '任务到达时间',
    allocbusiness varchar(20) default '暂无' null comment '分配给的企业'
)
    comment '系统任务表';

-- auto-generated definition
create table task_business
(
    task_id   int null comment '任务编号',
    bus_id    int null comment '企业编号',
    isexecute int null comment '是否当前任务'
)
    comment '任务企业表';






