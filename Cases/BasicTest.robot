*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://www.youtube.com

*** Test Cases ***
Test Case 1
    Open Browser    ${URL}    chrome
    Sleep    10s
    Close Browser