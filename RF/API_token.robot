*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${login_button}    //button[@id='dt_login_button']

*** Test Cases ***
TC 01
# This test is to navigate to api token page
    Set Selenium Speed    0.5
    Open Browser    https://app.deriv.com/account/api-token/   chrome
    Maximize Browser Window
    Wait Until Page Contains Element    //input[@type='email']    10
    Input Text    //input[@type='email']    aaron+4@besquare.com.my
    Input Text    //input[@type='password']    C0rrect_p4ssword
    Click Element    //button[@type='submit']
    Wait Until Page Contains Element    //h4[@class='dc-text da-article__header']

# TC_02
# # This test is to check and verify scope checkbox
#     Click Element    //*[text()='Read']//parent::label
#     Click Element    //*[text()='Trade']//parent::label
#     Click Element    //*[text()='Payments']//parent::label
#     Click Element    //*[text()='Trading information']//parent::label
#     Click Element    //*[text()='Admin']//parent::label
#     Element Should Be Visible    //*[text()='Read']//ancestor::div[@class='composite-checkbox api-token__checkbox composite-checkbox--active']
#     Element Should Be Visible    //*[text()='Trade']//ancestor::div[@class='composite-checkbox api-token__checkbox composite-checkbox--active']
#     Element Should Be Visible    //*[text()='Payments']//ancestor::div[@class='composite-checkbox api-token__checkbox composite-checkbox--active']
#     Element Should Be Visible    //*[text()='Trading information']//ancestor::div[@class='composite-checkbox api-token__checkbox composite-checkbox--active']
#     Element Should Be Visible    //*[text()='Admin']//ancestor::div[@class='composite-checkbox api-token__checkbox composite-checkbox--active']
   
# TC_03
# # This test is to input token name without scopes
#     Input Text    //input[@type='text']    uwu
#     Element Should Be Disabled    //button[@class='dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-btn__button-group da-api-token__button']

# TC_04
# # This test is to input invalid token name with scopes
#     Click Element    //*[text()='Read']//parent::label
#     Input Text    //input[@type='text']    ==
#     Element Should Be Disabled    //button[@class='dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-btn__button-group da-api-token__button']

# TC_05
# # This test is to input invalid token name with scopes
    Click Element    //*[text()='Read']//parent::label
    Input Text    //input[@type='text']    ss
    Element Should Be Disabled    //button[@class='dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-btn__button-group da-api-token__button']

# TC_06
# # This test is to input valid token name with scopes
    Click Element    //*[text()='Read']//parent::label
    Input Text    //input[@type='text']    uwu
    Click Button    //button[@class='dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-btn__button-group da-api-token__button']
    Wait Until Page Contains Element    //*[text()='uwu']//parent::td[@class='da-api-token__table-cell da-api-token__table-cell--name']    
    Wait Until Page Contains Element   //*[text()='Read']//ancestor::td[@class='da-api-token__table-cell']

# TC_07
# # This test is to create token with a combination of scopes
    Click Element    //*[text()='Read']//parent::label
    Click Element    //*[text()='Trade']//parent::label
    Click Element    //*[text()='Payments']//parent::label
    Click Element    //*[text()='Trading information']//parent::label
    Click Element    //*[text()='Admin']//parent::label
    Input Text    //input[@type='text']    john
    Click Button    //button[@class='dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-btn__button-group da-api-token__button']
    Wait Until Page Contains Element    //*[text()='john']//ancestor::td[@class='da-api-token__table-cell da-api-token__table-cell--name']    
    Wait Until Page Contains Element    //*[text()='Read']//ancestor::td[@class='da-api-token__table-cell']
    Wait Until Page Contains Element    //*[text()='Trade']//ancestor::td[@class='da-api-token__table-cell']
    Wait Until Page Contains Element    //*[text()='Payments']//ancestor::td[@class='da-api-token__table-cell']
    Wait Until Page Contains Element    //*[text()='Trading information']//ancestor::td[@class='da-api-token__table-cell']
    Wait Until Page Contains Element    //*[text()='Admin']//ancestor::td[@class='da-api-token__table-cell']

TC_08
# This test is to test the copy, view token, scopes info and delete functions
    Click Element    //*[text()='Admin']//parent::label
    Input Text    //input[@type='text']    bill
    Click Button    //button[@class='dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-btn__button-group da-api-token__button']
    Wait Until Page Contains Element    //*[text()='bill']//ancestor::td[@class='da-api-token__table-cell da-api-token__table-cell--name']
    Wait Until Page Contains Element    //*[text()='Admin']//ancestor::td[@class='da-api-token__table-cell']
    Click Element    //*[@class="dc-icon dc-clipboard"]
    Wait Until Page Contains Element    //button[@class='dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-dialog__button']
    Click Button    //button[@class='dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-dialog__button']
    Click Element    //*[@class='dc-icon da-api-token__visibility-icon']
    Wait Until Page Contains Element    //p[@class="dc-text"]
    Click Element    //*[@class='dc-icon dc-clipboard da-api-token__delete-icon']
    Click Button    //button[@class='dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-dialog__button']
    Wait Until Page Does Not Contain    //*[text()='bill']//ancestor::td[@class='da-api-token__table-cell da-api-token__table-cell--name']