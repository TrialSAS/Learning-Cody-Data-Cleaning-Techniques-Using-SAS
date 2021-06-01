data Std_Addresses;
	set Clean.Addresses;
	array Chars[*] Name Street City;
	/*使用这三个变量创建一个数组。这些变量会被函数COMPBL,PROPCASE处理。*/
	do i=1 to dim(Chars);
	/* DIM()函数返回array中元素的数量。这里dim(Chars)的值为3（3个变量） */
		Chars[i] =compbl(Chars[i]);
		/*COMPBL()函数将多个空格转为1个空格。*/
		Chars[i]=propcase(Chars[i]," '");
		/*Propcase（）函数将第一个字母为大写，其他小写。 参数" '"一个空格，一个单引号，
		作为delimiter，确保名字D'AMORE 格式转为 D'Amore */
	end;

	Street=tranwrd(Street,"Road","Rd.");
	/* tranwrd()函数，将Street中的“Road”转为“Rd." */
	Street=tranwrd(Street,"Court","Ct.");
	Street=tranwrd(Street,"Street","St.");
	State=Upcase(State);

	Name=tranwrd(Name,"Jr."," "); /* Jr. 转为一个空格。 */
	Name=tranwrd(Name,","," ");  /*逗号,转为一个空格。*/
	drop i;
run;

proc print data = Std_Addresses noobs;	/*NOOBS表示在output中不产生观测序号observation number */
run;


/*ARRAY
语法：ARRAY array-name<{n} > <$> <length> <elements> <(initial-values)> ; 
如：array A{16}(0,3*1,4*(2,3,4));结果为：
0, 1, 1, 1, 2, 3, 4, 2, 3, 4, 2, 3, 4, 2, 3, 4 */

/*ARRAY arrayname [ dimensions ] <$> <variables-and-constants>; 
ARRAY statement is used to associate a name (of no more than eight characters)
 with a list of variables and constants.
 例如：array r[8] r1-r8; 表示数组 r有8个元素（变量）。
*/

/*DIM()函数
Retrieves the dimensions of an array or dictionary
数组或字典的维数。
语法： DIM (array-name); 
The DIM function returns the number of elements in a one-dimensional array, 
or the number of elements in a specified dimension of a multidimensional array. 
DIM返回一维数组中元素的个数 ，或 多维数组中指定维度的元素个数。*/

/*tranwrd函数
功能：Replaces all occurrences of a substring in a characterstring.
语法：TRANWRD(source, target, replacement) 
使用replacement代替source中出现的所有target。
可以用tranwrd来移除字符串中的特殊字符/空格。
如：newtext=tranwrd(mytxt, ',,,', ',');移除重复的逗号。
*/