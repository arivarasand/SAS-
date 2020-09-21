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

data do;
set a;
Id=_n_;
rename Model=label
	    Id=start;
fmtname='do';
	    run;
proc format library=work cntlin=do;
run;
	    
data dt;
set a;
Id=_n_;
rename Make=label
	    id=start;
fmtname='dt';
	    run;
proc format library=work cntlin=dt;
run;	    
	 


Data lookup;
set b;
Model=put(Id,do.);
Make= put(Id,dt.);
run;

proc print data =lookup noobs;
var ID Make Model MSRP Invoice ;
run;







