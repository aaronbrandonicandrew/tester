*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${login_button}    //button[@id='dt_login_button']

*** Test Cases ***
Task 5
    Open Browser    https://app.deriv.com/    chrome
    Maximize Browser Window
    Wait Until Page Contains Element    //div[@class='btn-purchase__text_wrapper' and contains(.,'Rise')]    30
    Click Element    dt_login_button
    Wait Until Page Contains Element    //input[@type='email']    10
    Input Text    //input[@type='email']    aaron+4@besquare.com.my
    Input Text    //input[@type='password']    C0rrect_p4ssword
    Click Element    //button[@type='submit']
    Wait Until Page Contains Element    //div[@class='btn-purchase__text_wrapper']    30
    Click Element    dt_core_account-info_acc-info
    Wait Until Page Contains Element    //div[@class='acc-switcher__loginid-text' and contains(.,'CR4457136')]    30
    Click Element   dt_core_account-switcher_demo-tab
    Wait Until Page Contains Element    //div[@class='acc-switcher__loginid-text' and contains(.,'VRTC6739285')]    30
    Click Element    //span[@class="acc-switcher__id"]
    Wait Until Page Contains Element    //div[@class='btn-purchase__info btn-purchase__info--right']    30
    Click Element   //div[@class='cq-symbol-select-btn__container']
    Wait Until Page Contains Element    //*[@class="ciq-menu ciq-enabled cq-chart-title stx-show cq-symbols-display stxMenuActive"]
    Sleep    10