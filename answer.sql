create or replace view Q1(Name, Country) as 
select name, country from company where lower(trim(country))='australia';