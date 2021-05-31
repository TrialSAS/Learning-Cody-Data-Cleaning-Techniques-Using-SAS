%macro Test_Regex(Regex=,String=);

data _null_;
	file print;
	put "Regular Expression is : &Regex"
		"String is : &String";
	Position= prxmatch("&Regex","&String");
	if position then put "Match made starting in position" Position;
	else put "No match";
run;
%Mend Test_Regex;

