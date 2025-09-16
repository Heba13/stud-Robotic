*** Settings ***
Library    SeleniumLibrary
Library    Collections

*** Variables ***
${ORDER_BTN}          css:button[variant='link']
${ORDER_ID_ELEMENT}   xpath://h3[@class='panel-title'][1]

*** Keywords ***
Click Order
    Click Element    ${ORDER_BTN}

Verify Shipping And Total
    [Arguments]    ${address}    ${total}
    Page Should Contain Element    xpath=//h4[normalize-space()='Address 1 : ${address}']
    Page Should Contain Element    xpath=//h4[normalize-space()='Total : $${total}']

Verify Order ID Is Displayed
    [Arguments]    ${order_id}
    ${displayed}=    Get Text    ${ORDER_ID_ELEMENT}
    ${ui_id}=    Evaluate    ${displayed}[11:].lower()
    Should Be Equal    ${ui_id}    ${order_id}
