*** Settings ***
Resource    ../pages/loginPage.robot


*** Test Cases ***
Auth Correct Password
    [Documentation]    Checks if authentication works with valid username and password
    [Tags]    Sanity
    Given Navigator Is Open
    sleep   15
    When I Enter The Correct Password    test1234
    And I Click On The Login Button
    #Then Home page should be open
    [Teardown]    Close Browser
