*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               Andre Fettermann andre.fettermann@trt1.jus.br TRT1/DG/STI/CSIS/DISAD
...               Sistema de gestao de contratos
Library           SeleniumLibrary

*** Variables ***
${HML}         
${DEV}         contratos-jb-dev.trt1.jus.br:8443/contrato/login.xhtml?dswid=3566
${SERVER}         ${DEV}
${BROWSER}        firefox
${DELAY}          0.5
${VALID USER}     demo
${VALID PASSWORD}    mode
${LOGIN URL}      https://${SERVER}/
${WELCOME URL}    http://${SERVER}/welcome.html
${ERROR URL}      http://${SERVER}/error.html

*** Keywords ***
que estou na pagina de login
    Ir para a pagina de login

me autenticar com o usuario "${username}" e a senha "${password}"
    Preenche o nome de usuario   ${username}
    Preenche a senha  ${password}
    Envia as credenciais

deveria ser exibida a pagina inicial
    O titulo da pagina deveria ser "Predial"

deveria exibir a pagina de login
    Title Should Be    Contratos

##deveria ser exibida a mensagem "${texto}"
##    foi exibida a mensagem "${texto}"

O titulo da pagina deveria ser "${title}"
    Title Should Be    ${title}

Ir para a pagina de login
    Go To    ${LOGIN URL}
    Deveria exibir a pagina de login

Preenche o nome de usuario
    [Arguments]    ${username}
    Input Text    formAutenticacao:username    ${username}

Preenche a senha
    [Arguments]    ${password}
    Input Text    formAutenticacao:password    ${password}

Envia as credenciais
    Click Button    formAutenticacao:login-button

Clica em "${menu_item}" no menu
    Clica no item de menu "${menu_item}"

Clica no item de menu "${menu_item}"
    Clica no link  ${menu_item}
    
Clica no link
    [Arguments]     ${menu_item}
    Click Link      link=${menu_item}

foi exibida a mensagem "${texto}"
    Page Should Contain         ${texto}

deveria ser exibida a mensagem "${texto}"
    foi exibida a mensagem "${texto}"

# Hooks
Abre a sessao
    Open Browser                ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed          ${DELAY}

Encerra a sessao
    #Capture Page Screenshot
    #Click link  Sair
    Click Element      xpath://a/span[contains(text(),'Sair')]
    Fecha o navegador

Fecha o navegador
    Close Browser

Abre o navegador e entra no sistema
    Abre a sessao
    Ir para a pagina de login
    Preenche o nome de usuario  XXXXX
    Preenche a senha            XXXXXX
    Envia as credenciais
    O titulo da pagina deveria ser "Contratos"

