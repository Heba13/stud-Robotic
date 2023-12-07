*** Settings ***
Library    Collections
Library  SeleniumLibrary
*** Variables ***
${url}  https://eshop.vodafone.com.eg/en
${Browser}   Firefox
${userProfile_icon}  xpath://*[@id="userProfileMenu"]/button
${rejectCookies}  id:onetrust-reject-all-handler
${user_MSISDN_field}   id:username
${user_Password_field}  id:password
${gotoMyAccountButton}   css:input#submitBtn.btn.btn-primary.card-btn.js-btn-submit2
${searchBar}  id:searchInput
${outOfStock}  css:P.variants-options-invalid
${div}   div
${P}     P

*** Keywords ***
Vodafone eShop website opened
     Open Browser   ${url}  ${Browser}
     Maximize Browser Window
     Click Button  ${rejectCookies}

user Login Using ${msisdn} And ${password}
    [Arguments]  ${msisdn}  ${password}
    Click Button    ${userProfile_icon}
    input text    ${user_MSISDN_field}   ${msisdn}
    input text    ${user_Password_field}  ${password}
    Wait Until Element Is Visible  ${gotoMyAccountButton}
    Click Button  ${gotoMyAccountButton}

When enter search "${Keyword}" in search bar
    [Arguments]  ${Keyword}
    input text   ${searchBar}    ${Keyword}

click on the "${suggestion}" form suggestion list
    [Arguments]  ${suggestion}
    click Element   xpath://div/P[text()=' ${suggestion} ']

click on brand ${brand}
    [Arguments]  ${brand}
    Wait Until Element Is Visible  xpath://div[text()=' Oppo ']
     click Element    xpath://div[text()=' Oppo ']


select the version ${version}
   [Arguments]  ${version}
    ${element}=  Get WebElement    xpath:/html/body/vf-root/main/section[2]/vf-product-list-page/div[2]/div[2]/div[4]/vf-product-box-featured[1]/div/div[3]/div/div[2]/div/div
    Execute JavaScript    arguments[0].scrollIntoView(true);    ${element}


select color of the product ${color} and check if the product out of stock ${status}
   [Arguments]   ${color}  ${status}
   ${colorIcon}   Set Variable  xpath://button[@title='${color}']
   click Element  ${colorIcon}
   Should Be True    ${condition}   msg=Condition is not true
   ${actual_value}    Does Page Contain Link    ${outOfStock}
   Should Be Equal    ${actual_value}    ${status}    msg=error in stock

*** Keywords ***

Scroll Element Into View
          [Arguments]    ${element}
          Execute JavaScript    arguments[0].scrollIntoView(true)    ${element}

click on element contain text
         [Arguments]    ${text}   ${tag}
         ${textModefied}=   Evaluate  " ${text} "
         ${xpath} =     Evaluate  "//${tag}\[text()='${textModefied}']"
         click Element    ${xpath}


click Element By Script
          [Arguments]    ${xpath}
          ${element} =    Get WebElement   ${xpath}
          Execute JavaScript    arguments[0].click()    ${element}
