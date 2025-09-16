*** Settings ***
Library    SeleniumLibrary
*** Variables ***
${PAGE_HEADLINE}       xpath://h4[normalize-space()='Register']
${USERNAME_INPUT}      xpath://input[@id='username']
${PASSWORD_INPUT}      css:input[id='password']
${EMAIL_INPUT}         css:input[id='email']
${GENDER_SELECT}       css:select[id='gender']
${FIRST_ADDRESS}       css:input[id='address1']
${SECOND_ADDRESS}      css:input[id='address2']
${SUCCESS_MESSAGE}     css:div[class='react-toast-notifications__toast__content css-1ad3zal']
${CONTACT_INPUT}       css:input[id='contact']
${REGISTER_BUTTON}     css:button.w-100.submit-btn.my-3

*** Keywords ***
Get Page Headline
    [Return]    ${PAGE_HEADLINE}

Enter Username
    [Arguments]    ${username}
    Wait Until Element Is Visible   ${USERNAME_INPUT}     30
    Input Text    ${USERNAME_INPUT}    ${username}

Enter Password
    [Arguments]    ${password}
    Wait Until Element Is Visible      ${PASSWORD_INPUT}   30
    Input Text    ${PASSWORD_INPUT}    ${password}

Enter Email
    [Arguments]    ${email}
    Wait Until Element Is Visible    ${EMAIL_INPUT}  30
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
    Input Text     ${CONTACT_INPUT}   ${contact}

Click Register Button
    Click Element   ${REGISTER_BUTTON}

Verify Toast Message for registration
     [Arguments]      ${message}
     Wait Until Element Is Visible  ${SUCCESS_MESSAGE}
     Element Text Should Be   ${SUCCESS_MESSAGE}  ${message}