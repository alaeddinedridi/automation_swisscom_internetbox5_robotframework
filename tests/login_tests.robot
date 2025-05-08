*** Settings ***
#Metadata       Spec Version used        ${spec_version}

Resource    ../pages/login/loginKeywords.robot
Resource    ../resources/CommonKeywords.robot
Resource    ../config/config.robot

*** Test Cases ***
Auth Correct Password
    [Documentation]    Checks if authentication works with valid username and password
    [Tags]    Sanity
    Navigator Is Open
    I Enter The Correct Password    ${webui_password}
    I Click On The Login Button
    Home page should be open    ${language}
    #Common Test Teardown
