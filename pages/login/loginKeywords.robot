*** Settings ***

Library    SeleniumLibrary
Resource    ../../config/config.robot
Resource    loginTextLangs.robot
Resource    loginLocators.robot

*** Keywords ***

Auth Enter Password
    [Arguments]    ${password}
    Wait Until Element Is Visible    ${passwordTextBox}    timeout=10s
    Input Password    ${passwordTextBox}    ${password}

Auth Click Login Button
    Wait Until Element Is Visible    ${loginButton}    timeout=10s
    Click Element    ${loginButton}

Auth Check Successful Login
    [Arguments]    ${language}
    [Documentation]    Arguments : language (fr,en)
    Wait Until Element Is Visible    ${weakPasswordModal}    timeout=10s
    Element Text Should Be    ${weakPasswordModal}    ${homePage.password.modal.title.${language}}

Auth Wait Login Page Loaded
    Wait Until Keyword Succeeds    30s    2s    Wait Until Element Is Visible    ${passwordTextBox}    timeout=1s