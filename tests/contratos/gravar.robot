*** Settings ***
Documentation     Teste de gravacao de servico.
...               Andre Fettermann andre.fettermann@trt1.jus.br TRT1/DG/STI/CSIS/DISAD
...               Sistema de manutencao predial
...               
...               
Resource          ../../resources/commons.robot
Resource          ../../steps/contratos_steps.robot
Resource          ../../steps/contrato_steps.robot
Suite Setup       Abre o navegador e entra no sistema
Suite Teardown    Encerra a sessao
Test Setup        Acessa o cadastro de contratos

*** Test Cases ***

## Inclusao ##

# robot -t "Cenario 01-A" .\tests\contratos\gravar.robot
Cenario 01-A
    When for solicitado incluir um contrato
    Then deveria ser exibida a pagina para inclusao dos dados do contrato
    When for solicitado gravar os dados do contrato
    Then deveria ser exibida a mensagem "Nº Processo: preenchimento obrigatório"
    Then deveria ser exibida a mensagem "Ano Processo: preenchimento obrigatório"
    Then deveria ser exibida a mensagem "Proc SIGEO: preenchimento obrigatório"
    Then deveria ser exibida a mensagem "Espécie de Contrato: preenchimento obrigatório"
    Then deveria ser exibida a mensagem "Objeto: preenchimento obrigatório"
    When for solicitado voltar a lista de contratos cadastrados
    Then nao deveria ter sido incluido o contrato
    Then deveriam ser exibidos "1 até 20 total 409 - Página: 1/21" contratos cadastrados

# robot -t "Cenario 01-B" .\tests\contratos\gravar.robot
Cenario 01-B
    When for solicitado incluir um contrato
    Then deveria ser exibida a pagina para inclusao dos dados do contrato
    Given que foi informado o ano do processo "1901" na pagina de dados do contrato
    Given que foi informado o proc sigeo "1111" na pagina de dados do contrato
    Given que foi selecionada especie de contrato "Aquisição" na pagina de dados do contrato
    Given que foi informado o objeto da contratacao "Gravar contrato - Cenario 01B" na pagina de dados do contrato
    When for solicitado gravar os dados do contrato
    Then deveria ser exibida a mensagem "Nº Processo: preenchimento obrigatório"
    When for solicitado voltar a lista de contratos cadastrados
    Then nao deveria ter sido incluido o contrato
    Then deveriam ser exibidos "1 até 20 total 409 - Página: 1/21" contratos cadastrados

# robot -t "Cenario 01-C" .\tests\contratos\gravar.robot
Cenario 01-C
    When for solicitado incluir um contrato
    Then deveria ser exibida a pagina para inclusao dos dados do contrato
    Given que foi informado o numero do processo "1111" na pagina de dados do contrato
    Given que foi informado o proc sigeo "1111" na pagina de dados do contrato
    Given que foi selecionada especie de contrato "Aquisição" na pagina de dados do contrato
    Given que foi informado o objeto da contratacao "Gravar contrato - Cenario 01B" na pagina de dados do contrato
    When for solicitado gravar os dados do contrato
    Then deveria ser exibida a mensagem "Ano Processo: preenchimento obrigatório"
    When for solicitado voltar a lista de contratos cadastrados
    Then nao deveria ter sido incluido o contrato
    Then deveriam ser exibidos "1 até 20 total 409 - Página: 1/21" contratos cadastrados

# robot -t "Cenario 01-D" .\tests\contratos\gravar.robot
Cenario 01-D
    When for solicitado incluir um contrato
    Then deveria ser exibida a pagina para inclusao dos dados do contrato
    Given que foi informado o numero do processo "1111" na pagina de dados do contrato
    Given que foi informado o ano do processo "1901" na pagina de dados do contrato
    Given que foi selecionada especie de contrato "Aquisição" na pagina de dados do contrato
    Given que foi informado o objeto da contratacao "Gravar contrato - Cenario 01B" na pagina de dados do contrato
    When for solicitado gravar os dados do contrato
    Then deveria ser exibida a mensagem "Proc SIGEO: preenchimento obrigatório"
    When for solicitado voltar a lista de contratos cadastrados
    Then nao deveria ter sido incluido o contrato
    Then deveriam ser exibidos "1 até 20 total 409 - Página: 1/21" contratos cadastrados

# robot -t "Cenario 01-E" .\tests\contratos\gravar.robot
Cenario 01-E
    When for solicitado incluir um contrato
    Then deveria ser exibida a pagina para inclusao dos dados do contrato
    Given que foi informado o numero do processo "1111" na pagina de dados do contrato
    Given que foi informado o ano do processo "1901" na pagina de dados do contrato
    Given que foi informado o proc sigeo "1111" na pagina de dados do contrato
    Given que foi informado o objeto da contratacao "Gravar contrato - Cenario 01B" na pagina de dados do contrato
    When for solicitado gravar os dados do contrato
    Then deveria ser exibida a mensagem "Espécie de Contrato: preenchimento obrigatório"
    When for solicitado voltar a lista de contratos cadastrados
    Then nao deveria ter sido incluido o contrato
    Then deveriam ser exibidos "1 até 20 total 409 - Página: 1/21" contratos cadastrados

# robot -t "Cenario 01-F" .\tests\contratos\gravar.robot
Cenario 01-F
    When for solicitado incluir um contrato
    Then deveria ser exibida a pagina para inclusao dos dados do contrato
    Given que foi informado o numero do processo "1111" na pagina de dados do contrato
    Given que foi informado o ano do processo "1901" na pagina de dados do contrato
    Given que foi informado o proc sigeo "1111" na pagina de dados do contrato
    Given que foi selecionada especie de contrato "Aquisição" na pagina de dados do contrato
    When for solicitado gravar os dados do contrato
    Then deveria ser exibida a mensagem "Objeto: preenchimento obrigatório"
    When for solicitado voltar a lista de contratos cadastrados
    Then nao deveria ter sido incluido o contrato
    Then deveriam ser exibidos "1 até 20 total 409 - Página: 1/21" contratos cadastrados

## Alteracao ##

# robot -t "Cenario 01-G" .\tests\contratos\gravar.robot
Cenario 01-G
    Given que foi selecionado o contrato com o numero "36/2012"
    When for solicitado visualizar o contrato
    Then deveria ser exibida a pagina para visualizacao dos dados do contrato
    When for solicitado editar os dados do contrato
    Then deveria ser exibida a pagina para edicao dos dados do contrato
    Given que foi informado o numero do processo "" na pagina de dados do contrato
    Given que foi informado o ano do processo "1901" na pagina de dados do contrato
    Given que foi informado o proc sigeo "1111" na pagina de dados do contrato
    Given que foi selecionada especie de contrato "Aquisição" na pagina de dados do contrato
    Given que foi informado o objeto da contratacao "Gravar contrato - Cenario 01B" na pagina de dados do contrato
    When for solicitado gravar os dados do contrato
    Then deveria ser exibida a mensagem "Nº Processo: preenchimento obrigatório"
    Given que foi solicitado voltar a lista de contratos cadastrados
    Given que foi informado o numero do processo "36" na pesquisa de contratos
    Given que foi informado o ano do processo "2012" na pesquisa de contratos
    When for solicitado pesquisar o contrato
    Then deveriam ser exibidos "1 até 1 total 1 - Página: 1/1" contratos cadastrados

## Inclusao com sucesso

# robot -t "Cenario 02-A" .\tests\contratos\gravar.robot
Cenario 02-A
    When for solicitado incluir um contrato
    Then deveria ser exibida a pagina para inclusao dos dados do contrato
    Given que foi informado o numero do processo "1111" na pagina de dados do contrato
    Given que foi informado o ano do processo "1901" na pagina de dados do contrato
    Given que foi informado o proc sigeo "1111" na pagina de dados do contrato
    Given que foi informado o objeto da contratacao "Gravar contrato - Cenario 02-A" na pagina de dados do contrato
    Given que foi selecionada especie de contrato "Aquisição" na pagina de dados do contrato
    When for solicitado gravar os dados do contrato
    Then deveria ter sido incluido o contrato
    Given que se deseja buscar o processo de numero "1111" e ano "1901" na pesquisa de contratos
    When for solicitado pesquisar o contrato
    Then deveriam ser exibidos "1 até 1 total 1 - Página: 1/1" contratos cadastrados
    Given que foi selecionado o contrato com o numero "1111/01"
    When for solicitado visualizar o contrato
    Then deveria ser exibida a pagina para visualizacao dos dados do contrato
    Then deveria exibir o numero do processo igual a "1111" na pagina de visualizacao dos dados do contrato
    Then deveria exibir o ano do processo igual a "1901" na pagina de visualizacao dos dados do contrato
    Then deveria exibir o proc sigeo igual a "1111" na pagina de visualizacao dos dados do contrato
    Then deveria exibir o objeto da contratacao igual a "Gravar contrato - Cenario 02-A" na pagina de visualizacao dos dados do contrato
    Then deveria exibir a especie de contrato igual a "Aquisição" na pagina de visualizacao dos dados do contrato

# robot -t "Cenario 02-B" .\tests\contratos\gravar.robot
Cenario 02-B
    Given que se deseja buscar o processo de numero "1111" e ano "1901" na pesquisa de contratos
    When for solicitado pesquisar o contrato
    Then deveriam ser exibidos "1 até 1 total 1 - Página: 1/1" contratos cadastrados
    Given que foi selecionado o contrato com o numero "1111/01"
    When for solicitado visualizar o contrato
    Then deveria ser exibida a pagina para visualizacao dos dados do contrato
    When for solicitado editar os dados do contrato
    Then deveria ser exibida a pagina para edicao dos dados do contrato
    Given que foi informado o numero do processo "2222" na pagina de dados do contrato
    Given que foi informado o ano do processo "1902" na pagina de dados do contrato
    Given que foi informado o proc sigeo "2222" na pagina de dados do contrato
    Given que foi selecionada especie de contrato "Convênio" na pagina de dados do contrato
    Given que foi informado o objeto da contratacao "Gravar contrato - Cenario 02-B" na pagina de dados do contrato
    When for solicitado gravar os dados do contrato
    Then deveria ter sido alterado o contrato
    Given que se deseja buscar o processo de numero "2222" e ano "1902" na pesquisa de contratos
    When for solicitado pesquisar o contrato
    Then deveriam ser exibidos "1 até 1 total 1 - Página: 1/1" contratos cadastrados
    Given que foi selecionado o contrato com o numero "2222/02"
    When for solicitado visualizar o contrato
    Then deveria ser exibida a pagina para visualizacao dos dados do contrato
    Then deveria exibir o numero do processo igual a "2222" na pagina de visualizacao dos dados do contrato
    Then deveria exibir o ano do processo igual a "1902" na pagina de visualizacao dos dados do contrato
    Then deveria exibir o proc sigeo igual a "2222" na pagina de visualizacao dos dados do contrato
    Then deveria exibir o objeto da contratacao igual a "Gravar contrato - Cenario 02-B" na pagina de visualizacao dos dados do contrato
    Then deveria exibir a especie de contrato igual a "Convênio" na pagina de visualizacao dos dados do contrato
