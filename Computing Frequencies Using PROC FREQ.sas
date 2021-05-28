libname Clean 'D:\SASShare\Data\github\Learning-Cody-Data-Cleaning-Techniques-Using-SAS';

data Check_Char;
	set Clean.Patients(keep = Patno Account_No Gender);
	length State $ 2;
	State=Account_No;
	/*这里先将State的长度规定为2， 然后将Account_No赋值给State，只读取到前两位。	*/
run;

title "Frequencies for Gender and the First Two Digits of Account_No";
proc freq data = Check_Char;
	tables Gender State / nocum nopercent;
run;

/*

PROC FREQ  <options> ; 
	BY variables;    对每个BY Group单独分析。
	EXACT statistic-options </ computation-options> ;  要求精确test。
	OUTPUT  <OUT=SAS-data-set> output-options;  将统计结果输出到data set
	TABLES requests </ options> ;   指定tables。
	TEST options;   检验方法
	WEIGHT variable </ option> ;  权重
*/