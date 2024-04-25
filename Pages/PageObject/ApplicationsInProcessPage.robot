*** Settings ***
Resource        ../BasePage.robot

*** Variables ***
${CONTINUE_SUBMISSION_BUTTON}       css:input[value='Continue with the submission of the application']
${SUBMIT_NEW_APPLICATION_BUTTON}        css:p[class='submitNew'] a

*** Keywords ***
${user|I|you} clicks on the submit a new application button
    Wait Until Element Is Visible    ${SUBMIT_NEW_APPLICATION_BUTTON}       timeout=30 seconds
    ${CONTINUE_SUBMISSION_BUTTON_COUNT}=    SeleniumLibrary.Get Element Count    ${CONTINUE_SUBMISSION_BUTTON}
    Log To Console      Continue Submission Button Count:${CONTINUE_SUBMISSION_BUTTON_COUNT}
    Run Keyword If    ${CONTINUE_SUBMISSION_BUTTON_COUNT} > 0   Click Element    ${SUBMIT_NEW_APPLICATION_BUTTON}
