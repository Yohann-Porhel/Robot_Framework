*** Settings ***
Documentation       API list for practice : https://www.automationexercise.com/api_list
...                 Robot Framework with RequestsLibrary : https://github.com/MarketSquare/robotframework-requests

Library     Collections
Library     RequestsLibrary


*** Test Cases ***
API 1: Get All Products List
    [Documentation]     API URL: https://automationexercise.com/api/productsList
    ...                 Request Method : GET
    ...                 Response Code : 200
    ...                 Response JSON : All products list
    [Tags]              GET

    Get All The Products List

API 2: POST To All Products List
    [Documentation]     API URL: https://automationexercise.com/api/productsList
    ...                 Request Method: POST
    ...                 Response Code: 405
    ...                 Response Message: This request method is not supported.
    [Tags]              POST

    Post To All Products List

API 3: Get All Brands List
    [Documentation]     API URL: https://automationexercise.com/api/brandsList
    ...                 Request Method: GET
    ...                 Response Code: 200
    ...                 Response JSON: All brands list
    [Tags]              GET

    Get All Brands List

API 4: PUT To All Brands List
    [Documentation]     API URL: https://automationexercise.com/api/brandsList
    ...                 Request Method: PUT
    ...                 Response Code: 405
    ...                 Response Message: This request method is not supported.
    [Tags]              PUT

    Put To All Brands List

API 5: POST To Search Product
    [Documentation]     API URL: https://automationexercise.com/api/searchProduct
    ...                 Request Method: POST
    ...                 Request Parameter: search_product (For example: top, tshirt, jean)
    ...                 Response Code: 200
    ...                 Response JSON: Searched products list
    [Tags]              POST    05

    Post To Search Product


*** Keywords ***
Get All Brands List
    [Documentation]     API to get all brands list

    ${response}=    GET     https://automationexercise.com/api/brandsList       expected_status=200
    Log     BRANDS LIST :\n${response.json()}[brands]       console=True

Get All The Products List
    [Documentation]     API to get all products list

    ${response}=    GET     https://automationexercise.com/api/productsList     expected_status=200
    Log     PRODUCTS LIST :\n${response.json()}[products]       console=True

Post To All Products List
    [Documentation]     API to try to post to all products list.
    ...                 The request method is not supported.

    ${response}=    POST    https://automationexercise.com/api/productsList     expected_status=200
    Should Be Equal As Strings      ${response.json()}[responseCode]    405
    Should Be Equal As Strings      ${response.json()}[message]         This request method is not supported.

Post To Search Product
    [Documentation]     API to post to search product

    Create Session      base    https://automationexercise.com
    &{data}=    Create Dictionary    search_product=Jeans
    ${response}=    POST On Session   base      /api/searchProduct    json=${data}
    Log     PRODUCTS LIST :\n${response.json()}       console=True

Put To All Brands List
    [Documentation]     API to put to all brands list
    ...                 The request method is not supported.

    ${response}=    PUT     https://automationexercise.com/api/brandsList       expected_status=200
    Should Be Equal As Strings      ${response.json()}[responseCode]    405
    Should Be Equal As Strings      ${response.json()}[message]         This request method is not supported.
