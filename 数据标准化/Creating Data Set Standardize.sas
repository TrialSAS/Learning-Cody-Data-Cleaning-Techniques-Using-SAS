/*Creating Data Set Standardize*/

data Standardize;
	input 	@1 Alternate $40.
			@41 Standard $40.;
datalines;
International Business Machines, Inc.   International Business Machines
IBM International                       Business Machines
Little & Sons                           Little and Sons
Little and Son                          Little and Sons
MacHenrys                               McHenrys
MacHenries                              McHenrys
McHenry's                               McHenrys
;
