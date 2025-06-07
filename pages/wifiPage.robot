*** Settings ***

Library    SeleniumLibrary
Resource    ../config/config.robot
Resource    ../config/textLangTranslation.robot


*** Variables ***

${wifiSSIDField}        xpath://*[contains(@class, 'input-container')]/input[@name='ssid']
${wifiPasswordField}        xpath://*[contains(@class, 'input-container')]/input[@name='password']
${wifiEncMenu}        xpath://*[contains(@class, 'encryption-selection')]/div[contains(@class, 'selected-option')]
${wifiEncItem}        xpath://*[contains(@class, 'options')]/li[@data-value=${wifi_enc_mode}]/span
${wifiEncSelectedOption}        xpath://*[contains(@class, 'encryption-selection')]/div[contains(@class, 'selected-option')]/span
${wifiNavigationItem}    xpath://*[@id='navigation-menu']/li[contains(@class, "menu-wifi")]
${wifiChannelSelectElement}    xpath://*[contains(@class, 'channel-selection')]
${wifiChannelSelectedElement}    xpath://*[contains(@class, 'channel-selection')]/div[contains(@class, 'selected-option')]/span
${wifiChannelSelectMenuItem}    xpath://*[contains(@class, 'options')]/li[@data-value=${wifi_2.4GHz_channel}]/span
${wifiChannelBandwidthSelectElement}    xpath://*[contains(@class, 'channel-bandwidth-selection')]
${wifiChannelBandwidthSelectedElement}    xpath://*[contains(@class, 'channel-bandwidth-selection')]/div[contains(@class, 'selected-option')]/span
${wifiChannelBandwidthSelectMenuItem}    xpath://*[contains(@class, 'options')]/li[@data-value=${wifi_2.4GHz_channel_bandwidth}]/span
${wifiSaveButton}    xpath://*[contains(@class, 'client-buttons')]/a[contains(@class, 'save-changes')]/span


*** Keywords ***

Navigate To Wifi Settings
    Wait Until Element Is Visible    ${wifiNavigationItem}    timeout=30s
    Run Keyword And Continue On Failure    Click Element    ${wifiNavigationItem}

Wifi Enter SSID
    [Arguments]    ${wifi_SSID}
    Wait Until Element Is Visible    ${wifiSSIDField}    timeout=30s
    Run Keyword And Continue On Failure    Input text    ${wifiSSIDField}    ${wifi_SSID}
    
Wifi Get SSID
    Wait Until Element Is Visible    ${wifiSSIDField}    timeout=30s
    ${ssid}=    Run Keyword And Continue On Failure    Get Value    ${wifiSSIDField}
    RETURN    ${ssid}
    
Wifi Enter Password
    [Arguments]    ${wifi_password}
    Wait Until Element Is Visible    ${wifiPasswordField}    timeout=30s
    Run Keyword And Continue On Failure    Input Password    ${wifiPasswordField}    ${wifi_password}

Wifi Get Password
    Wait Until Element Is Visible    ${wifiPasswordField}    timeout=30s
    ${password}=    Run Keyword And Continue On Failure    Get Value    ${wifiPasswordField}
    RETURN    ${password}

Wifi Set Encryption
    Wait Until Element Is Visible    ${wifiEncMenu}    timeout=30s
    Run Keyword And Continue On Failure    Click Element    ${wifiEncMenu}
    Run Keyword And Continue On Failure    Click Element    ${wifiEncItem}

Wifi Get Encryption
    Wait Until Element Is Visible    ${wifiEncMenu}    timeout=30s
    ${encOption}=    Run Keyword And Continue On Failure    Get Text    ${wifiEncSelectedOption}
    RETURN    ${encOption}

Wifi Set Channel
    Wait Until Element Is Visible    ${wifiChannelSelectElement}    timeout=30s
    Run Keyword And Continue On Failure    Click Element    ${wifiChannelSelectElement}
    Run Keyword And Continue On Failure    Click Element    ${wifiChannelSelectMenuItem}

Wifi Set Channel Bandwidth
    Wait Until Element Is Visible    ${wifiChannelBandwidthSelectElement}    timeout=30s
    Run Keyword And Continue On Failure    Click Element    ${wifiChannelBandwidthSelectElement}
    Run Keyword And Continue On Failure    Click Element    ${wifiChannelBandwidthSelectMenuItem}

Wifi Get Channel
    Wait Until Element Is Visible    ${wifiChannelSelectElement}    timeout=30s
    ${channel}=    Run Keyword And Continue On Failure    Get Text    ${wifiChannelSelectedElement}
    Log    ${channel}
    RETURN    ${channel}

Wifi Get Channel Bandwidth
    Wait Until Element Is Visible    ${wifiChannelBandwidthSelectElement}    timeout=30s
    ${channelBandwidth}=    Run Keyword And Continue On Failure    Get Text    ${wifiChannelSelectedElement}
    Log    ${channelBandwidth}
    RETURN    ${channelBandwidth}

Wifi Save Changes
    Wait Until Element Is Visible    ${wifiSaveButton}    timeout=30s
    ${saveBtn}    Run Keyword And Continue On Failure    Get WebElement    ${wifiSaveButton}
    Run Keyword And Continue On Failure    Execute JavaScript    arguments[0].click();    ARGUMENTS    ${saveBtn}
    sleep    5s