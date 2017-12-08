# similar to 'import' in python. Importing standard/external libraries
# press ctrl+space to display built-in keywords 
*** settings ***
resource  PO/common.robot
resource  PO/HomePage.robot

Suite Setup    Run Keywords    Setup Firefoxdriver
Test Setup    Run Keywords    common.Begin Test    HomePage.verify page loaded
Test Teardown    common.End Test

*** keywords ***
organization
     Click Element    css=ul.right.hide-on-med-and-down > li:nth-child(3) > a.nav-link > span
     Wait Until Page Contains    organizations found  
     
projects
    Click Element    css=ul.right.hide-on-med-and-down > li:nth-child(1) > a.nav-link > span
    Wait Until Page Contains    projects found
    
volunteers
    Click Element    css=ul.right.hide-on-med-and-down > li:nth-child(2) > a.nav-link > span
    Wait Until Page Contains    volunteers found
    
click logo
    Click Image    a.brand-logo.largeScreen.hide-on-med-and-down > img
    Wait Until Page Contains    WE ARE CHANGING THE WORLD    

*** Test Cases ***

#c4sg_featuredItems_TC001
    # this is used to print stuff in report/console
   # [documentation]  Check if Featured items expansion on Home Page works   
   # HomePage.verify featured items
      
 
 C4SG_Header_links_TC024
     [documentation]    Check the header links landing pages
     comment   Organization
     organization
     comment    Projects
     projects
     comment    Volunteers
     volunteers
     click logo
     
     
  
 
 
     
      
            
    
    
    