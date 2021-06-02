libname Clean 'D:\SASShare\Data\github\Learning-Cody-Data-Cleaning-Techniques-Using-SAS';
data Remove_Names;
	set Clean.Addresses(keep = Street);
	Original=Street;
	Words="s/\sRoad\b|\sCourt\b|\sStreet\b";
	
	Abbreviations="|\sRd\.\s*$|\sCt\.\s*$|\sSt\.\s*$/ /";
	Regex=cats(Words,Abbreviations);
	/*cats( )函数去除参数首尾的空格，并将所有参数连接为一个连续的字符串。*/
	Street=prxchange(Regex,-1,Street);
	keep Original Street;
run;

/*正则表达式 "s/\sRoad\b|\sCourt\b|\sStreet\b" 解释：
函数PRXCHANGE()的正则表达式的规范是：s/regular-expression/replacement-string/ ，表示这是用来替换的正则表达式。
如：prxchange('s/world/planet/', 1, 'Hello world!'); 
\S 表示：匹配任何whitespace字符，包括space, tab, form feed, and so on,等价于：[\f\n\r\t\v]. 
Road\b 表示：匹配以Road结尾的单词。*/

/* Regex=cats(Words,Abbreviations);结果为：/"
s/\sRoad\b|\sCourt\b|\sStreet\b|sRd\.\s*$|\sCt\.\s*$|\sSt\.\s*$/ /

其中，\sRoad\b|\sCourt\b|\sStreet\b|\sRd\.\s*$|\sCt\.\s*$|\sSt\.\s*$是regular-expression,
其中，/ /之间的空格表示replacement-string。
最终的效果是：将Road、Court、Street、Rd. 、Ct. 、St. 等用空格代替，达到删除的效果。
*/

/*
CATS 函数
作用:Removes leading and trailing blanks, and returnsa concatenated character string. 
语法：CATS(item-1 <, …, item-n>) 
先去除item-1，...,item-n首尾的空格，然后将他们连接起来组成一个连续的字符串。
例如：CAT(OF X1-X4) 等价于： X1||X2||X3||X4
*/
/*
prxchange( )函数：实现查找替换。
语法：PRXCHANGE(perl-regular-expression | regular-expression-id, times, source) 
作用：
第一个参数表示匹配的正则表达式。
第二个参数times表示搜索和替换的次数。the number of times to searchfor a match and replace a matching pattern. 
	如果times的值为-1，表示一直匹配替换，直到末尾，即全部替换。 matching patterns continue to be replaced until theend of source is reached. 
第三个参数source：表示 需要执行替换的原始字符串，specifies a characterconstant, variable, or expression that you want to search. 。
例如：name=prxchange('s/(\w+), (\w+)/$2 $1/', -1, name);
表示：
*/