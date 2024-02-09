*** Settings ***
Documentation  To validate the Login form
Library        SeleniumLibrary
Library        String
Library        Collections
Test Setup      open the browser with the Morgage payment url
Test Teardown   Close Browser Session
Resource        resources.robot

# robot C:\Users\Aisha\PycharmProjects\pythonProject\rahulshettyDemo\testDemo3.robot

*** Variables ***
${Error_Message_Login}      xpath:/html/body/div[1]/div/div/div/div/form/div[1]


*** Test Cases ***
Validate Child window Functionality
    Select the link of Child window
    Verify the user is Switched to Child window
    Grab the Email id in the Child window
    Switch to Parent window and enter the email


*** Keywords ***
Select the link of Child window
    Click Element       css:.blinkingText
    Sleep               5

Verify the user is Switched to Child window
    Switch Window       NEW
    Element Text Should Be      css:body > div.page-wrapper > section.page-title > div > div > h1       DOCUMENTS REQUEST

Grab the Email id in the Child window
# Creating a Variable to store the text
    ${text}=     Get Text        css:.red
    @{words}=    Split String    ${text}     at
#   0   ->Please email u
#   1   ->mentor@rahulshettyacademy.com with below template to receive response
    ${text_split}=      Get From List     ${words}      1
    log    ${text_split}
    @{words_2}=    Split String    ${text_split}
#   0   ->mentor@rahulshettyacademy.com
    ${email}=      Get From List     ${words_2}      0
    Set Global Variable     ${email}


Switch to Parent window and enter the email
    Switch Window       MAIN
    Title Should Be     LoginPage Practise | Rahul Shetty Academy
    Input Text          xpath://input[@id='username']       ${email}



