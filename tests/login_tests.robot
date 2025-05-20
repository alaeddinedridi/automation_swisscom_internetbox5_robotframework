*** Settings ***
#Metadata       Spec Version used        ${spec_version}

Resource    ../pages/auth/authKeywords.robot
Resource    ../resources/CommonKeywords.robot
Resource    ../config/config.robot

Test Setup        Open Navigator
Test Teardown     Close Browser

*** Test Cases ***

Verify Language selection
    [Documentation]    Checks if the language was correctly selected
    [Tags]    Sanity
    Auth Wait Login Page Loaded
    Select Language
    Check Language Correctly Selected    ${language}
    
Verify Authentication with Correct Password
    [Documentation]    Checks if authentication works with valid password
    [Tags]    Sanity
    Auth Wait Login Page Loaded
    Auth Enter Password    ${webui_password}
    Auth Click Login Button
    Auth Check Successful Login    ${language}

Verify Authentication with Wrong Password
    [Documentation]    Checks if authentication does not work with a wrong password
    [Tags]    Sanity
    Auth Wait Login Page Loaded
    Auth Enter Password    ${webui_wrong_password}
    Auth Click Login Button
    Auth Check Login Failure    ${language}


