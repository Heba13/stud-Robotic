*** Settings ***
Library     SeleniumLibrary
Library     Collections
Library     RequestsLibrary
Resource   resources/pages/LoginPage.robot
Resource   resources/pages/register.robot
Resource   resources/pages/header.robot
Resource   resources/pages/Products.robot
Resource  resources/pages/cart.robot
Resource  resources/pages/order.robot
Resource   resources/variables.robot

Suite Setup    Open Browser To Shop
Suite Teardown    Close Browser
*** Variables ***
${BROWSER}    Chrome
${BASE_URL}  https://practice-react.sdetunicorns.com/
*** Test Cases ***

User Can Sign Up New User Account
    [Template]    Sign Up Template
    Admin    Admin1234    digital.testing88@gmail.com    female    Giza    0101182335    SHOP    Congratulations Your account has been created

Verify Two Products Are Purchased Successfully
    [Template]    Purchase Products Template
    regression.testing08@gmail.com    Heb@@2022    keyboard    laptop    Wireless Keyboard    Chromebook    33    700    733    Added To Cart    Giza    Algeria    Adrar    78965223    02
#
#Verify Order ID Returns Successfully
#    [Template]    Verify Order ID Template
#    regression.testing08@gmail.com    Heb@@2022    keyboard    Wireless Keyboard    Added To Cart    Giza    Algeria    Adrar    78965223    02

*** Keywords ***

Open Browser To Shop
    Open Browser    ${BASE_URL}    ${BROWSER}
    Maximize Browser Window

# ===== Sign Up Template =====
Sign Up Template
    [Arguments]    ${userName}  ${password}  ${email}  ${gender}  ${address}  ${contact}  ${products}  ${successMessage}
    Click Profile Icon
    Click Register Button in Header
    Enter Username    ${userName}
    Enter Password    ${password}
    Enter Email       ${email}
    Select Gender     ${gender}
    Enter First Address   ${FIRST_ADDRESS}
    Enter Second Address  ${SECOND_ADDRESS}
    Enter Contact Number  ${contact}
    Click Register Button
    Verify Products Page Title    ${products}
    Verify Toast Message          ${successMessage}
    Click Profile Icon
    Click Logout Button

# ===== Purchase Products Template =====
Purchase Products Template
    [Arguments]    ${email}  ${password}  ${keyboard}  ${laptop}  ${keyboardModel}  ${laptopModel}  ${kPrice}  ${lPrice}  ${total}  ${message}  ${address}  ${country}  ${region}  ${phone}  ${code}
    Click Profile Icon
    Click Login Button
    Enter Login Email       ${email}
    Enter Login Password    ${password}
    Click Login
    Click Profile Icon
    Logout Button Should Be Visible
    Click Products Tab
    Select Category    ${keyboard}
    Click Apply
    Verify Product Name    ${keyboardModel}
    # Assuming laptop filter hides laptop
    Select Category    ${laptop}
    Click Apply
    Open Product    ${keyboardModel}
    Verify Product Name    ${keyboardModel}
    Verify Product Price   ${kPrice}
    Cart Count Should Be    0
    Click Add To Cart
    Cart Count Should Be    1
    Verify Toast Message    ${message}
    Click Products Tab
    Select Category    ${laptop}
    Click Apply
    Open Product    ${laptopModel}
    Click Add To Cart
    Cart Count Should Be    2
    Click Cart Icon
    Click View Cart
    Verify Product In Cart    ${keyboardModel}    ${kPrice}
    Verify Product In Cart    ${laptopModel}     ${lPrice}
    Click Checkout
    Enter Shipping Address    ${address}
    Select Country            ${country}
    Select Region             ${region}
    Enter Phone And Postal    ${phone}    ${code}
    Click Cash On Delivery
    Click Confirm
    Click Order
#    Verify Shipping And Total    ${address}    ${total}

# ===== Verify Order ID Template =====
Verify Order ID Template
    [Arguments]    ${email}  ${password}  ${keyboard}  ${keyboardModel}  ${message}  ${address}  ${country}  ${region}  ${phone}  ${code}
    Click Profile Icon
    Click Login Button
    Enter Login Email       ${email}
    Enter Login Password    ${password}
    Click Login
    Click Profile Icon
    Logout Button Should Be Visible
    Click Products Tab
    Select Category    ${keyboard}
    Click Apply
    Open Product    ${keyboardModel}
    Click Add To Cart
    Cart Count Should Be    1
    Verify Toast Message    ${message}
    Click Cart Icon
    Click View Cart
    Click Checkout
    Enter Shipping Address    ${address}
    Select Country            ${country}
    Select Region             ${region}
    Enter Phone And Postal    ${phone}    ${code}
    Click Cash On Delivery
    Click Confirm
    Click Order
    Get Orders From API
    Verify Order ID Is Displayed    ${ORDER_ID}

# ===== API Keyword =====
Get Orders From API
    Create Session    order_api    https://api.example.com
    ${resp}=    Get Request    order_api    /orders
    ${json}=    To Json    ${resp.content}
    Set Suite Variable    ${ORDER_ID}    ${json}[0].orderId
    Log    API Order ID: ${ORDER_ID}
