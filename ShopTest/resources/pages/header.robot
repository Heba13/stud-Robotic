*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${PROFILE_ICON}        css=.account-setting-active
${REGISTER_BTN_HEADER}  xpath=//div[@class="account-dropdown active"]/ul/li[2]
${LOGIN_BTN}           css=a[href='/login']
${LOGOUT_BTN}          xpath=//div[@class='account-dropdown active']//li[contains(text(),'Logout')]
${CART_ICON}           css=div.cart-icon
${PRODUCTS_TAB}        css=a[href='/shop-grid-standard']
${VIEW_CART_BTN}       css=//a[@href='/cart']
${CART_COUNT}          css=span[class='count-style]

*** Keywords ***
Click Profile Icon

    Click Element    ${PROFILE_ICON}

Click Register Button in Header
    Wait Until Element Is Visible    ${REGISTER_BTN_HEADER}    30s
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

