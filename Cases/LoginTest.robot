*** Settings ***
Library           SeleniumLibrary
Library           BuiltIn
Test Setup        Begin Web Test  # Setup to initialize browser and settings before each test case.
Test Teardown     End Web Test    # Teardown to close the browser after each test case.

*** Variables ***
${URL}                  https://demo.guru99.com/insurance/v1/index.php  # URL of the login page.
${EMAIL}                bro12344321@gmail.com  # Test email for login.
${PASSWORD}             12344321  # Test password for login.
${EMAIL_FIELD}          email  # Name attribute of the email input field.
${PASSWORD_FIELD}       password  # Name attribute of the password input field.
${SUCCESS_DASHBOARD}    Broker Insurance WebPage  # Text expected on successful login page.

*** Test Cases ***
Login with Valid Passcode Test
    [Documentation]    Logs in with valid email and password, expecting success message.
    Open Login Page  # Navigates to the login page.
    Enter Email    ${EMAIL}  # Enters the email in the email field.
    Enter Password    ${PASSWORD}  # Enters the password in the password field.
    Click Login Button  # Clicks the login button to submit the form.
    Verify Dashboard Loaded  # Verifies that the login was successful by checking page content.

*** Keywords ***
Begin Web Test
    Open Browser    ${URL}    chrome  # Opens the browser and navigates to URL in Chrome.
    Maximize Browser Window  # Maximizes browser window for better visibility in tests.
    Set Selenium Timeout    2s  # Sets a default timeout for Selenium actions.

End Web Test
    Close Browser  # Closes the browser at the end of the test case.

Open Login Page
    Go to    ${URL}  # Directs browser to the login URL.
    Wait Until Element Is Visible    name=${EMAIL_FIELD}    5s  # Waits until email field is visible.

Enter Email
    [Arguments]    ${EMAIL}  # Receives email as an argument for reusability.
    Input Text    name=${EMAIL_FIELD}    ${EMAIL}  # Enters the email text in the email input.

Enter Password
    [Arguments]    ${PASSWORD}  # Receives password as an argument for reusability.
    Input Password    name=${PASSWORD_FIELD}    ${PASSWORD}  # Enters the password securely.
    Wait Until Element Is Visible    name=submit    5s  # Waits until the submit button is visible.

Click Login Button
    Click Button    name=submit  # Clicks the login button to attempt login.
    Wait Until Page Contains    ${SUCCESS_DASHBOARD}    10s  # Waits until the dashboard text appears on successful login.

Verify Dashboard Loaded
    Page Should Contain    ${SUCCESS_DASHBOARD}  # Confirms the dashboard page has loaded by checking for expected text.
