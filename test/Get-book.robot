*** Settings ***
Library    RequestsLibrary

*** Test Cases ***
TC001
    [Tags]    Testgrafana1
    Create Session    alias=get-books    url=https://demoqa.com    verify=${True}
    ${response}    GET On Session    alias=get-books    url=/BookStore/v1/Books    expected_status=200
    Log    ${response.status_code}
    Log    ${response.json()}
    Log    ${response.json()}[books][0][title]
    Should Be Equal    Git Pocket Guide    ${response.json()}[books][0][title]
