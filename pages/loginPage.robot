*** Settings ***
Library    ../utils/FirefoxWithProxy.py
Library    SeleniumLibrary
Resource    ../config/config.robot

*** Variables ***

${passwordTextBox}        name:login-password
${loginButton}            xpath://a[@name="login-button"]


*** Keywords ***
Navigator is open
    ${driver}=    Open Firefox With Socks Proxy    ${HGWURL}
    Title Should Be    Internet-Box

I enter the correct password
    [Arguments]    ${password}
    Input Password    ${passwordTextBox}    ${password}

I click on the login button
    Click Element    ${loginButton}

Home page should be open
    Element Text Should Be    xpath://div[contains(@class, 'modalWindowInner')]//div//span    Weak web portal password