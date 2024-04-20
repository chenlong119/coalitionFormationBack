update task_all set task_status=0,coalition_id=0 where task_status=1;
update company_all set status=1,coalition_id=0 where status=2;
delete from coalition where coalition_status=1;