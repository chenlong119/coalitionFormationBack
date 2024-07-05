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

create table auction_user
(
    UserID   varchar(255) null comment '用户编号',
    UserName varchar(255) null comment '用户名称',
    Password varchar(255) null comment '密码',
    Email    varchar(255) null comment '邮箱',
    Balance  varchar(255) null comment '余额'
)
    comment '拍卖用户';

create table bid
(
    BidID     int          null comment '出价编号',
    UserID    int          null comment '用户编号',
    DataID    int          null comment '数据编号',
    BidTime   datetime     null comment '出价时间',
    BidAmount varchar(255) null comment '出价价格'
)
    comment '出价';

create table bid
(
    BidID     int          null comment '出价编号',
    UserID    int          null comment '用户编号',
    DataID    int          null comment '数据编号',
    BidTime   datetime     null comment '出价时间',
    BidAmount varchar(255) null comment '出价价格'
)
    comment '出价';

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


create table chain
(
    id   int auto_increment comment '产业链编号'
        primary key,
    name varchar(20) null comment '产业链名称'
)
    comment '产业链';

create table coalition
(
    id               int auto_increment comment '联盟编号'
        primary key,
    name             varchar(20)   null comment '联盟名称',
    task_id          int           null comment '联盟任务编号',
    create_time      datetime      null comment '联盟创建时间',
    coalition_status int default 1 null comment '联盟状态（0异常，1工作，2空闲）',
    mode             int default 0 null comment '联盟模式'
)
    comment '企业联盟表';

c
create table coalition_company
(
    coalition_id  int      null comment '联盟id',
    company_id    int      null comment '企业id',
    layer_id      int      null comment '企业所属网络层',
    date_number   int      null comment '约定数目',
    actual_number int      null comment '实际数目',
    date_time     datetime null comment '约定时间',
    actual_time   datetime null comment '实际时间'
)
    comment '联盟企业表';

create table company_all
(
    id           int                        not null comment '企业编号',
    layer_id     int                        not null comment '产业链网络层编号',
    company_type int                        null comment '企业在产业链所在阶段（原料供应，零件生产，整机组装，销售和回收）',
    name         varchar(20)                null comment '企业名称',
    address      varchar(20) default '济南' null comment '企业地址',
    group_id     int         default 0      null comment '所属企业群id',
    coalition_id int         default 0      null,
    process_rate int                        null comment '任务完成速率',
    rep          double      default 1      null comment '企业信誉',
    status       int         default 1      null comment '企业状态（0异常，1空闲，2工作）',
    score        double                     null,
    primary key (layer_id, id)
)
    comment '企业表';

create table company_coalition
(
    coalition_id int         null comment '联盟编号',
    layer_id     int         null comment '企业所在网络层编号',
    company_id   varchar(20) null comment '企业编号'
)
    comment '联盟企业映射表';

create table company_group_cj
(
    group_id   int         null comment '协作团体id',
    `describe` varchar(50) null comment '协作团体特征'
);

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

create table company_income
(
    id                      int     not null comment '企业编号'
        primary key,
    category                int     null comment '所属企业团体',
    market_share            double  null comment '企业市场份额',
    market_increase         double  null comment '企业市场增长率',
    profitability           double  null comment '盈利率',
    invest_ratio            double  null comment '科研投入比例',
    product_width           int     null comment '产品线宽度',
    product_depth           int     null comment '产品线深度',
    brand_awareness         double  null comment '品牌知名度',
    cooperation_willingness double  null comment '合作意愿强度',
    reputation              double  null comment '信誉分',
    cooperation_num         int     null comment '合作数量',
    cooperation_success     double  null comment '合作成功率',
    average_roi             double  null comment '平均收益回报率',
    suppliers_num           int     null comment '供应商数量',
    turnover                double  null comment '库存周转率',
    delivery_rate           double  null comment '准时交付率',
    trade_level             double  null comment '物流水平',
    liability               decimal null comment '负债',
    owner_equity            decimal null comment '所有者权益',
    income                  decimal null comment '收益值'
)
    comment '企业收益信息表';

create table company_location_cj
(
    location_id int    null comment '主键',
    location_x  double null comment '前端x坐标',
    location_y  double null comment '前端y坐标',
    company_id  int    null comment '企业id',
    layer       int    null comment '关系层'
);

create table company_location_income
(
    location_id int    null comment '位置表编号',
    layer       int    null comment '所属网络层编号',
    company_id  int    null comment '企业编号',
    location_x  double null comment '前端x坐标（未使用）',
    location_y  double null comment '前端y坐标（未使用）'
)
    comment '企业位置表';

create table company_overall_location_cj
(
    id         int    null comment '主键',
    location_x double null comment '前端x坐标',
    location_y double null comment '前端y坐标',
    company_id int    null comment '企业id'
)
    comment '整合模型的位置表';

create table company_relation_total
(
    id             int         null comment '总关系表编号',
    source_id      int         null comment '源企业编号',
    target_id      int         null comment '目标企业编号',
    is_supply      tinyint     null comment '是否有供应关系',
    is_cooperation tinyint     null comment '是否有合作关系',
    is_competition tinyint     null comment '是否有竞争关系',
    total_relation double      null comment '整体关联强度',
    analysis       varchar(25) null comment '关联分析'
)
    comment '企业总关系表';

create table company_resource
(
    company_id  int not null comment '企业编号',
    layer_id    int not null comment '企业所在网络层',
    resource_id int not null comment '资源编号',
    number      int not null comment '资源数量',
    primary key (company_id, layer_id, resource_id)
)
    comment '企业资源表';

create table data
(
    DataID        int            null comment '数据条目的唯一标识符',
    DataName      varchar(255)   null comment '数据名称',
    Discription   varchar(255)   null comment '数据描述',
    StartingPrice decimal(10, 2) null comment '数据首次上市时的初始价格',
    CurrentPrice  decimal(10, 2) null comment '数据的当前价格',
    StartTime     datetime       null comment '数据首次上市的日期和时间',
    EndTime       datetime       null comment '数据上市结束或将结束的日期和时间',
    Status        varchar(255)   null comment '数据的当前状态（例如，活动的、过期的等）'
);

create table data_sharing_requests
(
    request_id       int auto_increment
        primary key comment '请求的唯一标识符',
    request_name     varchar(255) null comment '数据共享请求的名称',
    description      varchar(255) null comment '数据共享请求的描述',
    industry_chain   varchar(255) null comment '与数据请求相关的产业链',
    data_type        varchar(255) null comment '请求的数据类型',
    target_companies varchar(255) null comment '数据共享请求的目标公司',
    deadline         varchar(255) null comment '数据共享请求的截止日期',
    status           varchar(255) null comment '数据共享请求的当前状态（例如，待处理、已完成等）'
)
    charset = utf8mb4
    row_format = DYNAMIC comment '用于存储数据共享请求及其详细信息的表';

create table gen_table
(
    table_id          bigint auto_increment comment '编号'
        primary key,
    table_name        varchar(200) default ''     null comment '表名称',
    table_comment     varchar(500) default ''     null comment '表描述',
    sub_table_name    varchar(64)                 null comment '关联子表的表名',
    sub_table_fk_name varchar(64)                 null comment '子表关联的外键名',
    class_name        varchar(100) default ''     null comment '实体类名称',
    tpl_category      varchar(200) default 'crud' null comment '使用的模板（crud单表操作 tree树表操作）',
    tpl_web_type      varchar(30)  default ''     null comment '前端模板类型（element-ui模版 element-plus模版）',
    package_name      varchar(100)                null comment '生成包路径',
    module_name       varchar(30)                 null comment '生成模块名',
    business_name     varchar(30)                 null comment '生成业务名',
    function_name     varchar(50)                 null comment '生成功能名',
    function_author   varchar(50)                 null comment '生成功能作者',
    gen_type          char         default '0'    null comment '生成代码方式（0zip压缩包 1自定义路径）',
    gen_path          varchar(200) default '/'    null comment '生成路径（不填默认项目路径）',
    options           varchar(1000)               null comment '其它生成选项',
    create_by         varchar(64)  default ''     null comment '创建者',
    create_time       datetime                    null comment '创建时间',
    update_by         varchar(64)  default ''     null comment '更新者',
    update_time       datetime                    null comment '更新时间',
    remark            varchar(500)                null comment '备注'
)
    comment '代码生成业务表';

create table gen_table_column
(
    column_id      bigint auto_increment comment '编号'
        primary key,
    table_id       bigint                    null comment '归属表编号',
    column_name    varchar(200)              null comment '列名称',
    column_comment varchar(500)              null comment '列描述',
    column_type    varchar(100)              null comment '列类型',
    java_type      varchar(500)              null comment 'JAVA类型',
    java_field     varchar(200)              null comment 'JAVA字段名',
    is_pk          char                      null comment '是否主键（1是）',
    is_increment   char                      null comment '是否自增（1是）',
    is_required    char                      null comment '是否必填（1是）',
    is_insert      char                      null comment '是否为插入字段（1是）',
    is_edit        char                      null comment '是否编辑字段（1是）',
    is_list        char                      null comment '是否列表字段（1是）',
    is_query       char                      null comment '是否查询字段（1是）',
    query_type     varchar(200) default 'EQ' null comment '查询方式（等于、不等于、大于、小于、范围）',
    html_type      varchar(200)              null comment '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
    dict_type      varchar(200) default ''   null comment '字典类型',
    sort           int                       null comment '排序',
    create_by      varchar(64)  default ''   null comment '创建者',
    create_time    datetime                  null comment '创建时间',
    update_by      varchar(64)  default ''   null comment '更新者',
    update_time    datetime                  null comment '更新时间'
)
    comment '代码生成业务表字段';

create table group_ranking_sxz
(
    id         int            null,
    group_name varchar(255)   null comment '企业群名称',
    score      decimal(10, 2) null comment '得分',
    ranking    int            null comment '排名',
    time_frame varchar(50)    null comment '时间段'
)
    comment '企业群排行表';

create table message
(
    from_id      varchar(10) null comment '消息发送者编号',
    type         int         null comment '消息类型',
    to_id        varchar(10) null comment '消息接收者编号',
    arrival_time datetime    null
);

create table mode
(
    mode            int         null comment '多模式id',
    mode_name       varchar(50) null comment '多模式名称',
    competition_num int         null comment '成功任务数',
    failure_num     int         null comment '失败任务数'
)
    comment '多模式协同表';

create table monthly_statistics_sxz
(
    id               int auto_increment
        primary key,
    month            varchar(7) not null comment '月份',
    high_score_count int        not null comment '>80分数量',
    layer_id         int        not null comment '产业链网络层编号',
    constraint month
        unique (month, layer_id)
)
    comment '每月每条链中大于80分的记录';

create table multiplex_relationship
(
    company1_id int           null comment '企业1编号',
    company2_id int           null comment '企业2编号',
    layer_id    int           null comment '关系所在层编号',
    link_type   int           null comment '原料供应，零件生产，整机组装，销售和回收',
    weight      int default 1 null comment '权重(合作成本/关联强度)',
    strength    double        null comment '关系强度'
);

create table multiplex_relationship_1
(
    company1_id int    null comment '源企业id',
    company2_id int    null comment '目标企业id',
    layer_id    int    null comment '关系层',
    strength    double null comment '关联强度'
)
    comment '多重关系表';

create table product
(
    id   int auto_increment comment '产品id'
        primary key,
    name varchar(20) null comment '产品名称'
)
    comment '产品表';

create table QRTZ_CALENDARS
(
    sched_name    varchar(120) not null comment '调度名称',
    calendar_name varchar(200) not null comment '日历名称',
    calendar      blob         not null comment '存放持久化calendar对象',
    primary key (sched_name, calendar_name)
)
    comment '日历信息表';

create table QRTZ_FIRED_TRIGGERS
(
    sched_name        varchar(120) not null comment '调度名称',
    entry_id          varchar(95)  not null comment '调度器实例id',
    trigger_name      varchar(200) not null comment 'qrtz_triggers表trigger_name的外键',
    trigger_group     varchar(200) not null comment 'qrtz_triggers表trigger_group的外键',
    instance_name     varchar(200) not null comment '调度器实例名',
    fired_time        bigint       not null comment '触发的时间',
    sched_time        bigint       not null comment '定时器制定的时间',
    priority          int          not null comment '优先级',
    state             varchar(16)  not null comment '状态',
    job_name          varchar(200) null comment '任务名称',
    job_group         varchar(200) null comment '任务组名',
    is_nonconcurrent  varchar(1)   null comment '是否并发',
    requests_recovery varchar(1)   null comment '是否接受恢复执行',
    primary key (sched_name, entry_id)
)
    comment '已触发的触发器表';

create table QRTZ_JOB_DETAILS
(
    sched_name        varchar(120) not null comment '调度名称',
    job_name          varchar(200) not null comment '任务名称',
    job_group         varchar(200) not null comment '任务组名',
    description       varchar(250) null comment '相关介绍',
    job_class_name    varchar(250) not null comment '执行任务类名称',
    is_durable        varchar(1)   not null comment '是否持久化',
    is_nonconcurrent  varchar(1)   not null comment '是否并发',
    is_update_data    varchar(1)   not null comment '是否更新数据',
    requests_recovery varchar(1)   not null comment '是否接受恢复执行',
    job_data          blob         null comment '存放持久化job对象',
    primary key (sched_name, job_name, job_group)
)
    comment '任务详细信息表';

create table QRTZ_LOCKS
(
    sched_name varchar(120) not null comment '调度名称',
    lock_name  varchar(40)  not null comment '悲观锁名称',
    primary key (sched_name, lock_name)
)
    comment '存储的悲观锁信息表';

create table QRTZ_PAUSED_TRIGGER_GRPS
(
    sched_name    varchar(120) not null comment '调度名称',
    trigger_group varchar(200) not null comment 'qrtz_triggers表trigger_group的外键',
    primary key (sched_name, trigger_group)
)
    comment '暂停的触发器表';

create table QRTZ_SCHEDULER_STATE
(
    sched_name        varchar(120) not null comment '调度名称',
    instance_name     varchar(200) not null comment '实例名称',
    last_checkin_time bigint       not null comment '上次检查时间',
    checkin_interval  bigint       not null comment '检查间隔时间',
    primary key (sched_name, instance_name)
)
    comment '调度器状态表';

create table QRTZ_TRIGGERS
(
    sched_name     varchar(120) not null comment '调度名称',
    trigger_name   varchar(200) not null comment '触发器的名字',
    trigger_group  varchar(200) not null comment '触发器所属组的名字',
    job_name       varchar(200) not null comment 'qrtz_job_details表job_name的外键',
    job_group      varchar(200) not null comment 'qrtz_job_details表job_group的外键',
    description    varchar(250) null comment '相关介绍',
    next_fire_time bigint       null comment '上一次触发时间（毫秒）',
    prev_fire_time bigint       null comment '下一次触发时间（默认为-1表示不触发）',
    priority       int          null comment '优先级',
    trigger_state  varchar(16)  not null comment '触发器状态',
    trigger_type   varchar(8)   not null comment '触发器的类型',
    start_time     bigint       not null comment '开始时间',
    end_time       bigint       null comment '结束时间',
    calendar_name  varchar(200) null comment '日程表名称',
    misfire_instr  smallint     null comment '补偿执行的策略',
    job_data       blob         null comment '存放持久化job对象',
    primary key (sched_name, trigger_name, trigger_group),
    constraint QRTZ_TRIGGERS_ibfk_1
        foreign key (sched_name, job_name, job_group) references QRTZ_JOB_DETAILS (sched_name, job_name, job_group)
)
    comment '触发器详细信息表';

create table resource_all
(
    id            int         not null comment '资源编号'
        primary key,
    resource_type int         not null comment '企业在产业链所在阶段（原料供应，零件生产，整机组装，销售和回收）',
    name          varchar(20) null comment '资源名称'
)
    comment '资源表';

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

create table score_records_sxz
(
    id                      int auto_increment
        primary key,
    task_id                 int           null comment '任务id',
    company_id              int           null comment '评分的企业ID',
    evaluated_company_id    int           null comment '被评分的企业ID',
    score                   decimal(5, 2) null comment '得分',
    timestamp               timestamp     null comment '时间戳',
    supplyRateScore         int           null comment '供应率',
    deliveryTimeScore       int           null comment '供应时间',
    dataAccuracy            int           null comment '数据准确率',
    passRateScore           int           null comment '合格率',
    productAppearance       int           null comment '产品外观',
    productPackaging        int           null comment 'chan'
)
    comment '评分记录表';

create table sys_config
(
    config_id    int auto_increment comment '参数主键'
        primary key,
    config_name  varchar(100) default ''  null comment '参数名称',
    config_key   varchar(100) default ''  null comment '参数键名',
    config_value varchar(500) default ''  null comment '参数键值',
    config_type  char         default 'N' null comment '系统内置（Y是 N否）',
    create_by    varchar(64)  default ''  null comment '创建者',
    create_time  datetime                 null comment '创建时间',
    update_by    varchar(64)  default ''  null comment '更新者',
    update_time  datetime                 null comment '更新时间',
    remark       varchar(500)             null comment '备注'
)
    comment '参数配置表';

create table sys_dept
(
    dept_id     bigint auto_increment comment '部门id'
        primary key,
    parent_id   bigint      default 0   null comment '父部门id',
    ancestors   varchar(50) default ''  null comment '祖级列表',
    dept_name   varchar(30) default ''  null comment '部门名称',
    order_num   int         default 0   null comment '显示顺序',
    leader      varchar(20)             null comment '负责人',
    phone       varchar(11)             null comment '联系电话',
    email       varchar(50)             null comment '邮箱',
    status      char        default '0' null comment '部门状态（0正常 1停用）',
    del_flag    char        default '0' null comment '删除标志（0代表存在 2代表删除）',
    create_by   varchar(64) default ''  null comment '创建者',
    create_time datetime                null comment '创建时间',
    update_by   varchar(64) default ''  null comment '更新者',
    update_time datetime                null comment '更新时间'
)
    comment '部门表';

create table sys_dict_data
(
    dict_code   bigint auto_increment comment '字典编码'
        primary key,
    dict_sort   int          default 0   null comment '字典排序',
    dict_label  varchar(100) default ''  null comment '字典标签',
    dict_value  varchar(100) default ''  null comment '字典键值',
    dict_type   varchar(100) default ''  null comment '字典类型',
    css_class   varchar(100)             null comment '样式属性（其他样式扩展）',
    list_class  varchar(100)             null comment '表格回显样式',
    is_default  char         default 'N' null comment '是否默认（Y是 N否）',
    status      char         default '0' null comment '状态（0正常 1停用）',
    create_by   varchar(64)  default ''  null comment '创建者',
    create_time datetime                 null comment '创建时间',
    update_by   varchar(64)  default ''  null comment '更新者',
    update_time datetime                 null comment '更新时间',
    remark      varchar(500)             null comment '备注'
)
    comment '字典数据表';

create table sys_dict_type
(
    dict_id     bigint auto_increment comment '字典主键'
        primary key,
    dict_name   varchar(100) default ''  null comment '字典名称',
    dict_type   varchar(100) default ''  null comment '字典类型',
    status      char         default '0' null comment '状态（0正常 1停用）',
    create_by   varchar(64)  default ''  null comment '创建者',
    create_time datetime                 null comment '创建时间',
    update_by   varchar(64)  default ''  null comment '更新者',
    update_time datetime                 null comment '更新时间',
    remark      varchar(500)             null comment '备注',
    constraint dict_type
        unique (dict_type)
)
    comment '字典类型表';

create table sys_job
(
    job_id          bigint auto_increment comment '任务ID',
    job_name        varchar(64)  default ''        not null comment '任务名称',
    job_group       varchar(64)  default 'DEFAULT' not null comment '任务组名',
    invoke_target   varchar(500)                   not null comment '调用目标字符串',
    cron_expression varchar(255) default ''        null comment 'cron执行表达式',
    misfire_policy  varchar(20)  default '3'       null comment '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
    concurrent      char         default '1'       null comment '是否并发执行（0允许 1禁止）',
    status          char         default '0'       null comment '状态（0正常 1暂停）',
    create_by       varchar(64)  default ''        null comment '创建者',
    create_time     datetime                       null comment '创建时间',
    update_by       varchar(64)  default ''        null comment '更新者',
    update_time     datetime                       null comment '更新时间',
    remark          varchar(500) default ''        null comment '备注信息',
    primary key (job_id, job_name, job_group)
)
    comment '定时任务调度表';

create table sys_job_log
(
    job_log_id     bigint auto_increment comment '任务日志ID'
        primary key,
    job_name       varchar(64)               not null comment '任务名称',
    job_group      varchar(64)               not null comment '任务组名',
    invoke_target  varchar(500)              not null comment '调用目标字符串',
    job_message    varchar(500)              null comment '日志信息',
    status         char          default '0' null comment '执行状态（0正常 1失败）',
    exception_info varchar(2000) default ''  null comment '异常信息',
    create_time    datetime                  null comment '创建时间'
)
    comment '定时任务调度日志表';

create table sys_logininfor
(
    info_id        bigint auto_increment comment '访问ID'
        primary key,
    user_name      varchar(50)  default ''  null comment '用户账号',
    ipaddr         varchar(128) default ''  null comment '登录IP地址',
    login_location varchar(255) default ''  null comment '登录地点',
    browser        varchar(50)  default ''  null comment '浏览器类型',
    os             varchar(50)  default ''  null comment '操作系统',
    status         char         default '0' null comment '登录状态（0成功 1失败）',
    msg            varchar(255) default ''  null comment '提示消息',
    login_time     datetime                 null comment '访问时间'
)
    comment '系统访问记录';

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

create table sys_notice
(
    notice_id      int auto_increment comment '公告ID'
        primary key,
    notice_title   varchar(50)             not null comment '公告标题',
    notice_type    char                    not null comment '公告类型（1通知 2公告）',
    notice_content longblob                null comment '公告内容',
    status         char        default '0' null comment '公告状态（0正常 1关闭）',
    create_by      varchar(64) default ''  null comment '创建者',
    create_time    datetime                null comment '创建时间',
    update_by      varchar(64) default ''  null comment '更新者',
    update_time    datetime                null comment '更新时间',
    remark         varchar(255)            null comment '备注'
)
    comment '通知公告表';

create table sys_oper_log
(
    oper_id        bigint auto_increment comment '日志主键'
        primary key,
    title          varchar(50)   default '' null comment '模块标题',
    business_type  int           default 0  null comment '业务类型（0其它 1新增 2修改 3删除）',
    method         varchar(100)  default '' null comment '方法名称',
    request_method varchar(10)   default '' null comment '请求方式',
    operator_type  int           default 0  null comment '操作类别（0其它 1后台用户 2手机端用户）',
    oper_name      varchar(50)   default '' null comment '操作人员',
    dept_name      varchar(50)   default '' null comment '部门名称',
    oper_url       varchar(255)  default '' null comment '请求URL',
    oper_ip        varchar(128)  default '' null comment '主机地址',
    oper_location  varchar(255)  default '' null comment '操作地点',
    oper_param     varchar(2000) default '' null comment '请求参数',
    json_result    varchar(2000) default '' null comment '返回参数',
    status         int           default 0  null comment '操作状态（0正常 1异常）',
    error_msg      varchar(2000) default '' null comment '错误消息',
    oper_time      datetime                 null comment '操作时间',
    cost_time      bigint        default 0  null comment '消耗时间'
)
    comment '操作日志记录';

create table sys_post
(
    post_id     bigint auto_increment comment '岗位ID'
        primary key,
    post_code   varchar(64)            not null comment '岗位编码',
    post_name   varchar(50)            not null comment '岗位名称',
    post_sort   int                    not null comment '显示顺序',
    status      char                   not null comment '状态（0正常 1停用）',
    create_by   varchar(64) default '' null comment '创建者',
    create_time datetime               null comment '创建时间',
    update_by   varchar(64) default '' null comment '更新者',
    update_time datetime               null comment '更新时间',
    remark      varchar(500)           null comment '备注'
)
    comment '岗位信息表';

create table sys_role
(
    role_id             bigint auto_increment comment '角色ID'
        primary key,
    role_name           varchar(30)             not null comment '角色名称',
    role_key            varchar(100)            not null comment '角色权限字符串',
    role_sort           int                     not null comment '显示顺序',
    data_scope          char        default '1' null comment '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
    menu_check_strictly tinyint(1)  default 1   null comment '菜单树选择项是否关联显示',
    dept_check_strictly tinyint(1)  default 1   null comment '部门树选择项是否关联显示',
    status              char                    not null comment '角色状态（0正常 1停用）',
    del_flag            char        default '0' null comment '删除标志（0代表存在 2代表删除）',
    create_by           varchar(64) default ''  null comment '创建者',
    create_time         datetime                null comment '创建时间',
    update_by           varchar(64) default ''  null comment '更新者',
    update_time         datetime                null comment '更新时间',
    remark              varchar(500)            null comment '备注'
)
    comment '角色信息表';

create table sys_role_dept
(
    role_id bigint not null comment '角色ID',
    dept_id bigint not null comment '部门ID',
    primary key (role_id, dept_id)
)
    comment '角色和部门关联表';

create table sys_role_menu
(
    role_id bigint not null comment '角色ID',
    menu_id bigint not null comment '菜单ID',
    primary key (role_id, menu_id)
)
    comment '角色和菜单关联表';

create table sys_user
(
    user_id     bigint auto_increment comment '用户ID'
        primary key,
    dept_id     bigint                    null comment '部门ID',
    user_name   varchar(30)               not null comment '用户账号',
    nick_name   varchar(30)               not null comment '用户昵称',
    user_type   varchar(2)   default '00' null comment '用户类型（00系统用户）',
    email       varchar(50)  default ''   null comment '用户邮箱',
    phonenumber varchar(11)  default ''   null comment '手机号码',
    sex         char         default '0'  null comment '用户性别（0男 1女 2未知）',
    avatar      varchar(100) default ''   null comment '头像地址',
    password    varchar(100) default ''   null comment '密码',
    status      char         default '0'  null comment '帐号状态（0正常 1停用）',
    del_flag    char         default '0'  null comment '删除标志（0代表存在 2代表删除）',
    login_ip    varchar(128) default ''   null comment '最后登录IP',
    login_date  datetime                  null comment '最后登录时间',
    create_by   varchar(64)  default ''   null comment '创建者',
    create_time datetime                  null comment '创建时间',
    update_by   varchar(64)  default ''   null comment '更新者',
    update_time datetime                  null comment '更新时间',
    remark      varchar(500)              null comment '备注'
)
    comment '用户信息表';

create table sys_user_post
(
    user_id bigint not null comment '用户ID',
    post_id bigint not null comment '岗位ID',
    primary key (user_id, post_id)
)
    comment '用户与岗位关联表';

create table sys_user_role
(
    user_id bigint not null comment '用户ID',
    role_id bigint not null comment '角色ID',
    primary key (user_id, role_id)
)
    comment '用户和角色关联表';

create table task_all
(
    id             int auto_increment comment '任务编号'
        primary key,
    name           varchar(20)    null comment '任务名称',
    task_type      int            null comment '任务类型(原料供应，零件生产，整机组装，销售和回收)',
    val            int default 40 null comment '任务价值',
    arrival_time   datetime       null comment '任务到达时间',
    coalition_time datetime       null comment '联盟形成时间',
    finish_time    datetime       null comment '任务完成时间',
    task_status    int default 0  null comment '任务状态（0 等待分配，1 已分配，2已完成,3执行失败）',
    duration       int default 30 null comment '任务持续时长',
    product_id     int            null comment '产品编号',
    coalition_id   int default 0  null comment '联盟编号',
    chain_id       int default 1  null comment '所属产业链编号',
    company_id     int default 1  null comment '任务所属企业编号'
)
    comment '任务表';

create table task_resource
(
    task_id     int not null comment '任务编号',
    resource_id int not null comment '技能编号',
    number      int null comment '资源需求量',
    primary key (task_id, resource_id)
)
    comment '任务技能表';

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



