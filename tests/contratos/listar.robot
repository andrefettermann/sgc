*** Settings ***
Documentation     Teste de listagem dos servicos cadastrados.
...               Andre Fettermann andre.fettermann@trt1.jus.br TRT1/DG/STI/CSIS/DISAD
...               Sistema de manutencao predial

Resource          ../../resources/commons.robot
Resource          ../../steps/servicos_steps.robot
Suite Setup       Abre o navegador e entra no sistema
Suite Teardown    Close Session
Test Setup        Acessa servicos

*** Test Cases ***
# robot -t "Cenario 01" .\tests\servicos\listar.robot
Cenario 01
    Given que nao ha servicos cadastrados
    Then deveriam ser exibidos "0 até 0 total 0 - Página: 1/1" servicos cadastrados

# robot -t "Cenario 02" .\tests\servicos\listar.robot
Cenario 02
    Given que ha servicos cadastrados
    Then deveriam ser exibidos "1 até 10 total 11640 - Página: 1/1164" servicos cadastrados
