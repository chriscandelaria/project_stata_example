/*
Purpose: Master .do file to illustrate the use
        of -project-, which was written by Robert Picard. 

NOTE: In order for this program to run, you must have project installed.
      If you are running Stata 16 and above, you may download a version forked
      from Michael Stepner via Candelaria's Github page: 
net install project, from(https://github.com/chriscandelaria/project_stata/raw/main)

* -project- Programming Notes:
* (1) project, do(filename)  //run nested do file
* (2) project, original(filename)  // input file dependency 
* (3) project, uses(filename) // input dependency, previously created in project
* (4) project, relies_on(filename) // input dependency, not accessed in .do file
* (5) project, creates(filename) // output dependency created from this .do file
*/

*
* Main settings
*
version 17.0
set more off
set varabbrev off // No shortcuts for variable names allowed
set linesize 132 // use 7pt font for printing
*
* Extract meta data
*
project, doinfo
glo root "`r(pdir)'"
glo dofile "`r(dofile)'"
*
* Create relevant folders
* Technically, you can comment out the following code block after having run
* project the first time
*
cap mkdir "${root}/ado"
cap mkdir "${root}/data"
cap mkdir "${root}/data/raw"
cap mkdir "${root}/data/derived"
cap mkdir "${root}/scratch"
cap mkdir "${root}/scratch/data"
cap mkdir "${root}/scratch/figures"
cap mkdir "${root}/scratch/tables"
cap mkdir "${root}/manuscript"
*
* This project may use user-written commands that are not part of the
* official Stata installation. To ensure replication, we include local
* copies in the "ado" subdirectory and put "ado" in front of the ado path
* so that its content has priority over other versions installed
* elsewhere. 
*
adopath ++ "${root}/ado"
*
* Install user-written programs
* NOTE: Look in this .do file to see which programs were installed
* Once the files are installed, you should comment out the lines of code that
* install them.
* -estout- was installed and has now been commented out.
*
project, do("progs/!install_user-written_programs.do")
*
* Add dependencies for user-written programs used in this project
*
project, do("progs/!add_user-written_program_dependencies.do")

*******************
*******************
**
** CODING EXAMPLE
**
*******************
*******************

*******************
***** PREPARE DATA
*******************

***
*** PART 1: Download data files and declare them as original files
***         Once downloaded, you may wish to comment out the "copy" or "import" 
***         within the .do file. This ensures there is a record of how the data 
***         were obtained.
***
*
* Download a data set, gpa.dta, from Jeff Wooldridge's Econometric Analysis of 
* Cross Section and Panel Data book via the Stata website
*
project, do("progs/download_data_gpa_raw.do")
***
*** PART 2: Clean the data sets
***
*
* Open the GPA data set and create some new variables
* Note: 
*
project, do("progs/data_gpa01_v01.do")
*
* Create even more variables
*
project, do("progs/data_gpa02_v01.do")

********************
***** DATA ANALYSIS
********************

*
* Regression analysis 
* Export results to scratch 
*
project, do("progs/analysis_basicmodels01_v01.do")
*
* Make a graph
*
project, do("progs/analysis_graph01_v01.do")

********************
***** PREPARE TABLES AND FIGURES FOR DRAFT
********************
project, do("progs/assign_fig_tab_numbers_v01.do")

* end file
