/ Judley Joseph  Phase C regression*/
/* We certify that the SAS code given our originial and exclusive work */

filename csv "/home/u45012722/STA 3024 Personal Coursework/nbastats2018-2019.csv" termstr=crlf;

proc import datafile=csv
			out=nba
			dbms=csv
			replace;

run;

proc print data=nba; 
run;

proc reg data=nba;
model age = points;
run;