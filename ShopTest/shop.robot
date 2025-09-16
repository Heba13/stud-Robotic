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
Test Teardown   Close Browser
Test Setup    Open Browser  ${BASE_URL}    ${BROWSER}
*** Test Cases ***

User Can Sign Up New User Account
    [Template]    Sign Up Template
    Admin    Admn@123    digital.testing1206@gmail.com    female    Giza   Zayed   0101182335    Congratulations Your account has been created

Verify Two Products Are Purchased Successfully
    [Template]    Purchase Products Template
    digital.testing1206@gmail.com    Admn@123   keyboard   Wireless Keyboard    Chromebook    33

Verify User Can Add To Cart Successfully
    [Template]    Verify User Can Add To Cart
    digital.testing1206@gmail.com    Admn@123   keyboard   Wireless Keyboard    Added To Cart

*** Keywords ***


# ===== Sign Up Template =====
Sign Up Template
    [Arguments]    ${userName}  ${password}  ${email}  ${gender}  ${address1}  ${address2}  ${contact}  ${successMessage}
    Open Browser    ${BASE_URL}    ${BROWSER}
    Click Profile Icon
    Click Register Button in Header
    Enter Username    ${userName}
    Enter Password    ${password}
    Enter Email       ${email}
    Select Gender     ${gender}
    Enter First Address   ${address1}
    Enter Second Address  ${address2}
    Enter Contact Number  ${contact}
    Click Register Button
    Verify Toast Message For Registration ${successMessage}

# ===== Purchase Products Template =====
Purchase Products Template
    [Arguments]    ${email}  ${password}  ${keyboard}   ${keyboardModel}  ${laptopModel}  ${kPrice}
    Click Profile Icon
    Click Login Button
    Enter Login Email       ${email}
    Enter Login Password    ${password}
    Click Login in login page
    Click Profile Icon
    Logout Button Should Be Visible
    Click Products Tab
    Select Category    ${keyboard}
    Click Apply
    Open Product    ${keyboardModel}
    Verify Product Name    ${keyboardModel}
    Verify Product Price   ${kPrice}


# ===== Verify Order Add To Cart Template =====
Verify User Can Add To Cart
    [Arguments]    ${email}  ${password}  ${keyboard}  ${keyboardModel}  ${message}
    Click Profile Icon
    Click Login Button
    Enter Login Email       ${email}
    Enter Login Password    ${password}
    Click Login in login page
    Click Products Tab
    Select Category    ${keyboard}
    Click Apply
    Open Product    ${keyboardModel}
    Click Add To Cart
    Verify Toast Message for add to cart   ${message}
    Cart Count Should Be one