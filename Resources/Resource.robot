*** Settings ***
Documentation           Demo project for Robot framework and Selenium
Library                 SeleniumLibrary

*** Keywords ***
Input In Each Field
        ${elements}     Get WebElements     css=div.tb-input-container.noselect>input
        ${element_count}    Get Length   ${elements}
        ${digit_count}    Get Length   ${sms_code}
        LOG     ${elements}
        Should Be True      ${element_count} == ${digit_count}

        FOR   ${i}    IN RANGE    0     ${digit_count}
            Input Text     ${elements}[${i}]    ${sms_code}[${i}]
        END
