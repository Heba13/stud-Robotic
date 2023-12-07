*** Settings ***
Library     RequestsLibrary
Library     Collections

*** Variables ***
${url}   https://reqres.in/
${headers}    Content-Type=application/json
${id}   2
${UserName}   morpheus
${job}    leader

*** Test Cases ***

Get User Details   ${id}
Create User        ${UserName}  ${job}
Delete A User      ${id}

*** Keywords ***

Get User Details
    [Arguments]     ${id}
    ${response} =    Get Request    ${url}/${id}    headers=${headers}

    Log    ${response.content}
    Should Be Equal As Numbers    ${response.status_code}    200

    ${data} =    Set Variable    ${response.json()['data']}
    Log    User ID: ${data['id']}
    Log    Email: ${data['email']}
    Log    First Name: ${data['first_name']}
    Log    Last Name: ${data['last_name']}

    ${support} =    Set Variable    ${response.json()['support']}
    Log    Support URL: ${support['url']}
    Log    Support Text: ${support['text']}


Create User
    [Arguments]      ${name}   ${job}
    ${data} =   Create Dictionary    name=  ${name}   job=  ${job}
    ${response} =    Post Request    ${url}    data= ${data}    headers= ${headers}
    Log   ${response.content}
    Should Be Equal As Numbers    ${response.status_code}    201

    ${json_response} =   Evaluate    json.loads('''${response.content}''')    json
    ${User_id} =  Set Variable  ${json_response["id"]}


Delete A User
        [Arguments]    ${id}
        ${url} =        Set Variable    ${url}/${id}
        ${response} =   Delete Request  ${url}    headers=${headers}
        Log    ${response.content}
        Should Be Equal As Numbers    ${response.status_code}    204

