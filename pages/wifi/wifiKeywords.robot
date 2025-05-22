*** Settings ***

Library    SeleniumLibrary
Resource    ../../config/config.robot
Resource    wifiTextLangs.robot
Resource    wifiLocators.robot

*** Keywords ***

Navigate To Wifi Settings
    Wait Until Element Is Visible    ${wifiNavigationItem}    timeout=30s
    Click Element    ${wifiNavigationItem}

Wifi Enter SSID
    [Arguments]    ${wifi_SSID}
    Wait Until Element Is Visible    ${wifiSSIDField}    timeout=30s
    Input text    ${wifiSSIDField}    ${wifi_SSID}

Wifi Enter Password
    [Arguments]    ${wifi_password}
    Wait Until Element Is Visible    ${wifiPasswordField}    timeout=30s
    Input Password    ${wifiPasswordField}    ${wifi_password}

Wifi Set Encryption
    Wait Until Element Is Visible    ${wifiEncMenu}    timeout=30s
    Click Element    ${wifiEncMenu}
    Click Element    ${wifiEncItem}