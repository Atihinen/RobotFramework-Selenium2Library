*** Settings ***
Documentation   Common variables and keywords
Library         Selenium2Library  0  implicit_wait=10    # Set explicit wait to 0 and implicit 
Library         Collections

*** Variables ***

*** Keywords ***
Open Browser And Go To Frontpage
    Open Browser    ${SERVER}    ${BROWSER}
    Select Window    title=Eficode | Eficode: Excellence in software development
    Maximize Browser Window

Open frontpage
    Go To  ${SERVER}

Navigate And Verify Location
    [Arguments]    ${url}    ${title}
    Go To    ${url}
    Location Should Be    ${url}
    Title Should Be    ${title}

Navigate By Link And Verify Location
    [Arguments]    ${link_text}    ${link_location}
    Click Link    ${link_text}
    Location Should Be    ${link_location}


