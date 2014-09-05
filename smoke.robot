*** Settings ***
Documentation    run pybot --variable ENVIRONMENT:env_file smoke.robot
Resource    resources/${ENVIRONMENT}.robot
resource    resources/smoke.robot
Suite Setup    Open Browser And Go To Frontpage
Test Setup    Open frontpage
Suite Teardown    Close Browser

*** Variables ****
${robot_blog_name}=    Automatic testing with Robot Framework pt. 3: Setting up a continuous integration system
${robot_blog_url}=    ${SERVER}/blogi/setting-up-a-ci-system/



*** Test Cases ***

Blog about robotframework should exist
    Choose Blog And Verify    ${robot_blog_name}    ${robot_blog_url}

Helsinki link should be on frontpage and work
    Navigate By Link And Verify Location    Helsinki    ${SERVER}/yhteystiedot/

Changing language should change website language
    Verify English Locale
    Verify Chinese Locale

Software pages should be reachable
    Get software pages and verify

