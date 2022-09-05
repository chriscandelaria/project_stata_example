/*******************************************************************************
* Purpose: Regression analysis
 
* -project- Programming Notes:
* (1) project, do(filename)  //run nested do file
* (2) project, original(filename)  // input file dependency 
* (3) project, uses(filename) // input dependency, previously created in project
* (4) project, relies_on(filename) // input dependency, not accessed in .do file
* (5) project, creates(filename) // output dependency created from this .do file
*******************************************************************************/

*
* Set version
* 
version 17.0
*
* Extract meta data
*
project, doinfo
glo root "`r(pdir)'"
glo dofile "`r(dofile)'"
*
* Load the data
*
project, uses("../data/derived/data_gpa02_v01.dta")
use "../data/derived/data_gpa02_v01.dta"
*
* Make a scatter plot
*
twoway (scatter trmgpa sat)
*
* Save the figure
*
graph export "../scratch/figures/${dofile}.pdf", replace
project, creates("../scratch/figures/${dofile}.pdf")
* end file
