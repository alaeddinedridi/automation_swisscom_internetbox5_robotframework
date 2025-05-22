*** Settings ***

Resource    ../../config/config.robot

*** Variables ***

${wifiSSIDField}        xpath://*[contains(@class, 'input-container')]/input[@name='ssid']
${wifiPasswordField}        xpath://*[contains(@class, 'input-container')]/input[@name='password']
${wifiEncMenu}        xpath://*[contains(@class, 'encryption-selection')]/div[contains(@class, 'selected-option')]
${wifiEncItem}        xpath://*[contains(@class, 'options')]/li[@data-value=${wifi_enc_mode}]/span
${wifiNavigationItem}    xpath://*[@id='navigation-menu']/li[contains(@class, "menu-wifi")]