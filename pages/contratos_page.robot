*** Settings ***
Documentation     Page object para a pagina de contratos.
...               Andre Fettermann andre.fettermann@trt1.jus.br TRT1/DG/STI/CSIS/DISAD
...               Sistema de gestao de contratos.
...               
...               
Library           SeleniumLibrary

*** Variables ***
${CONTRATOS_FIELDSET}                     //fieldset[@id='fieldsetListarContrato']
${CONTRATOS_TITULO}                       ${CONTRATOS_FIELDSET}/div/div
${CONTRATOS_DIALOG_CONFIRMA_EXCLUSAO}     ${CONTRATOS_FIELDSET}/div[3]
${CONTRATOS_BTN_CONFIRMA_EXCLUSAO}        ${CONTRATOS_DIALOG_CONFIRMA_EXCLUSAO}/div[3]/button[1]
${CONTRATOS_BTN_NAO_CONFIRMA_EXCLUSAO}    ${CONTRATOS_DIALOG_CONFIRMA_EXCLUSAO}/div[3]/button[2]
${CONTRATOS_INPUT_NUMERO_PROCESSO}        id:listarContrato:processoCod_input
${CONTRATOS_INPUT_ANO_PROCESSO}           id:listarContrato:processoAno_input
${CONTRATOS_INPUT_NUMERO_CONTRATO}        id:listarContrato:contratoCod_input
${CONTRATOS_INPUT_ANO_CONTRATO}           id:listarContrato:contratoAno_input
${CONTRATOS_LABEL_SELECT_SETOR}           id:listarContrato:cmbContratoSetor_label
${CONTRATOS_UL_SELECT_SETOR}              //ul[@id='listarContrato:cmbContratoSetor_items']
${CONTRATOS_INPUT_OBJETO}                 id:listarContrato:objeto
${CONTRATOS_LABEL_SELECT_CONTRATADA}      id:listarContrato:cmbContratada_label
${CONTRATOS_UL_SELECT_CONTRATADA}         //ul[@id='listarContrato:cmbContratada_items']
${CONTRATOS_LABEL_SELECT_SITUACAO}        id:listarContrato:cmbSituacaoContrato_label
${CONTRATOS_UL_SELECT_SITUACAO}           //ul[@id='listarContrato:cmbSituacaoContrato_items']
${CONTRATOS_TABLE}                        //div[@id='listarContrato:table']/div[2]/table
${CONTRATOS_TABLE_PAGINATOR}              id:listarContrato:table_paginator_top
${CONTRATOS_TABLE_HEADER}                 //thead[@id='listarProprietario:table_head']
${CONTRATOS_TABLE_DATA}                   //tbody[@id='listarContrato:table_data']
${CONTRATOS_BTN_PESQUISAR}                id:listarContrato:btnPesquisar
${CONTRATOS_BTN_LIMPAR}                   id:listarContrato:btnLimparPesquisa
${CONTRATOS_BTN_INCLUIR}                  id:listarContrato:btnIncluir
${CONTRATOS_BTN_VISUALIZAR}               id:listarContrato:btnVisualizar
${CONTRATOS_BTN_EXCLUIR}                  id:listarContrato:btnExcluir
${CONTRATOS_BTN_VOLTAR}                   id:listarContrato:btnVoltar
${CONTRATOS_DIALOG_MENSAGEM_ERRO}         //div[@id='primefacesmessagedlg']
${CONTRATOS_DIALOG_STATUS}                id:statusDialog

*** Keywords ***
acessa a pagina de contratos
    Click Link         link=Contrato
    Click Element      xpath://li/a[contains(text(),'Contratos')]

titulo da pagina igual a "${texto}"
    Element Text Should Be          ${CONTRATOS_TITULO}       ${texto}

preenche NUMERO PROCESSO "${numero}"
    Wait Until Element is Visible       id:listarContrato:processoCod_input
    Input Text                          id:listarContrato:processoCod_input     ${numero}                     

preenche ANO PROCESSO com "${ano}"
    Input Text                      ${CONTRATOS_INPUT_ANO_PROCESSO}         ${ano}

preenche NUMERO CONTRATO com "${numero}"
    Input Text                      ${CONTRATOS_INPUT_NUMERO_CONTRATO}      ${numero}

preenche ANO CONTRATO com "${ano}"
    Input Text                      ${CONTRATOS_INPUT_ANO_CONTRATO}         ${ano}

seleciona SETOR GESTOR com "${opcao}"
    Click Element                   ${CONTRATOS_LABEL_SELECT_SETOR}
    Click Element                   xpath:${CONTRATOS_UL_SELECT_SETOR}/li[@data-label='${opcao}']

preenche OBJETO CONTRATACAO com "${texto}"
    Input Text                      ${CONTRATOS_INPUT_OBJETO}               ${texto}

seleciona CONTRATADA com "${opcao}"
    Click Element                   ${CONTRATOS_LABEL_SELECT_CONTRATADA}     
    Click Element                   xpath:${CONTRATOS_UL_SELECT_CONTRATADA}/li[@data-label='${opcao}']

seleciona SITUACAO com "${opcao}"
    Click Element                   ${CONTRATOS_LABEL_SELECT_SITUACAO}     
    Click Element                   xpath:${CONTRATOS_UL_SELECT_SITUACAO}/li[@data-label='${opcao}']

# Pesquisar
solicita pesquisar
    Click Button                    ${CONTRATOS_BTN_PESQUISAR}

# Inclusao
o botao incluir deveria estar habilitado
    Element Should Be Enabled       ${CONTRATOS_BTN_INCLUIR}

o botao incluir deveria esta desabilitado
    Element Should Be Disabled      ${CONTRATOS_BTN_INCLUIR}

solicita incluir
    Wait Until Element is Visible                   ${CONTRATOS_BTN_INCLUIR}
    contratos_page.o botao incluir deveria estar habilitado
    Click Button                                    ${CONTRATOS_BTN_INCLUIR}

# Visualizar
o botao visualizar deveria estar habilitado
    Element Should Be Enabled       ${CONTRATOS_BTN_VISUALIZAR}

o botao visualizar deveria estar desabilitado
    Element Should Be Disabled      ${CONTRATOS_BTN_VISUALIZAR}

solicita visualizar
    contratos_page.o botao visualizar deveria estar habilitado
    Click Button                    ${CONTRATOS_BTN_VISUALIZAR}

# Exclusao
o botao excluir deveria estar habilitado na pagina de contratos
    Element Should Be Enabled       ${CONTRATOS_BTN_EXCLUIR}

o botao excluir deveria estar desabilitado na pagina de contratos
    Element Should Be Disabled      ${CONTRATOS_BTN_EXCLUIR}

solicita excluir
    contratos_page.o botao excluir deveria estar habilitado na pagina de contratos
    Click Button                    ${CONTRATOS_BTN_EXCLUIR}

confirmacao de exclusao esta visivel
    Element Should Be Visible       xpath:${CONTRATOS_DIALOG_CONFIRMA_EXCLUSAO}

confirma exclusao
    Click Button                    xpath:${CONTRATOS_BTN_CONFIRMA_EXCLUSAO}

nao confirma exclusao
    Click Button                    xpath:${CONTRATOS_BTN_NAO_CONFIRMA_EXCLUSAO}

# TABLE
seleciona contrato numero "${texto}"
    Wait Until Element is Visible   xpath://td[contains(text(),'${texto}')]
    Click Element                   xpath://td[contains(text(),'${texto}')]

a tabela de contratos deveria estar vazia
    Element Should Contain              ${CONTRATOS_TABLE_PAGINATOR}      0 até 0 total 0

total de registros da tabela igual a "${total}"
    Wait Until Element is Not Visible   ${CONTRATOS_DIALOG_STATUS}    timeout=15
    Element Should Contain              ${CONTRATOS_TABLE_PAGINATOR}      ${total}

a tabela nao deveria ter colunas em branco
    ${row_count} =                  Get Element Count       ${table}/tbody/tr   # Get row count
    FOR    ${rowindex}    IN RANGE    1    ${row_count}
        table columns should not contain empty value       ${table}   ${rowindex}
    END

table columns should not contain empty value 
    [Arguments]    ${p_table}    ${p_row_index}
    ${column_count} =    Get Element Count               ${p_table}/tbody/tr[1]/td   # Get Column count
    FOR    ${colindex}    IN RANGE    1             ${column_count}
        ${text} =   Get Table Cell    ${p_table}    ${p_row_index}  ${colindex}
        Should Not Be Empty           ${text}
    END

foi exibido alerta com mensagem "${texto}"
    Wait Until Element is Visible   xpath:${CONTRATOS_DIALOG_MENSAGEM_ERRO}
    Element Should Be Visible       xpath:${CONTRATOS_DIALOG_MENSAGEM_ERRO}
    Element Text Should Be          xpath:${CONTRATOS_DIALOG_MENSAGEM_ERRO}/div[2]      ${texto}
    Click Element                   xpath:${CONTRATOS_DIALOG_MENSAGEM_ERRO}/div/a
