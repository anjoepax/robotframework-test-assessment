*** Settings ***
Resource        ../BasePage.robot

*** Variables ***
# xpath://div[contains(text(),'First name') and @class='title']/parent::div//input
# xpath://div[contains(text(),'Last name') and @class='title']/parent::div//input
# xpath://div[contains(text(),'Unit no/House no, Street') and @class='title']/parent::div//textarea
# xpath://div[contains(text(),'Select postal code') and @class='title']/parent::div//input[1]
# xpath://div[contains(text(),'Country') and @class='title']/parent::div//select
# xpath://div[contains(text(),'Photo') and @class='title']/parent::div//input[@type='file']
# xpath://div[contains(text(),"Select a role you're applying for")]/parent::div//select
${FIRST_NAME_FIELD}     css:input[id='06c8a27e-7d11-57b2-9286-af8fc8ba5b27']
${LAST_NAME_FIELD}      css:input[id='9d848df4-cdd0-50aa-820f-fdedcbda7e11']
${ADDRESS_FIELD}        css:textarea[id='852ff964-97c2-5ea0-9674-49b3f95d2e86::17540589-1aa5-5bf7-93fa-d49acf58b711']
${POSTAL_CODE_FIELD}    css:input[name='48b06bb5-8a4f-504e-93a7-2c5e888da553::5911b832-9522-524a-9f3c-8014c2ddba1c']
${COUNTRY_FIELD}        css:select[id='bf6f7c7f-1da5-55d7-99ac-2866e4a139fd']
${UPLOAD_BUTTON}        css:input[name='Filedata']
${ROLE_DROPDOWN}        css:select[id='field_cba99291-980c-5cb1-91c2-1db8d294587b']
${GENDER_MALE_CHECKBOX}     css:ul[id='field_64d3c1af-c688-597d-9803-77e4287f2fbb'] > li:nth-child(1) > input
${GENDER_FEMALE_CHECKBOX}       css:ul[id='field_64d3c1af-c688-597d-9803-77e4287f2fbb'] > li:nth-child(2) > input
${GENDER_PREFER_NOT_TO_ANSWER}      css:ul[id='field_64d3c1af-c688-597d-9803-77e4287f2fbb'] > li:nth-child(3) > input
${SPREADSHEET_TOOL_CHECKBOX}        css:ul[id='field_73c26bc3-c6fb-5224-b962-b417331ee64c'] > li:nth-child(1) > input
${JIRA_TOOL_CHECKBOX}        css:ul[id='field_73c26bc3-c6fb-5224-b962-b417331ee64c'] > li:nth-child(2) > input
${TEST_MANAGEMENT_TOOL_CHECKBOX}        css:ul[id='field_73c26bc3-c6fb-5224-b962-b417331ee64c'] > li:nth-child(3) > input
${SQL_TOOL_CHECKBOX}        css:ul[id='field_73c26bc3-c6fb-5224-b962-b417331ee64c'] > li:nth-child(4) > input
${JAVA_TOOL_CHECKBOX}        css:ul[id='field_73c26bc3-c6fb-5224-b962-b417331ee64c'] > li:nth-child(5) > input
${JS_TOOL_CHECKBOX}        css:ul[id='field_73c26bc3-c6fb-5224-b962-b417331ee64c'] > li:nth-child(6) > input
${PYTHON_TOOL_CHECKBOX}        css:ul[id='field_73c26bc3-c6fb-5224-b962-b417331ee64c'] > li:nth-child(7) > input
${TESTNG_TOOL_CHECKBOX}        css:ul[id='field_73c26bc3-c6fb-5224-b962-b417331ee64c'] > li:nth-child(8) > input
${CUCUMBER_TOOL_CHECKBOX}        css:ul[id='field_73c26bc3-c6fb-5224-b962-b417331ee64c'] > li:nth-child(9) > input
${RF_TOOL_CHECKBOX}        css:ul[id='field_73c26bc3-c6fb-5224-b962-b417331ee64c'] > li:nth-child(10) > input
${CYPRESS_TOOL_CHECKBOX}        css:ul[id='field_73c26bc3-c6fb-5224-b962-b417331ee64c'] > li:nth-child(11) > input
${CAREER_OBJECTIVE_TEXTAREA_IFRAME}     css:iframe[class='cke_wysiwyg_frame cke_reset']
${CAREER_OBJECTIVE_TEXTAREA}        css:body[class='cke_editable cke_editable_themed cke_contents_ltr cke_show_borders']
${NEXT_SCREEN_BUTTON}       css:input#navButtonNext

*** Keywords ***
${user|I|you} enters first name
    [Arguments]     ${FIRST_NAME}
    Input Text    ${FIRST_NAME_FIELD}    ${FIRST_NAME}

${user|I|you} enters last name
    [Arguments]     ${LAST_NAME}
    Input Text    ${LAST_NAME_FIELD}    ${LAST_NAME}

${user|I|you} enters address
    [Arguments]     ${ADDRESS}
    Input Text    ${ADDRESS_FIELD}    ${ADDRESS}

${user|I|you} enters postal code
    [Arguments]     ${POSTAL_CODE}
    Input Text    ${POSTAL_CODE_FIELD}    ${POSTAL_CODE}
    Sleep    1 seconds
    Press Keys    ${POSTAL_CODE_FIELD}    ARROW_DOWN
    Sleep    1 seconds
    Press Keys    ${POSTAL_CODE_FIELD}    RETURN
    Sleep    2 seconds
    
${user|I|you} selects country
    [Arguments]     ${COUNTRY}
    Scroll Element Into View    ${COUNTRY_FIELD}
    Select From List By Label    ${COUNTRY_FIELD}       ${COUNTRY}

${user|I|you} uploads a photo
    [Arguments]     ${FILE_PATH}
    Scroll Element Into View    ${UPLOAD_BUTTON}
    Choose File    ${UPLOAD_BUTTON}     ${FILE_PATH}
    
${user|I|you} selects gender
    [Arguments]     ${GENDER}
    Run Keyword If  '${GENDER}' == 'Male'
    ...    Click Element    ${GENDER_MALE_CHECKBOX}
    ...  ELSE IF    '${GENDER}' == 'Female'
    ...    Click Element    ${GENDER_FEMALE_CHECKBOX}
    ...  ELSE
    ...    Click Element    ${GENDER_PREFER_NOT_TO_ANSWER}

${user|I|you} selects role
    [Arguments]     ${ROLE}
    Scroll Element Into View    ${ROLE_DROPDOWN}
    Select From List By Label    ${ROLE_DROPDOWN}       ${ROLE}

${user|I|you} selected tools of experience
    [Arguments]     @{TOOLS}
    FOR    ${TOOL}    IN    @{TOOLS}
        Run Keyword If      '${TOOL}' == 'Jira'
    ...    Click Element    ${JIRA_TOOL_CHECKBOX}
    ...  ELSE IF    '${TOOL}' == 'Test Management Tool'
    ...    Click Element   ${TEST_MANAGEMENT_TOOL_CHECKBOX}
    ...  ELSE IF    '${TOOL}' == 'SQL'
    ...    Click Element   ${SQL_TOOL_CHECKBOX}
    ...  ELSE IF    '${TOOL}' == 'Java'
    ...    Click Element    ${JAVA_TOOL_CHECKBOX}
    ...  ELSE IF    '${TOOL}' == 'JS'
    ...    Click Element    ${JS_TOOL_CHECKBOX}
    ...  ELSE IF    '${TOOL}' == 'Python'
    ...     Click Element    ${PYTHON_TOOL_CHECKBOX}
    ...  ELSE IF    '${TOOL}' == 'TestNG'
    ...     Click Element    ${TESTNG_TOOL_CHECKBOX}
    ...  ELSE IF     '${TOOL}' == 'Cucumber'
    ...     Click Element    ${CUCUMBER_TOOL_CHECKBOX}
    ...  ELSE IF    '${TOOL}' == 'Robot Framework'
    ...     Click Element    ${RF_TOOL_CHECKBOX}
    ...  ELSE IF    '${TOOL}' == 'Cypress'
    ...     Click Element   ${CYPRESS_TOOL_CHECKBOX}
    END

${user|I|you} enters career objective
    [Arguments]     ${TXT}
    Scroll Element Into View    ${CAREER_OBJECTIVE_TEXTAREA_IFRAME}
    Select Frame    ${CAREER_OBJECTIVE_TEXTAREA_IFRAME}
    Press Keys      ${CAREER_OBJECTIVE_TEXTAREA}        ${TXT}
    Unselect Frame
    
${user|I|you} clicks the next screen button
    Scroll Element Into View    ${NEXT_SCREEN_BUTTON}
    Click Element    ${NEXT_SCREEN_BUTTON}