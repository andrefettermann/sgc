*** Settings ***
Documentation     Teste de solicitacao de visualiazacao de contrato.
...               Andre Fettermann andre.fettermann@trt1.jus.br TRT1/DG/STI/CSIS/DISAD
...               Sistema de gestao contratual
...               
Resource          ../../resources/commons.robot
Resource          ../../steps/contratos_steps.robot
Resource          ../../steps/contrato_steps.robot
Suite Setup       Abre o navegador e entra no sistema
Suite Teardown    Encerra a sessao
Test Setup        Acessa o cadastro de contratos

*** Test Cases ***
# robot -t "Cenario 01" .\tests\contratos\solicitar_alteracao.robot
Cenario 01
    Given que foi selecionado o contrato com o numero "36/2012"
    When for solicitado visualizar o contrato
    Then deveria ser exibida a pagina para visualizacao dos dados do contrato
    When for solicitado editar os dados do contrato
    Then deveria ser exibida a pagina para edicao dos dados do contrato

