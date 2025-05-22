*** Settings ***

Library    SeleniumLibrary
Resource    ../../config/config.robot
Resource    authTextLangs.robot
Resource    authLocators.robot

*** Keywords ***

Auth Enter Password
    [Arguments]    ${password}
    Wait Until Element Is Visible    ${passwordTextBox}    timeout=30s
    Input Password    ${passwordTextBox}    ${password}

Auth Click Login Button
    Wait Until Element Is Visible    ${loginButton}    timeout=30s
    Click Element    ${loginButton}

Auth Check Successful Login
    [Arguments]    ${language}
    [Documentation]    Check if the weak password model contains the correct message, Arguments : language (fr,en)
    run keyword if    '${webui_weak_password}'=='True'    Run Keywords
    ...    Wait Until Element Is Visible    ${weakPasswordModal}    timeout=30s    AND
    ...    Element Text Should Be    ${weakPasswordModal}    ${homePage.password.modal.title.${language}}
    ...    ELSE    Wait Until Keyword Succeeds    30s    2s    Page Should Contain Element    ${overviewPageHGWElement}

Auth Check Login Failure
    [Arguments]    ${language}
    [Documentation]    Check the displayed error message in case of a wrong password, Arguments : language (fr,en)
    Wait Until Element Is Visible    ${loginFailureMsg}    timeout=10s
    Element Text Should Be    ${loginFailureMsg}    ${homePage.login.password.failure.message.${language}}

Auth Wait Login Page Loaded
    Wait Until Keyword Succeeds    30s    2s    Wait Until Element Is Visible    ${passwordTextBox}    timeout=1s