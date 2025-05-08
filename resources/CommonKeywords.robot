*** Settings ***
Library    ../utils/FirefoxWithProxy.py
Library    SeleniumLibrary
Library    OperatingSystem
Resource    ../config/config.robot

*** Keywords ***

Navigator is open
    ${driver}=    Open Firefox With Socks Proxy    ${HGW_URL}
    Title Should Be    ${webui_title}

Capture Custom Screenshot
    ${screenshot_path}=    Set Variable    results/screenshots/${TEST NAME}.png
    Create Directory    results/screenshots
    Capture Page Screenshot    ${screenshot_path}

#Common Test Teardown
#	[Teardown]    Run Keyword If Test Failed    Capture Custom Screenshot
#	Close Browser