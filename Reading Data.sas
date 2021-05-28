libname Clean 'D:\SASShare\Data\github\Learning-Cody-Data-Cleaning-Techniques-Using-SAS';

data Clean.Patients;
	infile 'D:\SASShare\Data\github\Learning-Cody-Data-Cleaning-Techniques-Using-SAS\Patients.txt';

	input 	@1 Patno $3.
			@4 Account_No $7.
			@11 Gender $1.
			@12 Visit mmddyy10.    /*这里的mmddyy10.是informat*/
			@22 HR 3.
			@25 SBP 3.
			@28 DBP 3.
			@31 Dx $7.
			@38 AE 1.;
	label 	Patno = "Patient Number"
			Account_No="Account Number"
			Gender = "Gender"
			Visit="Visit Date"
			HR = "Heart Rate"
			SBP = "Systolic Blood Pressure"
			DBP="Diastolic Blood Pressue"
			Dx="Diagnosis Code"
			AE="Adverse Event?";
	format Visit mmddyy10.;   /*这里的mmddyy10.是format*/
run;

proc sort data = Clean.Patients;
	by Patno Visit;
run;

proc print data = Clean.Patients;
	id Patno;
run;


/*
PROC PRINT <option(s)>; 
	BY <DESCENDING> variable-1 <<DESCENDING> variable-2 ...> <NOTSORTED>; 
		PAGEBY BY-variable; 
		SUMBY BY-variable; 
	ID variable(s)
		</ STYLE <(location(s))>=<style-override>>; 

	SUM variable(s) 
		</ STYLE <(location(s))>=<style-override>>; 
	VAR variable(s) 
		</ STYLE <(location(s))>=<style-override> >; 
*/
/*
ID 作用: 通过列出的 变量的格式化值 来标识观察值，而不是通过观察值编号。
Identify observations by the formatted values of thevariables that you list 
instead of by observation numbers 
语法：ID variable(s)</ STYLE <(location(s))>=<style-override(s)> >; 
variables表示：指定一个或多个变量 在report的每行的最前面打印出来。而不是observation number.
如果同一个variable在ID语句后面用了，在var语句后面语句后面也用了，则会将这个variable打印两次。
*/


				