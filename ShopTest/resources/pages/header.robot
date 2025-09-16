*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${PROFILE_ICON}        css:.account-setting-active
${REGISTER_BTN_HEADER}  css:a[href="/register"]
${LOGIN_BTN}           css:a[href='/login']
${LOGOUT_BTN}          xpath://div[@class='account-dropdown active']//li[contains(text(),'Logout')]
${CART_ICON}           css:div.cart-icon
${PRODUCTS_TAB}        css:a[href='/shop-grid-standard']
${VIEW_CART_BTN}       css://a[@href='/cart']
${CART_COUNT}         xpath://button[@class='icon-cart']/span[@class='count-style']

*** Keywords ***
Click Profile Icon
  Wait Until Element Is Visible  ${PROFILE_ICON}
    Click Element    ${PROFILE_ICON}

Click Register Button in Header
    Wait Until Element Is Visible    ${REGISTER_BTN_HEADER}    30s
    Click Element    ${REGISTER_BTN_HEADER}

Click Login Button
    Wait Until Element Is Visible   ${LOGIN_BTN}
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
    Wait Until Element Is Visible   ${PRODUCTS_TAB}  50
    Click Element    ${PRODUCTS_TAB}


Cart Count Should Be one
    Wait Until Element Is Visible     ${CART_COUNT}
    Element Text Should Be     ${CART_COUNT}     1
