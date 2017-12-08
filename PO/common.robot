*** settings ***
library    OperatingSystem
library    Selenium2Library


*** variables ***
${url}  http://dev.code4socialgood.org/
#${url}    https://app.code4socialgood.org/
${browser}  ff

*** keywords ***
Setup Chromedriver
    Set Environment Variable    webdriver.chrome.driver    C:\lib\chromedriver.exe

Setup Firefoxdriver
    Set Environment Variable    webdriver.gecko.driver    C:\lib\geckodriver.exe


    set selenium timeout  60
    
Begin Test
    open browser    ${url}    ${browser}
    #The below keyword throws error in the current webdriver version
    #Maximize Browser Window
    Set Window Size    1400    1080
    
End Test
    close browser
