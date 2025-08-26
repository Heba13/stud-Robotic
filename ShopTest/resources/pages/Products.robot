*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${APPLY_BTN}          css=button[type='button']
${PRODUCT_PRICE}      css=div[class='product-details-price'] span
${ADD_TO_CART_BTN}    css=div[class='pro-details-cart btn-hover'] button


#    private final By pageHeadline = By.cssSelector("span[to='/shop-grid-standard']");
#    private final By  messages = By.cssSelector("div[class='react-toast-notifications__toast__content css-1ad3zal']");
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
