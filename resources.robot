*** Settings ***
Documentation       A resource file with reusable keywords and variables.
...
...                 The system specific keywords created here form our own
...                 domain specific language. They utilize keywords procided
...                 by the imported SeleniumLibrary.
Library             SeleniumLibrary


*** Variables ***
${BROWSER}              chrome
${URL}                  https://rahulshettyacademy.com/loginpagePractise/
${user_name}                              rahulshettyacademy
${invalid_password}                       password
${valid_password}                         learning

*** Keywords ***
open the browser with the Morgage payment url
    Open Browser  ${URL}  ${BROWSER}
#    Set Selenium Speed  0.5
    Maximize Browser Window

Close Browser Session
    Close Browser