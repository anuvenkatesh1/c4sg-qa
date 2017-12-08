*** settings ***
resource  PO/common.robot
resource  PO/HomePage.robot
resource    resources/login_vars.txt

Suite Setup    Run Keywords    Setup Firefoxdriver
#use Run Keywords when executing multiple keywords on test set up
Test Setup    Run Keywords    common.Begin Test    Go to Home Page and Click Login
Test Teardown    common.End Test
#use this if setting a global template for all testcases in this suite
Test Template    Forgot Password

*** test cases ***    username    msg
Forgot Password with Empty Email Address    ${empty}    ${forgot_pw_empty_email_msg}     
Forgot Password with Invalid Email Address    ${invalid_email}    ${forgot_pw_invalid_email_msg}
Forgot Password with Unregistered Email Address    ${invalid_email}    ${forgot_pw_invalid_email_msg}
Forgot Password with Registered Email Address    ${valid_email}    ${forgot_pw_invalid_email_msg}


*** keywords ***
Go to Home Page and Click Login
    HomePage.verify page loaded
    HomePage.Click Login
    
Forgot Password
    [Arguments]    ${username}    ${msg}
    Input Text    email    ${username}
    Click Link    Forgot Password
    Wait Until Page Contains    ${msg}   
    
    