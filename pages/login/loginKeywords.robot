*** Settings ***
Library    ../../utils/FirefoxWithProxy.py
Library    SeleniumLibrary
Resource    ../../config/config.robot
Resource    loginTextLangs.robot
Resource    loginLocators.robot

*** Keywords ***
Navigator is open
    ${driver}=    Open Firefox With Socks Proxy    ${HGWURL}
    Title Should Be    Internet-Box

I enter the correct password
    [Arguments]    ${password}
    Wait Until Element Is Visible    ${passwordTextBox}    timeout=10s
    Input Password    ${passwordTextBox}    ${password}

I click on the login button
    Wait Until Element Is Visible    ${loginButton}    timeout=10s
    Click Element    ${loginButton}

Home page should be open
    Wait Until Element Is Visible    ${weakPasswordModal}    timeout=10s
    Element Text Should Be    ${weakPasswordModal}    ${homePage.password.modal.title.fr}