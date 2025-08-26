*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${CHECKOUT_BTN}       xpath=//a[normalize-space()='Proceed to Checkout']
${ADDRESS_INPUT}      css=input[name='address1']
${COUNTRY_SELECT}     css=select[name='rcrs-country']
${REGION_SELECT}      css=select[name='rcrs-region']
${PHONE_INPUT}        css=input[name='contact']
${POSTAL_CODE}        css=input[name='postalcode']
${CASH_CHECKBOX}      css=input[type='checkbox']
${CONFIRM_BTN}        css=button[class='btn-hover']

*** Keywords ***
Click Checkout
    Click Button    ${CHECKOUT_BTN}

Enter Shipping Address
    [Arguments]    ${address}
    Input Text    ${ADDRESS_INPUT}    ${address}

Select Country
    [Arguments]    ${country}
    Select From List By Value    ${COUNTRY_SELECT}    ${country}

Select Region
    [Arguments]    ${region}
    Select From List By Value    ${REGION_SELECT}    ${region}

Enter Phone And Postal
    [Arguments]    ${phone}    ${code}
    Input Text    ${PHONE_INPUT}    ${phone}
    Input Text    ${POSTAL_CODE}    ${code}

Click Cash On Delivery
    Click Element    ${CASH_CHECKBOX}

Click Confirm
    Click Button    ${CONFIRM_BTN}
