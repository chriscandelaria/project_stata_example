/***
To ensure replicability and make this project portable, we use local copies of
user-written programs.
***/

*
* Dependencies for programs not installed using Stata packages (i.e. these files
* are just saved to this directory)
*
  
which package_dependencies
project, original("../ado/package_dependencies.ado")

which unicode_dependencies
project, original("../ado/unicode_dependencies.ado")


*       
* Add dependencies for all files installed using Stata packages in this 
* directory. This will only be run if 
* "install_user-written_programs.do" has been updated
*
project, relies_on("!install_user-written_programs.do")
package_dependencies
*unicode_dependencies //not presently used in this project

* end file
