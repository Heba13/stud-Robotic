*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${PROFILE_ICON}        css=button.account-setting-active
${REGISTER_BTN_HEADER}  xpath=(//a[normalize-space()='Register'])[1]
${LOGIN_BTN}           css=button[class='w-100 my-3 submit-btn']
${LOGOUT_BTN}          css=button.logout-btn
${CART_ICON}           css=div.cart-icon
${PRODUCTS_TAB}        css=li.products-tab
${VIEW_CART_BTN}       css=button.view-cart-btn
${CART_COUNT}          css=span.cart-count

*** Keywords ***
Click Profile Icon
    Click Element    ${PROFILE_ICON}

Click Register Button in Header
    Click Button    ${REGISTER_BTN_HEADER}

Click Login Button
    Click Element    ${LOGIN_BTN}

Click Logout Button
    Click Element    ${LOGOUT_BTN}

Logout Button Should Be Visible
    Element Should Be Visible    ${LOGOUT_BTN}

Click Cart Icon
    Click Element    ${CART_ICON}

Click View Cart
    Click Element    ${VIEW_CART_BTN}

Click Products Tab
    Click Element    ${PRODUCTS_TAB}

Get Cart Count
    [Return]    Get Text    ${CART_COUNT}
