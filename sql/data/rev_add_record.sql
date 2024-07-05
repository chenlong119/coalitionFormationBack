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

