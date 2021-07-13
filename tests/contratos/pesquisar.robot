*** Settings ***
Documentation     Teste de pesquisa dos contratos cadastrados.
...               Andre Fettermann andre.fettermann@trt1.jus.br TRT1/DG/STI/CSIS/DISAD
...               Sistema de gestão de contratos

Resource          ../../resources/commons.robot
Resource          ../../steps/contratos_steps.robot
Suite Setup       Abre o navegador e entra no sistema
Suite Teardown    Encerra a sessao
Test Setup        Acessa o cadastro de contratos
Test Template     Pesquisa contratos

*** Test Cases ***
# robot -t "Test 99" .\tests\contratos\pesquisar.robot
Cenario 02      ${EMPTY}    ${EMPTY}    ${EMPTY}    ${EMPTY}    Selecione:    ${EMPTY}    Selecione:    Ativo    1 até 20 total 409 - Página: 1/21
Cenario 03      123456      2014        36          2012        SCO           Contrato de aluguel do imóvel localizado na Rua Cônego Bulcão, 74 - Centro, onde instalada a 2ª VT de Resende - RJ    OTTO TEIXEIRA DE CARVALHO (005.007.121-15)    Ativo    0 até 0 total 0 - Página: 1/1
Cenario 04      31          14          36          2012        SCO           Contrato de aluguel do imóvel localizado na Rua Cônego Bulcão, 74 - Centro, onde instalada a 2ª VT de Resende - RJ    OTTO TEIXEIRA DE CARVALHO (005.007.121-15)    Ativo    0 até 0 total 0 - Página: 1/1
Cenario 05      31          2013        36          2012        SCO           Contrato de aluguel do imóvel localizado na Rua Cônego Bulcão, 74 - Centro, onde instalada a 2ª VT de Resende - RJ    OTTO TEIXEIRA DE CARVALHO (005.007.121-15)    Ativo    0 até 0 total 0 - Página: 1/1
Cenario 06      31          2014        1234        2012        SCO           Contrato de aluguel do imóvel localizado na Rua Cônego Bulcão, 74 - Centro, onde instalada a 2ª VT de Resende - RJ    OTTO TEIXEIRA DE CARVALHO (005.007.121-15)    Ativo    0 até 0 total 0 - Página: 1/1
Cenario 07      31          2014        36            12        SCO           Contrato de aluguel do imóvel localizado na Rua Cônego Bulcão, 74 - Centro, onde instalada a 2ª VT de Resende - RJ    OTTO TEIXEIRA DE CARVALHO (005.007.121-15)    Ativo    0 até 0 total 0 - Página: 1/1
Cenario 08      31          2014        36          1984        SCO           Contrato de aluguel do imóvel localizado na Rua Cônego Bulcão, 74 - Centro, onde instalada a 2ª VT de Resende - RJ    OTTO TEIXEIRA DE CARVALHO (005.007.121-15)    Ativo    0 até 0 total 0 - Página: 1/1
Cenario 09      31          2014        36          2012        APOSENT       Contrato de aluguel do imóvel localizado na Rua Cônego Bulcão, 74 - Centro, onde instalada a 2ª VT de Resende - RJ    OTTO TEIXEIRA DE CARVALHO (005.007.121-15)    Ativo    0 até 0 total 0 - Página: 1/1
Cenario 10      31          2014        36          2012        SCO           Contr. de aluguel do imóvel localizado na Rua Cônego Bulcão, 74 - Centro, onde instalada a 2ª VT de Resende - RJ      OTTO TEIXEIRA DE CARVALHO (005.007.121-15)    Ativo    0 até 0 total 0 - Página: 1/1
Cenario 11      31          2014        36          2012        SCO           Contrato de aluguel do imóvel localizado na Rua Cônego Bulcão, 74 - Centro, onde instalada a 2ª VT de Resende - RJ    (NOME NÃO INFORMADO) (20.174.368/0001-83)     Ativo    0 até 0 total 0 - Página: 1/1
Cenario 12      31          2014        36          2012        SCO           Contrato de aluguel do imóvel localizado na Rua Cônego Bulcão, 74 - Centro, onde instalada a 2ª VT de Resende - RJ    OTTO TEIXEIRA DE CARVALHO (005.007.121-15)    Cancelado    0 até 0 total 0 - Página: 1/1
Cenario 13      31          2014        36          2012        SCO           Contrato de aluguel do imóvel localizado na Rua Cônego Bulcão, 74 - Centro, onde instalada a 2ª VT de Resende - RJ    OTTO TEIXEIRA DE CARVALHO (005.007.121-15)    Ativo    1 até 1 total 1 - Página: 1/1


*** Keywords ***
Pesquisa contratos
    [Arguments]     ${nr_processo}    ${ano_processo}    ${contrato}    ${ano_contrato}    ${setor}    ${objeto}    ${contratada}    ${situacao}    ${total}
    Given que foi informado o numero do processo "${nr_processo}" na pesquisa de contratos
    Given que foi informado o ano do processo "${ano_processo}" na pesquisa de contratos
    Given que foi informado o numero do contrato "${contrato}" na pesquisa de contratos
    Given que foi informado o ano do contrato "${ano_contrato}" na pesquisa de contratos
    Given que foi informado o setor gestor "${setor}" na pesquisa de contratos
    Given que foi informado o objeto da contratacao "${objeto}" na pesquisa de contratos
    Given que foi informado a contratada "${contratada}" na pesquisa de contratos
    Given que foi informado a situacao "${situacao}" na pesquisa de contratos
    When for solicitado pesquisar o contrato
    Then deveriam ser exibidos "${total}" contratos cadastrados
