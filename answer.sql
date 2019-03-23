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

-- q8
create or replace view asx_max_date as 
    select "Date", max(volume)
    from asx
    group by "Date"
;

create or replace view Q8("Date", Code, Volume) as
    select a."Date", a.code, a.volume
    from asx as a 
    join asx_max_date as am 
    on a."Date"=am."Date" and am.max=a.volume
;

-- q9
create or replace view Q9(Sector, Industry, Number) as 
    select sector, industry, count(*) 
    from category 
    group by industry, sector 
    order by sector, industry
;

-- q10

create or replace view Q10(Code, Industry) as
    select c.code, c.industry
    from category as c 
    join q9 
    on q9.industry= c.industry 
    where q9.number=1
;