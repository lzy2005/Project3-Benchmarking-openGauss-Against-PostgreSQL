create table table1 (id int, name char(5), property int);
create table s_table1 (id int, name char(5), property int);
create table table2(id int, name char(5), region_code char(10));
create table s_table2(id int, name char(5), region_code char(10));
create table table3(id int, property int, salary int);
create table s_table3(id int, property int, salary int);

-- create table

do $$
begin
    for i in 0..999999 loop
        insert into table1(id,name,property) values (
            i,
            chr(65+i/100000)||
            chr(97+i%100000/10000)||
            chr(97+i%10000/1000)||
            chr(97+i%1000/100)||
            chr(97+i%100/10),
            (i%100000)+1
        );
    end loop;
end
$$;

do $$
begin
    for i in 0..9999 loop
        insert into s_table1(id,name,property) values (
            i,
            chr(65+i/100000)||
            chr(97+i%100000/10000)||
            chr(97+i%10000/1000)||
            chr(97+i%1000/100)||
            chr(97+i%100/10),
            (i%1000)+1
        );
    end loop;
end
$$;

-- table1 & s_table1

create or replace function rnd_char9() returns char(9) as $$
declare
    o integer;
begin
    o = floor(random() * 9)+1;
    if o=1 then
        return to_char(floor(random() * 10),'0');
    elsif o=2 then
        return to_char(floor(random() * 100),'00');
    elsif o=3 then
        return to_char(floor(random() * 1000),'000');
    elsif o=4 then
        return to_char(floor(random() * 10000),'0000');
    elsif o=5 then
        return to_char(floor(random() * 100000),'00000');
    elsif o=6 then
        return to_char(floor(random() * 1000000),'000000');
    elsif o=7 then
        return to_char(floor(random() * 10000000),'0000000');
    elsif o=8 then
        return to_char(floor(random() * 100000000),'00000000');
    else
        return to_char(floor(random() * 1000000000),'000000000');
    end if;
end;
$$language plpgsql;

select setseed(0);
do $$
begin
    for i in 0..999999 loop
        insert into table2(id,name,region_code) values (
            i,
            chr(65+i/100000)||
            chr(97+i%100000/10000)||
            chr(97+i%10000/1000)||
            chr(97+i%1000/100)||
            chr(97+i%100/10),
            rnd_char9()
        );
    end loop;
end
$$;

select setseed(0);
do $$
begin
    for i in 0..9999 loop
        insert into s_table2(id,name,region_code) values (
            i,
            chr(65+i/100000)||
            chr(97+i%100000/10000)||
            chr(97+i%10000/1000)||
            chr(97+i%1000/100)||
            chr(97+i%100/10),
            rnd_char9()
        );
    end loop;
end
$$;

-- table2 & s_table2

create or replace function rnd_int8() returns integer as $$
declare
begin
    return floor(random()*100000000);
end;
$$language plpgsql;

select setseed(0);
do $$
begin
    for i in 0..999999 loop
        insert into table3(id,property,salary) values (
            i,
            (i%100000)+1,
            rnd_int8()
        );
    end loop;
end
$$;

select setseed(0);
do $$
begin
    for i in 0..9999 loop
        insert into s_table3(id,property,salary) values (
            i,
            (i%1000)+1,
            rnd_int8()
        );
    end loop;
end
$$;

-- table3 & s_table3