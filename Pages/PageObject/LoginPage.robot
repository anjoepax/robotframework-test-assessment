*** Settings ***
Resource        ../BasePage.robot

*** Variables ***
${USERNAME_FIELD}       css:input#loginEmail
${PASSWORD_FIELD}       css:input#loginPassword
${LOGIN_BUTTON}         css:input[value='Login']
${TIMEOUT}      30 seconds

*** Keywords ***
${user|I|you} logged in to the application
    [Arguments]     ${USERNAME}     ${PASSWORD}
    Wait Until Element Is Visible    ${USERNAME_FIELD}      timeout=${TIMEOUT}
    Input Text    ${USERNAME_FIELD}     ${USERNAME}
    Input Password    ${PASSWORD_FIELD}    ${PASSWORD}
    Click Button    ${LOGIN_BUTTON}