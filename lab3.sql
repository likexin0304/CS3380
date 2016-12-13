CREATE TABLE classes(
    name varchar(50),
    department varchar(50),
    course_id varchar(50),
    start time,
    end time,
    days varchar(50),
	primary key (course_id)

);

insert into classes values('Math 1500','Math','Math 1500','09:00:00','09:50:00','MWF');
insert into classes values('CS 1000','CS','CS 1000','10:00:00','10:50:00','MWF');
insert into classes values('CS 1050','CS','CS 1050','11:00:00','11:50:00','MWF');
insert into classes values('CS 2050','CS','CS 2050','13:00:00','13:50','MWF');
insert into classes values('REL_ST 2240','REL_ST','REL_ST 2240','14:00:00','14:50:00','MWF');
insert into classes values('NEP 1034','NEP','NEP 1034','09:30:00','10:45:00','TTH');
insert into classes values('CS 3380','CS','CS 3380','11:00:00','11:15:00','TTH');
insert into classes values('CS 2830','CS','CS 2830','11:30:00','12:45:00','TTH');
insert into classes values('English 1200','English','English 1200','14:00:00','15:15:00','TTh');
insert into classes values('Math 2320','Math','Math 2320','15:30:00','16:45:00','TTH');

select * from classes;
select start from classes;
select * from classes where department = 'CS';
select name,course_id from classes where days = 'MWF';
select timediff(end,start) from classes;

update classes set days = 'TTH' where course_id = 'Math 1500';
update classes set start = '02:00:00' where days = 'MWF';
update classes set end = '02:50:00' where days = 'MWF';
update classes set department = 'Chinese', name='Chinese 1000', course_id = 'Chinese 1000' where department = 'NEP';
update classes set name = 'Database', course_id = 'Datebase 1000' where name = 'CS 1000';
delete from classes where department = 'English';
select * from classes;