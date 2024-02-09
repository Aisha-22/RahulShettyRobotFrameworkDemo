*** Settings ***
Documentation  To validate the Login form
Library        SeleniumLibrary
Library        Collections
Test Setup      open the browser with the Morgage payment url
Test Teardown   Close Browser Session
Resource        resources.robot

# robot C:\Users\Aisha\PycharmProjects\pythonProject\rahulshettyDemo\testDemo2.robot

*** Variables ***
${Error_Message_Login}      xpath:/html/body/div[1]/div/div/div/div/form/div[1]
${Shope_page_load}          css:.nav-link


*** Test Cases ***
#Validate UnSuccessful Login
#    Fill the login Form         ${user_name}        ${invalid_password}
#    wait until Element is located in the page       ${Error_Message_Login}
#    verify error message is correct

Validate Cards display in the Shopping Page
    Fill the login Form         ${user_name}        ${valid_password}
    wait until Element is located in the page       ${Shope_page_load}
    Verify Card titles in the Shop page
    Select the Card     Blackberry

Select the form and navigate to Child window
    Fill the login Details and Login Form

*** Keywords ***
Fill the login Form
    [Arguments]     ${username}     ${password}
    Input Text          xpath://input[@id='username']       ${username}
    Input Password      xpath://input[@id='password']       ${password}
    Click Button        xpath://input[@id='signInBtn']

wait until Element is located in the page
    [Arguments]     ${element}
    Wait Until Element Is Visible      ${element}

verify error message is correct
    ${result} =      Get Text        ${Error_Message_Login}
    Should Be Equal As Strings      ${result}       Incorrect username/password.

Verify Card titles in the Shop page
#   Returns a list containing given items. (When Creating list Variable you start with '@')
    @{expectedList} =    Create List     iphone X        Samsung Note 8      Nokia Edge      Blackberry
#   Returns a list of WebElement objects matching the locator
    ${elements} =        Get WebElements     css:.card-title
    @{actualList} =      Create List

    FOR     ${element}  IN  @{elements}
            Log     ${element.text}
            Append To List      ${actualList}       ${element.text}

    END
    Lists Should Be Equal       ${expectedList}     ${actualList}

#    Return a List

#Select the Card
#    [Arguments]       ${cardName}
#    ${elements} =      Get WebElements     css:.card-title
#    ${index} =         Set Variable        1
#    FOR    ${element}  IN  @{elements}
#        Exit For Loop If  '${cardName}' == '${element.text}'
#        ${index}=  Evaluate  ${index}  +  1
#    END
#    Click Button        xpath://body/app-root/app-shop//app-card-list[@class='row']/app-card[${index}]//button[@class='btn btn-info']

Select the Card
    [Arguments]       ${cardName}
    ${elements} =      Get WebElements     css:.card-title
    ${index} =         Set Variable        -1
    FOR    ${element}  IN  @{elements}
        ${index}=  Evaluate  ${index} + 1
        ${found} =  Run Keyword And Return Status  Should Be Equal As Strings  ${cardName}  ${element.text}
        Exit For Loop If  ${found}
    END
    Run Keyword If    '${index}' != '-1'    Click Button    xpath://body/app-root/app-shop//app-card-list[@class='row']/app-card[${index}]//button[@class='btn btn-info']

Fill the login Details and Login Form
    Input Text          xpath://input[@id='username']       rahulshettyacademy
    Input Password      xpath://input[@id='password']       learning
    Click Element       xpath://*[@id="login-form"]/div[4]/div/label[2]/span[2]
    Wait Until Element Is Visible       css:.modal-body
    Click Element       okayBtn
    Wait Until Element Is Not Visible       css:.modal-body
    Select From List By Value       css:select.form-control     teach
    Select Checkbox     xpath://*[@id="terms"]
    Checkbox Should Be Selected     xpath://*[@id="terms"]


