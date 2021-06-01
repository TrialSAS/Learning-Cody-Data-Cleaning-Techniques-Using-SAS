libname Clean 'D:\SASShare\Data\github\Learning-Cody-Data-Cleaning-Techniques-Using-SAS';
data Clean.Addresses;
	input 	#1 Name $20.
			#2 Street $30.
			#3 	@1 City $20.
				@21 State $2.
				@23 Zip $10.;
datalines;	
Robet L. Stevenson
12 River Road
Hartford	           CN06101
Mr.Fred Silver
145A Union Court
Flemingron          NJ08822
Mrs. Beverly Bliss
6767 Camp Verde Road East
Center Point        tx78010
Mr. Dennis Brown,Jr.
67 First Street
Miami               FL33101
Ms. Sylvia D'AMORE
23 Upper Valley Rd.
Clear Lake          WI154005
;
