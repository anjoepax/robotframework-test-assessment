*** Settings ***
Resource        ../BasePage.robot
Library    Collections

*** Variables ***
${FIRST_NAME_FIELD_SUMMARY}     css:div[id='container_06c8a27e-7d11-57b2-9286-af8fc8ba5b27'] > div
${LAST_NAME_FIELD_SUMMARY}      css:div[id='container_9d848df4-cdd0-50aa-820f-fdedcbda7e11'] > div
${ADDRESS_FIELD_SUMMARY}        css:div[id='container_17540589-1aa5-5bf7-93fa-d49acf58b711'] > div
${POSTAL_CODE_FIELD_SUMMARY}    css:div[id='container_5911b832-9522-524a-9f3c-8014c2ddba1c'] > div
${COUNTRY_FIELD_SUMMARY}        css:div[id='container_bf6f7c7f-1da5-55d7-99ac-2866e4a139fd'] > div
${PHOTO_FIELD_SUMMARY}      css:div[id='container_396b40f4-2e98-5e88-8bb5-611227ddf7de'] a
${GENDER_FIELD_SUMMARY}     css:li[id='container_254f1489-f589-50c5-a1cc-698f61546ccc']
${ROLE_FIELD_SUMMARY}       css:div[id='container_cba99291-980c-5cb1-91c2-1db8d294587b'] > div:nth-child(2)
${TOOL_FIELD_SUMMARY}       css:ul[id='field_73c26bc3-c6fb-5224-b962-b417331ee64c'] li
${OBJECTIVE_FIELD_SUMMARY}      css:div[id='container_9aba057d-53de-543a-b8ec-9b8005d1bb1e'] > div
${VALIDATE_AND_SEND_BUTTON}     css:input#submitButton
${TIMEOUT}      10 seconds

*** Keywords ***
assert that first name text contains
    [Arguments]     ${EXPECTED_TEXT}
    Wait Until Element Contains    ${FIRST_NAME_FIELD_SUMMARY}    ${EXPECTED_TEXT}      timeout=${TIMEOUT}
    SeleniumLibrary.Element Text Should Be    ${FIRST_NAME_FIELD_SUMMARY}    ${EXPECTED_TEXT}

assert that last name text contains
    [Arguments]     ${EXPECTED_TEXT}
    SeleniumLibrary.Element Text Should Be    ${LAST_NAME_FIELD_SUMMARY}    ${EXPECTED_TEXT}

assert that address text contains
    [Arguments]     ${EXPECTED_TEXT}
    SeleniumLibrary.Element Text Should Be    ${ADDRESS_FIELD_SUMMARY}    ${EXPECTED_TEXT}

assert that postal code text contains
    [Arguments]     ${EXPECTED_TEXT}
    SeleniumLibrary.Element Text Should Be    ${POSTAL_CODE_FIELD_SUMMARY}    ${EXPECTED_TEXT}

assert that country text contains
    [Arguments]     ${EXPECTED_TEXT}
    SeleniumLibrary.Element Text Should Be    ${COUNTRY_FIELD_SUMMARY}    ${EXPECTED_TEXT}

assert that photo file name text contains
    [Arguments]     ${EXPECTED_TEXT}
    SeleniumLibrary.Element Text Should Be    ${PHOTO_FIELD_SUMMARY}    ${EXPECTED_TEXT}

assert that gender text contains
    [Arguments]     ${EXPECTED_TEXT}
    SeleniumLibrary.Element Text Should Be    ${GENDER_FIELD_SUMMARY}    ${EXPECTED_TEXT}

assert that role text contains
    [Arguments]     ${EXPECTED_TEXT}
    SeleniumLibrary.Element Text Should Be    ${ROLE_FIELD_SUMMARY}    ${EXPECTED_TEXT}

assert that objective text contains
    [Arguments]     ${EXPECTED_TEXT}
    SeleniumLibrary.Element Text Should Be    ${OBJECTIVE_FIELD_SUMMARY}    ${EXPECTED_TEXT}

assert that tools of experience contains
    [Arguments]     @{TOOLS_EXP}
    ${elements}=        Get WebElements    ${TOOL_FIELD_SUMMARY}
    @{texts}=   Create List
    FOR    ${element}    IN    @{elements}
        ${text}=    Get Text    ${element}
        Append To List    ${texts}      ${text}
    END
    List Should Contain Sub List    ${TOOLS_EXP}    ${texts}

${user|I|you} clicked the validate and send button
    Click Element    ${VALIDATE_AND_SEND_BUTTON}
