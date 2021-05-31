/*Testing the Regular Expression for US ZIP Codes*/

DATA _NULL_;
	file print;
	input Zip $10.;
	if  not prxmatch("/\d{5}(-d{4})?/",Zip) then
		put "Invalid Zip Code "  Zip;
datalines;
12345
78010-5049
12Z44
ABCDE
08822
;
RUN;

/* file print  
file  表示： 指定PUT语句的输出文件。
file print 表示将put的结果打印到结果窗口。如这里是：
     put "Invalid Zip Code "  Zip;
*/
/*
正则表达式："/\d{5}(-d{4})?/"
5个数字，一个“-”，5个数字。？表示匹配前面的(-d{4})零次或一次。
所以，这样的话：12345，78010-5049，08822都是符合正则表达式的。
*/

/*结果：
Invalid Zip Code 12Z44 
Invalid Zip Code ABCDE
*/