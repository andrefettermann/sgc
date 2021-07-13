*** Settings ***
Documentation     Steps para os testes de aceitacao associados a pagina de 
...               listagem dos contratos.
...               Andre Fettermann andre.fettermann@trt1.jus.br 
...               TRT1/DG/STI/CSIS/DISAD
...               Sistema de gestao de contratos
...               
...               
Library           SeleniumLibrary
Resource          ../resources/commons.robot
Resource          ../pages/contratos_page.robot

*** Keywords ***

# GIVEN
que foi informado o numero do processo "${numero}" na pesquisa de contratos
    contratos_page.preenche NUMERO PROCESSO "${numero}"

que foi informado o ano do processo "${ano}" na pesquisa de contratos
    contratos_page.preenche ANO PROCESSO com "${ano}"

que foi informado o numero do contrato "${numero}" na pesquisa de contratos
    contratos_page.preenche NUMERO CONTRATO com "${numero}"

que foi informado o ano do contrato "${ano_contrato}" na pesquisa de contratos
    contratos_page.preenche ANO CONTRATO com "${ano}"

que foi informado o setor gestor "${opcao}" na pesquisa de contratos
    contratos_page.seleciona SETOR GESTOR com "${opcao}"

que foi informado o objeto da contratacao "${texto}" na pesquisa de contratos
    contratos_page.preenche OBJETO CONTRATACAO com "${texto}"

que foi informado a contratada "${opcao}" na pesquisa de contratos
    contratos_page.seleciona CONTRATADA com "${opcao}"

que se deseja buscar o processo de numero "${numero}" e ano "${ano}" na pesquisa de contratos
    que foi informado o numero do processo "${numero}" na pesquisa de contratos
    que foi informado o ano do processo "${ano}" na pesquisa de contratos

que foi informado a situacao "${opcao}" na pesquisa de contratos
    contratos_page.seleciona SITUACAO com "${opcao}"

que nao foi selecionado um contrato
    No Operation

que foi selecionado o contrato com o numero "${numero}"
    contratos_page.seleciona contrato numero "${numero}"

# WHEN

for solicitado pesquisar o contrato
    contratos_page.solicita pesquisar
    
for solicitado incluir um contrato
    contratos_page.solicita incluir

for solicitado excluir o contrato
    contratos_page.solicita excluir

for solicitado visualizar o contrato
    contratos_page.solicita visualizar

nao for confirmada a exclusao do contrato
    contratos_page.nao confirma exclusao

for confirmada a exclusao do contrato
    contratos_page.confirma exclusao

# THEN
deveria ser exibida a pagina de contratos
    contratos_page.titulo da pagina igual a "Contratos"

deveriam ser exibidos "${total}" contratos cadastrados
    contratos_page.total de registros da tabela igual a "${total}"

deveria ser exibida uma mensagem para confirmacao da exclusao do contrato na pesquisa de contratos
    contratos_page.confirmacao de exclusao esta visivel

nao deveria ter sido incluido o contrato
    No Operation

nao deveria ter sido excluido o contrato
    No Operation

o processo de numero "${numero}" e ano "${ano}" deveria ser excluido da lista de contratos cadastrados
    que se deseja buscar o processo de numero "${numero}" e ano "${ano}" na pesquisa de contratos
    for solicitado pesquisar o contrato
    deveriam ser exibidos "0 até 0 total 0 - Página: 1/1" contratos cadastrados

# Hooks
Acessa o cadastro de contratos
    acessa a pagina de contratos