/*MERGE LOOKUP*/


data a;
set sashelp.cars(keep= Make Model);
Id=_n_;
run;

data b;
set sashelp.cars(keep =MSRP Invoice);
ID=_n_;
run;

Proc sort data =work.a ;
by Id;
run;

Proc sort data =work.b ;
by Id;
run;

data merge_lookup;
merge a(in=x)
b(in=y);
by Id;
if x and y;
run;

data merge_lookup;
merge a(in=x)
b(in=y);
by Id;
if x ;
run;


data merge_lookup;
merge a(in=x)
b(in=y);
by Id;
if y ;
run;

data merge_lookup;
merge a(in=x)
b(in=y);
by Id;
if x and not y ;
run;

data merge_lookup;
merge a(in=x)
b(in=y);
by Id;
if y and not x;
run;


