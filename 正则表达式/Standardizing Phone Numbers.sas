/*将电话号码的格式规范化*/

data Standard_Phone;
	input Phone $16.;
	Digits = compress(Phone,,'kd');
	Phone=cats('(',substr(Digits,1,3),')',substr(Digits,4,3),
		'_',substr(Digits,7));
	drop Digits;
datlines;
(908)123-1234
609.455-7654
210782999
(800)  123-4567
run;

proc print data = Standard_Phone noobs;
run;

/*
compress(Phone,,'kd') 表示：保留Phone中的数字。

语法：COMPRESS(source <, characters> <, modifier(s)>) 
从source中移除characters，返回新字符串。
第三个变量modifier指定一个字符常量，如果k/K，表示保留characters中的字符，而不是删除。
如果是i/I，表示忽略大小写。d/D， 表示添加数字到characters列表。
*/

/*cats函数： 移除开头和结尾的空格，返回一个连续的字符串。
语法：CATS(item-1 <, …, item-n>)  如果item是数字，则会使用BESTw.格式转换为字符串。
cats有两个功能：移除空格，连接多个字符串成为一个字符串。
如
CAT(OF X1-X4)作用等价于  X1||X2||X3||X4
*/

/*
substr(Digits,1,3) 
语法：SUBSTR(matrix, position <, length> ); 
表示从position开始，截取一个长度为length的新字符串。
*/

/* drop Digits；解释：
表示：The DROP statement specifies that some variables 
be excluded from the OUT= data set。 */