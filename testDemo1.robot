*** Settings ***
Library  SeleniumLibrary
Test Teardown   Close Browser

# robot C:\Users\Aisha\PycharmProjects\pythonProject\rahulshettyDemo

*** Variables ***
${Error_Message_Login}      xpath:/html/body/div[1]/div/div/div/div/form/div[1]


*** Test Cases ***
Validate UnSuccessful Login
    open the browser with the Morgage payment url
    Fill the login Form
    wait until it checks and display error message
    verify error message is correct



*** Keywords ***
Open the browser with the Morgage payment url
    Create Webdriver    Chrome
    Go To   https://rahulshettyacademy.com/loginpagePractise/

Fill the login Form
    Input Text          xpath://input[@id='username']       Aisha_Demo
    Input Password      xpath://input[@id='password']       Password
    Click Button        xpath://input[@id='signInBtn']

wait until it checks and display error message
    Wait Until Element Is Visible      ${Error_Message_Login}

verify error message is correct
    ${result} =      Get Text        ${Error_Message_Login}
    Should Be Equal As Strings      ${result}       Incorrect username/password.

