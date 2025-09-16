*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${EMAIL_INPUT}         css:input[name='email']
${PASSWORD_INPUT}      css:input[id='password']
${LOGIN_BUTTON}        css:button[class='w-100 my-3 submit-btn']

*** Keywords ***
Enter Login Email
    [Arguments]    ${email}
    Wait Until Element Is Visible   ${EMAIL_INPUT}
    Input Text    ${EMAIL_INPUT}    ${email}

Enter Login Password
    [Arguments]    ${password}
    Input Text    ${PASSWORD_INPUT}    ${password}

Click Login in login page
    Click Element  ${LOGIN_BUTTON}
