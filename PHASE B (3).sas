
/* I certify that the SAS code given our originial and exclusive work */

filename csv "/home/u45012722/STA 3024 Personal Coursework/nbastats2018-2019.csv" termstr=crlf;

proc import datafile=csv
			out=nba
			dbms=csv
			replace;

run;

proc print data=nba; 
run;
length




/*NBA Data*/
data nba; 
infile '/home/u45012722/STA 3024 Personal Coursework/nbastats2018-2019.csv' dlm=','  firstobs=2;
input Name $ Height Salary Points;

run; 

proc print data=nba;
run;


/*Data Exploration via Graphical Display*/
/*bar graph for height*/
proc sgplot data=nba;
	vbar height / stat=freq; 
run;

/*Histogram for Salary*/
proc sgplot data=nba;
	histogram salary/nbins=25; /*requests 25 bars*/
run;

/*Histogram for Points*/
proc sgplot data=nba;
	histogram points/nbins=25; /*requests 25 bars*/
run;


/* MULTIVARIABLE SECTION*/

/*bar graph for heights and points*/
proc sgplot data=nba;
	vbar height/response=points stat=mean
	          group=salary groupdisplay=cluster
	          fillattrs=(color=yellow); /*Each bar the same color*/
run;

/*Bar graph for salary and points and height apparently*/
proc sgplot data=nba;
scatter x=salary y=Points /markerattrs=(symbol=squarefilled color=orange);
scatter x=salary y=Height /markerattrs=(symbol=diamondfilled color=yellow);
run;




/*Data Description via Numerical Summaries*/ 

/*height and points numerical summary*/ 
Proc means data=nba;
	var  height points;	
run;

/*points and salary numerical summary */ 
proc corr data=nba noprob;
var points salary;
run;

 




















































