*** Settings ***
Documentation    Recursos e keywords reutilizáveis para automação do PsicoCare
Library          SeleniumLibrary    timeout=${TIMEOUT_MEDIUM}    implicit_wait=${TIMEOUT_SHORT}
Library          Collections
Library          String
Resource         ../locators.robot

*** Variables ***

*** Keywords ***
# ============================================================================
# KEYWORDS DE NAVEGAÇÃO
# ============================================================================

Abrir Navegador PsicoCare
    [Documentation]    Abre o navegador e navega para a URL base do PsicoCare
    [Arguments]    ${browser}=chrome    ${headless}=False
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Run Keyword If    '${headless}' == 'True'    Call Method    ${options}    add_argument    --headless
    Call Method    ${options}    add_argument    --disable-gpu
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    Call Method    ${options}    add_argument    --window-size=1920,1080
    Open Browser    ${BASE_URL}    ${browser}    options=${options}
    Maximize Browser Window
    Wait Until Page Contains Element    ${LOGIN_TITLE}    timeout=${TIMEOUT_PAGE_LOAD}

Fechar Navegador
    [Documentation]    Fecha o navegador
    Close All Browsers

Navegar Para Login
    [Documentation]    Navega para a tela de login
    Go To    ${LOGIN_URL}
    Wait Until Page Contains Element    ${LOGIN_TITLE}    timeout=${TIMEOUT_PAGE_LOAD}

Navegar Para Cadastro
    [Documentation]    Navega para a tela de cadastro
    Go To    ${REGISTER_URL}
    Wait Until Page Contains Element    ${REGISTER_TITLE}    timeout=${TIMEOUT_PAGE_LOAD}

Navegar Para Agendamentos
    [Documentation]    Navega para a tela de agendamentos
    Go To    ${AGENDAMENTOS_URL}
    Wait Until Page Contains Element    ${AGENDAMENTOS_TITLE}    timeout=${TIMEOUT_PAGE_LOAD}

Navegar Para Psicologos
    [Documentation]    Navega para a lista de psicólogos
    Go To    ${PSICOLOGOS_URL}
    Wait Until Page Contains Element    ${PSICOLOGOS_TITLE}    timeout=${TIMEOUT_PAGE_LOAD}

Navegar Para Acompanhamento
    [Documentation]    Navega para a tela de acompanhamento diário
    Go To    ${ACOMPANHAMENTO_URL}
    Wait Until Page Contains Element    ${ACOMPANHAMENTO_TITLE}    timeout=${TIMEOUT_PAGE_LOAD}

# ============================================================================
# KEYWORDS DE AUTENTICAÇÃO
# ============================================================================

Fazer Login Como Paciente
    [Documentation]    Realiza login como paciente
    [Arguments]    ${email}=${EMAIL_PACIENTE_TESTE}    ${senha}=${SENHA_PACIENTE_TESTE}
    Navegar Para Login
    Preencher Campo Email    ${email}
    Preencher Campo Senha    ${senha}
    Clicar No Botao Entrar
    Wait Until Page Does Not Contain Element    ${LOGIN_TITLE}    timeout=${TIMEOUT_MEDIUM}

Fazer Login Como Psicologo
    [Documentation]    Realiza login como psicólogo
    [Arguments]    ${email}=${EMAIL_PSICOLOGO_TESTE}    ${senha}=${SENHA_PSICOLOGO_TESTE}
    Navegar Para Login
    Preencher Campo Email    ${email}
    Preencher Campo Senha    ${senha}
    Clicar No Botao Entrar
    Wait Until Page Does Not Contain Element    ${LOGIN_TITLE}    timeout=${TIMEOUT_MEDIUM}

Preencher Campo Email
    [Documentation]    Preenche o campo de email
    [Arguments]    ${email}
    Wait Until Element Is Visible    ${LOGIN_EMAIL_INPUT}    timeout=${TIMEOUT_SHORT}
    Input Text    ${LOGIN_EMAIL_INPUT}    ${email}

Preencher Campo Senha
    [Documentation]    Preenche o campo de senha
    [Arguments]    ${senha}
    Wait Until Element Is Visible    ${LOGIN_SENHA_INPUT}    timeout=${TIMEOUT_SHORT}
    Input Password    ${LOGIN_SENHA_INPUT}    ${senha}

Clicar No Botao Entrar
    [Documentation]    Clica no botão Entrar
    Wait Until Element Is Visible    ${LOGIN_BTN_ENTRAR}    timeout=${TIMEOUT_SHORT}
    Click Element    ${LOGIN_BTN_ENTRAR}

Verificar Mensagem De Erro Login
    [Documentation]    Verifica se a mensagem de erro de login foi exibida
    Wait Until Page Contains Element    ${LOGIN_MSG_ERRO}    timeout=${TIMEOUT_SHORT}
    Page Should Contain Element    ${LOGIN_MSG_ERRO}

Verificar Login Bem Sucedido
    [Documentation]    Verifica se o login foi bem sucedido
    Wait Until Page Does Not Contain Element    ${LOGIN_TITLE}    timeout=${TIMEOUT_MEDIUM}
    Page Should Not Contain Element    ${LOGIN_MSG_ERRO}

# ============================================================================
# KEYWORDS DE CADASTRO
# ============================================================================

Preencher Formulario Cadastro Paciente
    [Documentation]    Preenche o formulário de cadastro para paciente
    [Arguments]    ${nome}    ${email}    ${senha}    ${telefone}    ${nascimento}
    Navegar Para Cadastro
    Selecionar Tipo Usuario Paciente
    Input Text    ${REGISTER_NOME_INPUT}    ${nome}
    Input Text    ${REGISTER_EMAIL_INPUT}    ${email}
    Input Password    ${REGISTER_SENHA_INPUT}    ${senha}
    Input Text    ${REGISTER_TELEFONE_INPUT}    ${telefone}
    Input Text    ${REGISTER_NASCIMENTO_INPUT}    ${nascimento}

Preencher Formulario Cadastro Psicologo
    [Documentation]    Preenche o formulário de cadastro para psicólogo
    [Arguments]    ${nome}    ${email}    ${senha}    ${telefone}    ${nascimento}    ${crp}    ${especialidade}
    Navegar Para Cadastro
    Selecionar Tipo Usuario Psicologo
    Input Text    ${REGISTER_NOME_INPUT}    ${nome}
    Input Text    ${REGISTER_EMAIL_INPUT}    ${email}
    Input Password    ${REGISTER_SENHA_INPUT}    ${senha}
    Input Text    ${REGISTER_TELEFONE_INPUT}    ${telefone}
    Input Text    ${REGISTER_NASCIMENTO_INPUT}    ${nascimento}
    Input Text    ${REGISTER_CRP_INPUT}    ${crp}
    Input Text    ${REGISTER_ESPECIALIDADE_INPUT}    ${especialidade}

Selecionar Tipo Usuario Paciente
    [Documentation]    Seleciona o tipo de usuário como paciente
    Wait Until Element Is Visible    ${REGISTER_BTN_PACIENTE}    timeout=${TIMEOUT_SHORT}
    Click Element    ${REGISTER_BTN_PACIENTE}

Selecionar Tipo Usuario Psicologo
    [Documentation]    Seleciona o tipo de usuário como psicólogo
    Wait Until Element Is Visible    ${REGISTER_BTN_PSICOLOGO}    timeout=${TIMEOUT_SHORT}
    Click Element    ${REGISTER_BTN_PSICOLOGO}

Clicar No Botao Cadastrar
    [Documentation]    Clica no botão Cadastrar
    Wait Until Element Is Visible    ${REGISTER_BTN_CADASTRAR}    timeout=${TIMEOUT_SHORT}
    Click Element    ${REGISTER_BTN_CADASTRAR}

# ============================================================================
# KEYWORDS DE AGENDAMENTO
# ============================================================================

Selecionar Psicologo Para Agendamento
    [Documentation]    Seleciona um psicólogo da lista para agendamento
    [Arguments]    ${nome_psicologo}
    Navegar Para Psicologos
    ${locator}=    Set Variable    xpath=//*[contains(text(), '${nome_psicologo}')]/ancestor::*[contains(@class, 'card')]//*[contains(text(), 'Agendar')]
    Wait Until Element Is Visible    ${locator}    timeout=${TIMEOUT_SHORT}
    Click Element    ${locator}

Preencher Data E Hora Agendamento
    [Documentation]    Preenche a data e hora do agendamento
    [Arguments]    ${data}    ${hora}
    Wait Until Element Is Visible    ${AGENDAMENTOS_INPUT_DATA}    timeout=${TIMEOUT_SHORT}
    Input Text    ${AGENDAMENTOS_INPUT_DATA}    ${data}
    Wait Until Element Is Visible    ${AGENDAMENTOS_INPUT_HORA}    timeout=${TIMEOUT_SHORT}
    Input Text    ${AGENDAMENTOS_INPUT_HORA}    ${hora}

Confirmar Agendamento
    [Documentation]    Confirma o agendamento
    Wait Until Element Is Visible    ${AGENDAMENTOS_BTN_CRIAR}    timeout=${TIMEOUT_SHORT}
    Click Element    ${AGENDAMENTOS_BTN_CRIAR}
    Sleep    2s    # Aguarda processamento

Verificar Agendamento Criado
    [Documentation]    Verifica se o agendamento foi criado com sucesso
    Wait Until Page Contains Element    ${AGENDAMENTOS_LISTA}    timeout=${TIMEOUT_MEDIUM}
    Page Should Contain Element    ${AGENDAMENTOS_LISTA}

Verificar Mensagem Horario Indisponivel
    [Documentation]    Verifica se a mensagem de horário indisponível foi exibida
    Wait Until Page Contains Element    ${AGENDAMENTOS_MSG_ERRO}    timeout=${TIMEOUT_SHORT}
    Page Should Contain Element    ${AGENDAMENTOS_MSG_ERRO}

# ============================================================================
# KEYWORDS DE ACOMPANHAMENTO DIÁRIO
# ============================================================================

Preencher Acompanhamento Diario
    [Documentation]    Preenche o formulário de acompanhamento diário
    [Arguments]    ${texto}    ${qualidade_sono}    ${humor}
    Navegar Para Acompanhamento
    Wait Until Element Is Visible    ${ACOMPANHAMENTO_TEXTAREA}    timeout=${TIMEOUT_SHORT}
    Input Text    ${ACOMPANHAMENTO_TEXTAREA}    ${texto}
    Selecionar Qualidade Sono    ${qualidade_sono}
    Selecionar Humor    ${humor}

Selecionar Qualidade Sono
    [Documentation]    Seleciona a qualidade do sono (1 a 5)
    [Arguments]    ${nota}
    ${locator}=    Set Variable    ${ACOMPANHAMENTO_SONO_${nota}}
    Wait Until Element Is Visible    ${locator}    timeout=${TIMEOUT_SHORT}
    Click Element    ${locator}

Selecionar Humor
    [Documentation]    Seleciona o humor/estado emocional
    [Arguments]    ${humor}
    ${locator}=    Set Variable    ${ACOMPANHAMENTO_HUMOR_${humor.upper()}}
    Wait Until Element Is Visible    ${locator}    timeout=${TIMEOUT_SHORT}
    Click Element    ${locator}

Salvar Acompanhamento
    [Documentation]    Salva o acompanhamento diário
    Wait Until Element Is Visible    ${ACOMPANHAMENTO_BTN_SALVAR}    timeout=${TIMEOUT_SHORT}
    Click Element    ${ACOMPANHAMENTO_BTN_SALVAR}
    Sleep    2s    # Aguarda processamento

Verificar Acompanhamento Salvo
    [Documentation]    Verifica se o acompanhamento foi salvo
    Wait Until Page Contains Element    ${ACOMPANHAMENTO_HISTORICO}    timeout=${TIMEOUT_MEDIUM}
    Page Should Contain Element    ${ACOMPANHAMENTO_HISTORICO}

# ============================================================================
# KEYWORDS DE AVALIAÇÃO
# ============================================================================

Preencher Avaliacao Psicologo
    [Documentation]    Preenche a avaliação de um psicólogo
    [Arguments]    ${nota}    ${comentario}
    Wait Until Element Is Visible    ${AVALIACAO_NOTA_INPUT}    timeout=${TIMEOUT_SHORT}
    Input Text    ${AVALIACAO_NOTA_INPUT}    ${nota}
    Wait Until Element Is Visible    ${AVALIACAO_COMENTARIO_INPUT}    timeout=${TIMEOUT_SHORT}
    Input Text    ${AVALIACAO_COMENTARIO_INPUT}    ${comentario}

Enviar Avaliacao
    [Documentation]    Envia a avaliação
    Wait Until Element Is Visible    ${AVALIACAO_BTN_ENVIAR}    timeout=${TIMEOUT_SHORT}
    Click Element    ${AVALIACAO_BTN_ENVIAR}
    Sleep    2s    # Aguarda processamento

Verificar Avaliacao Enviada
    [Documentation]    Verifica se a avaliação foi enviada
    Wait Until Page Contains Element    ${AVALIACAO_LISTA_PUBLICA}    timeout=${TIMEOUT_MEDIUM}
    Page Should Contain Element    ${AVALIACAO_LISTA_PUBLICA}

# ============================================================================
# KEYWORDS DE PSICÓLOGO
# ============================================================================

Aceitar Solicitacao Paciente
    [Documentation]    Aceita uma solicitação de paciente
    [Arguments]    ${nome_paciente}
    Go To    ${SOLICITACOES_URL}
    Wait Until Page Contains Element    ${SOLICITACOES_TITLE}    timeout=${TIMEOUT_PAGE_LOAD}
    ${locator}=    Set Variable    xpath=//*[contains(text(), '${nome_paciente}')]/ancestor::*[contains(@class, 'card')]//*[contains(text(), 'Aceitar')]
    Wait Until Element Is Visible    ${locator}    timeout=${TIMEOUT_SHORT}
    Click Element    ${locator}
    Sleep    2s    # Aguarda processamento

Alterar Disponibilidade
    [Documentation]    Altera a disponibilidade do psicólogo
    [Arguments]    ${disponivel}=True
    Go To    ${HOME_PSICOLOGO_URL}
    Wait Until Page Contains Element    ${PSICOLOGO_HOME_TITLE}    timeout=${TIMEOUT_PAGE_LOAD}
    # Navegar para perfil se necessário
    # Clicar no botão de disponibilidade
    # Verificar mudança de status

# ============================================================================
# KEYWORDS UTILITÁRIAS
# ============================================================================

Aguardar Carregamento
    [Documentation]    Aguarda o carregamento da página
    [Arguments]    ${timeout}=${TIMEOUT_MEDIUM}
    Sleep    ${timeout}

Limpar Cookies E Sessao
    [Documentation]    Limpa cookies e sessão
    Delete All Cookies
    Sleep    1s

Tirar Screenshot
    [Documentation]    Tira um screenshot da página atual
    [Arguments]    ${nome}=screenshot
    Capture Page Screenshot    ${nome}.png

