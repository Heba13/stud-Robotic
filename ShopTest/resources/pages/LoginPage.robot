*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${EMAIL_INPUT}         css=input[name='email']
${PASSWORD_INPUT}      css=input[id='password']
${LOGIN_BUTTON}        css=button.w-100.my-3.submit-btn

*** Keywords ***
Enter Email
    [Arguments]    ${email}
    Input Text    ${EMAIL_INPUT}    ${email}

Enter Password
    [Arguments]    ${password}
    Input Text    ${PASSWORD_INPUT}    ${password}

Click Login
    Click Button    ${LOGIN_BUTTON}
