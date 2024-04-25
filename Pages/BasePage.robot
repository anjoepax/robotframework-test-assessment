*** Settings ***
Library     SeleniumLibrary
Resource    PageObject/LoginPage.robot
Resource    PageObject/CookiesNoticePage.robot
Resource    PageObject/HomePage.robot
Resource    PageObject/ApplicationsInProcessPage.robot
Resource    PageObject/ApplicationsFormPage.robot
Resource    PageObject/SummaryPage.robot
Resource    PageObject/ThankYouPage.robot

*** Keywords ***
${user|I|you} open the application via browser
    [Arguments]     ${URL}      ${BROWSER}
    Open Browser    ${URL}      ${BROWSER}
    Maximize Browser Window
