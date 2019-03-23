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