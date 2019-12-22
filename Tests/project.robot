*** Settings ***
Documentation           Demo project for Robot framework and Selenium
Library                 SeleniumLibrary
Resource                ../Resources/Resource.robot

*** Variables ***
${mobile_number}    46701234567
@{sms_code}     1   0   0   1   0   0

*** Test Cases ***
User can open home page
    [Documentation]     As a user I want to open the home page and see the tagline

    open browser    https://boka.techbuddy.se/#/services    chrome
    wait until element is visible   css=div.tb-service-selector-item:first-child
    click element   css=div.tb-service-selector-item:first-child
    wait until element is visible   css=div.tb-category-box:first-child
    click element   css=div.tb-category-box:first-child
    click element   css=div.tb-dropdown-toggle.no-selection
    click element   css=ul.tb-dropdown-menu>li:first-child
    click button    css=button.tb-button
    wait until element is visible   id=input
    Input Text      id=input    ${mobile_number}
    Wait Until Element Is Enabled   css=button.tb-button
    click button    css=button.tb-button
    wait until element is visible   css=div.tb-input-container.noselect>input
    Input In Each Field
    Wait Until Element Is Enabled   css=button.tb-button
    click button    css=button.tb-button
    wait until element is visible   css=div.tb-error-message    timeout=3    error=Validation error message is not displayed
    close browser
