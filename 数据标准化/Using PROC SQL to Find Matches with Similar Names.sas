/*Discharge中：姓的首字母大写，性别大写。*/
data Clean.Discharge;
	set Clean.Discharge;
	LastName=propcase(LastName,"'");
	Gender=Upcase(Gender);
run;

/*MI中：LastName首字母大写， */
/*语法： PROPCASE(argument <, delimiters>)
参数<,delimiters>指定分隔符，如Delacroix, Eugene# EUGENE DELACROIX
使用# 为分隔符，则Delacroix, Eugene是一个值，EUGENE DELACROIX是一个值，
而不会使用逗号和空格作为分隔符。*/
data Clean.MI;
	set Clean.MI;
	LastName=propcase(LastName_MI,"'");
	Gender_MI=upcase(Gender_MI);
run;

/*创建表join*/
title "Creating a Cartesian Product";
proc sql;
	create table Clean.join as 
	select * 
	from Clean.Discharge,Clean.MI;
quit;

title "Listing of Data Set JOIN";
proc print data = Clean.join;
	id LastName;
run;

/*创建表Exact */
proc sql;
	create table Clean.Exact as 
	select *
	from Clean.Discharge, Clean.MI
	where DOB eq DOB_MI		and
		gender eq Gender_MI and
		LastName=LastName_MI;
quit;

/*创建表Possible，使用方法SPEDIS()选取惩罚分在0-25之间的值。*/
proc sql;
	Create table Clean.Possible as 
	select *
	from Clean.discharge,Clean.MI
	where DOB eq DOB_MI	 and
		Gender eq Gener_MI and
		0 lt spedis(LastName,LastName_MI) le 25;
quit;
