*** Settings ***
#Metadata       Spec Version used        ${spec_version}

Resource    ../pages/login/loginKeywords.robot
Resource    ../resources/CommonKeywords.robot
Resource    ../config/config.robot

Test Setup        Open Navigator
Test Teardown     Close Browser

*** Test Cases ***
Verify Authentication with Parallel
    [Documentation]    Checks if authentication works with valid password
    [Tags]    Sanity
    Auth Wait Login Page Loaded
    Auth Enter Password    ${webui_password}
    Auth Click Login Button
    Auth Check Successful Login    ${language}
