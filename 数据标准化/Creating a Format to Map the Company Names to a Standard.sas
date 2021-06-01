/*Creating a Format to Map the Company Names to a Standard*/

proc format;
	value $Company
		/*指定"International Business Machines"为标准名称。*/
		"International Business Machines,Inc."=
		"International Business Machines"
		"IBM"="International Business Machines"
		/*指定"Little and Sons"为标准名称。*/
		"Little & Sons"="Little and Sons"
		"Little and Son"="Little and Sons"
		
		"Machenrys"="McHenrys"
		"MacHenries"="McHenrys"
		"McHenry's"="McHenrys";
run;

/*format
作用：为变量创建用户自定义的formats 和informats。
语法：PROC FORMAT <option(s)>; 
options选项：
1. CNTLIN=input-control-SAS-data-set 指定一个数据集用来创建informat或format

2. casfmtlib： 给CAS会话添加一个format library。
	（只有在SAS Cloud Analytics Services（CAS）session使用。）
	
3. LIBRARY=libref<.catlog> 指定一个SAS library或目录用来包含生成的informats或formats。
	如果省略了这个选项，生成的formats和informats会存放在WORK.Formats目录下。
	如果制定了LIBRARY=选项，但未指定目录名称catlog，formats和informats会存放在libref.FORMATS目录下。

	

*/