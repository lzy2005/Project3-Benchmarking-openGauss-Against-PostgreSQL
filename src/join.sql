begin;
explain analyze select count(*) from(
    table1 join table2 on table1.name=table2.name
);
rollback;

begin;
explain analyze select count(*) from(
    s_table1 join s_table2 on s_table1.name=s_table2.name
);
rollback;

-- join1

begin;
explain analyze select count(*) from(
    table1 left outer join table3 on table1.property=table3.property
);
rollback;

begin;
explain analyze select count(*) from(
    s_table1 left outer join s_table3 on s_table1.property=s_table3.property
);
rollback;

-- join2

begin;
explain analyze select count(*) from(
    table1 join table2 on table1.name=table2.name join table3 on table1.property=table3.property
);
rollback;

begin;
explain analyze select count(*) from(
    s_table1 join s_table2 on s_table1.name=s_table2.name join s_table3 on s_table1.property=s_table3.property
);
rollback;

-- join3

begin;
explain analyze select count(*) from table1 cross join table2 cross join table3
where table1.name=table2.name and table1.property=table3.property;
rollback;

begin;
explain analyze select count(*) from s_table1 cross join s_table2 cross join s_table3
where s_table1.name=s_table2.name and s_table1.property=s_table3.property;
rollback;

-- join4