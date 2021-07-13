*** Settings ***
Documentation     Page object para a pagina de dados do contrato.
...               Andre Fettermann andre.fettermann@trt1.jus.br TRT1/DG/STI/CSIS/DISAD
...               Sistema de gestao de contratos
Library           SeleniumLibrary

*** Variables ***
${CONTRATO_EDITA_FIELDSET}                     //fieldset[@id='fieldsetEditarContrato']
${CONTRATO_EDITA_TITULO}                       ${CONTRATO_EDITA_FIELDSET}/div/div
${CONTRATO_EDITA_INPUT_NUMERO_PROCESSO}        id:editarContrato:processoCod_input
${CONTRATO_EDITA_INPUT_ANO_PROCESSO}           id:editarContrato:processoAno_input
${CONTRATO_EDITA_INPUT_PROC_SIGEO}             id:editarContrato:processoCodSigeo_input
${CONTRATO_EDITA_INPUT_CLASSE}                 id:editarContrato:classe
${CONTRATO_EDITA_INPUT_PROC_FISICO}            id:editarContrato:processoFisico
${CONTRATO_EDITA_INPUT_PROC_ITEM}              id:editarContrato:processoItem
${CONTRATO_EDITA_INPUT_DIAS_TERMINO}           id:editarContrato:tempoRestanteTermino
${CONTRATO_EDITA_LABEL_SELECT_SITUACAO}        id:editarContrato:cmbSituacaoContrato_label
${CONTRATO_EDITA_UL_SELECT_SITUACAO}           //ul[@id='editarContrato:cmbSituacaoContrato_items']
${CONTRATO_EDITA_LABEL_SELECT_FORMALIZACAO}    id:editarContrato:cmbFormalizacaoContrato_label
${CONTRATO_EDITA_UL_SELECT_FORMALIZACAO}       //ul[@id='editarContrato:cmbFormalizacaoContrato_items']
${CONTRATO_EDITA_LABEL_SELECT_MODALIDADE}      id:editarContrato:cmbModalidade_label
${CONTRATO_EDITA_UL_SELECT_MODALIDADE}         //ul[@id='editarContrato:cmbModalidade_items']
${CONTRATO_EDITA_LABEL_SELECT_TIPO_PREGAO}     id:editarContrato:cmbTipoPregaoEletronico_label
${CONTRATO_EDITA_UL_SELECT_TIPO_PREGAO}        //ul[@id='editarContrato:cmbTipoPregaoEletronico_items']
${CONTRATO_EDITA_CHKBOX_PRORROGAVEL}           //div[@id='editarContrato:prorrogavel']/div[2]/span
${CONTRATO_EDITA_CHKBOX_CONTINUO}              //div[@id='editarContrato:continuo']/div[2]/span
${CONTRATO_EDITA_INPUT_NUM_CONTRATO}           id:editarContrato:contratoCod_input
${CONTRATO_EDITA_INPUT_ANO_CONTRATO}           id:editarContrato:contratoAno_input
${CONTRATO_EDITA_INPUT_REGISTRO_DIAGC}         id:editarContrato:registroDIAGC
${CONTRATO_EDITA_LABEL_SELECT_ESPECIE}         id:editarContrato:cmbEspecie_label
${CONTRATO_EDITA_UL_SELECT_ESPECIE}            //ul[@id='editarContrato:cmbEspecie_items']
${CONTRATO_EDITA_CHKBOX_RESIDENTE}             //div[@id='editarContrato:chkComMaoDeObraResidente']/div[2]/span
${CONTRATO_EDITA_INPUT_NUM_TERCEIRIZADOS}      id:editarContrato:estimadoTerceirizados_input
${CONTRATO_EDITA_TEXT_AREA_OBJETO}             id:editarContrato:objeto
${CONTRATO_EDITA_TABLE_CONTRATADAS}            //div[@id='editarContrato:tblContratadas']/div/table
${CONTRATO_EDITA_TABLE_THEAD_CONTRATADAS}      id:editarContrato:tblContratadas_head
${CONTRATO_EDITA_TABLE_TBODY_CONTRATADAS}      id:editarContrato:tblContratadas_data
${CONTRATO_EDITA_BTN_LEGENDA_EMPENHO}          //button[@id='editarContrato:legendaBtn']
${CONTRATO_EDITA_BTN_SELECIONAR_CONTRATADA}    ${CONTRATO_EDITA_BTN_LEGENDA_EMPENHO}/following-sibling::button
${CONTRATO_EDITA_BTN_SELECIONAR_EMPENHO}       ${CONTRATO_EDITA_BTN_LEGENDA_EMPENHO}/following-sibling::button[2]
${CONTRATO_EDITA_LABEL_SELECT_UNID_GESTORA}    id:editarContrato:cmbUnidadeGestora_label
${CONTRATO_EDITA_UL_SELECT_UNID_GESTORA}       //ul[@id='editarContrato:cmbUnidadeGestora_items']
${CONTRATO_EDITA_LABEL_SELECT_SEC_RESP}        id:editarContrato:cmbContratoSetor_label
${CONTRATO_EDITA_UL_SELECT_UNID_GESTORA}       //ul[@id='editarContrato:cmbContratoSetor_items']
${CONTRATO_EDITA_TABLE_SECRETARIAS}            //div[@id='editarContrato:tblContratoSetor']/div/table
${CONTRATO_EDITA_TABLE_THEAD_SECRETARIAS}      id:editarContrato:tblContratoSetor_head
${CONTRATO_EDITA_TABLE_TBODY_SECRETARIAS}      id:editarContrato:tblContratoSetor_data
${CONTRATO_EDITA_BTN_SELECIONAR_SECRETARIA}    //span[contains(text(),'Selecionar Secretaria')]//parent::button
${CONTRATO_EDITA_INPUT_DATA_INICIO}            id:editarContrato:dataInicio_input
${CONTRATO_EDITA_INPUT_OBS_INICIO}             id:editarContrato:obsInicio
${CONTRATO_EDITA_INPUT_DATA_TERMINO}           id:editarContrato:dataTermino_input
${CONTRATO_EDITA_INPUT_OBS_TERMINO}            id:editarContrato:obsTermino
${CONTRATO_EDITA_INPUT_VALOR_MENSAL}           id:editarContrato:valorMensal_input
${CONTRATO_EDITA_INPUT_VALOR_GLOBAL}           id:editarContrato:valorGlobal_input
${CONTRATO_EDITA_INPUT_FUNDAMENTACAO_LEGAL}    id:editarContrato:fundamentacaoLegal
${CONTRATO_EDITA_INPUT_PROGRAMA}               id:editarContrato:progTrabOrigRecOrcObj
${CONTRATO_EDITA_INPUT_DATA_ASSINATURA}        id:editarContrato:dataAssinatura_input
${CONTRATO_EDITA_INPUT_DATA_PUBLICACAO}        id:editarContrato:dataPublicacaoDOU_input
${CONTRATO_EDITA_INPUT_DATA_LICITACAO}         id:editarContrato:dataLicitacao_input

*** Keywords ***
titulo da pagina igual a "${texto}"
    Element Text Should Be          ${CONTRATO_EDITA_TITULO}                         ${texto}

preenche o campo NUMERO PROCESSO com "${valor}" na pagina de dados do contrato
    Input text                      ${CONTRATO_EDITA_INPUT_NUMERO_PROCESSO}          ${valor}

preenche o campo ANO PROCESSO com "${valor}" na pagina de dados do contrato
    Input text                      ${CONTRATO_EDITA_INPUT_ANO_PROCESSO}             ${valor}

preenche o campo PROC SIGEO com "${valor}" na pagina de dados do contrato
    Input text                      ${CONTRATO_EDITA_INPUT_PROC_SIGEO}               ${valor}

preenche o campo CLASSE com "${valor}" na pagina de dados do contrato
    Input text                      ${CONTRATO_EDITA_INPUT_CLASSE}                   ${valor}

preenche o campo NUM PROC FISICO com "${valor}" na pagina de dados do contrato
    Input text                      ${CONTRATO_EDITA_INPUT_PROC_FISICO}              ${valor}

preenche o campo PROCESSO ITEM com "${valor}" na pagina de dados do contrato
    Input text                      ${CONTRATO_EDITA_INPUT_PROC_ITEM}                ${valor}

preenche o campo DIAS PARA TERMINO DO CONTRATO com "${valor}" na pagina de dados do contrato
    Input text                      ${CONTRATO_EDITA_INPUT_DIAS_TERMINO}             ${valor}

seleciona o campo SITUACAO com "${opcao}" na pagina de dados do contrato
    Click Element                   ${CONTRATO_EDITA_LABEL_SELECT_SITUACAO}
    Click Element                   xpath:${CONTRATO_EDITA_UL_SELECT_SITUACAO}/li[@data-label='${opcao}']

seleciona o campo FORMALIZACAO DO CONTRATO com "${opcao}" na pagina de dados do contrato
    Click Element                   ${CONTRATO_EDITA_LABEL_SELECT_FORMALIZACAO}
    Click Element                   xpath:${CONTRATO_EDITA_UL_SELECT_FORMALIZACAO}/li[@data-label='${opcao}']

seleciona o campo MODALIDADE com "${opcao}" na pagina de dados do contrato
    Click Element                   ${CONTRATO_EDITA_LABEL_SELECT_MODALIDADE}
    Click Element                   xpath:${CONTRATO_EDITA_UL_SELECT_MODALIDADE}/li[@data-label='${opcao}']

seleciona o campo TIPO DE PREGAO ELETRONICO com "${opcao}" na pagina de dados do contrato
    Click Element                   ${CONTRATO_EDITA_LABEL_SELECT_TIPO_PREGAO}
    Click Element                   xpath:${CONTRATO_EDITA_UL_SELECT_TIPO_PREGAO}/li[@data-label='${opcao}']

seleciona o campo ESPECIE DE CONTRATO com "${opcao}" na pagina de dados do contrato
    Click Element                   ${CONTRATO_EDITA_LABEL_SELECT_ESPECIE}
    Click Element                   xpath:${CONTRATO_EDITA_UL_SELECT_ESPECIE}/li[@data-label='${opcao}']

preenche o campo NUMERO DO CONTRATO com "${valor}" na pagina de dados do contrato
    Input Text                      ${CONTRATO_EDITA_INPUT_NUM_CONTRATO}              ${valor}

preenche o campo objeto da contratacao com "${texto}" na pagina de dados do servico
    Input Text                      ${CONTRATO_EDITA_TEXT_AREA_OBJETO}                ${texto}

solicita salvar
    Click Button                    id:editarContrato:btnSalvar

pagina exibida para inclusao?
    contrato_page.titulo da pagina igual a "Editar Contrato"
    Text Field Value Should Be      ${CONTRATO_EDITA_INPUT_NUMERO_PROCESSO}           ${EMPTY}
    Text Field Value Should Be      ${CONTRATO_EDITA_INPUT_ANO_PROCESSO}              ${EMPTY}
    Text Field Value Should Be      ${CONTRATO_EDITA_INPUT_PROC_SIGEO}                ${EMPTY}
    Text Field Value Should Be      ${CONTRATO_EDITA_INPUT_CLASSE}                    ${EMPTY}
    Text Field Value Should Be      ${CONTRATO_EDITA_INPUT_PROC_FISICO}               ${EMPTY}
    Text Field Value Should Be      ${CONTRATO_EDITA_INPUT_PROC_ITEM}                 ${EMPTY}
    Text Field Value Should Be      ${CONTRATO_EDITA_INPUT_DIAS_TERMINO}              ${EMPTY}
    Element Text Should Be          ${CONTRATO_EDITA_LABEL_SELECT_SITUACAO}           Ativo
    Element Text Should Be          ${CONTRATO_EDITA_LABEL_SELECT_FORMALIZACAO}       Selecione:
    Element Text Should Be          ${CONTRATO_EDITA_LABEL_SELECT_MODALIDADE}         Selecione:
    Element Text Should Be          ${CONTRATO_EDITA_LABEL_SELECT_TIPO_PREGAO}        Selecione:
    ${is_prorrogavel}=              Get Element Attribute                             ${CONTRATO_EDITA_CHKBOX_PRORROGAVEL}      class
    Should Contain                  ${is_prorrogavel}                                 ui-icon-blank
    ${is_continuo}=                 Get Element Attribute                            ${CONTRATO_EDITA_CHKBOX_CONTINUO}         class
    Should Contain                  ${is_continuo}                                   ui-icon-blank
    Text Field Value Should Be      ${CONTRATO_EDITA_INPUT_NUM_CONTRATO}              ${EMPTY}
    Text Field Value Should Be      ${CONTRATO_EDITA_INPUT_ANO_CONTRATO}              ${EMPTY}
    Text Field Value Should Be      ${CONTRATO_EDITA_INPUT_REGISTRO_DIAGC}            ${EMPTY}
    Element Text Should Be          ${CONTRATO_EDITA_LABEL_SELECT_ESPECIE}            Selecione:
    ${is_residente}=                Get Element Attribute                             ${CONTRATO_EDITA_CHKBOX_RESIDENTE}        class
    Should Contain                  ${is_residente}                                   ui-icon-blank
    Text Field Value Should Be      ${CONTRATO_EDITA_INPUT_NUM_TERCEIRIZADOS}         ${EMPTY}
    Text Area Value Should Be       ${CONTRATO_EDITA_TEXT_AREA_OBJETO}                ${EMPTY}
    Element Text Should Be          ${CONTRATO_EDITA_TABLE_TBODY_CONTRATADAS}         Nenhuma contratada
    Element Should Be Enabled       ${CONTRATO_EDITA_BTN_LEGENDA_EMPENHO}
    Element Should Be Enabled       ${CONTRATO_EDITA_BTN_SELECIONAR_CONTRATADA}
    Element Should Be Enabled       ${CONTRATO_EDITA_BTN_SELECIONAR_EMPENHO}
    Element Text Should Be          ${CONTRATO_EDITA_LABEL_SELECT_UNID_GESTORA}       Selecione uma unidade gestora
    Element Text Should Be          ${CONTRATO_EDITA_LABEL_SELECT_SEC_RESP}           Selecione um setor
    Element Text Should Be          ${CONTRATO_EDITA_TABLE_TBODY_SECRETARIAS}         Nenhuma secretaria envolvida
    Element Should Be Enabled       ${CONTRATO_EDITA_BTN_SELECIONAR_SECRETARIA}       
    Text Field Value Should Be      ${CONTRATO_EDITA_INPUT_DATA_INICIO}               ${EMPTY}
    Text Field Value Should Be      ${CONTRATO_EDITA_INPUT_OBS_INICIO}                ${EMPTY}
    Text Field Value Should Be      ${CONTRATO_EDITA_INPUT_DATA_TERMINO}              ${EMPTY}
    Text Field Value Should Be      ${CONTRATO_EDITA_INPUT_OBS_TERMINO}               ${EMPTY}
    Text Field Value Should Be      ${CONTRATO_EDITA_INPUT_VALOR_MENSAL}              ${EMPTY}
    Text Field Value Should Be      ${CONTRATO_EDITA_INPUT_VALOR_GLOBAL}              ${EMPTY}
    Text Field Value Should Be      ${CONTRATO_EDITA_INPUT_FUNDAMENTACAO_LEGAL}       ${EMPTY}
    Text Field Value Should Be      ${CONTRATO_EDITA_INPUT_PROGRAMA}                  ${EMPTY}
    Text Field Value Should Be      ${CONTRATO_EDITA_INPUT_DATA_ASSINATURA}           ${EMPTY}
    Text Field Value Should Be      ${CONTRATO_EDITA_INPUT_DATA_PUBLICACAO}           ${EMPTY}
    Text Field Value Should Be      ${CONTRATO_EDITA_INPUT_DATA_LICITACAO}            ${EMPTY}

pagina exibida para edicao?
    contrato_page.titulo da pagina igual a "Editar Contrato"
