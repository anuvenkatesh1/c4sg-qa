# similar to 'import' in python. Importing standard/external libraries
# press ctrl+space to display built-in keywords 
*** settings ***
resource  PO/common.robot
resource  PO/HomePage.robot
resource    resources/login_vars.txt
    

Suite Setup    Run Keywords    Setup Firefoxdriver
#use Run Keywords when executing multiple keywords on test set up
Test Setup    Run Keywords    common.Begin Test    Go to Home Page and Click Login
Test Teardown    common.End Test
#use this if setting a global template for all testcases in this suite
Test Template    login
       

*** variables ***


#Login Test Case Suite
*** Test Cases ***    username    password    msg
login using Goolge credentials    ${google_username}    ${google_pw}    ${logged_in_msg}    
    [template]    Google Login 
    
login using facebook credentials
    #override default templete
    [template]    FB Login
    ${fb_username}    ${fb_pass}    ${logged_in_msg}

login with empty data    ${empty}    ${empty}    ${err_msg_empty}

login with unregistered data    ${unregis_user}    ${pw}    ${err_msg_invalid}
    
login with invalid data    ${invalid_email}    ${pw}    ${err_msg_invalid}
    
login with registered but unverified email address    ${regis_unverified_email}    ${pw}    ${err_msg_registered_unverified}
    
login with registered email address and repeat visit    ${valid_email}    ${pw}    ${logged_in_msg}

*** comment ***
login registered verified but first login    ${valid_email}    ${pw}    ${empty}


*** keywords ***
Go to Home Page and Click Login
    HomePage.verify page loaded
    HomePage.Click Login

Logout
    Wait Until Element Is Enabled    //nav/div/ul[2]/li[4]/a/my-user-avatar-header/img    
    Mouse Over    //nav/div/ul[2]/li[4]/a/my-user-avatar-header/img
    Click Element    //ul[@id='dropdownprojectcollapse']/li[3]/a
    Wait Until Page Does Not Contain    Log Out        
    
    
Submit Credentials
    [Arguments]    ${username}    ${password}    ${msg}
    log    ${username}
    log    ${password}
    log    ${msg} 
    Input Text    email    ${username}
    Input Password    password    ${password}
    Click Button    btn-login
    wait until page contains    ${msg}   
    Run Keyword If    ${msg} == 'Log Out'    Logout  
       
    
login
    [Arguments]    ${username}    ${password}    ${msg}
    Submit Credentials    ${username}    ${password}    ${msg}
    Capture Page Screenshot    
    
FB Login
    [Arguments]    ${username}    ${password}    ${msg}
    Click Button    btn-fb
    Wait Until Page Contains    Log into Facebook
    Input Text    email    ${username}
    Input Text    pass    ${password}
    Submit Form    
    Wait Until Page Contains    ${msg}  
    Run Keyword If    ${msg} == 'Log Out'    Logout  
    
Google Login
    [Arguments]    ${username}    ${password}    ${msg}
    Click Button    btn-google
    Wait Until Page Contains Element    identifierId
    Input Text    identifierId    ${username}
    Click Element    css=span.RveJvd.snByac
    Wait Until Element Is Visible    name=password    
    Input Text    name=password    abi2007sneha2001
    Click Element    css=span.RveJvd.snByac
    Wait Until Page Contains    ${msg}
    Run Keyword If    '${msg}' == 'Log Out'    Logout  
 
    
    

  
    

            