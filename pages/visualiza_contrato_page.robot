*** Settings ***
Documentation     Page object para a pagina de visualizacao dos dados do contrato.
...               Andre Fettermann andre.fettermann@trt1.jus.br TRT1/DG/STI/CSIS/DISAD
...               Sistema de gestao de contratos
Library           SeleniumLibrary

*** Variables ***
${CONTRATO_VISUALIZA_FIELDSET}                     //fieldset[@id='fieldsetEditarContrato']
${CONTRATO_VISUALIZA_TITULO}                       ${CONTRATO_VISUALIZA_FIELDSET}/div/div
${CONTRATO_VISUALIZA_BTN_EDITAR}                   id:editarContrato:btnEditar
${CONTRATO_VISUALIZA_NUMERO_PROCESSO}              //label[@for='editarContrato:processoCod_input']
${CONTRATO_VISUALIZA_ANO_PROCESSO}                 //label[@for='editarContrato:processoAno_input']
${CONTRATO_VISUALIZA_PROC_SIGEO}                   //label[@for='editarContrato:processoCodSigeo_input']
${CONTRATO_VISUALIZA_CLASSE}                       //label[@for='editarContrato:classe']
${CONTRATO_VISUALIZA_PROC_FISICO}                  //label[@for='editarContrato:processoFisico']
${CONTRATO_VISUALIZA_PROC_ITEM}                    //label[@for='editarContrato:processoItem']
${CONTRATO_VISUALIZA_DIAS_TERMINO}                 id:editarContrato:tempoRestanteTermino
${CONTRATO_VISUALIZA_SITUACAO}                     //label[@for='editarContrato:cmbSituacaoContrato_focus']
${CONTRATO_VISUALIZA_FORMALIZACAO}                 //label[@for='editarContrato:cmbFormalizacaoContrato_focus']
${CONTRATO_VISUALIZA_MODALIDADE}                   //label[@for='editarContrato:cmbModalidade_focus']
${CONTRATO_VISUALIZA_TIPO_PREGAO}                  //label[@for='editarContrato:cmbTipoPregaoEletronico_focus']
${CONTRATO_VISUALIZA_PRORROGAVEL}                  //label[@for='editarContrato:prorrogavel_input']
${CONTRATO_VISUALIZA_CONTINUO}                     //label[@for='editarContrato:continuo_input']
${CONTRATO_VISUALIZA_NUM_CONTRATO}                 //label[@for='editarContrato:contratoCod_input']
${CONTRATO_VISUALIZA_ANO_CONTRATO}                 //label[@for='editarContrato:contratoAno_input']
${CONTRATO_VISUALIZA_REGISTRO_DIAGC}               //label[@for='editarContrato:registroDIAGC']
${CONTRATO_VISUALIZA_ESPECIE}                      //label[@for='editarContrato:cmbEspecie_focus']
${CONTRATO_VISUALIZA_RESIDENTE}                    //label[@id='editarContrato:chkComMaoDeObraResidente_input']
${CONTRATO_VISUALIZA_NUM_TERCEIRIZADOS}            //label[@id='editarContrato:estimadoTerceirizados_input']
${CONTRATO_VISUALIZA_OBJETO}                       id:editarContrato:objeto
${CONTRATO_VISUALIZA_TABLE_CONTRATADAS}            //div[@id='editarContrato:tblContratadas']/div/table
${CONTRATO_VISUALIZA_TABLE_THEAD_CONTRATADAS}      id:editarContrato:tblContratadas_head
${CONTRATO_VISUALIZA_TABLE_TBODY_CONTRATADAS}      id:editarContrato:tblContratadas_data
${CONTRATO_VISUALIZA_BTN_LEGENDA_EMPENHO}          //button[@id='editarContrato:legendaBtn']
${CONTRATO_VISUALIZA_UNID_GESTORA}                 //label[@id='editarContrato:cmbUnidadeGestora_focus']
${CONTRATO_VISUALIZA_SEC_RESP}                     //label[@id='editarContrato:cmbContratoSetor_focus']
${CONTRATO_VISUALIZA_TABLE_SECRETARIAS}            //div[@id='editarContrato:tblContratoSetor']/div/table
${CONTRATO_VISUALIZA_TABLE_THEAD_SECRETARIAS}      id:editarContrato:tblContratoSetor_head
${CONTRATO_VISUALIZA_TABLE_TBODY_SECRETARIAS}      id:editarContrato:tblContratoSetor_data
${CONTRATO_VISUALIZA_DATA_INICIO}                  //label[@id='editarContrato:dataInicio_input']
${CONTRATO_VISUALIZA_OBS_INICIO}                   //label[@id='editarContrato:obsInicio']
${CONTRATO_VISUALIZA_DATA_TERMINO}                 //label[@id='editarContrato:dataTermino_input']
${CONTRATO_VISUALIZA_OBS_TERMINO}                  //label[@id='editarContrato:obsTermino']
${CONTRATO_VISUALIZA_VALOR_MENSAL}                 //label[@id='editarContrato:valorMensal_input']
${CONTRATO_VISUALIZA_VALOR_GLOBAL}                 //label[@id='editarContrato:valorGlobal_input']
${CONTRATO_VISUALIZA_FUNDAMENTACAO_LEGAL}          //label[@id='editarContrato:fundamentacaoLegal']
${CONTRATO_VISUALIZA_PROGRAMA}                     //label[@id='editarContrato:progTrabOrigRecOrcObj']
${CONTRATO_VISUALIZA_DATA_ASSINATURA}              //label[@id='editarContrato:dataAssinatura_input']
${CONTRATO_VISUALIZA_DATA_PUBLICACAO}              //label[@id='editarContrato:dataPublicacaoDOU_input']
${CONTRATO_VISUALIZA_DATA_LICITACAO}               //label[@id='editarContrato:dataLicitacao_input']

*** Keywords ***

obtem o valor do campo PROC SIGEO
    ${valor}      Get Text     ${CONTRATO_VISUALIZA_PROC_SIGEO}/following-sibling::span
    [Return]      ${valor}

obtem o valor do campo CLASSE
    ${valor}      Get Text     ${CONTRATO_VISUALIZA_CLASSE}/following-sibling::span
    [Return]      ${valor}

obtem o valor do campo NUM PROC FISICO
    ${valor}      Get Text     ${CONTRATO_VISUALIZA_PROC_FISICO}/following-sibling::span
    [Return]      ${valor}

obtem o valor do campo PROCESSO ITEM
    ${valor}      Get Text     ${CONTRATO_VISUALIZA_PROC_FISICO}/following-sibling::span
    [Return]      ${valor}

obtem o valor do campo DIAS PARA TERMINO DO CONTRATO
    ${valor}      Get Value    ${CONTRATO_VISUALIZA_DIAS_TERMINO}
    [Return]      ${valor}

obtem o valor do campo SITUACAO
    ${valor}      Get Text     ${CONTRATO_VISUALIZA_SITUACAO}/following-sibling::span
    [Return]      ${valor}

obtem o valor do campo FORMALIZACAO DO CONTRATO
    ${valor}      Get Text     ${CONTRATO_VISUALIZA_FORMALIZACAO}/following-sibling::span
    [Return]      ${valor}

obtem o valor do campo MODALIDADE
    ${valor}      Get Text     ${CONTRATO_VISUALIZA_MODALIDADE}/following-sibling::span
    [Return]      ${valor}

obtem o valor do campo TIPO DE PREGAO ELETRONICO
    ${valor}      Get Text     ${CONTRATO_VISUALIZA_MODALIDADE}/following-sibling::span
    [Return]      ${valor}

obtem o valor do campo NUMERO DO CONTRATO
    ${valor}      Get Text     ${CONTRATO_VISUALIZA_NUM_CONTRATO}/following-sibling::span
    [Return]      ${valor}

solicita editar
    Click Button               id:editarContrato:btnEditar

pagina exibida?
    Element Text Should Be     ${CONTRATO_VISUALIZA_TITULO}         Visualizar Contrato

NUMERO PROCESSO igual a "${esperado}"?
    ${obtido}=                    Get Text     ${CONTRATO_VISUALIZA_NUMERO_PROCESSO}/following-sibling::span
    Should Be Equal               ${obtido}         ${esperado}

ANO PROCESSO igual a "${esperado}"?
    ${obtido}=                    Get Text     ${CONTRATO_VISUALIZA_ANO_PROCESSO}/following-sibling::span
    Should Be Equal               ${obtido}         ${esperado}

PROC SIGEO igual a "${esperado}"?
    ${obtido}                     Get Text     ${CONTRATO_VISUALIZA_PROC_SIGEO}/following-sibling::span
    Should Be Equal               ${obtido}         ${esperado}

OBJETO CONTRATACAO igual a "${esperado}"?
    ${obtido}                     Get Value    ${CONTRATO_VISUALIZA_OBJETO}
    Should Be Equal               ${obtido}         ${esperado}

ESPECIE CONTRATO igual a "${esperado}"?
    ${obtido}                     Get Text     ${CONTRATO_VISUALIZA_ESPECIE}/following-sibling::span
    Should Be Equal               ${obtido}         ${esperado}
