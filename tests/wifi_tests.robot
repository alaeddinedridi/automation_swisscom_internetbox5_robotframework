*** Settings ***
#Metadata       Spec Version used        ${spec_version}

Resource    ../pages/wifiPage.robot
Resource    ../pages/authPage.robot
Resource    ../resources/CommonKeywords.robot
Resource    ../config/config.robot

Test Setup        Open Navigator
Test Teardown     Close Browser

*** Test Cases ***

Verify WLAN Credentials
    [Documentation]    Checks if authentication works with valid password
    [Tags]    notSanity
    Login to App
    Toggle Expert Mode
    Navigate To Wifi Settings
    Wifi Enter SSID    ${wifi_SSID}
    Wifi Enter Password    ${wifi_Password}
    Wifi Set Encryption


