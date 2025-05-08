*** Settings ***

Library    SeleniumLibrary
Resource    ../../config/config.robot
Resource    loginTextLangs.robot
Resource    loginLocators.robot

*** Keywords ***

I enter the correct password
    [Arguments]    ${password}
    Wait Until Element Is Visible    ${passwordTextBox}    timeout=10s
    Input Password    ${passwordTextBox}    ${password}

I click on the login button
    Wait Until Element Is Visible    ${loginButton}    timeout=10s
    Click Element    ${loginButton}

Home page should be open
    [Arguments]    ${language}
    [Documentation]    Arguments : language (fr,en)
    Wait Until Element Is Visible    ${weakPasswordModal}    timeout=10s
    Element Text Should Be    ${weakPasswordModal}    ${homePage.password.modal.title.${language}}