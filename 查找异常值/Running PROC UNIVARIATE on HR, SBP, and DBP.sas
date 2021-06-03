title "Running PROC UNIVARIATE on HR,SBP,and DBP";
proc univariate data = Clean.Patients;
	id Patno;
	var HR SBP DBP;
	histogram /normal;
run;