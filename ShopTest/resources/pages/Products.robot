*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${APPLY_BTN}          css:button[type='button']
${PRODUCT_PRICE}      css:div[class='product-details-price'] span
${ADD_TO_CART_BTN}    xpath://button[normalize-space()='Add To Cart']
${PRODUCT_HEADLINE}   css:span[to='/shop-grid-standard']
${SUCCESS_MESSAGE}    css:div[class='react-toast-notifications__toast__content css-1ad3zal']

*** Keywords ***

Select Category
    [Arguments]    ${category}
    Click Element    xpath://button[normalize-space()='${category}']

Click Apply
    Click Element    ${APPLY_BTN}

Open Product
    [Arguments]    ${productName}
    Click Element    xpath://a[contains(text(),'${productName}')]

Verify Product Name
    [Arguments]    ${productName}
    Wait Until Element Is Visible   xpath://h2[contains(text(),'${productName}')]  40

Verify Product Price
    [Arguments]    ${price}
    Element Text Should Be    ${PRODUCT_PRICE}    $${price}

Click Add To Cart
    Wait Until Element Is Visible    ${ADD_TO_CART_BTN}     30
    Click Element    ${ADD_TO_CART_BTN}

Verify Toast Message for add to cart
     [Arguments]      ${message}
     Wait Until Element Is Visible  ${SUCCESS_MESSAGE}
     Element Text Should Be     ${SUCCESS_MESSAGE}   ${message}