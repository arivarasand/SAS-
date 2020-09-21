/*JOIN LOOKUP*/


data a;
set sashelp.cars(keep= Make Model);
Id=_n_;
run;

data b;
set sashelp.cars(keep =MSRP Invoice);
Id=_n_;
run;

PROC SQL;
create table Join_lookup as
select a.Make,a.Model,b.MSRP,b.Invoice from a
Left join b 
on a.Id=b.Id ;
run;

PROC SQL;
create table Join_lookup as
select a.Make,a.Model,b.MSRP,b.Invoice from a
right join b 
on a.Id=b.Id ;
run;

PROC SQL;
create table Join_lookup as
select a.Make,a.Model,b.MSRP,b.Invoice from a
inner join b 
on a.Id=b.Id ;
run;

PROC SQL;
create table Join_lookup as
select a.Make,a.Model,b.MSRP,b.Invoice from a
full join b 
on a.Id=b.Id ;
run;




