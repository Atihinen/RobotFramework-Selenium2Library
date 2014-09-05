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
    \    Navigate And Verify Location    ${page[0]}    ${page[1]}

Choose Blog And Verify
    [Arguments]    ${blog_name}    ${url}
    ${blog_title}    Set Variable    Eficode | ${blog_name}
    Navigate And Verify Location    ${SERVER}/blogi/    Eficode | Blogi
    Click Link    ${blog_name}
    Title Should Be    ${blog_title}
    Location Should Be    ${url}

Verify English Locale
    Navigate By Link And Verify Location    ${english_link}    ${SERVER}/en/

Verify Chinese Locale
    Navigate By Link And Verify Location    ${chinese_link}    ${SERVER}/zh-hans/

Get software pages and verify
    @{valid_pages}=    Get urls for software pages
    Verify urls are valid    @{valid_pages}
