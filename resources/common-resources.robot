*** Settings ***
Documentation   Common variables and keywords
Library         Selenium2Library  0  implicit_wait=10    # Set explicit wait to 0 and implicit 
Library         Collections

*** Variables ***
@{software_finnish}=  ${SERVER}/palvelut/ohjelmistokehitys/  Eficode | Ohjelmistokehitys
@{software_english}=  ${SERVER}/en/services/software-development/  Eficode | Software
@{software_chinese}=  ${SERVER}/zh-hans/software-development/  Eficode | Software Development
@{VALID_URLS}  ${software_finnish}  ${software_english}  ${software_chinese}

*** Keywords ***
Open Browser And Go To Production
    Open Browser  ${SERVER}  ${BROWSER}
    Select Window    title=Eficode | Eficode: Excellence in software development
    #Maximize Browser Window

Open frontpage
    Go To  ${SERVER}

Navigate And Check Location
    [Arguments]  ${url}  ${title}
    Go To  ${url}
    Location Should Be  ${url}
    Title Should Be  ${title}


