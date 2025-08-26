*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${PAGE_HEADLINE}       xpath=//h4[normalize-space()='Register']
${USERNAME_INPUT}      css=input[id='username']
${PASSWORD_INPUT}      css=input[id='password']
${EMAIL_INPUT}         css=input[id='email']
${GENDER_SELECT}       css=select[id='gender']
${FIRST_ADDRESS}       css=input[id='address1']
${SECOND_ADDRESS}      css=input[id='address2']
${CONTACT_INPUT}       css=input[id='contact']
${REGISTER_BUTTON}     css=button.w-100.submit-btn.my-3


*** Keywords ***
Get Page Headline
    [Return]    ${PAGE_HEADLINE}

Enter Username
    [Arguments]    ${username}
    Input Text    ${USERNAME_INPUT}    ${username}

Enter Password
    [Arguments]    ${password}
    Input Text    ${PASSWORD_INPUT}    ${password}

Enter Email
    [Arguments]    ${email}
    Input Text    ${EMAIL_INPUT}    ${email}

Select Gender
    [Arguments]    ${gender}
    Select From List By Value    ${GENDER_SELECT}    ${gender}

Enter First Address
    [Arguments]    ${address}
    Input Text    ${FIRST_ADDRESS}    ${address}

Enter Second Address
    [Arguments]    ${address}
    Input Text    ${SECOND_ADDRESS}    ${address}

Enter Contact Number
    [Arguments]    ${contact}
    Input Text    ${CONTACT_INPUT}    ${contact}

Click Register Button
    Click Button   ${REGISTER_BUTTON}
