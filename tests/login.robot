*** Settings ***
Library    FirefoxWithProxy.py

*** Test Cases ***
Open Firefox With SOCKS Proxy
    ${driver}=    Open Firefox With Socks Proxy    http://192.168.1.1/
    Sleep    5s
    ${driver}.quit()
