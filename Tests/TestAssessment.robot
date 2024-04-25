*** Settings ***
Resource        ../Pages/BasePage.robot
Test Setup      Given I open the application via browser    ${URL}      CHROME
Test Template   When I submitted a new application

*** Variables ***
${URL}      https://qrqck8u5t9co.front.staging.optimy.net/en/
${USERNAME}     optimyautomationtester@gmail.com
${PASSWORD}     2MsWseoj
@{TOOLS_EXPERIENCE}     Cypress     Robot Framework     Java

*** Test Cases ***                      FIRST_NAME  LAST_NAME       ADDRESS     POSTAL_CODE     COUNTRY     FILE_NAME               GENDER      ROLE                OBJECTIVE
Submit new application with valid data  TonTon      AutomationTest  Elisco Rd   1000            Belgium     sample-picture.jpeg     Male        Automation tester   Automation Testing


*** Keywords ***
I submitted a new application
    [Arguments]     ${FIRST_NAME}       ${LAST_NAME}    ${ADDRESS}      ${POSTAL_CODE}      ${COUNTRY}      ${FILE_NAME}    ${GENDER}       ${ROLE}     ${OBJECTIVE}
    When I closes the website cookies pop up notice
    And I clicks on the submit application button
    And I logged in to the application      ${USERNAME}     ${PASSWORD}
    And I clicks on the submit a new application button
    And I fill up the first name and last name field with   ${FIRST_NAME}   ${LAST_NAME}
    And I fill up the address, postal code, & country field with        ${ADDRESS}      ${POSTAL_CODE}      ${COUNTRY}
    And I uploaded a photo in the photo field    ${CURDIR}/TestData/sample_picture.jpeg
    And I selects a gender   ${GENDER}
    And I selects role   ${ROLE}
    And I selected tools of experience       @{TOOLS_EXPERIENCE}
    And I enters career objective    ${OBJECTIVE}
    When I clicks the next screen button
    Then assert that first name text contains   ${FIRST_NAME}
    Then assert that last name text contains    ${LAST_NAME}
    Then assert that address text contains  ${ADDRESS}
    Then assert that postal code text contains     ${POSTAL_CODE} - Bruxelles / Brussel
    Then assert that country text contains      ${COUNTRY}
    Then assert that photo file name text contains      ${FILE_NAME}
    Then assert that gender text contains       ${GENDER}
    Then assert that role text contains     ${ROLE}
    Then assert that tools of experience contains   @{TOOLS_EXPERIENCE}
    Then assert that objective text contains        ${OBJECTIVE}
    When I clicked the validate and send button
    Then assert that redirected to "Thank you for submitting your project" page
    Then sleep  5 seconds


${user|I|you} fill up the first name and last name field with
    [Arguments]     ${FIRST_NAME}       ${LAST_NAME}
    user enters first name   ${FIRST_NAME}
    user enters last name    ${LAST_NAME}

${user|I|you} fill up the address, postal code, & country field with
    [Arguments]     ${ADDRESS}      ${POSTAL_CODE}      ${COUNTRY}
    user enters address    ${ADDRESS}
    user enters postal code    ${POSTAL_CODE}
    user selects country    ${COUNTRY}

${user|I|you} uploaded a photo in the photo field
    [Arguments]     ${PATH}
    user uploads a photo    ${PATH}

${user|I|you} selects a gender
    [Arguments]     ${GENDER}
    user selects gender     ${GENDER}

