select * from q1;
select * from q2;
select * from q3;
select * from q4;
select * from q5;
select * from q6;
select * from q7;
select * from q8;
select * from q9;
select * from q10;
select * from q11;
select * from q12;
select * from q13;
select * from q14;
select * from q15;


insert into executive (code, person) values ('DDD','Toby');
insert into executive (code, person) values ('DDD','Jone');

-- q16
select * from avg_company_rating  where code = 'BBB';
insert into asx ("Date", Code, Volume, Price) values ('2018-05-23' , 'BBB'  , 1503600 ,1.2 );
select * from avg_company_rating  where code = 'BBB';
insert into asx ("Date", Code, Volume, Price) values ('2018-05-24' , 'BBB'  , 1503600 ,0.5 );
select * from avg_company_rating  where code = 'BBB';

-- q17 
select * from ASXLog;
update asx set volume=22222222, Price=0.91 
where "Date"='2018-05-24' and code = 'BBB';
select * from ASXLog;
