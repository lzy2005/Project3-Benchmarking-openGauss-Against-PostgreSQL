select * from table1;

begin;
explain analyze update table1 set property=id*10;
rollback;

begin;
explain analyze update s_table1 set property=id*10;
rollback;

-- update1

begin;
explain analyze update table2 set region_code=name||to_char(id/1000,'000') where id<1000;
rollback;

begin;
explain analyze update s_table2 set region_code=name||to_char(id/1000,'000') where id<1000;
rollback;

-- update2

begin;
explain analyze update table1 set property=property+id where name like '%b%e%';
rollback;

begin;
explain analyze update s_table1 set property=property+id where name like '%b%e%';
rollback;

-- update3

begin;
explain analyze update table2 set region_code=(
    select to_char(property,'999999999') from s_table1 where s_table1.id=table2.id
    ) where table2.name like '%c%a%';
rollback;

begin;
explain analyze update s_table2 set region_code=(
    select to_char(property,'999999999') from s_table1 where s_table1.id=s_table2.id
    ) where s_table2.name like '%c%a%';
rollback;

-- update4