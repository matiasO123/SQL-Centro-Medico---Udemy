-- tabla temporal en memoria
declare @tablatemp table(id int identity (1,1), pais varchar(50));

insert into @tablatemp values ('Mexico');
insert into @tablatemp values ('Venezuela');
insert into @tablatemp values ('Colombia');
insert into @tablatemp values ('Ecuador');
insert into @tablatemp values ('Francia');
insert into @tablatemp values ('Alemania');
insert into @tablatemp values ('España');

select * from @tablatemp

-- tabla temporal física
create table #tablatempFis (id int identity (1,1), pais varchar(50));

insert into #tablatempFis values ('Mexico');
insert into #tablatempFis values ('Venezuela');
insert into #tablatempFis values ('Colombia');
insert into #tablatempFis values ('Ecuador');
insert into #tablatempFis values ('Francia');
insert into #tablatempFis values ('Alemania');
insert into #tablatempFis values ('España');

select * from #tablatempFis