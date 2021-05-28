/*Perform an Operation on All Character Variables in a Dataset
对数据集中所有的变量执行同一个操作。*/

libname Clean 'D:\SASShare\Data\github\Learning-Cody-Data-Cleaning-Techniques-Using-SAS';

data Clean.Patients_Caps;
	set Clean.Patients;
	array Chars[*] _character_;  /*因为不知道数组中有多少个元素，就用了“*”。 */
	do i=1 to dim(Chars);
		
		Chars[i]=upcase(Chars[i]);
	end;
	drop i;
run;

/*
_CHARACTER_ 生成一个数组，包含数据集中所有字符变量。如Patient中包含变量：
Patno、Account_No、Gender、Visit、HR、SBP等变量,其中只有Account_No和Gender是
Character Variable，将这两个变量包含在_CHARACTER_中。
*/
/*在ARRAY语句：
ARRAY  array-name { subscript } 
	<$ length | length |  VARCHAR(length) | VARCHAR(*)> 
	<array-elements> <(initial-value-list)>; 
	在这个例子中，Chars是array-name，[*]是subscript下标。
	_CHARACTER_是<array-elements>指定构成array的元素的名称。
*/
/*函数DIM() 获取数组的维数。
语法：DIM (array-name)
DIM()返回一维数组的元素格式，或返回多维数组中指定维度的元素个数; 

*/


