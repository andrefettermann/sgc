*** Settings ***
Documentation     Teste de solicitacao de exclusao de contrato.
...               Andre Fettermann andre.fettermann@trt1.jus.br TRT1/DG/STI/CSIS/DISAD
...               Sistema de gestao de contratos
...               
Resource          ../../resources/commons.robot
Resource          ../../steps/contratos_steps.robot
Resource          ../../steps/contratos_excluidos_steps.robot
Suite Setup       Abre o navegador e entra no sistema
Suite Teardown    Encerra a sessao
Test Setup        Acessa o cadastro de contratos

*** Test Cases ***

# robot -t "Cenario 01" .\tests\contratos\excluir.robot
Cenario 01
    Given que se deseja buscar o processo de numero "1111" e ano "1901" na pesquisa de contratos
    When for solicitado pesquisar o contrato
    Then deveriam ser exibidos "1 até 1 total 1 - Página: 1/1" contratos cadastrados
    Given que foi selecionado o contrato com o numero "1111/01"
    When for solicitado excluir o contrato
    Then deveria ser exibida uma mensagem para confirmacao da exclusao do contrato na pesquisa de contratos
    When nao for confirmada a exclusao do contrato
    Then nao deveria ter sido excluido o contrato
    Given que se deseja buscar o processo de numero "1111" e ano "1901" na pesquisa de contratos
    When for solicitado pesquisar o contrato
    Then deveriam ser exibidos "1 até 1 total 1 - Página: 1/1" contratos cadastrados

# robot -t "Cenario 02" .\tests\contratos\excluir.robot
Cenario 02
    Given que se deseja buscar o processo de numero "1111" e ano "1901" na pesquisa de contratos
    When for solicitado pesquisar o contrato
    Then deveriam ser exibidos "1 até 1 total 1 - Página: 1/1" contratos cadastrados
    Given que foi selecionado o contrato com o numero "1111/01"
    When for solicitado excluir o contrato
    Then deveria ser exibida uma mensagem para confirmacao da exclusao do contrato na pesquisa de contratos
    When for confirmada a exclusao do contrato
    Then o processo de numero "1111" e ano "1901" deveria ser excluido da lista de contratos cadastrados
    Given que foi solicitado acessar os contratos excluidos
    Then deveria ser exibida a pagina de contratos excluidos
    Given que se deseja buscar o processo de numero "1111" e ano "1901" na pesquisa de contratos excluidos
    When for solicitado pesquisar o contrato excluido
    Then deveriam ser exibidos "1 até 1 total 1 - Página: 1/1" contratos excluidos


