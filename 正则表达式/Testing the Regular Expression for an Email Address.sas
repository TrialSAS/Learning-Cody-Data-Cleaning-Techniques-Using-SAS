/*Testing the Regular Expression for an Email Address*/

data _null_;
	file print;
	input Email $50.;
	if not prxmatch("/\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,6}\b/i",
		Email) then
		put "Invalid Email Address" Email;
datalines;
Jeff.Clark@google.com
no_at_sign_here
1234567890.1234567
fred@rr.tt.org
Bill_baker@Kerrville.edu
A.B.C@def.too_long
ABC012._%+-@gmail.com
;
/*
("/\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}\b/")
*/
/*  "/\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,6}\b/i"
表示：\b 表示单词的开头或结尾，是单词的边界。
[A-Z0-9._%+-] 表示：这些字符是被允许的。
+ 加号表示：匹配前面的字符一次或多次。
{2，6}表示匹配前面的字符至少2次，但不能超过6次。
i 表示不区分大小写。 */

/*结果：
Invalid Email Addressno_at_sign_here 
Invalid Email Address1234567890.1234567
Invalid Email AddressA.B.C@def.too_long 
*/