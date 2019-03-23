-- question 1 data
insert into company (code, name, zip, country) values ('AAA', 'AAA corp','2022', 'Australia');
insert into company (code, name, zip, country) values ('BBB', 'BBB corp','2035', 'australia');
insert into company (code, name, zip, country) values ('CCC', 'CCC corp','1024', 'china');
insert into company (code, name, zip, country) values ('DDD', 'DDD corp','3011', 'Australia');
insert into company (code, name, zip, country) values ('EEE', 'EEE corp','1244', 'US');
insert into company (code, name, zip, country) values ('FFF', 'FFF corp','0255', 'Australia');
insert into company (code, name, zip, country) values ('GGG', 'GGG corp','4854', 'New Zealand');
insert into company (code, name, zip, country) values ('HHH', 'HHH corp','9842', 'Australia');

insert into Executive (code, person) values ('AAA', 'Mark');
insert into Executive (code, person) values ('AAA', 'Jane');
insert into Executive (code, person) values ('BBB', 'Duke');
insert into Executive (code, person) values ('BBB', 'Twain');
insert into Executive (code, person) values ('CCC', 'Mark');
insert into Executive (code, person) values ('CCC', 'Jone');
insert into Executive (code, person) values ('AAA', 'Juanna');
insert into Executive (code, person) values ('AAA', 'October');
insert into Executive (code, person) values ('AAA', 'Summer');
insert into Executive (code, person) values ('AAA', 'Chan');
insert into Executive (code, person) values ('DDD', 'Duke');
insert into Executive (code, person) values ('DDD', 'Lucas');
insert into Executive (code, person) values ('CCC', 'Dublin');

-- q3
insert into category (code, sector, industry) values ('AAA','Milk', 'Farming');
insert into category (code, sector, industry) values ('BBB','Technology', 'SoC');
insert into category (code, sector, industry) values ('CCC','Milk', 'Farming');
insert into category (code, sector, industry) values ('DDD','Technology', 'Chipset');
insert into category (code, sector, industry) values ('EEE','Technology', 'Chipset');
insert into category (code, sector, industry) values ('FFF','Services', 'Delivery');
insert into category (code, sector, industry) values ('GGG','Milk', 'Farming');

insert into asx ("Date", Code, Volume, Price) values ('2018-05-12', 'AAA', 12, 1);
insert into asx ("Date", Code, Volume, Price) values ('2018-05-13', 'AAA', 24, 0.75);
insert into asx ("Date", Code, Volume, Price) values ('2018-05-14', 'AAA', 15, 0.8);
insert into asx ("Date", Code, Volume, Price) values ('2018-05-15', 'AAA', 11, 0.93);
insert into asx ("Date", Code, Volume, Price) values ('2018-05-16', 'AAA', 8,  1.2);
insert into asx ("Date", Code, Volume, Price) values ('2018-05-17', 'AAA', 17, 1.22);
insert into asx ("Date", Code, Volume, Price) values ('2018-05-18', 'AAA', 16, 1.15);
insert into asx ("Date", Code, Volume, Price) values ('2018-05-19', 'AAA', 5,  1.02);
insert into asx ("Date", Code, Volume, Price) values ('2018-05-12' , 'BBB'  ,  766300 ,0.91 );
insert into asx ("Date", Code, Volume, Price) values ('2018-05-13' , 'BBB'  ,  766300 ,0.92 );
insert into asx ("Date", Code, Volume, Price) values ('2018-05-14' , 'BBB'  ,  693800 ,0.91 );
insert into asx ("Date", Code, Volume, Price) values ('2018-05-15' , 'BBB'  ,  741800 ,0.90 );
insert into asx ("Date", Code, Volume, Price) values ('2018-05-16' , 'BBB'  ,  663900 ,0.89 );
insert into asx ("Date", Code, Volume, Price) values ('2018-05-17' , 'BBB'  ,  521500 ,0.89 );
insert into asx ("Date", Code, Volume, Price) values ('2018-05-18' , 'BBB'  ,  441900 ,0.92 );
insert into asx ("Date", Code, Volume, Price) values ('2018-05-19' , 'BBB'  ,  382300 ,0.91 );
insert into asx ("Date", Code, Volume, Price) values ('2018-05-20' , 'BBB'  ,  388900 ,0.90 );
insert into asx ("Date", Code, Volume, Price) values ('2018-05-21' , 'BBB'  ,  391700 ,0.90 );
insert into asx ("Date", Code, Volume, Price) values ('2018-05-22' , 'BBB'  , 1503600 ,0.92 );