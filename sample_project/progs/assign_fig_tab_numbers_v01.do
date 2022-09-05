/*******************************************************************************
* Purpose: Correspondence between output and manuscript figures and tables
* 
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
version 15.1 
*
* Extract meta data
*
project, doinfo
glo root "`r(pdir)'"
glo dofile "`r(dofile)'"
*
* Create output folders
*

* FIGURE 1
copy ../scratch/figures/analysis_graph01_v01.pdf ../manuscript/figure01.pdf, replace
 
* Table 1 
copy ../scratch/tables/analysis_basicmodels01_v01.csv ../manuscript/table01.csv, replace

*end
