/*Using a PUT Function to Standardize the Company Names*/
data Standard;
	set Company;
	Standard_Name=put(Name,$Company.);
run;

title "Listing of Standard";
proc print data = Standard noobs;
run;

/*put函数
作用：使用指定的format返回一个值。
Returns a value using a specified format.
语法：PUT(source, format.) 
参数format.  必须是一个format名，且带有一个句号“.” 。
*/