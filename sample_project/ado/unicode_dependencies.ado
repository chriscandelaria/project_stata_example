*! version 1.0.0  08jul2015  Robert Picard, picard@netbox.com
program define unicode_dependencies

    version 14


* attach all backup files to the project

    filelist , dir(../ado/bak.stunicode)
    local nobs = _N
    if `nobs' {
        
        forvalues i = 1/`nobs' {
            
            project, relies_on("`=dirname[`i']'/`=filename[`i']'") preserve
            
        }
    }
    
end
