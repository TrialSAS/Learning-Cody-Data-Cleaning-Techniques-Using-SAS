/*Using a Regex to Test the Dx Values*/

libname Clean 'D:\SASShare\Data\github\Learning-Cody-Data-Cleaning-Techniques-Using-SAS\';

data _null_;
	file print;
	set Clean.patients(keep = Patno Dx);
	/* 查找并返回不满足"/\d\d\d\.\d\d\d/"的值。*/
	if not prxmatch("/\d\d\d\.\d\d\d/",Dx) then
		put "Error for patient " Patno " Dx code= " Dx;
run;
	
/*PRXMATCH函数
语法：PRXMATCH(perl-regular-expression, source) 
再source中查找与正则表达式匹配的值，并返回查找到的位置。
*/

/*结果：
Error for patient 011  Dx code= 530.abc                                                                                             
Error for patient 091  Dx code=                                                                                                     
Error for patient 094  Dx code= V23.000                                                                                             
*/