*** Settings ***
Documentation  run pybot --variable ENVIRONMENT:env_file smoke.robot
Resource  resources/${ENVIRONMENT}.robot
Suite Setup  Open Browser And Go To Production
Test Setup  Open frontpage
Suite Teardown  Close Browser

*** Test Cases ***

Blog should exists
    Go To  ${SERVER}/blogi/
    Title Should Be  Eficode | Blogi
    Click Link  Automatic testing with Robot Framework pt. 3: Setting up a continuous integration system
    Title Should Be  Eficode | Automatic testing with Robot Framework pt. 3: Setting up a continuous integration system
    Location Should Be  ${SERVER}/blogi/setting-up-a-ci-system/

Helsinki link should be on frontpage and work
    Page Should Contain Link  Seuraa Twitterissä
    Click Link  Helsinki
    Location Should Be  ${SERVER}/yhteystiedot/

Changing language should change website language
    Click Link  English
    Location Should Be  ${SERVER}/en/
    Click Link  简体中文
    Location Should Be  ${SERVER}/zh-hans/

Software pages should be reachable
    :FOR  ${site}  IN  @{VALID_URLS}
    \   Navigate And Check Location  ${site[0]}  ${site[1]}

