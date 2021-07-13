*** Settings ***
Documentation     Steps para os testes de aceitacao associados a pagina de 
...               contratos excluidos.
...               Andre Fettermann andre.fettermann@trt1.jus.br 
...               TRT1/DG/STI/CSIS/DISAD
...               Sistema de gestao de contratos
...               
...               
Library           SeleniumLibrary
Resource          ../pages/contratos_excluidos_page.robot

*** Keywords ***

# GIVEN
que foi informado o numero do processo "${numero}" na pesquisa de contratos excluidos
    contratos_excluidos_page.preenche NUMERO PROCESSO "${numero}"

que foi informado o ano do processo "${ano}" na pesquisa de contratos excluidos
    contratos_excluidos_page.preenche ANO PROCESSO com "${ano}"

que foi solicitado acessar os contratos excluidos
    Acessa contratos excluidos

que se deseja buscar o processo de numero "${numero}" e ano "${ano}" na pesquisa de contratos excluidos
    que foi informado o numero do processo "${numero}" na pesquisa de contratos excluidos
    que foi informado o ano do processo "${ano}" na pesquisa de contratos excluidos

# WHEN

for solicitado pesquisar o contrato excluido
    contratos_excluidos_page.solicita pesquisar

# THEN
deveria ser exibida a pagina de contratos excluidos
    contratos_excluidos_page.titulo da pagina igual a "Contratos Excluídos"

deveriam ser exibidos "${total}" contratos excluidos
    contratos_excluidos_page.total de registros da tabela igual a "${total}"

deveria ser exibida uma mensagem para confirmacao da exclusao do contrato contratos excluidos
    contratos_page.confirmacao de exclusao esta visivel

o processo de numero "${numero_processo}" e ano "${ano}" deveria ser excluido da lista de contratos excluidos
    que se deseja buscar o processo de numero "${numero}" e ano "${ano}" na pesquisa de contratos excluidos
    for solicitado pesquisar o contrato excluido
    deveriam ser exibidos "0 até 0 total 0 - Página: 1/1" contratos excluidos

# Hooks
Acessa contratos excluidos
    acessa a pagina de contratos excluidos