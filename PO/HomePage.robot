*** settings ***
library  Selenium2Library

*** variables ***
${featured_items_count}    3



*** Keywords ***
verify page loaded
    #wait until the three dots for the featured item appears
    Wait Until Page Contains Element    //i[@class='activator material-icons right'][1]
    #another way of assertion
    page should contain  ONE PROJECT AT A TIME
    #assert the presence of map
    Page Should Contain Element    //div[@class='agm-map-container-inner sebm-google-map-container-inner']  
     

verify featured items
    Comment    Count number Of featured items on the Page
    ${AllLinksCount}    Get Matching Xpath Count    //i[@class='activator material-icons right']
    log  ${AllLinksCount}
    Should Be equal    ${AllLinksCount}    ${featured_items_count}   
    
    Comment    Loop through and click on each featured item
    :FOR    ${index}    IN range    1   ${AllLinksCount}    
    \    log  ${index}
    \    Wait Until Element Is Enabled    //div[@class='col s12 m4'][${index}]/div/div[2]/i    
    \    Click Element  //div[@class='col s12 m4'][${index}]/div/div[2]/i
    \    Wait Until Element Is Enabled    //div[@class='col s12 m4'][${index}]/div/div[3]/span/i
    \    Click Element    //div[@class='col s12 m4'][${index}]/div/div[3]/span/i
    \    Capture Page Screenshot 

Click Login
    Page Should Contain Button    css=ul.right.hide-on-med-and-down > li:nth-child(4) > a > span > button[type="button"]
    
    Click Element    css=ul.right.hide-on-med-and-down > li:nth-child(4) > a > span > button[type="button"]
    Wait Until Page Contains Element    email


    