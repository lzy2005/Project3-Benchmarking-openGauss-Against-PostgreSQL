begin;
explain analyze delete from table1;
rollback;

begin;
explain analyze delete from s_table1;
rollback;

-- delete1

begin;
explain analyze delete from table2 where id%2=0;
rollback;

begin;
explain analyze delete from s_table2 where id%2=0;
rollback;

-- delete2

begin;
explain analyze delete from table2 where region_code like '%3%7%';
rollback;

begin;
explain analyze delete from s_table2 where region_code like '%3%7%';
rollback;

-- delete3