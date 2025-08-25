*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${APPLY_BTN}          css=button[type='button']
${PRODUCT_PRICE}      css=div.product-details-price span
${ADD_TO_CART_BTN}    css=div.pro-details-cart.btn-hover button

*** Keywords ***
Select Category
    [Arguments]    ${category}
    Click Button    xpath=//button[normalize-space()='${category}']

Click Apply
    Click Button    ${APPLY_BTN}

Open Product
    [Arguments]    ${productName}
    Click Element    xpath=//a[contains(text(),'${productName}')]

Verify Product Name
    [Arguments]    ${productName}
    Page Should Contain Element    xpath=//h2[contains(text(),'${productName}')]

Verify Product Price
    [Arguments]    ${price}
    Element Text Should Be    ${PRODUCT_PRICE}    $${price}

Click Add To Cart
    Click Button    ${ADD_TO_CART_BTN}
