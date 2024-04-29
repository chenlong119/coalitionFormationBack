set @resource_count=0;
set @minid=0;
set @maxid=0;
select count(*) into @resource_count from resource_all where resource_type=1;
select min(id) into @minid from resource_all where resource_type=1;
select max(id) into @maxid from resource_all where resource_type=1;
call InsertCompanyResource(1, 1,@minid, @minid+Floor(@resource_count/2));
call InsertCompanyResource(1, 2,@minid+FLOOR(@resource_count/2)+1, @minid+@resource_count-1);
call InsertCompanyResource(1, 3,@minid+FLOOR(@resource_count/3), @minid+2*FLOOR(@resource_count/3));
#
select count(*) into @resource_count from resource_all where resource_type=2;
select min(id) into @minid from resource_all where resource_type=2;
select max(id) into @maxid from resource_all where resource_type=2;
call InsertCompanyResource(2, 1,@minid, @minid+Floor(@resource_count/2));
call InsertCompanyResource(2, 2,@minid+FLOOR(@resource_count/2)+1, @minid+@resource_count-1);
call InsertCompanyResource(2, 3,@minid+FLOOR(@resource_count/3), @minid+2*FLOOR(@resource_count/3));

select count(*) into @resource_count from resource_all where resource_type=3;
select min(id) into @minid from resource_all where resource_type=3;
select max(id) into @maxid from resource_all where resource_type=3;
call InsertCompanyResource(3, 1,@minid, @minid+Floor(@resource_count/2));
call InsertCompanyResource(3, 2,@minid+FLOOR(@resource_count/2)+1, @minid+@resource_count-1);
call InsertCompanyResource(3, 3,@minid+FLOOR(@resource_count/3), @minid+2*FLOOR(@resource_count/3));

select count(*) into @resource_count from resource_all where resource_type=4;
select min(id) into @minid from resource_all where resource_type=4;
select max(id) into @maxid from resource_all where resource_type=4;
call InsertCompanyResource(4, 1,@minid, @minid+Floor(@resource_count/2));
call InsertCompanyResource(4, 2,@minid+FLOOR(@resource_count/2)+1, @minid+@resource_count-1);
call InsertCompanyResource(4, 3,@minid+FLOOR(@resource_count/2), @minid+2*FLOOR(@resource_count/3));