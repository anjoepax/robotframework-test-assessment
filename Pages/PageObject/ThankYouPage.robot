*** Settings ***
Resource        ../BasePage.robot

*** Variables ***
${THANK_YOU_FOR_SUBMISSION_MSG}     css:div[class='projectEnd form_76008305-395c-5a0e-8ce0-41d8395b3258'] > h1

*** Keywords ***
assert that redirected to "${message}" page
    Wait Until Element Is Visible    ${THANK_YOU_FOR_SUBMISSION_MSG}    timeout=30 seconds
    Element Should Be Visible    ${THANK_YOU_FOR_SUBMISSION_MSG}