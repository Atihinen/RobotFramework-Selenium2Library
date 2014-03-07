*** Settings ***
Documentation  run pybot --variable ENVIRONMENT:env_file.txt find-blog.robot
Resource  ${ENVIRONMENT}.txt
Suite Setup  Open Browser And Go To Production
Test Setup  Open frontpage
Suite Teardown  Close Browser

*** Test Cases ***
Unix process blog should exits
	Go To  ${SERVER}/blogi/
	Title Should Be  Eficode | Blogi
	Click Link  Unix-prosessin hallittu kaatuminen – detaljit signaaleista core dumpiin
	Title Should Be  Eficode | Unix-prosessin hallittu kaatuminen – detaljit signaaleista core dumpiin
	Location Should Be  ${SERVER}/blogi/unix-prosessin-hallittu-kaatuminen/
