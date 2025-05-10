*** Settings ***
Library    ../utils/FirefoxWithProxy.py
Library    SeleniumLibrary
Library    OperatingSystem
Resource    ../config/config.robot

*** Keywords ***

Open Navigator
    ${driver}=    Open Firefox With Socks Proxy    ${HGW_URL}
    Title Should Be    ${webui_title}

Capture Custom Screenshot
    ${screenshot_path}=    Set Variable    results/screenshots/${TEST NAME}.png
    Create Directory    results/screenshots
    Capture Page Screenshot    ${screenshot_path}
