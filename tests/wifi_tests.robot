*** Settings ***
#Metadata       Spec Version used        ${spec_version}

Resource    ../pages/wifiPage.robot
Resource    ../pages/authPage.robot
Resource    ../resources/CommonKeywords.robot
Resource    ../config/config.robot

Test Setup        Open Navigator
Test Teardown     Close Browser

*** Test Cases ***

Verify WLAN 2.4GHz Credentials
    [Documentation]    Checks if WLAN credentials are set
    [Tags]    wifi
    Login to App
    Toggle Expert Mode
    Navigate To Wifi Settings
    Wifi Enter SSID    ${wifi_SSID}
    Wifi Enter Password    ${wifi_Password}
    Wifi Set Encryption
    Wifi Save Changes
    ${returnedSSID}=    Wifi Get SSID
    Run Keyword And Continue On Failure    Should Be Equal    ${returnedSSID}    ${wifi_SSID}
    ${returnedPassword}=    Wifi Get Password
    Run Keyword And Continue On Failure    Should Be Equal    ${returnedPassword}    ${wifi_Password}
    ${returnedEnc}=    Wifi Get Encryption
    Should Be Equal    ${returnedEnc}    ${wifi_enc_mode}

Verify Wifi 2.4GHz Channel
    [Documentation]    Checks if wifi 2.4GHz channel and channel bandwidth are set
    [Tags]    wifi
    Login to App
    Toggle Expert Mode
    Navigate To Wifi Settings
    Wifi Set Channel
    Wifi Set Channel Bandwidth
    Wifi Save Changes
    ${returnedChannel}=    Wifi Get Channel
    Run Keyword And Continue On Failure    Should Be Equal    ${returnedChannel}    ${wifi_2.4GHz_channel}
    ${returnedChannelBandwidth}=    Wifi Get Channel Bandwidth
    Should Be Equal    ${returnedChannelBandwidth}    ${wifi_2.4GHz_channel_bandwidth}
