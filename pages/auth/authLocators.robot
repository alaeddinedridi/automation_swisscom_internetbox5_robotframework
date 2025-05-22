*** Variables ***

${passwordTextBox}        name:login-password
${loginButton}        xpath://*[@name="login-button"]
${weakPasswordModal}        xpath://*[contains(@class, 'modalWindowInner')]/div/span
${loginFailureMsg}        xpath://*[contains(@class, 'info-messages')]/div[2]/span
${overviewPageHGWElement}    xpath://*[@data-type='gateway']