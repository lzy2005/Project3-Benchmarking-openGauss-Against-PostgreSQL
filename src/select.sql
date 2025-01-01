begin;
explain analyze select count(*) from table1;
rollback;

begin;
explain analyze select count(*) from s_table1;
rollback;

-- select1

begin;
explain analyze select * from table2;
rollback;

begin;
explain analyze select * from s_table2;
rollback;


-- select2

begin;
explain analyze select * from table3 order by salary;
rollback;

begin;
explain analyze select * from s_table3 order by salary;
rollback;

-- select3

begin;
explain analyze select * from table1 where property<10000;
rollback;

begin;
explain analyze select * from s_table1 where property<10000;
rollback;

-- select4

begin;
explain analyze select * from table2 where name like '%ac%';
rollback;

begin;
explain analyze select * from s_table2 where name like '%ac%';
rollback;

-- select5

begin;
explain analyze select * from
(select * from table3 where property>30000) t1
where salary<1000000;
rollback;

begin;
explain analyze select * from
(select * from s_table3 where property>300) t1
where salary<1000000;
rollback;

-- select6