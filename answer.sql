-- q1
create or replace view Q1 (Name, Country) as
    select name, country
    from company
    where lower(trim(country))<>'australia'
;

-- q2
create or replace view count_executive (code, count) as
    select code, count(*) 
    from executive
    group by code;
;

create or replace view Q2(code) as
    select code
    from count_executive
    where count>=5
;

-- q3
create or replace view Q3(Name) as 
    select c.name 
    from company as c 
    join category as ca on ca.code = c.code 
    where ca.sector='Technology'
;

-- q4
create or replace view Q4(Sector, Number) as 
    select sector, count(*) 
    from category 
    group by sector 
;

-- q5, different name means different person 
create or replace view Q5(Name) as 
    select distinct person 
    from executive as e 
    join category as c on c.code=e.code 
    where c.sector='Technology' ;
;

-- q6 
create or replace view company_code as 
    select name, substr(zip, 1,1) 
    from company
;

create or replace view Q6(Name) as 
    select name from company_code where substr='2'
;

-- q7 
create type asx_record as (
    da date, code char(3), vol integer, price numeric
);
create type asx_record as (
    "Date" date, Code char(3), Volume integer,
    PrevPrice numeric, Price numeric, Change numeric, 
    Gain numeric
);

create or replace view asx_shift as
    select "Date"+1 as d,* from asx
;

create or replace view Q7(
    "Date", Code, Volume, PrevPrice, Price, Change, Gain
) as 
    select 
        a."Date", 
        a.code, 
        a.volume, 
        ah.price , 
        a.price,
        a.price-ah.price,
        (a.price-ah.price)/ah.price *100 
    from asx as a 
    join asx_shift as ah 
    on a."Date"= ah.d and a.code = ah.code
;