*** Settings ***

Library    SeleniumLibrary
Resource    ../../config/config.robot
Resource    ../config/textLangTranslation.robot


*** Variables ***

${wifiSSIDField}        xpath://*[contains(@class, 'input-container')]/input[@name='ssid']
${wifiPasswordField}        xpath://*[contains(@class, 'input-container')]/input[@name='password']
${wifiEncMenu}        xpath://*[contains(@class, 'encryption-selection')]/div[contains(@class, 'selected-option')]
${wifiEncItem}        xpath://*[contains(@class, 'options')]/li[@data-value=${wifi_enc_mode}]/span
${wifiNavigationItem}    xpath://*[@id='navigation-menu']/li[contains(@class, "menu-wifi")]


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