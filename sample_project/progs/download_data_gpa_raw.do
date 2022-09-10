/*******************************************************************************
* Purpose: Download data set
 
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
* Download data set
* Save it with the same name as the .do file
*
copy "http://www.stata.com/data/jwooldridge/eacsap/gpa.dta" ///
    "../data/raw/${dofile}.dta", replace
*
* Declare data set as an original file
*
project, original("../data/raw/${dofile}.dta")

* end file
