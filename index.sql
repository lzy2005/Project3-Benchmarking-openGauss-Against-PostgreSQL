create index idx1 on table1(name);

create index idx2 on s_table1(name);

-- index1

begin;
explain analyze select count(*) from table1 where name>'Ac' and name <'Bd';
rollback;

begin;
explain analyze select count(*) from s_table1 where name>'Ac' and name <'Bd';
rollback;

-- index2

begin;
explain analyze select count(*) from table1 where upper(name)>'AC' and upper(name) <'BD';
rollback;

begin;
explain analyze select count(*) from s_table1 where upper(name)>'AC' and upper(name) <'BD';
rollback;

-- index3

create index idx3 on table2(name,region_code);

create index idx4 on s_table2(name,region_code);

-- index4

begin;
explain analyze select count(*) from table2 where name>'BC' and region_code<'79';
rollback;

begin;
explain analyze select count(*) from s_table2 where name>'BC' and region_code<'79';
rollback;

-- index5

begin;
explain analyze select count(*) from table2 where name<'CF' and id%2=0;
rollback;

begin;
explain analyze select count(*) from s_table2 where name<'CF' and id%2=0;
rollback;

-- index6