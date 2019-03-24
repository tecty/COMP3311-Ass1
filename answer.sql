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
    join category as ca 
    on ca.code = c.code 
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

-- q11
create or replace view avg_company_rating as 
    select c.code, avg(r.star) 
    from company as c 
    join rating as r 
    on r.code = c.code 
    group by c.code
;

create or replace view Q11(Sector, AvgRating) as
    select c.sector, avg(cr.avg) 
    from category as c 
    join avg_company_rating as cr 
    on cr.code=c.code 
    group by c.sector 
    order by avg desc; 
; 

-- q12
create or replace view executive_company_count(person, "count") as 
    select person, count(*) 
    from executive 
    group by person 
;

create or replace view Q12(Name) as 
    select person 
    from executive_company_count
    where count > 1
;

-- q13
create or replace view local_sector(sector) as 
(
    select sector 
    from category
) 
except 
(
    select distinct ca.sector 
    from category as ca 
    join company as co 
    on co.code =ca.code 
    where co.country <>'Australia' 
);

create or replace view Q13(Code, Name, Address, Zip, Sector) as
    select  co.code, co.name, co.address, co.zip, ca.sector 
    from local_sector as ls 
    join category as ca 
    on ca.sector=ls.sector
    join company as co 
    on co.code=ca.code
;

-- q14 
create or replace view trade_range(code, mi, ma) as
    select code, min("Date"), max("Date") 
    from asx 
    group by code
;

create or replace view co_range_price(code, da, price) as 
select a.code, a."Date", a.price
from trade_range as tr 
join asx as a 
on 
    tr.code = a.code 
    and (
        tr.mi = a."Date" or tr.ma=a."Date"
    ) 
;

create or replace view Q14(Code, BeginPrice, EndPrice, Change, Gain) as 
    select 
        co1.code, co2.price,co1.price,
        co1.price -co2.price,
        (co1.price -co2.price)/co2.price*100  
    from co_range_price as co1 
    join co_range_price as co2 
    on
        co1.code= co2.code 
        and
        co1.da >co2.da
;

-- q15
create or replace view co_gain_digest(code, min_gain, avg_gain, max_gain) as 
    select code, min(gain), avg(gain), max(gain) 
    from q7 
    group by code
;

create or replace view Q15(
    Code, MinPrice, AvgPrice, MaxPrice, MinDayGain, AvgDayGain, MaxDayGain
) as 
    select 
        a.code, min(a.price),avg(a.price),max(a.price),
        cgd.min_gain, cgd.avg_gain, cgd.max_gain 
    from co_gain_digest as cgd
    join asx as a 
    on a.code=cgd.code 
    group by a.code,cgd.min_gain, cgd.avg_gain, cgd.max_gain
;