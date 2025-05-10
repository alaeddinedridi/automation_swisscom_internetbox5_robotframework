*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${REMOTE_URL}    http://localhost:4444/wd/hub
${BROWSER}       chrome

*** Test Cases ***
Open Page On Selenium Grid
    Open Browser    https://google.com    ${BROWSER}    remote_url=${REMOTE_URL}
    Title Should Be    Example Domain
    Close Browser