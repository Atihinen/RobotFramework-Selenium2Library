*** Settings ***
Documentation  run pybot --variable ENVIRONMENT:env_file find-blog.robot
Resource  resources/${ENVIRONMENT}.robot
Suite Setup  Open Browser And Go To Production
Test Setup  Open frontpage
Suite Teardown  Close Browser

*** Test Cases ***

Unix process blog should exists
    Go To  ${SERVER}/blogi/
    Title Should Be  Eficode | Blogi
    Click Link  Automatic testing with Robot Framework pt. 3: Setting up a continuous integration system
    Title Should Be  Eficode | Automatic testing with Robot Framework pt. 3: Setting up a continuous integration system
    Location Should Be  ${SERVER}/blogi/setting-up-a-ci-system/
