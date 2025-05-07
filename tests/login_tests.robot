*** Settings ***
Resource    ../pages/login/loginKeywords.robot
Resource    ../resources/CommonKeywords.robot

*** Test Cases ***
Auth Correct Password
    [Documentation]    Checks if authentication works with valid username and password
    [Tags]    Sanity
    Navigator Is Open
    I Enter The Correct Password    test1234
    I Click On The Login Button
    Home page should be open
    #Common Test Teardown
