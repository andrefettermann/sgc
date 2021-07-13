*** Settings ***
Documentation     Steps para os testes associados a pagina de edicao/inclusao do contrato
...               Andre Fettermann andre.fettermann@trt1.jus.br TRT1/DG/STI/CSIS/DISAD
...               Sistema de gestao de contratos
...               
...               
...               
Library           SeleniumLibrary
Resource          ../pages/contrato_page.robot
Resource          ../pages/visualiza_contrato_page.robot

*** Keywords ***

# GIVEN
que foi informado o numero do processo "${numero}" na pagina de dados do contrato
    preenche o campo NUMERO PROCESSO com "${numero}" na pagina de dados do contrato

que foi informado o ano do processo "${ano}" na pagina de dados do contrato
    preenche o campo ANO PROCESSO com "${ano}" na pagina de dados do contrato

Given que foi informado o proc sigeo "${numero}" na pagina de dados do contrato
    preenche o campo PROC SIGEO com "${numero}" na pagina de dados do contrato

que foi selecionada especie de contrato "${opcao}" na pagina de dados do contrato
    seleciona o campo ESPECIE DE CONTRATO com "${opcao}" na pagina de dados do contrato

que foi informado o valor "${texto}" na pagina de dados do servico
    preenche o campo valor com "${texto}" na pagina de dados do servico

que foi informado o objeto da contratacao "${texto}" na pagina de dados do contrato
    preenche o campo objeto da contratacao com "${texto}" na pagina de dados do servico

que foi solicitado voltar a lista de contratos cadastrados
    Acessa o cadastro de contratos

# WHEN
for solicitado gravar os dados do contrato
    contrato_page.solicita salvar

for solicitado voltar a lista de contratos cadastrados
    Acessa o cadastro de contratos

for solicitado editar os dados do contrato
    visualiza_contrato_page.solicita editar

# THEN
deveria ser exibida a pagina para inclusao dos dados do contrato
    contrato_page.pagina exibida para inclusao?

deveria ser exibida a pagina para edicao dos dados do contrato
    contrato_page.pagina exibida para edicao?

deveria ser exibida a pagina para visualizacao dos dados do contrato
    visualiza_contrato_page.pagina exibida?

deveria ter sido incluido o contrato
    No Operation

deveria ter sido alterado o contrato
    No Operation

deveria exibir o numero do processo igual a "${texto}" na pagina de visualizacao dos dados do contrato
    visualiza_contrato_page.NUMERO PROCESSO igual a "${texto}"?

deveria exibir o ano do processo igual a "${texto}" na pagina de visualizacao dos dados do contrato
    visualiza_contrato_page.ANO PROCESSO igual a "${texto}"?

deveria exibir o proc sigeo igual a "${texto}" na pagina de visualizacao dos dados do contrato
    visualiza_contrato_page.PROC SIGEO igual a "${texto}"?

deveria exibir o objeto da contratacao igual a "${texto}" na pagina de visualizacao dos dados do contrato
    visualiza_contrato_page.OBJETO CONTRATACAO igual a "${texto}"?

deveria exibir a especie de contrato igual a "${texto}" na pagina de visualizacao dos dados do contrato
    visualiza_contrato_page.ESPECIE CONTRATO igual a "${texto}"?
