*** Settings ***
Documentation     Teste de solicitacao de inclusao de contrato.
...               Andre Fettermann andre.fettermann@trt1.jus.br TRT1/DG/STI/CSIS/DISAD
...               Sistema de gestao de contratos
...               
...               
Resource          ../../resources/commons.robot
Resource          ../../steps/contratos_steps.robot
Resource          ../../steps/contrato_steps.robot
Suite Setup       Abre o navegador e entra no sistema
Suite Teardown    Encerra a sessao
Test Setup        Acessa o cadastro de contratos

*** Test Cases ***
# robot -t "Cenario 01" .\tests\contratos\solicitar_inclusao.robot
Cenario 01
    When for solicitado incluir um contrato
    Then deveria ser exibida a pagina para inclusao de contrato

