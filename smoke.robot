*** Settings ***
Documentation    run pybot --variable ENVIRONMENT:env_file smoke.robot
Resource    resources/${ENVIRONMENT}.robot
Suite Setup    Open Browser And Go To Frontpage
Test Setup    Open frontpage
Suite Teardown    Close Browser

*** Variables ***

${english_link}=    English
${chinese_link}=    简体中文

*** Keywords ***

Get urls for software pages
    [Documentation]    Returns 2 dimensional list containing url and title for webpages
    @{software_finnish}=    Set Variable    ${SERVER}/palvelut/ohjelmistokehitys/    Eficode | Ohjelmistokehitys
    @{software_english}=    Set Variable    ${SERVER}/en/services/software-development/    Eficode | Software
    @{software_chinese}=    Set Variable    ${SERVER}/zh-hans/software-development/    Eficode | Software Development
    [Return]    ${software_finnish}    ${software_english}    ${software_chinese}
    

Verify urls are valid
    [Documentation]    Loop 2 dimensional list and check that url is valid and has correct title
    [Arguments]    @{valid_pages}
    :FOR    ${page}    IN    @{valid_pages}
    \    Navigate And Check Location    ${page[0]}    ${page[1]}

*** Test Cases ***

Blog should exists
    Go To    ${SERVER}/blogi/
    Title Should Be    Eficode | Blogi
    Click Link    Automatic testing with Robot Framework pt. 3: Setting up a continuous integration system
    Title Should Be    Eficode | Automatic testing with Robot Framework pt. 3: Setting up a continuous integration system
    Location Should Be    ${SERVER}/blogi/setting-up-a-ci-system/

Helsinki link should be on frontpage and work
    Page Should Contain Link    Seuraa Twitterissä
    Click Link    Helsinki
    Location Should Be    ${SERVER}/yhteystiedot/

Changing language should change website language
    Click Link    ${english_link}
    Location Should Be    ${SERVER}/en/
    Click Link    ${chinese_link}
    Location Should Be    ${SERVER}/zh-hans/

Software pages should be reachable
    @{valid_pages}=    Get urls for software pages
    Verify urls are valid    @{valid_pages}

