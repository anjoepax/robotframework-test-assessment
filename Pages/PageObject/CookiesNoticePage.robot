*** Settings ***
Resource        ../BasePage.robot

*** Variables ***
${CLOSE_BUTTON}     css:button[class='closeButton ui-button ui-corner-all ui-widget']

*** Keywords ***
${user|I|you} closes the website cookies pop up notice
    ${IS_COOKIES_POP_UP_OPEN}=      Run Keyword And Return Status    Element Should Be Visible    ${CLOSE_BUTTON}
    Log To Console    Is Cookie Pop Up Displayed? ${IS_COOKIES_POP_UP_OPEN}
    Run Keyword If    ${IS_COOKIES_POP_UP_OPEN} == True    User clicks the close button

${user|I|you} clicks the close button
    Click Element    ${CLOSE_BUTTON}