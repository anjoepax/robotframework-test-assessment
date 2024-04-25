*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${SUBMIT_APPLICATION_BUTTON}        css:input#homeSubmitProjectButton

*** Keywords ***
${user|I|you} clicks on the Submit application button
    Click Element       ${SUBMIT_APPLICATION_BUTTON}