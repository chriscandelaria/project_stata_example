*! version 1.0.2  29mar2015  Robert Picard, picard@netbox.com

* Candelaria updated so that this program runs from the main project folder
program define package_dependencies

    version 9


* Stata tracks what it installs in this directory via the -net- command
* using the following files

    project, original("../ado/stata.trk")
    cap project, relies_on("../ado/backup.trk")    // capture in case not there
    
    
* Loop over all installed files from Stata packages and add dependencies

    tempname trk
    file open `trk' using "../ado/stata.trk", read
    
    file read `trk' line
    
    
    while !r(eof) {
    
        if regexm(`"`line'"', "^f (.+)") {
        
            local fname = regexs(1)
            
            if regexm(`"`fname'"',"\.(ado|mlib)$") project, original(`"../ado/`fname'"') preserve
            else project, relies_on(`"../ado/`fname'"') preserve
            
        }
        
        file read `trk' line
    }
    
    file close `trk'
    
    
end
