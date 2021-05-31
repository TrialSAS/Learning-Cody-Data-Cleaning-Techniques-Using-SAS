/*Checking for Invalid Canadian Postal Codes*/
/*加拿大邮编格式为： LdLdLd 或 LdL dLd（L表示字母，d表示数字）
其中D,F,I,O,Q,U不能使用。第一个字母还不能使用W,Z。
所以，匹配加拿大邮编的正则表达式应为：
"/[ABCEFGHJ-NPQRSTVXY][0-9][ABCEFGHJ-NPRSTV-Z] ?[0-9]
[ABCEFGHJ-NPRSTV-Z][0-9]/"
*/

data _null_;
	First="/[ABCEFGHJ-NPQRSTVXY][0-9]";
	Second="[ABCEFGHJ-NPRSTV-Z]?[0-9]";   /*问好？前面是一个空格。*/
	Third="[ABCEFGHJ-NPRSTV-Z][0-9]/";
	file print;

	input CPC $7.;
	Regex=First||Second||Third;

	if not prxmatch(Regex,CPC) then
		put "Invalid Postal Code" CPC;
DATALINES;
A1B2C3
ABCDEF
A1B 2C3
D5C6F7
;

/*
INPUT 语句
描述input中数据记录的排列分布，并将输入的值分配给相应的SAS变量。
例如：
data club1;
   input Idno Name $18.
      Team $ 25-30 Startwght Endwght;
   datalines;
023 David Shaw         red    189 165
049 Amelia Serrano     yellow 189 165
;
其中，
变量  	  						 Input类型
Idno, Startwght, Endwght     	list input
Name							formatted input
Team						 	column input 
*/