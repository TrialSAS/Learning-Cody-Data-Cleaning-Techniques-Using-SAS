/*DATA Step to Convert the Standardize Data Set Into the Control Data Set*/

/*这段代码的作用就是创建CNTLIN= input-control-SAS-data-set*/
data Control;
	set Standardize(rename =  (Alternate=Start Standard=Label));
	/*这里将Alternate的变量名修改为Start，将Standard的变量名修改为Label。*/
	retain Fmtname "Company" Type "C";
	/*RETAIN创建两个变量fmtname，Type并赋予初始值，同时在data步中retain其值。*/
run;

/*
1. set语句的作用：从一个或多个数据集中读取一个观测。
Reads an observation from one or more SAS data sets.
语法：
SET<SAS-data-set(s) <(data-set-options(s) )> > 
<options>; 

2. retain 在DATA步的迭代中保留值到下一次迭代。
语法：RETAIN  <element-list(s) <initial-value(s) |(initial-value-1)| (initial-value-list-1)> 
<... element-list-n <initial-value-n |(initial-value-n )| (initial-value-list-n)> >>;
*/

/*---------------------------------------------------*/
/* 这段代码使用上面程序创建的data set用来创建format。  */

proc format libaray=work cntlin = Control fmtlib;  /*上个程序创建了Control*/
run;

/*FORMAT的元素包含START、END、LABEL。上面的代码已经自定义了start、label。*/
/*
Control data sets have special requirements for the variable names that hold the value to be formatted, 
the label associated with this value, the format name, and whether the format is character or numeric. 
构建FORMAT必须的变量名：
Start：范围内的起始值。
End：范围的末尾值。比如有一个10-20的范围，那么10就是start，20就是end。
Label：format的label。
Fmtname：要创建的format的名字。不能在这里加$美元符号。
Type：要创建的format的type。如C或N。
*/

/*Format：
语法：PROC FORMAT <option(s)>; 
其中，options的选项有：
CASFMTLIB='name'
CNTLIN=input-control-SAS-data-set    指定控制数据集，用来创建format或informat。
CNTOUT=output-control-SAS-data-set   生成一个SAS数据集用来存放informat或format的信息。
	这个数据集存放在由LIBRARY= 选项指定的目录下。
FMTLIB 打印由LIBRARY=选项指定的目录下的informat或format的信息。
LIBRARY= libref<.catalog> 指定一个SAS library或目录用来存放生成的format或informat。
LOCALE: specifies to create a format catalog that correspondsto the current SAS locale. 
	以当前的SAS LOCALE 生成一个format 目录。
	其中，LOCALE表示本地化。比如：zh_CN 表示中文。en_US 表示美国。
*/
/*
 If the SAS locale is German_Germany, the POSIX localevalue is de_DE. 
 Using the following PROC FORMAT statement,  SAS createsthe catalog 
 mylib.formats_de_DE to store formats and informats  created by this procedure: 
	proc format locale lib=mylib.formats
 这里的locale是德国德语，所以SAS会生成目录“mylib.formats_de_DE”来存放FORMAT.
*/
