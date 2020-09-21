/* INDEX LOOKUP */

data a;
set sashelp.cars(keep= Make Model);
Id=_n_;
run;


data b(index=(A=(ID Make)));
set sashelp.cars(keep =Make MSRP Invoice);
ID=_n_;
run;

data lookup;
set a;
set b key=A;
run;

proc print data =lookup noobs;
var ID Make Model MSRP Invoice ;
run;
