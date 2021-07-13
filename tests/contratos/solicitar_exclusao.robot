*** Settings ***
Documentation     Teste de solicitacao de exclusao de contrato.
...               Andre Fettermann andre.fettermann@trt1.jus.br TRT1/DG/STI/CSIS/DISAD
...               Sistema de gestao de contratos
...               
Resource          ../../resources/commons.robot
Resource          ../../steps/contratos_steps.robot
Suite Setup       Abre o navegador e entra no sistema
Suite Teardown    Encerra a sessao
Test Setup        Acessa o cadastro de contratos

*** Test Cases ***
# robot -t "Cenario 01" .\tests\contratos\solicitar_exclusao.robot
Cenario 01
    Given que nao foi selecionado um contrato
    When for solicitado excluir o contrato
    Then deveria ser exibida a mensagem "Favor selecionar um registro da tabela para proceder esta ação."

# robot -t "Cenario 02" .\tests\contratos\solicitar_exclusao.robot
Cenario 02
    Given que foi selecionado o contrato com o numero "36/2012"
    When for solicitado excluir o contrato
    Then deveria ser exibida uma mensagem para confirmacao da exclusao do contrato
