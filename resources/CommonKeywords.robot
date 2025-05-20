*** Settings ***
Library    ../utils/FirefoxWithProxy.py
Library    SeleniumLibrary
Library    OperatingSystem
Resource    ../config/config.robot

*** Variables ***

${languagesMenu}        xpath://*[contains(@class, 'selected-option')]
${languageItem}        xpath://*[contains(@class, 'options')]/li/span[contains(text(),${language})]
${selectedLanguage}        xpath://*[contains(@class, 'selected-option')]/span

*** Keywords ***

Open Navigator
    ${driver}=    Open Firefox With Socks Proxy    ${HGW_URL}
    Title Should Be    ${webui_title}

Capture Custom Screenshot
    ${screenshot_path}=    Set Variable    results/screenshots/${TEST NAME}.png
    Create Directory    results/screenshots
    Capture Page Screenshot    ${screenshot_path}

Select Language
    [Documentation]    Arguments : language (FR,EN)
    Run Keyword And Continue On Failure    Wait Until Element Is Visible    ${languagesMenu}    timeout=30s
    Run Keyword And Continue On Failure    Click Element    ${languagesMenu}
    Run Keyword And Continue On Failure    Wait Until Element Is Visible    ${languageItem}    timeout=30s
    Run Keyword And Continue On Failure    Click Element    ${languageItem}
    ${html}=    Get Source
    Log    ${html}

Check Language Correctly Selected
    [Arguments]    ${language}
    Wait Until Element Is Visible    ${selectedLanguage}    timeout=30s
    Element Text Should Be    ${selectedLanguage}    ${language}

