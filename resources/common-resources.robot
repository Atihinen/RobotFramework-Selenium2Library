*** Settings ***
Documentation   Common variables and keywords
Library         Selenium2Library  0  implicit_wait=10    # Set explicit wait to 0 and implicit 

*** Keywords ***
Open Browser And Go To Production
    Open Browser  ${SERVER}  ${BROWSER}
    Select Window    title=Eficode | Eficode: Excellence in software development
    #Maximize Browser Window

Open frontpage
    Go To  ${SERVER}
