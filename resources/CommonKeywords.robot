*** Settings ***

Library    SeleniumLibrary
Library    OperatingSystem

*** Keywords ***

Capture Custom Screenshot
    ${screenshot_path}=    Set Variable    results/screenshots/${TEST NAME}.png
    Create Directory    results/screenshots
    Capture Page Screenshot    ${screenshot_path}

#Common Test Teardown
#	[Teardown]    Run Keyword If Test Failed    Capture Custom Screenshot
#	Close Browser