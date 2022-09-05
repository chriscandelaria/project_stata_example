/* 
-------------------------------------------------------------------------------

To ensure replicability and make this project portable, we install
local copies of user-written programs.

-------------------------------------------------------------------------------
*/

version 12.1
    
    
* Install user-written programs that are distributed as Stata packages. We only
* need to install/uninstall/update packages once so uncomment the code as needed

    net set ado "../ado/"    // packages will now be installed in this directory
    
    *ssc install estout //EXAMPLE
    
* If we want to uninstall programs, here's a sample of the correct syntax

*    ado uninstall educationdata, from("../ado/")

* If we want to check for updates,

*    adoupdate, dir("../ado/") update
      
* Show what packages are installed in this directory

    ado dir, from("../ado/")
        
* end file

